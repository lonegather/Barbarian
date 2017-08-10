#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.6.9

@author: Serious Sam
'''

from maya import cmds, mel
from utils import config
import maya.OpenMaya as om
import reloader


class Entrance(object):
    '''
    --------------------------------------------------------------------------------
    Class Representing the Entrance UI
    --------------------------------------------------------------------------------
    '''
    def __init__(self, layout):
        from barbarian.utils import getPath, getProject, setProject, kIcon, kUI
        
        if cmds.control("itBtn", exists=True):
            cmds.deleteUI("itBtn")
            cmds.deleteUI("opMnu")
        
        self.layout = layout
        cmds.shelfLayout(layout, e=True, backgroundColor=[0.2,0.2,0.2], spacing=3)
        self.button = cmds.iconTextButton("itBtn", style="iconOnly", width=33, 
            image=getPath(kIcon, "logo.png"), parent=layout, command=lambda *_: config.Main("main"))
        
        cmds.loadUI(f=getPath(kUI, "entrance.ui"))
        self.menu = cmds.layout("entranceLayout", q=True, ca=True)[0]
        cmds.optionMenu(self.menu, e=True, parent=layout, width=60, changeCommand=setProject)
        cmds.deleteUI("entranceForm")
        
        currentMode = cmds.setMenuMode()
        cmds.popupMenu(parent=self.layout, allowOptionBoxes=True)
        cmds.menuItem(label=u'模型', radioButton=(currentMode == "modelingMenuSet"),
                    command=lambda *_: cmds.setMenuMode("modelingMenuSet"))
        cmds.menuItem(label=u'绑定', radioButton=(currentMode == "riggingMenuSet"),
                    command=lambda *_: cmds.setMenuMode("riggingMenuSet"))
        cmds.menuItem(label=u'动画', radioButton=(currentMode == "animationMenuSet"),
                    command=lambda *_: cmds.setMenuMode("animationMenuSet"))
        cmds.menuItem(label=u'渲染', radioButton=(currentMode == "renderingMenuSet"),
                    command=lambda *_: cmds.setMenuMode("renderingMenuSet"))
        cmds.menuItem(label=u'特效', radioButton=(currentMode == "dynamicsMenuSet"),
                    command=lambda *_: cmds.setMenuMode("dynamicsMenuSet"))
        
        cmds.scriptJob(event=["MenuModeChanged", self.__build__], parent=self.button)
        cmds.scriptJob(event=["NewSceneOpened", self.__refreshUI__], parent=self.menu)
        cmds.scriptJob(event=["timeUnitChanged", self.__refreshUI__], parent=self.menu)
        cmds.scriptJob(event=["linearUnitChanged", self.__refreshUI__], parent=self.menu)
        cmds.scriptJob(conditionChange=["ProjectChanged", self.__refreshUI__], parent=self.menu)
        om.MSceneMessage.addCallback(om.MSceneMessage.kBeforeSave, self.__boundingBox__)
        
        self.__build__()
        self.__refreshUI__()
    
    def __build__(self):
        from barbarian.utils import getPath, kUI
        
        while cmds.control("menuSetForm", exists=True): cmds.deleteUI("menuSetForm")
        widgets = cmds.layout(self.layout, q=True, ca=True)
        for widget in widgets:
            isShelfButton = cmds.shelfButton(widget, exists=True)
            if (not isShelfButton) and widget.find("itBtn")==-1 and widget != self.menu:
                cmds.deleteUI(widget)
        
        try: cmds.loadUI(f=getPath(kUI, "%s.ui" % cmds.setMenuMode()))
        except: return

        cmds.shelfLayout(self.layout, e=True, position=(self.button, 1))
        cmds.shelfLayout(self.layout, e=True, position=(self.menu, 2))
        widgets = cmds.layout("menuSetLayout", q=True, ca=True)
        position = 3
        for widget in widgets:
            width = cmds.control(widget, q=True, width=True)
            cmds.control(widget, e=True, parent=self.layout, width=width)
            cmds.shelfLayout(self.layout, e=True, position=(widget, position))
            position += 1

    def __refreshUI__(self):
        from barbarian.utils import getProject, getConfig
        
        if getProject(): 
            if not cmds.optionMenu(self.menu, q=True, numberOfItems=True): 
                projects = getProject(all=True)
                for prj in projects: cmds.menuItem(l=prj, parent=self.menu)
            
            cmds.optionMenu(self.menu, e=True, l="", v=getProject())
            cmds.currentUnit(time=getConfig(time=True), updateAnimation=False)
            cmds.setAttr("%s.width"%cmds.ls(renderResolutions=True)[0], getConfig(camResX=True))
            cmds.setAttr("%s.height"%cmds.ls(renderResolutions=True)[0], getConfig(camResY=True))
        elif getProject(all=True): 
            cmds.optionMenu(self.menu, e=True, l=u"<选择项目>")
            if not cmds.optionMenu(self.menu, q=True, numberOfItems=True): 
                projects = getProject(all=True)
                for prj in projects: cmds.menuItem(l=prj, parent=self.menu)
        else: 
            if cmds.optionMenu(self.menu, q=True, numberOfItems=True): 
                for mi in cmds.optionMenu(self.menu, q=True, itemListLong=True): 
                    cmds.deleteUI(mi)
            cmds.optionMenu(self.menu, e=True, l=u"<配置异常>")

    def __boundingBox__(self, *_):
        allPanels = cmds.getPanel(type='modelPanel')
        for p in allPanels:
            cmds.modelEditor(p, edit=1, displayAppearance='boundingBox')
    
'''
--------------------------------------------------------------------------------
Tool Initialization at Maya Startup
--------------------------------------------------------------------------------
'''
#initialize entrance
if not cmds.shelfLayout("PuTao", exists=True):
    mel.eval("addNewShelfTab \"PuTao\";")
Entrance(cmds.shelfLayout("PuTao", q=True, fpn=True))

reloader.doIt()

print u"╔══════════════════════════════════════════════════════════╗"
print u"╟────────── PUTAOTOOLS INITIALIZATION COMPLETED ───────────╢"
print u"╚══════════════════════════════════════════════════════════╝"
