#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.6.9

@author: Sam
'''

from maya import cmds
from maya import mel
import maya.OpenMaya as om
import barbarian.reloader

def showMain():
    from barbarian.utils import getPath, kUI, debug
    
    win = "PuTaoMain"
    
    if cmds.window(win, exists=True): cmds.deleteUI(win)
    cmds.loadUI(f=getPath(kUI, "main.ui"))
    cmds.showWindow(win)
    
    cmds.menu(label=u"开发者选项", parent=win)
    cmds.menuItem(label=u"连接调试服务器", command=debug)

class Entrance(object):
    '''
    --------------------------------------------------------------------------------
    Class Representing the Entrance UI
    --------------------------------------------------------------------------------
    '''
    def __init__(self, layout):
        from barbarian.utils import getPath, getProject, setProject, kIcon
        
        if cmds.control("itBtn", exists=True):
            cmds.deleteUI("itBtn")
            cmds.deleteUI("opMnu")
        
        self.layout = layout
        cmds.shelfLayout(layout, e=True, backgroundColor=[0.2,0.2,0.2], spacing=3)
        self.button = cmds.iconTextButton("itBtn", style="iconOnly", width=33, 
            image=getPath(kIcon, "logo.png"), parent=layout, command=showMain)
        self.menu = cmds.optionMenu("opMnu", parent=layout, nbg=True, changeCommand=setProject)
        
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
            if (not isShelfButton) and widget != "itBtn" and widget != "opMnu":
                cmds.deleteUI(widget)
        
        try: cmds.loadUI(f=getPath(kUI, "%s.ui" % cmds.setMenuMode()))
        except: pass
        else:
            cmds.shelfLayout(self.layout, e=True, position=(self.button, 1))
            cmds.shelfLayout(self.layout, e=True, position=(self.menu, 2))
            widgets = cmds.layout("menuSetLayout", q=True, ca=True)
            position = 3
            for widget in widgets:
                width = cmds.control(widget, q=True, width=True)
                cmds.control(widget, e=True, parent=self.layout, width=width)
                cmds.shelfLayout(self.layout, e=True, position=(widget, position))
                position = position + 1

    def __refreshUI__(self):
        from barbarian.utils import getProject, getConfig
        
        if getProject(): 
            if not cmds.optionMenu(self.menu, q=True, numberOfItems=True): 
                projects = getProject(all=True)
                for prj in projects: cmds.menuItem(l=prj, parent=self.menu)
            
            cmds.optionMenu(self.menu, e=True, l="", width=50, v=getProject())
            cmds.currentUnit(time=getConfig(time=True))
            cmds.setAttr("%s.width"%cmds.ls(renderResolutions=True)[0], getConfig(camResX=True))
            cmds.setAttr("%s.height"%cmds.ls(renderResolutions=True)[0], getConfig(camResY=True))
        elif getProject(all=True): 
            cmds.optionMenu(self.menu, e=True, width=85, l=u"<选择项目>")
            if not cmds.optionMenu(self.menu, q=True, numberOfItems=True): 
                projects = getProject(all=True)
                for prj in projects: cmds.menuItem(l=prj, parent=self.menu)
        else: 
            if cmds.optionMenu(self.menu, q=True, numberOfItems=True): 
                for mi in cmds.optionMenu(self.menu, q=True, itemListLong=True): 
                    cmds.deleteUI(mi)
            cmds.optionMenu(self.menu, e=True, width=85, l=u"<配置异常>")

    def __boundingBox__(self, *_):
        allPanels = cmds.getPanel(type='modelPanel')
        for p in allPanels:
            cmds.modelEditor(p, edit=1, displayAppearance='boundingBox')
    
'''
--------------------------------------------------------------------------------
Tool Initialization at Maya Startup
--------------------------------------------------------------------------------
'''

#initialize plugins
for i in ["pyPBMpegCmd", "CustomDeformers", "animImportExport"]:
    try: cmds.loadPlugin(i)
    except: pass

#initialize entrance
if not cmds.shelfLayout("PuTao", exists=True):
    mel.eval("addNewShelfTab \"PuTao\";")
Entrance(cmds.shelfLayout("PuTao", q=True, fpn=True))

barbarian.reloader.doIt()

print u"╔══════════════════════════════════════════════════════════╗"
print u"╟────────── PUTAOTOOLS INITIALIZATION COMPLETED ───────────╢"
print u"╚══════════════════════════════════════════════════════════╝"
