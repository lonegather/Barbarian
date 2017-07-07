# -*- coding: utf-8 -*-
'''
Created on 2017.7.5

@author: Sam
'''

import os
import pymel.core as pm
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
    
    path = ""
    char = ""
    namespace = ""
    
    @classmethod
    def UI(cls):
        if pm.window(cls.win, exists=True): pm.deleteUI(cls.win)
        pm.loadUI(f=getPath(kUI, "motionLib.ui"))
        pm.window(cls.win, e=True, toolbox=True, leftEdge=100, topEdge=100)
        pm.showWindow(cls.win)
        
        projects = getProject(all=True)
        
        if not projects:
            pm.control(cls.tab, e=True, enable=False)
        else: 
            for project in projects:
                pm.menuItem(l=project, parent=cls.opMnuProject)
            pm.optionMenu(cls.opMnuProject, e=True, changeCommand=setProject)
            if not getProject(): setProject(projects[0])
            pm.optionMenu(cls.opMnuProject, e=True, v=getProject())
            pm.scriptJob(conditionChange=["ProjectChanged", cls.refreshList], parent=cls.win)
        
        chars = cls.getCharactors()
        #script job things here (when reference file was added or removed):
        
        if not chars:
            pm.control(cls.tab, e=True, enable=False)
        else:
            for char in chars:
                pm.menuItem(l=char, parent=cls.opMnuCharactor)
            pm.optionMenu(cls.opMnuCharactor, e=True, changeCommand=cls.refreshList)
            cls.refreshList(pm.optionMenu(cls.opMnuCharactor, q=True, v=True))
        
    @classmethod
    def refreshList(cls, value=None):
        pm.optionMenu(cls.opMnuProject, e=True, v=getProject())
        
        if not value: value = pm.optionMenu(cls.opMnuCharactor, q=True, v=True)
        cls.path = getConfig(animLibPath=True)
        cls.char = value.split(":")[-1]
        cls.namespace = value
        files = cls.getFileList(cls.path+cls.getOrigChar(cls.char))
        pm.textScrollList(cls.tslImport, e=True, removeAll=True)
        pm.textScrollList(cls.tslImport, e=True, append=files)
    
    @classmethod    
    def getOrigChar(cls, char):
        chars = cls.getDirectoryList(cls.path)
        for orig in chars:
            if not char.find(orig) == -1:
                return orig
    
    @classmethod
    def getCharactors(cls):
        pm.namespace(set = ":")
        allNS = pm.namespaceInfo(lon=True, r=True, an=True)
        for ns in [':UI', ':shared']:
            allNS.remove(ns)
        
        newNS = []
        for ns in allNS:
            children = pm.namespaceInfo(ns, lon=True, r=True, an=True)
            if (not children) and (not ns.find("C_") == -1): newNS.append(ns)
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
    def animImport(cls):
        time = int(pm.currentTime(q=True))
        copies = pm.intSlider(cls.isImport, q=True, value=True)
        sel = pm.textScrollList(cls.tslImport, q=True, selectItem=True)
        if not sel: return
        
        filePath = cls.path + cls.getOrigChar(cls.char) + "\\" + sel[0] + ".anim"
        opt = "targetTime=3;option=insert;pictures=0;connect=0;"
        opt = opt + "time=%d;" % time
        opt = opt + "copies=%d;" % copies
        
        pm.select(cls.namespace+":Main", r=True)
        
        file(filePath, type="animImport", ns=sel[0], options=opt, 
             i=True, iv=True, ra=True, mnc=False, pr=True)
        
    @classmethod
    def animExport(cls, filePath, startTime, endTime):
        opt = "precision=8;intValue=17;nodeNames=1;verboseUnits=0;whichRange=2;"
        opt = opt + "range=%d:%d;" % (startTime, endTime)
        opt = opt + "options=curve;hierarchy=below;controlPoints=0;shapes=0;helpPictures=1;useChannelBox=0;"
        opt = opt + "copyKeyCmd=-animation objects "
        opt = opt + "-time >%d:%d> -float >%d:%d> " % (startTime, endTime, startTime, endTime)
        opt = opt + "-option curve -hierarchy below -controlPoints 0 -shape 0 "
        file(filePath, type="animExport", options=opt, 
             force=True, es=True, pr=True)
        
        
'''
file -force 
     -options "precision=8;intValue=17;nodeNames=1;verboseUnits=0;whichRange=2;range=0:24;options=curve;hierarchy=below;controlPoints=0;shapes=0;helpPictures=1;useChannelBox=0;
               copyKeyCmd=-animation objects -time >0:24> -float >0:24> -option curve -hierarchy below -controlPoints 0 -shape 0 " 
     -typ "animExport" 
     -pr 
     -es 
     "F:/walk.anim";
'''