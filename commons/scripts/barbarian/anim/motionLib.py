#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.7.5

@author: Serious Sam
'''

import os, codecs
import maya.OpenMaya as om
from maya import cmds
from PySide import QtCore, QtGui
from barbarian.utils import ui, config


def UI(*_):
    for plugin in ["animImportExport", "MLIECmd"]:
        try: cmds.loadPlugin(plugin, quiet=True)
        except: pass
    
    AnimRepository()


class AnimRepository(ui.motionLibUI.Ui_motionLibOption):
    def setupUi(self, win=None):
        super(AnimRepository, self).setupUi(win)
        
        cmds.scriptJob(conditionChange=["ProjectChanged", self.refreshCharacters], parent=self.window)
        cmds.scriptJob(event=["playbackRangeChanged", self.refreshTimeRange], parent=self.window)
        
        self.addSceneCallback(om.MSceneMessage.kAfterCreateReference, self.refreshCharacters)
        self.addSceneCallback(om.MSceneMessage.kAfterRemoveReference, self.refreshCharacters)
        self.addSceneCallback(om.MSceneMessage.kAfterLoadReference, self.refreshCharacters)
        self.addSceneCallback(om.MSceneMessage.kAfterUnloadReference, self.refreshCharacters)
        self.addSceneCallback(om.MSceneMessage.kAfterImportReference, self.refreshCharacters)
        self.addSceneCallback(om.MSceneMessage.kAfterNew, self.refreshCharacters)
        self.addSceneCallback(om.MSceneMessage.kAfterOpen, self.refreshCharacters)
        self.addSceneCallback(om.MSceneMessage.kAfterImport, self.refreshCharacters)
        
        QtCore.QObject.connect(self.motionLibCBProject, 
                               QtCore.SIGNAL("activated(int)"), 
                               lambda *_: config.setProject(self.motionLibCBProject.currentText()))
        QtCore.QObject.connect(self.motionLibCBCharactor, 
                               QtCore.SIGNAL("activated(int)"),
                               self.refreshData)
        QtCore.QObject.connect(self.motionLibLEFilter,
                               QtCore.SIGNAL("textChanged(QString)"),
                               lambda txt: self.shelf.itemFilter(txt))
        QtCore.QObject.connect(self.motionLibLEExportFile,
                               QtCore.SIGNAL("textChanged(QString)"),
                               self.refreshBtn)
        QtCore.QObject.connect(self.motionLibHSView,
                               QtCore.SIGNAL("valueChanged(int)"),
                               self.refreshView)
        self.motionLibBtnImport.clicked.connect(lambda *_: self.animImport())
        self.motionLibBtnExport.clicked.connect(lambda *_: self.animExport())
        self.shelf.itemSelected.connect(self.__getLabel__)
        
        self.refreshTimeRange()
        self.refreshCharacters()
    
    def refreshCharacters(self, *_):
        if config.getProject(): 
            self.motionLibTab.setVisible(True)
            if not self.motionLibCBProject.count(): 
                projects = config.getProject(all=True)
                for prj in projects: 
                    self.motionLibCBProject.addItem(prj)
        elif config.getProject(all=True): 
            self.motionLibTab.setVisible(False)
            if not self.motionLibCBProject.count(): 
                projects = config.getProject(all=True)
                for prj in projects: 
                    self.motionLibCBProject.addItem(prj)
            return
        else: 
            self.motionLibTab.setVisible(False)
            while self.motionLibCBProject.count(): 
                self.motionLibCBProject.removeItem(0)
            return
        
        cmds.namespace(set = ":")
        chars = self.getCharacters()
        if getattr(self, 'chars', None) and self.chars == chars: return
        self.chars = chars
        self.motionLibTab.setVisible(bool(chars))
        while self.motionLibCBCharactor.count(): 
            self.motionLibCBCharactor.removeItem(0)
        charsDic = {}
        for char in chars:
            charsDic[char] = "%s <%s>"%(self.getOrigChar(char.split(":")[-1]).split("C_")[-1], char)
            self.motionLibCBCharactor.addItem(charsDic[char])
        try: 
            self.motionLibCBCharactor.setCurrentIndex(self.motionLibCBCharactor.findText(charsDic[self.namespace]))
        except: pass
        self.refreshData()
    
    def refreshData(self, *_):
        self.__select = []
        cmds.namespace(set = ":")
        self.shelf.cleanUp()
        self.motionLibBtnImport.setEnabled(False)
        self.motionLibCBProject.setCurrentText(config.getProject())
        if not self.motionLibCBCharactor.count(): return
        self.namespace = self.motionLibCBCharactor.currentText().split("<")[-1].split(">")[0]
        self.path = config.getConfig('animLibPath') + self.getOrigChar(self.namespace.split(":")[-1])
        
        fileList = self.getFileList(self.path)
        exp = codecs.decode(self.motionLibLEFilter.text(), 'utf-8')
        itemList = []
        for f in fileList:
            if self.__match__(f, exp):
                found = False
                for ext in ['gif', 'png', 'jpg']:
                    iconPath = self.path+f+ext
                    if os.path.isfile(iconPath): 
                        found = True
                        break
                if not found: iconPath = config.getPath(config.kIcon, "motion.gif")
                itemList.append({ui.QShelfView.kName:f, 
                                 ui.QShelfView.kData:f,
                                 ui.QShelfView.kIcon:iconPath,
                                 ui.QShelfView.kType:f})
        self.shelf.setup(*itemList)
        
        sels = os.popen("type \"%s\"\\__config__" % self.path).read()
        for sel in sels.split('&'):
            if not sel: continue
            self.__select.append("%s:%s"%(self.namespace, sel))
        if not self.__select: self.__select.append("%s:Main"%self.namespace)
        cmds.select(self.__select, r=True)
        self.__config = None
        
    def refreshTimeRange(self, *_):
        self.motionLibLEExportStart.setText(unicode(int(cmds.playbackOptions(q=1, minTime=1))))
        self.motionLibLEExportEnd.setText(unicode(int(cmds.playbackOptions(q=1, maxTime=1))))
        
    def refreshView(self, *_):
        self.shelf.cellHeight = 100 - self.motionLibHSView.value() * 70
        self.refreshData()
        
    def refreshBtn(self, *_):
        txt = self.motionLibLEExportFile.text()
        self.motionLibBtnExport.setEnabled(bool(txt))
        
    def __match__(self, obj, exp):
        return obj.find(exp) > -1
    
    @QtCore.Slot(object)
    def __getLabel__(self, obj):
        if not obj: return ""
        
        self.motionLibLEExportFile.setText(obj)
        self.motionLibBtnImport.setEnabled(True)
        
    @property
    def configuration(self):
        sel = self.shelf.data
        if not sel: return None
        cmds.namespace(set = ":")
        time = int(cmds.currentTime(q=True))
        copy = self.motionLibHSCopies.value()
        filePath = "%s%s\\%s.anim"%(config.getConfig('animLibPath'), self.getOrigChar(self.namespace.split(":")[-1]), sel)
        mode = "insert"
        if self.motionLibRBMerge.isChecked(): mode = "merge"
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
    
    @QtCore.Slot()
    def animImport(self, *_):
        cfg = self.configuration
        if not cfg: return
        
        self.constructProxy()
        cmds.select(self.grp)
        
        motionImport = getattr(cmds, "motionImport")
        motionImport(**cfg)
        
        self.copyFromProxy()
    
    @QtCore.Slot()
    def animExport(self, *_):
        cmds.namespace(set = ":")
        try: startTime = int(self.motionLibLEExportStart.text())
        except: 
            cmds.confirmDialog(message=u"无效数值", icon="information")
            return
        try: endTime = int(self.motionLibLEExportEnd.text())
        except: 
            cmds.confirmDialog(message=u"无效数值", icon="information")
            return
        outFile = self.motionLibLEExportFile.text()
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
