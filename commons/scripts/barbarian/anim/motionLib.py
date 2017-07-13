# -*- coding: utf-8 -*-
'''
Created on 2017.7.5

@author: Sam
'''

import os
import maya.OpenMaya as om

from maya import cmds
from barbarian.utils import getPath, kUI, getProject, setProject, getConfig, getQtWindow

class AnimRepository(object):
    '''
    classdocs
    '''
    win = ""
    tab = "motionLibTab"
    opMnuProject = "motionLibCBProject"
    opMnuCharactor = "motionLibCBCharactor"
    btnImport = "motionLibBtnImport"
    tslImport = "motionLibLVImport"
    isImport = "motionLibHSCopies"
    lblWarning = "motionLibLWarning"
    txtExportStart = "motionLibLEExportStart"
    txtExportEnd = "motionLibLEExportEnd"
    txtExportFile = "motionLibLEExportFile"
    progressBar = "motionLibPB"
    
    charsDic = {}
    menuItems = []
    messages = []
    outCurves = []
    
    path = ""
    namespace = ""
    
    @classmethod
    def UI(cls):
        cls.cleanUp()
        cls.win = cmds.loadUI(f=getPath(kUI, "motionLib.ui"))
        cmds.showWindow(cls.win)
        #cls.win = getQtWindow("motionLib.ui", "motionLibCentralwidget", u"动作库")
        
        cls.messages.append(om.MSceneMessage.addCallback(om.MSceneMessage.kAfterCreateReference, cls.refreshCharacters))
        cls.messages.append(om.MSceneMessage.addCallback(om.MSceneMessage.kAfterRemoveReference, cls.refreshCharacters))
        cls.messages.append(om.MSceneMessage.addCallback(om.MSceneMessage.kAfterLoadReference, cls.refreshCharacters))
        cls.messages.append(om.MSceneMessage.addCallback(om.MSceneMessage.kAfterUnloadReference, cls.refreshCharacters))
        cls.messages.append(om.MSceneMessage.addCallback(om.MSceneMessage.kAfterImportReference, cls.refreshCharacters))
        cls.messages.append(om.MSceneMessage.addCallback(om.MSceneMessage.kAfterNew, cls.refreshCharacters))
        cls.messages.append(om.MSceneMessage.addCallback(om.MSceneMessage.kAfterOpen, cls.refreshCharacters))
        cls.messages.append(om.MSceneMessage.addCallback(om.MSceneMessage.kAfterImport, cls.refreshCharacters))
            
        cmds.optionMenu(cls.opMnuProject, e=True, changeCommand=setProject)
        cmds.optionMenu(cls.opMnuCharactor, e=True, changeCommand=cls.refreshData)
        cmds.textField(cls.txtExportStart, e=True, tx=int(cmds.playbackOptions(q=1, minTime=1)))
        cmds.textField(cls.txtExportEnd, e=True, tx=int(cmds.playbackOptions(q=1, maxTime=1)))
        cmds.scriptJob(conditionChange=["ProjectChanged", cls.refreshCharacters], parent=cls.win)
        
        cls.refreshCharacters()
    
    @classmethod
    def refreshCharacters(cls, *_):
        if getProject(): 
            cmds.control(cls.tab, e=True, enable=True)
            cmds.optionMenu(cls.opMnuProject, e=True, l=u"")
            if not cmds.optionMenu(cls.opMnuProject, q=True, numberOfItems=True): 
                projects = getProject(all=True)
                for prj in projects: cmds.menuItem(l=prj, parent=cls.opMnuProject)
        elif getProject(all=True): 
            cmds.control(cls.tab, e=True, enable=False)
            cmds.optionMenu(cls.opMnuProject, e=True, l=u"<选择项目>")
            if not cmds.optionMenu(cls.opMnuProject, q=True, numberOfItems=True): 
                projects = getProject(all=True)
                for prj in projects: cmds.menuItem(l=prj, parent=cls.opMnuProject)
            return
        else: 
            cmds.control(cls.tab, e=True, enable=False)
            cmds.optionMenu(cls.opMnuProject, e=True, l=u"<配置异常>")
            if cmds.optionMenu(cls.opMnuProject, q=True, numberOfItems=True): 
                for mi in cmds.optionMenu(cls.opMnuProject, q=True, itemListLong=True): 
                    cmds.deleteUI(mi)
            return
        
        cmds.namespace(set = ":")
        chars = cls.getCharacters()
        cmds.control(cls.tab, e=True, enable=bool(chars))
        for mi in cls.menuItems: cmds.deleteUI(mi)
        cls.menuItems = []
        cls.charsDic = {}
        for char in chars:
            cls.charsDic[char] = "%s <%s>"%(cls.getOrigChar(char.split(":")[-1]).split("C_")[-1], char)
            cls.menuItems.append(cmds.menuItem(l=cls.charsDic[char], parent=cls.opMnuCharactor))
        cls.refreshData()
    
    @classmethod
    def refreshData(cls, *_):
        cmds.namespace(set = ":")
        cmds.optionMenu(cls.opMnuProject, e=True, v=getProject())
        cmds.textScrollList(cls.tslImport, e=True, removeAll=True)
        cls.namespace = ""
        cls.path = ""
        if not cmds.optionMenu(cls.opMnuCharactor, q=True, numberOfItems=True): return
        cls.namespace = cmds.optionMenu(cls.opMnuCharactor, q=True, v=True).split("<")[-1].split(">")[0]
        cls.path = getConfig(animLibPath=True) + cls.getOrigChar(cls.namespace.split(":")[-1])
        cmds.textScrollList(cls.tslImport, e=True, append=cls.getFileList(cls.path))
        
        cmds.select("%s:Group"%cls.namespace, r=True)
        cmds.pickWalk(d="down")
    
    @classmethod
    def cleanUp(cls, *_):
        if cmds.window(cls.win, exists=True): 
            cmds.deleteUI(cls.win)
        for msg in cls.messages:
            om.MMessage.removeCallback(msg)
        cls.messages = []
        cls.menuItems = []
        cls.outCurves = []
    
    @classmethod    
    def getOrigChar(cls, char):
        cmds.namespace(set = ":")
        files = cmds.file(q=True, reference=True)
        for rf in files:
            if char == cmds.file(rf, q=True, namespace=True):
                char = rf.split("/")[-1].split(".")[0]
        return char
    
    @classmethod
    def getCharacters(cls):
        cmds.namespace(set = ":")
        refs = cmds.file(q=True, reference=True)
        fileList = cls.getDirectoryList(getConfig(animLibPath=True))
        newNS = []
        for ref in refs:
            if not cmds.referenceQuery(ref, isLoaded=True): continue
            ref = ref.split("/")[-1]
            for f in fileList:
                if not ref.find(f) == -1:
                    newNS.append(cmds.file(ref, q=True, namespace=True))
                    break
        return newNS
    
    @classmethod
    def getFileList(cls, path):
        p = os.popen("dir \"%s\" *.anim /b" % path)
        fileList = p.read().split("\n")
        p.close()
        del fileList[-1]
        for i in range(0, len(fileList)):
            fileList[i] = fileList[i].split(".anim")[0]
        return fileList
    
    @classmethod
    def getDirectoryList(cls, path):
        p = os.popen("dir \"%s\" d /b" % path)
        fileList = p.read().split("\n")
        p.close()
        del fileList[-1]
        return fileList
    
    @classmethod
    def constructProxy(cls):
        cmds.namespace(set = ":")
        cmds.select("%s:Group"%cls.namespace, r=True)
        cmds.select(cmds.pickWalk(d="down"), r=True, hi=True)
        dags = cmds.ls(sl=True)
        cmds.group(name="%s:Proxy"%cls.namespace, empty=True)
        for dag in dags:
            shape = cmds.listRelatives(dag, s=True)
            if shape and cmds.objectType(shape[0]) == "nurbsCurve":
                loc = cmds.spaceLocator(name=dag+"___Proxy")
                cmds.parent(loc, "%s:Proxy"%cls.namespace)
    
    @classmethod
    def copyFromProxy(cls):
        animCurves = []
        for ac in cmds.ls(type="animCurveTL"): animCurves.append(ac)
        for ac in cmds.ls(type="animCurveTA"): animCurves.append(ac)
        for ac in cmds.ls(type="animCurveTU"): animCurves.append(ac)
        
        cls.destructProxy()
        
    @classmethod
    def copyToProxy(cls):
        animCurves = []
        cls.outCurves = []
        for ac in cmds.ls(type="animCurveTL"): animCurves.append(ac)
        for ac in cmds.ls(type="animCurveTA"): animCurves.append(ac)
        for ac in cmds.ls(type="animCurveTU"): animCurves.append(ac)
        
        for cv in animCurves:
            out = cmds.connectionInfo("%s.output"%cv, destinationFromSource=True)
            if out and len(out[0].split(cls.namespace))==2:
                cls.outCurves.append(cv)
                out = out[0]
                
                print "%s.output"%cv, "->", "%s:Proxy|%s___Proxy.%s"%(cls.namespace, out.split(".")[0], out.split(".")[1])
                #cmds.connectAttr("%s.output"%cv, "%s:Proxy|%s___Proxy.%s"%(cls.namespace, out.split(".")[0], out.split(".")[1]))
                
        
    @classmethod
    def destructProxy(cls):
        cmds.delete("%s:Proxy"%cls.namespace)
        
    
    @classmethod
    def animImport(cls):
        cmds.namespace(set = ":")
        time = int(cmds.currentTime(q=True))
        copies = cmds.intSlider(cls.isImport, q=True, value=True)
        sel = cmds.textScrollList(cls.tslImport, q=True, selectItem=True)
        if not sel: return
        
        #cls.constructProxy()
        
        filePath = cls.path + "\\" + sel[0] + ".anim"
        opt = "targetTime=3;option=insert;pictures=0;connect=0;"
        opt = opt + "time=%d;" % time
        opt = opt + "copies=%d;" % copies
        
        cmds.select("%s:Group"%cls.namespace, r=True)
        cmds.pickWalk(d="down")
        
        cmds.file(filePath, type="animImport", ns=sel[0], options=opt, 
             i=True, iv=True, ra=True, mnc=False, pr=True)
        
        #import pymel.mayautils
        #pymel.mayautils.executeDeferred(cls.copyFromProxy)
        
    @classmethod
    def animExport(cls):
        cmds.namespace(set = ":")
        try: startTime = int(cmds.textField(cls.txtExportStart, q=True, tx=True))
        except: 
            cmds.confirmDialog(message=u"无效数值", icon="information")
            return
        try: endTime = int(cmds.textField(cls.txtExportEnd, q=True, tx=True))
        except: 
            cmds.confirmDialog(message=u"无效数值", icon="information")
            return
        outFile = cmds.textField(cls.txtExportFile, q=True, tx=True)
        if not outFile: return
        filePath = cls.path + "\\" + outFile + ".anim"
        opt = "precision=8;intValue=17;nodeNames=1;verboseUnits=0;whichRange=2;"
        opt = opt + "range=%d:%d;" % (startTime, endTime)
        opt = opt + "options=curve;hierarchy=below;controlPoints=0;shapes=0;helpPictures=0;useChannelBox=0;"
        opt = opt + "copyKeyCmd=-animation objects "
        opt = opt + "-time >%d:%d> -float >%d:%d> " % (startTime, endTime, startTime, endTime)
        opt = opt + "-option curve -hierarchy below -controlPoints 0 -shape 0 "
        
        #for testing
        #cls.destructProxy()
        #cls.constructProxy()
        #cls.copyToProxy()
        cmds.select("%s:Group"%cls.namespace, r=True)
        cmds.pickWalk(d="down")
        
        try:
            cmds.file(filePath, type="animExport", options=opt, 
                 force=True, es=True, pr=True)
        except:
            cmds.confirmDialog(message=u"无法创建文件", icon="warning")
            cls.destructProxy()
            raise
            return
        
        #cls.destructProxy()
        cmds.pause(sec=1)
        cls.refreshData()
