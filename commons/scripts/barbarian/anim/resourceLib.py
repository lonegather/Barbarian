#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.8.25

@author: Serious Sam
'''

import os
from maya import cmds
from xml.dom import minidom
from barbarian.utils import ui, config


def UI(*_):
    ResourceRepository("resourceLib",
                       opMnuProject = "resourceLibCBProject",
                       rbChar       = "resourceLibRBChar",
                       rbProp       = "resourceLibRBProp",
                       rbScene      = "resourceLibRBScene",
                       container    = "resourceLibMayaControlLocator",
                       btnLoad      = "resourceLibBtnLoad")


class ResourceRepository(ui.QtUI):
    def setupUi(self):
        cmds.optionMenu(self.opMnuProject, e=True, changeCommand=config.setProject)
        cmds.radioButton(self.rbChar, e=True, onCommand=self.refreshData)
        cmds.radioButton(self.rbProp, e=True, onCommand=self.refreshData)
        cmds.radioButton(self.rbScene, e=True, onCommand=self.refreshData)
        cmds.button(self.btnLoad, e=True, command=self.load)
        self.shelf = cmds.shelfLayout(parent=self.container, cellHeight=170, cellWidth=150, spacing=5)
        
        cmds.scriptJob(conditionChange=["ProjectChanged", self.refreshProject], parent=self.window)
        
        self.refreshProject()
    
    def refreshProject(self, *_):
        if config.getProject(): 
            cmds.optionMenu(self.opMnuProject, e=True, l=u"")
            if not cmds.optionMenu(self.opMnuProject, q=True, numberOfItems=True): 
                projects = config.getProject(all=True)
                for prj in projects: cmds.menuItem(l=prj, parent=self.opMnuProject)
            cmds.optionMenu(self.opMnuProject, e=True, v=config.getProject())
        elif config.getProject(all=True): 
            cmds.optionMenu(self.opMnuProject, e=True, l=u"<选择项目>")
            if not cmds.optionMenu(self.opMnuProject, q=True, numberOfItems=True): 
                projects = config.getProject(all=True)
                for prj in projects: cmds.menuItem(l=prj, parent=self.opMnuProject)
            return
        else: 
            cmds.optionMenu(self.opMnuProject, e=True, l=u"<配置异常>")
            if cmds.optionMenu(self.opMnuProject, q=True, numberOfItems=True): 
                for mi in cmds.optionMenu(self.opMnuProject, q=True, itemListLong=True): 
                    cmds.deleteUI(mi)
            return
        
        try: dom = minidom.parse(config.getPath(config.kConfig, config.getConfig("resourceLocator")))
        except: 
            self.root = None
            self.clearData()
        else: 
            self.clearData()
            
            Asset.pathDefine = {}
            self.assets = []
            self.root = dom.documentElement
            for path in self.root.getElementsByTagName("path"):
                Asset.pathDefine[path.getAttribute("name")] = path.childNodes[0].nodeValue
            
            self.itrc = cmds.iconTextRadioCollection(parent=self.shelf)
            
            items = self.root.getElementsByTagName("item")
            cmds.progressWindow(title=u"进度", status=u"读取中...")
            cmds.progressWindow(e=True, progress=0, max=len(items))
            
            for item in items:
                cmds.progressWindow(e=True, step=1)
                
                asset = Asset(item)
                self.assets.append(asset)
                cmds.iconTextRadioButton(asset, label=asset.label, parent=self.shelf, style='iconAndTextVertical',
                                         image=asset.image, font="smallFixedWidthFont", onCommand=self.getCurrent)
            
            cmds.progressWindow(endProgress=1)
        
        self.refreshData()
        
    def refreshData(self, *_):
        if not self.root: return
        
        if cmds.radioButton(self.rbChar, q=True, select=True): resType = 'character'
        elif cmds.radioButton(self.rbProp, q=True, select=True): resType = 'property'
        elif cmds.radioButton(self.rbScene, q=True, select=True): resType = 'scene'
        else: return
        
        position = 1
        for asset in self.assets:
            cmds.iconTextRadioButton(asset, e=True, visible=asset.filter(resType))
            if asset.filter(resType):
                cmds.shelfLayout(self.shelf, e=True, position=(asset, position))
                position += 1
        
    def clearData(self):
        self.current = None
        cmds.button(self.btnLoad, e=True, visible=False)
        
        if not cmds.shelfLayout(self.shelf, q=True, childArray=True): return
        for btn in cmds.shelfLayout(self.shelf, q=True, childArray=True):
            cmds.deleteUI(btn)
            
    def getCurrent(self, *_):
        cmds.button(self.btnLoad, e=True, visible=True)
        self.current = cmds.iconTextRadioCollection(self.itrc, q=True, select=True)
        
    def load(self, *_):
        for asset in self.assets:
            if str(asset) == self.current:
                cmds.file(asset.path, r=True, iv=True, typ='mayaAscii', ns=asset.namespace)
                return
        

class Asset():
    
    pathDefine = {}
    
    def __init__(self, item):
        self.__tag   = item.getAttribute("tag")
        self.__name  = item.getAttribute("name")
        self.__file  = item.getAttribute("file")
        self.__thumb = item.getAttribute("thumbnail")
        
        for p in Asset.pathDefine:
            strList = self.__file.split("%%%s%%"%p)
            if len(strList) > 1: self.__file = Asset.pathDefine[p] + strList[-1]
            
            strList = self.__thumb.split("%%%s%%"%p)
            if len(strList) > 1: self.__thumb = Asset.pathDefine[p] + strList[-1]
    
    def __str__(self):
        return "%s_%s"%(ResourceRepository.UI().window, self.__file.split('/')[-1].split('.ma')[0])
        
    def filter(self, *tags):
        for tag in tags:
            if not self.__tag.count(tag):
                return False
        return True
    
    @property
    def label(self):
        if not self.__name:
            return self.__file.split('/')[-1].split('.ma')[0]
        return self.__name
    
    @property
    def image(self):
        if not os.path.isfile(self.__thumb):
            for tp in ["character", "property", "scene"]:
                if self.__tag.count(tp): return config.getPath(config.kIcon, "empty_%s.png"%tp)
            return ""
        return self.__thumb
    
    @property
    def path(self):
        return self.__file
    
    @property
    def namespace(self):
        return self.__file.split('/')[-1].split('.ma')[0]
        