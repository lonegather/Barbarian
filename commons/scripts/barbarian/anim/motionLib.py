# -*- coding: utf-8 -*-
'''
Created on 2017.7.5

@author: Sam
'''

import os
import pymel.core as pm
import maya.OpenMaya as om
from barbarian.utils import getPath, kUI, getProject, setProject, getConfig
from pymel.internal.pmcmds import file


class AnimRepository(object):
    '''
    classdocs
    '''
    win = "motionLibOption"
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
        if pm.window(cls.win, exists=True): pm.deleteUI(cls.win)
        pm.loadUI(f=getPath(kUI, "motionLib.ui"))
        pm.window(cls.win, e=True, closeCommand=cls.cleanUp, mxb=False, leftEdge=100, topEdge=100)
        pm.progressBar(cls.progressBar, e=True, visible=False)
        pm.showWindow(cls.win)
        
        projects = getProject(all=True)
        
        if not projects:
            pm.control(cls.tab, e=True, enable=False)
        else: 
            for project in projects:
                pm.menuItem(l=project, parent=cls.opMnuProject)
            pm.optionMenu(cls.opMnuProject, e=True, changeCommand=setProject)
            pm.optionMenu(cls.opMnuCharactor, e=True, changeCommand=cls.refreshData)
            if not getProject(): setProject(projects[0])
            pm.textField(cls.txtExportStart, e=True, tx=int(pm.playbackOptions(q=1, minTime=1)))
            pm.textField(cls.txtExportEnd, e=True, tx=int(pm.playbackOptions(q=1, maxTime=1)))
            pm.scriptJob(conditionChange=["ProjectChanged", cls.refreshCharacters], parent=cls.win)
        
        cls.messages.append(om.MSceneMessage.addCallback(om.MSceneMessage.kAfterCreateReference, cls.refreshCharacters))
        cls.messages.append(om.MSceneMessage.addCallback(om.MSceneMessage.kAfterRemoveReference, cls.refreshCharacters))
        cls.messages.append(om.MSceneMessage.addCallback(om.MSceneMessage.kAfterLoadReference, cls.refreshCharacters))
        cls.messages.append(om.MSceneMessage.addCallback(om.MSceneMessage.kAfterUnloadReference, cls.refreshCharacters))
        cls.messages.append(om.MSceneMessage.addCallback(om.MSceneMessage.kAfterImportReference, cls.refreshCharacters))
        cls.messages.append(om.MSceneMessage.addCallback(om.MSceneMessage.kAfterNew, cls.refreshCharacters))
        cls.messages.append(om.MSceneMessage.addCallback(om.MSceneMessage.kAfterOpen, cls.refreshCharacters))
        cls.messages.append(om.MSceneMessage.addCallback(om.MSceneMessage.kAfterImport, cls.refreshCharacters))
        cls.refreshCharacters()
    
    @classmethod
    def refreshCharacters(cls, *args):
        pm.namespace(set = ":")
        chars = cls.getCharacters()
        pm.control(cls.tab, e=True, enable=bool(chars))
        for mi in cls.menuItems: pm.deleteUI(mi)
        cls.menuItems = []
        cls.charsDic = {}
        for char in chars:
            cls.charsDic[char] = "%s <%s>"%(cls.getOrigChar(char.split(":")[-1]).split("C_")[-1], char)
            cls.menuItems.append(pm.menuItem(l=cls.charsDic[char], parent=cls.opMnuCharactor))
        cls.refreshData()
    
    @classmethod
    def refreshData(cls, *args):
        pm.namespace(set = ":")
        pm.optionMenu(cls.opMnuProject, e=True, v=getProject())
        pm.textScrollList(cls.tslImport, e=True, removeAll=True)
        cls.namespace = ""
        cls.path = ""
        if not pm.optionMenu(cls.opMnuCharactor, q=True, numberOfItems=True): return
        cls.namespace = pm.optionMenu(cls.opMnuCharactor, q=True, v=True).split("<")[-1].split(">")[0]
        cls.path = getConfig(animLibPath=True) + cls.getOrigChar(cls.namespace.split(":")[-1])
        pm.textScrollList(cls.tslImport, e=True, append=cls.getFileList(cls.path))
        
        pm.select("%s:Group"%cls.namespace, r=True)
        pm.pickWalk(d="down")
    
    @classmethod
    def cleanUp(cls, *args):
        for msg in cls.messages:
            om.MMessage.removeCallback(msg)
        cls.messages = []
        cls.menuItems = []
        cls.outCurves = []
    
    @classmethod    
    def getOrigChar(cls, char):
        pm.namespace(set = ":")
        files = file(q=True, reference=True)
        for rf in files:
            if char == file(rf, q=True, namespace=True):
                char = rf.split("/")[-1].split(".")[0]
        return char
    
    @classmethod
    def getCharacters(cls):
        pm.namespace(set = ":")
        refs = file(q=True, reference=True)
        fileList = cls.getDirectoryList(getConfig(animLibPath=True))
        newNS = []
        for ref in refs:
            ref = ref.split("/")[-1]
            for f in fileList:
                if not ref.find(f) == -1:
                    newNS.append(file(ref, q=True, namespace=True))
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
        pm.namespace(set = ":")
        pm.select("%s:Group"%cls.namespace, r=True)
        pm.select(pm.pickWalk(d="down"), r=True, hi=True)
        dags = pm.ls(sl=True)
        pm.group(name="%s:Proxy"%cls.namespace, empty=True)
        for dag in dags:
            shape = pm.listRelatives(dag, s=True)
            if shape and pm.objectType(shape[0]) == "nurbsCurve":
                loc = pm.spaceLocator(name=dag+"___Proxy")
                pm.parent(loc, "%s:Proxy"%cls.namespace)
    
    @classmethod
    def copyFromProxy(cls):
        animCurves = []
        for ac in pm.ls(type="animCurveTL"): animCurves.append(ac)
        for ac in pm.ls(type="animCurveTA"): animCurves.append(ac)
        for ac in pm.ls(type="animCurveTU"): animCurves.append(ac)
        
        cls.destructProxy()
        
    @classmethod
    def copyToProxy(cls):
        animCurves = []
        cls.outCurves = []
        for ac in pm.ls(type="animCurveTL"): animCurves.append(ac)
        for ac in pm.ls(type="animCurveTA"): animCurves.append(ac)
        for ac in pm.ls(type="animCurveTU"): animCurves.append(ac)
        
        for cv in animCurves:
            out = pm.connectionInfo("%s.output"%cv, destinationFromSource=True)
            if out and len(out[0].split(cls.namespace))==2:
                cls.outCurves.append(cv)
                out = out[0]
                
                print "%s.output"%cv, "->", "%s:Proxy|%s___Proxy.%s"%(cls.namespace, out.split(".")[0], out.split(".")[1])
                #pm.connectAttr("%s.output"%cv, "%s:Proxy|%s___Proxy.%s"%(cls.namespace, out.split(".")[0], out.split(".")[1]))
                
        
    @classmethod
    def destructProxy(cls):
        pm.delete("%s:Proxy"%cls.namespace)
        
    
    @classmethod
    def animImport(cls):
        pm.namespace(set = ":")
        time = int(pm.currentTime(q=True))
        copies = pm.intSlider(cls.isImport, q=True, value=True)
        sel = pm.textScrollList(cls.tslImport, q=True, selectItem=True)
        if not sel: return
        
        #cls.constructProxy()
        
        filePath = cls.path + "\\" + sel[0] + ".anim"
        opt = "targetTime=3;option=insert;pictures=0;connect=0;"
        opt = opt + "time=%d;" % time
        opt = opt + "copies=%d;" % copies
        
        pm.select("%s:Group"%cls.namespace, r=True)
        pm.pickWalk(d="down")
        
        file(filePath, type="animImport", ns=sel[0], options=opt, 
             i=True, iv=True, ra=True, mnc=False, pr=True)
        
        #import pymel.mayautils
        #pymel.mayautils.executeDeferred(cls.copyFromProxy)
        
    @classmethod
    def animExport(cls):
        pm.namespace(set = ":")
        try: startTime = int(pm.textField(cls.txtExportStart, q=True, tx=True))
        except: 
            pm.confirmDialog(message=u"无效数值", icon="information")
            return
        try: endTime = int(pm.textField(cls.txtExportEnd, q=True, tx=True))
        except: 
            pm.confirmDialog(message=u"无效数值", icon="information")
            return
        outFile = pm.textField(cls.txtExportFile, q=True, tx=True)
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
        pm.select("%s:Group"%cls.namespace, r=True)
        pm.pickWalk(d="down")
        
        try:
            file(filePath, type="animExport", options=opt, 
                 force=True, es=True, pr=True)
        except:
            pm.confirmDialog(message=u"无法创建文件", icon="warning")
            cls.destructProxy()
            raise
            return
        
        #cls.destructProxy()
        pm.pause(sec=1)
        cls.refreshData()
