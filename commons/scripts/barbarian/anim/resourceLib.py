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
from barbarian.utils.ui import resourceLibUI


def UI(*_):
    ResourceRepository()


class ResourceRepository(resourceLibUI.Ui_resourceLibOption):
    def setupUi(self, win=None):
        super(ResourceRepository, self).setupUi(win)
        
        cmds.scriptJob(conditionChange=["ProjectChanged", self.refreshProject], parent=self.window)
        
        self.resourceLibRBChar.clicked.connect(self.refreshData)
        self.resourceLibRBProp.clicked.connect(self.refreshData)
        self.resourceLibRBScene.clicked.connect(self.refreshData)
        self.resourceLibBtnLoad.clicked.connect(self.load)
        
        self.shelf.itemSelected.connect(self.getCurrent)
        
        self.refreshProject()
    
    def refreshProject(self, *_):
        if not config.getProject(): return
        
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
            
            for item in self.root.getElementsByTagName("item"):
                self.assets.append(Asset(item))
        
            self.shelf.setup(*self.assets)
        
        self.refreshData()
        
    def refreshData(self, *_):
        if not self.root: return
        
        if self.resourceLibRBChar.isChecked(): resType = 'character'
        elif self.resourceLibRBProp.isChecked(): resType = 'property'
        elif self.resourceLibRBScene.isChecked(): resType = 'scene'
        else: return
        
        self.shelf.itemFilter(resType)
        
    def clearData(self):
        self.current = None
        self.shelf.cleanUp()
        self.resourceLibBtnLoad.setEnabled(False)
            
    def getCurrent(self, item):
        self.resourceLibBtnLoad.setEnabled(True)
        self.current = item
        
    def load(self, *_):
        for asset in self.assets:
            if asset.path == self.current:
                if asset.path.count('.ma'): typ = "mayaAscii"
                elif asset.path.count('.mb'): typ = "mayaBinary"
                else: cmds.error('文件类型错误')
                cmds.file(asset.path, r=True, iv=True, typ=typ, ns=asset.namespace)
                return
        

class Asset():
    
    pathDefine = {}
    
    def __init__(self, item):
        self.__tag   = item.getAttribute("tag")
        self.__name  = item.getAttribute("name")
        self.__file  = item.getAttribute("file")
        self.__thumb = item.getAttribute("thumbnail")
        self.__dic   = {}
        
        for p in Asset.pathDefine:
            strList = self.__file.split("%%%s%%"%p)
            if len(strList) > 1: self.__file = Asset.pathDefine[p] + strList[-1]
            
            strList = self.__thumb.split("%%%s%%"%p)
            if len(strList) > 1: self.__thumb = Asset.pathDefine[p] + strList[-1]
        
        self.__dic[ui.QShelfView.kName] = self.label
        self.__dic[ui.QShelfView.kIcon] = self.image
        self.__dic[ui.QShelfView.kData] = self.path
        self.__dic[ui.QShelfView.kType] = self.__tag
    
    def __str__(self):
        return "%s_%s"%(ResourceRepository.UI().window, self.__file.split('/')[-1].split('.ma')[0])
    
    def __getitem__(self, key):
        return self.__dic[key]
        
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
        fileName = self.__file.split('/')[-1]
        if len(fileName.split('.ma')) > 1: return fileName.split('.ma')[0]
        else: return fileName.split('.mb')[0]
        