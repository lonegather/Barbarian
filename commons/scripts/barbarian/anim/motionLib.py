#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.7.5

@author: Serious Sam
'''

import os
import maya.OpenMaya as om

from maya import cmds
from barbarian.utils import ui, getProject, setProject, getConfig


def UI(*_):
    AnimRepository("motionLib",
                   tab = "motionLibTab",
                   opMnuProject = "motionLibCBProject",
                   opMnuCharactor = "motionLibCBCharactor",
                   btnImport = "motionLibBtnImport",
                   btnExport = "motionLibBtnExport",
                   tslImport = "motionLibLVImport",
                   isImport = "motionLibHSCopies",
                   txtExportStart = "motionLibLEExportStart",
                   txtExportEnd = "motionLibLEExportEnd",
                   txtExportFile = "motionLibLEExportFile")


class AnimRepository(ui.QtUI):
    def __init__(self, uiFile, **info):
        ui.QtUI.__init__(self, uiFile, **info)
        
        self.addSceneCallback(om.MSceneMessage.kAfterCreateReference, self.refreshCharacters)
        self.addSceneCallback(om.MSceneMessage.kAfterRemoveReference, self.refreshCharacters)
        self.addSceneCallback(om.MSceneMessage.kAfterLoadReference, self.refreshCharacters)
        self.addSceneCallback(om.MSceneMessage.kAfterUnloadReference, self.refreshCharacters)
        self.addSceneCallback(om.MSceneMessage.kAfterImportReference, self.refreshCharacters)
        self.addSceneCallback(om.MSceneMessage.kAfterNew, self.refreshCharacters)
        self.addSceneCallback(om.MSceneMessage.kAfterOpen, self.refreshCharacters)
        self.addSceneCallback(om.MSceneMessage.kAfterImport, self.refreshCharacters)
            
        cmds.optionMenu(self.opMnuProject, e=True, changeCommand=setProject)
        cmds.optionMenu(self.opMnuCharactor, e=True, changeCommand=self.refreshData)
        cmds.button(self.btnImport, e=True, command=self.animImport)
        cmds.button(self.btnExport, e=True, command=self.animExport)
        cmds.textScrollList(self.tslImport, e=True, selectCommand=self.refreshConfig)
        cmds.textField(self.txtExportStart, e=True, tx=int(cmds.playbackOptions(q=1, minTime=1)))
        cmds.textField(self.txtExportEnd, e=True, tx=int(cmds.playbackOptions(q=1, maxTime=1)))
        cmds.scriptJob(conditionChange=["ProjectChanged", self.refreshCharacters], parent=self.window)
        
        self.refreshCharacters()
    
    def refreshCharacters(self, *_):
        print '----------refreshCharacters----------'
        self.__select = None
        if getProject(): 
            cmds.control(self.tab, e=True, visible=True)
            cmds.optionMenu(self.opMnuProject, e=True, l=u"")
            if not cmds.optionMenu(self.opMnuProject, q=True, numberOfItems=True): 
                projects = getProject(all=True)
                for prj in projects: cmds.menuItem(l=prj, parent=self.opMnuProject)
        elif getProject(all=True): 
            cmds.control(self.tab, e=True, visible=False)
            cmds.optionMenu(self.opMnuProject, e=True, l=u"<选择项目>")
            if not cmds.optionMenu(self.opMnuProject, q=True, numberOfItems=True): 
                projects = getProject(all=True)
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
        else: return
        self.refreshData()
    
    def refreshData(self, *_):
        print '----------refreshData----------'
        cmds.namespace(set = ":")
        cmds.optionMenu(self.opMnuProject, e=True, v=getProject())
        cmds.textScrollList(self.tslImport, e=True, removeAll=True)
        self.namespace = ""
        self.path = ""
        if not cmds.optionMenu(self.opMnuCharactor, q=True, numberOfItems=True): return
        self.namespace = cmds.optionMenu(self.opMnuCharactor, q=True, v=True).split("<")[-1].split(">")[0]
        self.path = getConfig(animLibPath=True) + self.getOrigChar(self.namespace.split(":")[-1])
        cmds.textScrollList(self.tslImport, e=True, append=self.getFileList(self.path))
        
        cmds.select("%s:Main"%self.namespace, r=True)
        self.__select = cmds.ls(sl=True)[0]
        self.__config = None
        
    def refreshConfig(self, *_):
        cmds.namespace(set = ":")
        time = int(cmds.currentTime(q=True))
        copy = cmds.intSlider(self.isImport, q=True, value=True)
        filePath = getConfig(animLibPath=True) + \
                   self.getOrigChar(self.namespace.split(":")[-1]) + "\\" + \
                   cmds.textScrollList(self.tslImport, q=True, selectItem=True)[0] + ".anim"
        self.__config = {"copy":copy, "file":filePath, "time":time}
        print '-----%s-----'%self.__config
        
    @property
    def configuration(self):
        return self.__config
    
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
        fileList = self.getDirectoryList(getConfig(animLibPath=True))
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
        p = os.popen("dir \"%s\" *.anim /b" % path)
        fileList = p.read().split("\n")
        p.close()
        del fileList[-1]
        for i in range(0, len(fileList)):
            fileList[i] = fileList[i].split(".anim")[0]
        return fileList
    
    def getDirectoryList(self, path):
        p = os.popen("dir \"%s\" d /b" % path)
        fileList = p.read().split("\n")
        p.close()
        del fileList[-1]
        return fileList
    
    def constructProxy(self):
        print '----------constructProxy----------'
        cmds.namespace(set = ":")
        self.destructProxy()
        cmds.select("%s:Main"%self.namespace, r=True, hi=True)
        dags = cmds.ls(sl=True)
        self.grp = cmds.group(name="%s:Proxy"%self.namespace, empty=True)
        cmds.hide(self.grp)
        
        cmds.progressWindow(title=u"创建代理", status=u"处理中...")
        cmds.progressWindow(e=True, progress=0, max=len(dags))
        
        for dag in dags:
            cmds.progressWindow(e=True, step=1)
            shape = cmds.listRelatives(dag, s=True)
            if not shape: continue
            shapeType = cmds.objectType(shape[0])
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
        print '----------copyFromProxy----------'
        animCurves = []
        for ac in cmds.ls(type="animCurveTL"): animCurves.append(ac)
        for ac in cmds.ls(type="animCurveTA"): animCurves.append(ac)
        for ac in cmds.ls(type="animCurveTU"): animCurves.append(ac)
        
        cmds.progressWindow(title=u"拷贝动画", status=u"处理中...")
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
            
            cmds.copyKey(cv)
            cmds.pasteKey(target, attribute=attr)
            
        cmds.progressWindow(endProgress=1)
        
        self.destructProxy()
        
    def copyToProxy(self):
        print '----------copyToProxy----------'
        animCurves = []
        for ac in cmds.ls(type="animCurveTL"): animCurves.append(ac)
        for ac in cmds.ls(type="animCurveTA"): animCurves.append(ac)
        for ac in cmds.ls(type="animCurveTU"): animCurves.append(ac)
        
        for cv in animCurves:
            if cmds.referenceQuery(cv, isNodeReferenced=True): continue
            out = cmds.connectionInfo("%s.output"%cv, destinationFromSource=True)
            if out and len((':%s'%out[0]).split(self.namespace))==2:
                out = out[0]
                loc = "%s|%s___Proxy"%(self.grp, out.split(".")[0])
                attr = out.split(".")[-1]
                print "%s.output"%cv, "-> %s.%s"%(loc, attr)
                
                cmds.copyKey(cv)
                cmds.pasteKey(loc, attribute=attr)
        
    def destructProxy(self):
        print '----------destructProxy----------'
        try: cmds.delete("%s:Proxy"%self.namespace)
        except: pass
    
    def animImport(self, *_):
        if not self.__config: return
        
        filePath = self.__config["file"]
        opt = "targetTime=3;option=insert;pictures=0;connect=0;"
        opt = opt + "time=%d;" % self.__config["time"]
        opt = opt + "copies=%d;" % self.__config["copy"]
        fns = filePath.split("\\")[-1].split(".")[0]
        
        #cmds.select("%s:Main"%self.namespace, r=True)
        self.constructProxy()
        cmds.select(self.grp)
        
        cmds.file(filePath, type="animImport", ns=fns, options=opt, 
             i=True, iv=True, ra=True, mnc=False, pr=True)
        
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
        opt = "precision=8;intValue=17;nodeNames=1;verboseUnits=0;whichRange=2;"
        opt += "range=%d:%d;" % (startTime, endTime)
        opt += "options=curve;hierarchy=below;controlPoints=0;shapes=0;helpPictures=0;useChannelBox=0;"
        opt += "copyKeyCmd=-animation objects "
        opt += "-time >%d:%d> -float >%d:%d> " % (startTime, endTime, startTime, endTime)
        opt += "-option curve -hierarchy below -controlPoints 0 -shape 0 "
        
        self.constructProxy()
        self.copyToProxy()
        cmds.select(self.grp)
        #cmds.select("%s:Main"%self.namespace, r=True)
        
        try:
            cmds.file(filePath, type="animExport", options=opt, 
                 force=True, es=True, pr=True)
        except Exception, e:
            cmds.confirmDialog(message=u"导出文件时出现问题：%s"%e, icon="warning")
            self.destructProxy()
            return
        
        self.destructProxy()
        cmds.pause(sec=1)
        self.refreshData()
