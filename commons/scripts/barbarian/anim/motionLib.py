#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.7.5

@author: Serious Sam
'''

import os
import maya.OpenMaya as om

from maya import cmds
from barbarian.utils import ui, config


def UI(*_):
    for plugin in ["animImportExport", "MLIECmd"]:
        try: cmds.loadPlugin(plugin, quiet=True)
        except: pass
    
    AnimRepository("motionLib",
                   container      = "motionLibMayaControlLocator",
                   tab            = "motionLibTab",
                   opMnuProject   = "motionLibCBProject",
                   opMnuCharactor = "motionLibCBCharactor",
                   txtFilter      = "motionLibLEFilter",
                   btnImport      = "motionLibBtnImport",
                   btnExport      = "motionLibBtnExport",
                   isImport       = "motionLibHSCopies",
                   isView         = "motionLibHSView",
                   rbInsert       = "motionLibRBInsert",
                   rbMerge        = "motionLibRBMerge",
                   txtExportStart = "motionLibLEExportStart",
                   txtExportEnd   = "motionLibLEExportEnd",
                   txtExportFile  = "motionLibLEExportFile")


class AnimRepository(ui.QtUI):
    def setupUi(self):
        self.addSceneCallback(om.MSceneMessage.kAfterCreateReference, self.refreshCharacters)
        self.addSceneCallback(om.MSceneMessage.kAfterRemoveReference, self.refreshCharacters)
        self.addSceneCallback(om.MSceneMessage.kAfterLoadReference, self.refreshCharacters)
        self.addSceneCallback(om.MSceneMessage.kAfterUnloadReference, self.refreshCharacters)
        self.addSceneCallback(om.MSceneMessage.kAfterImportReference, self.refreshCharacters)
        self.addSceneCallback(om.MSceneMessage.kAfterNew, self.refreshCharacters)
        self.addSceneCallback(om.MSceneMessage.kAfterOpen, self.refreshCharacters)
        self.addSceneCallback(om.MSceneMessage.kAfterImport, self.refreshCharacters)
        
        cmds.optionMenu(self.opMnuProject, e=True, changeCommand=config.setProject)
        cmds.optionMenu(self.opMnuCharactor, e=True, changeCommand=self.refreshData)
        cmds.textField(self.txtFilter, e=True, textChangedCommand=self.refreshData)
        cmds.textField(self.txtExportFile, e=True, textChangedCommand=self.refreshBtn)
        cmds.intSlider(self.isView, e=True, changeCommand=self.refreshView)
        cmds.button(self.btnImport, e=True, command=self.animImport)
        cmds.button(self.btnExport, e=True, enable=False, command=self.animExport)
        cmds.scriptJob(conditionChange=["ProjectChanged", self.refreshCharacters], parent=self.window)
        cmds.scriptJob(event=["playbackRangeChanged", self.refreshTF], parent=self.window)
        
        self.shelf = cmds.shelfLayout(parent=self.container, cellHeight=100, cellWidth=150, spacing=5)
        
        self.refreshTF()
        self.refreshCharacters()
    
    def refreshCharacters(self, *_):
        if config.getProject(): 
            cmds.control(self.tab, e=True, visible=True)
            cmds.optionMenu(self.opMnuProject, e=True, l=u"")
            if not cmds.optionMenu(self.opMnuProject, q=True, numberOfItems=True): 
                projects = config.getProject(all=True)
                for prj in projects: cmds.menuItem(l=prj, parent=self.opMnuProject)
        elif config.getProject(all=True): 
            cmds.control(self.tab, e=True, visible=False)
            cmds.optionMenu(self.opMnuProject, e=True, l=u"<选择项目>")
            if not cmds.optionMenu(self.opMnuProject, q=True, numberOfItems=True): 
                projects = config.getProject(all=True)
                for prj in projects: cmds.menuItem(l=prj, parent=self.opMnuProject)
            return
        else: 
            cmds.control(self.tab, e=True, visible=False)
            cmds.optionMenu(self.opMnuProject, e=True, l=u"<配置异常>")
            if cmds.optionMenu(self.opMnuProject, q=True, numberOfItems=True): 
                for mi in cmds.optionMenu(self.opMnuProject, q=True, itemListLong=True): 
                    cmds.deleteUI(mi)
            return
        
        cmds.namespace(set = ":")
        chars = self.getCharacters()
        if getattr(self, 'chars', None) and self.chars == chars: return
        self.chars = chars
        cmds.control(self.tab, e=True, visible=bool(chars))
        items = cmds.optionMenu(self.opMnuCharactor, q=True, itemListLong=True)
        if items: 
            for mi in items: cmds.deleteUI(mi)
        charsDic = {}
        for char in chars:
            charsDic[char] = "%s <%s>"%(self.getOrigChar(char.split(":")[-1]).split("C_")[-1], char)
            cmds.menuItem(l=charsDic[char], parent=self.opMnuCharactor)
        try: cmds.optionMenu(self.opMnuCharactor, e=True, v=charsDic[self.namespace])
        except: pass
        self.refreshData()
    
    def refreshData(self, *_):
        self.__select = []
        cmds.namespace(set = ":")
        cmds.button(self.btnImport, e=True, enable=False)
        cmds.optionMenu(self.opMnuProject, e=True, v=config.getProject())
        try:
            for ctrl in cmds.shelfLayout(self.shelf, q=True, ca=True): cmds.deleteUI(ctrl)
        except: pass
        self.itrc = cmds.iconTextRadioCollection(parent=self.shelf)
        if not cmds.optionMenu(self.opMnuCharactor, q=True, numberOfItems=True): return
        self.namespace = cmds.optionMenu(self.opMnuCharactor, q=True, v=True).split("<")[-1].split(">")[0]
        self.path = config.getConfig('animLibPath') + self.getOrigChar(self.namespace.split(":")[-1])
        
        fileList = self.getFileList(self.path)
        exp = cmds.textField(self.txtFilter, q=True, tx=True)
        for f in fileList:
            if not self.__match__(f, exp):
                fileList.remove(f)
        
        cellHeight = cmds.shelfLayout(self.shelf, q=True, cellHeight=True)
        for f in fileList:
            if cellHeight > 50:
                cmds.iconTextRadioButton(label=f, parent=self.shelf, style='iconAndTextVertical',
                                         image="motion.png", font="smallFixedWidthFont",
                                         onCommand=self.__getLabel__)
            else:
                cmds.iconTextRadioButton(label=f, parent=self.shelf, style='textOnly',
                                         font="smallFixedWidthFont", onCommand=self.__getLabel__)
        
        sels = os.popen("type \"%s\"\\__config__" % self.path).read()
        for sel in sels.split('&'):
            if not sel: continue
            self.__select.append("%s:%s"%(self.namespace, sel))
        if not self.__select: self.__select.append("%s:Main"%self.namespace)
        cmds.select(self.__select, r=True)
        self.__config = None
        
    def refreshTF(self, *_):
        cmds.textField(self.txtExportStart, e=True, tx=int(cmds.playbackOptions(q=1, minTime=1)))
        cmds.textField(self.txtExportEnd, e=True, tx=int(cmds.playbackOptions(q=1, maxTime=1)))
        
    def refreshView(self, *_):
        height = 100 - cmds.intSlider(self.isView, q=True, value=True) * 70
        cmds.shelfLayout(self.shelf, e=True, cellHeight=height)
        self.refreshData()
        
    def refreshBtn(self, *_):
        txt = cmds.textField(self.txtExportFile, q=True, tx=True)
        cmds.button(self.btnExport, e=True, enable=bool(txt))
        
    def __match__(self, obj, exp):
        #return mel.eval("gmatch \"%s\" \"%s\";"%(obj, exp))
        return obj.find(exp) > -1
    
    def __getLabel__(self, *_):
        rb = cmds.iconTextRadioCollection(self.itrc, q=True, select=True)
        if not rb: return ""
        sel = cmds.iconTextRadioButton(rb, q=True, label=True)
        if _ and _[0]: 
            cmds.textField(self.txtExportFile, e=True, tx=sel)
            cmds.button(self.btnImport, e=True, enable=True)
        return sel
        
    @property
    def configuration(self):
        sel = self.__getLabel__()
        if not sel: return None
        cmds.namespace(set = ":")
        time = int(cmds.currentTime(q=True))
        copy = cmds.intSlider(self.isImport, q=True, value=True)
        filePath = "%s%s\\%s.anim"%(config.getConfig('animLibPath'), self.getOrigChar(self.namespace.split(":")[-1]), sel)
        mode = "insert"
        if cmds.radioButton(self.rbMerge, q=True, select = True): mode = "merge"
        cfg = {"copy":copy, "file":filePath, "time":time, "mode":mode}
        return cfg
    
    @property
    def selection(self):
        return self.__select
    
    def getOrigChar(self, char):
        cmds.namespace(set = ":")
        files = cmds.file(q=True, reference=True)
        for rf in files:
            if char == cmds.file(rf, q=True, namespace=True):
                char = rf.split("/")[-1].split(".")[0]
        return char
    
    def getCharacters(self):
        cmds.namespace(set = ":")
        refs = cmds.file(q=True, reference=True)
        fileList = self.getDirectoryList(config.getConfig('animLibPath'))
        newNS = []
        for ref in refs:
            if not cmds.referenceQuery(ref, isLoaded=True): continue
            name = ref.split("/")[-1]
            for f in fileList:
                if not name.find(f) == -1:
                    newNS.append(cmds.referenceQuery(ref, namespace=True))
                    break
        return newNS
    
    def getFileList(self, path):
        p = os.popen("dir \"%s\"\\*.anim /b" % path)
        fileList = p.read().split("\n")
        p.close()
        del fileList[-1]
        for i in range(0, len(fileList)):
            fileList[i] = fileList[i].split(".anim")[0]
        return fileList
    
    def getDirectoryList(self, path):
        p = os.popen("dir \"%s\" /a:d /b" % path)
        fileList = p.read().split("\n")
        p.close()
        del fileList[-1]
        return fileList
    
    def constructProxy(self):
        cmds.namespace(set = ":")
        self.destructProxy()
        dags = cmds.ls(self.__select, dag=True, ap=True)
        self.grp = cmds.group(name="%s:Proxy"%self.namespace, empty=True)
        cmds.hide(self.grp)
        
        cmds.progressWindow(title=u"创建代理", status=u"生成中...")
        cmds.progressWindow(e=True, progress=0, max=len(dags))
        
        for dag in dags:
            cmds.progressWindow(e=True, step=1)
            if not dag.find("%s:Main"%self.namespace) == -1: continue
            shape = cmds.listRelatives(dag, shapes=True, fullPath=True)
            if not shape: continue
            shapeType = cmds.nodeType(shape[0])
            if shapeType == "nurbsCurve" or shapeType == "nurbsSurface":
                attrs = cmds.listAttr(dag, keyable=True)
                if not attrs: continue
                loc = cmds.spaceLocator(name=dag+"___Proxy")
                for attr in attrs:
                    if attr in [u'visibility', u'translateX', u'translateY', u'translateZ', 
                                u'rotateX', u'rotateY', u'rotateZ', 
                                u'scaleX', u'scaleY', u'scaleZ']: continue
                    attrType = cmds.getAttr("%s.%s"%(dag, attr), type=True)
                    try: cmds.addAttr(loc, ln=attr, keyable=True, attributeType=attrType)
                    except: continue
                cmds.parent(loc, self.grp)
        
        cmds.progressWindow(endProgress=1)
    
    def copyFromProxy(self):
        animCurves = []
        for ac in cmds.ls(type="animCurveTL"): animCurves.append(ac)
        for ac in cmds.ls(type="animCurveTA"): animCurves.append(ac)
        for ac in cmds.ls(type="animCurveTU"): animCurves.append(ac)
        
        cmds.progressWindow(title=u"导入动画", status=u"导入中...")
        cmds.progressWindow(e=True, progress=0, max=len(animCurves))
        
        for cv in animCurves:
            cmds.progressWindow(e=True, step=1)
            if cmds.referenceQuery(cv, isNodeReferenced=True): continue
            out = cmds.connectionInfo("%s.output"%cv, destinationFromSource=True)
            if not out: continue
            out = out[0]
            if out.find('___Proxy') == -1: continue
            if not len((':%s'%out).split(self.namespace))==2: continue
            
            attr = out.split(".")[-1]
            target = out.split("___")[0]
            
            try:
                cmds.copyKey(cv)
                cmds.pasteKey(target, attribute=attr, option = self.configuration['mode'])
            except Exception, e:
                print "%s"%e
            
        cmds.progressWindow(endProgress=1)
        
        self.destructProxy()
        
    def copyToProxy(self, startTime, endTime):
        animCurves = []
        for ac in cmds.ls(type="animCurveTL"): animCurves.append(ac)
        for ac in cmds.ls(type="animCurveTA"): animCurves.append(ac)
        for ac in cmds.ls(type="animCurveTU"): animCurves.append(ac)
        
        cmds.progressWindow(title=u"导出动画", status=u"导出中...")
        cmds.progressWindow(e=True, progress=0, max=len(animCurves))
        
        for cv in animCurves:
            cmds.progressWindow(e=True, step=1)
            if cmds.referenceQuery(cv, isNodeReferenced=True): continue
            out = cmds.connectionInfo("%s.output"%cv, destinationFromSource=True)
            if out and len((':%s'%out[0]).split(self.namespace))==2:
                out = out[0]
                loc = "%s|%s___Proxy"%(self.grp, out.split(".")[0])
                attr = out.split(".")[-1]
                #print "%s.output"%cv, "-> %s.%s"%(loc, attr)
                
                try:
                    cmds.copyKey(cv)
                    cmds.pasteKey(loc, attribute=attr)
                    cmds.setKeyframe(loc, time=[startTime, endTime])
                except Exception, e:
                    print u"%s"%e
        
        cmds.progressWindow(endProgress=1)
                    
    def destructProxy(self):
        try: cmds.delete("%s:Proxy"%self.namespace)
        except: pass
    
    def animImport(self, *_):
        cfg = self.configuration
        if not cfg: return
        
        self.constructProxy()
        cmds.select(self.grp)
        
        motionImport = getattr(cmds, "motionImport")
        motionImport(**cfg)
        
        self.copyFromProxy()
    
    def animExport(self, *_):
        cmds.namespace(set = ":")
        try: startTime = int(cmds.textField(self.txtExportStart, q=True, tx=True))
        except: 
            cmds.confirmDialog(message=u"无效数值", icon="information")
            return
        try: endTime = int(cmds.textField(self.txtExportEnd, q=True, tx=True))
        except: 
            cmds.confirmDialog(message=u"无效数值", icon="information")
            return
        outFile = cmds.textField(self.txtExportFile, q=True, tx=True)
        if not outFile: return
        filePath = self.path + "\\" + outFile + ".anim"
        
        self.constructProxy()
        self.copyToProxy(startTime, endTime)
        cmds.select(self.grp)
        
        motionExport = getattr(cmds, "motionExport")
        motionExport(f=filePath, st=startTime, et=endTime)
        
        self.destructProxy()
        cmds.pause(sec=1)
        self.refreshData()
