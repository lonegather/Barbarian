# -*- coding: utf-8 -*-

'''
Created on 2017.6.9

@author: Sam
'''

import pymel.core as pm
import maya.OpenMaya as om
import barbarian.reloader

def showMain():
    from barbarian.utils import getPath, kUI, debug
    
    win = "PuTaoMain"
    
    if pm.window(win, exists=True): pm.deleteUI(win)
    pm.loadUI(f=getPath(kUI, "main.ui"))
    pm.showWindow(win)
    
    pm.menu(label=u"开发者选项", parent=win)
    pm.menuItem(label=u"连接调试服务器", command=debug)

class Entrance(object):
    '''
    --------------------------------------------------------------------------------
    Class Representing the Entrance UI
    --------------------------------------------------------------------------------
    '''
    def __init__(self, layout):
        from barbarian.utils import getPath, getProject, setProject, kIcon
        
        if pm.control("itBtn", exists=True):
            pm.deleteUI("itBtn")
            pm.deleteUI("opMnu")
        
        self.layout = layout
        pm.shelfLayout(layout, e=True, backgroundColor=[0.2,0.2,0.2], spacing=3)
        self.button = pm.iconTextButton("itBtn", style="iconOnly", width=33, 
            image=getPath(kIcon, "logo.png"), parent=layout, command=showMain)
        self.menu = pm.optionMenu("opMnu", parent=layout, nbg=True, changeCommand=setProject)
        
        currentMode = pm.setMenuMode()
        pm.popupMenu(parent=self.layout, allowOptionBoxes=True)
        pm.menuItem(label=u'模型', radioButton=(currentMode == "modelingMenuSet"),
                    command=pm.Callback(pm.setMenuMode, "modelingMenuSet"))
        pm.menuItem(label=u'绑定', radioButton=(currentMode == "riggingMenuSet"),
                    command=pm.Callback(pm.setMenuMode, "riggingMenuSet"))
        pm.menuItem(label=u'动画', radioButton=(currentMode == "animationMenuSet"),
                    command=pm.Callback(pm.setMenuMode, "animationMenuSet"))
        pm.menuItem(label=u'渲染', radioButton=(currentMode == "renderingMenuSet"),
                    command=pm.Callback(pm.setMenuMode, "renderingMenuSet"))
        pm.menuItem(label=u'特效', radioButton=(currentMode == "dynamicsMenuSet"),
                    command=pm.Callback(pm.setMenuMode, "dynamicsMenuSet"))
        
        pm.scriptJob(event=["MenuModeChanged", self.__build__], parent=self.button)
        pm.scriptJob(event=["NewSceneOpened", self.__refreshUI__], parent=self.menu)
        pm.scriptJob(event=["timeUnitChanged", self.__refreshUI__], parent=self.menu)
        pm.scriptJob(event=["linearUnitChanged", self.__refreshUI__], parent=self.menu)
        pm.scriptJob(conditionChange=["ProjectChanged", self.__refreshUI__], parent=self.menu)
        om.MSceneMessage.addCallback(om.MSceneMessage.kBeforeSave, self.__boundingBox__)
        
        self.__build__()
        self.__refreshUI__()
    
    def __build__(self):
        from barbarian.utils import getPath, kUI
        
        while pm.control("menuSetForm", exists=True): pm.deleteUI("menuSetForm")
        widgets = pm.layout(self.layout, q=True, ca=True)
        for widget in widgets:
            isShelfButton = pm.shelfButton(widget, exists=True)
            if (not isShelfButton) and widget != "itBtn" and widget != "opMnu":
                pm.deleteUI(widget)
        
        try: pm.loadUI(f=getPath(kUI, "%s.ui" % pm.setMenuMode()))
        except: pass
        else:
            pm.shelfLayout(self.layout, e=True, position=(self.button, 1))
            pm.shelfLayout(self.layout, e=True, position=(self.menu, 2))
            widgets = pm.layout("menuSetLayout", q=True, ca=True)
            position = 3
            for widget in widgets:
                width = pm.control(widget, q=True, width=True)
                pm.control(widget, e=True, parent=self.layout, width=width)
                pm.shelfLayout(self.layout, e=True, position=(widget, position))
                position = position + 1

    def __refreshUI__(self):
        from barbarian.utils import getProject, getConfig
        
        if getProject(): 
            if not pm.optionMenu(self.menu, q=True, numberOfItems=True): 
                projects = getProject(all=True)
                for prj in projects: pm.menuItem(l=prj, parent=self.menu)
            
            pm.optionMenu(self.menu, e=True, l="", width=50, v=getProject())
            pm.currentUnit(time=getConfig(time=True))
            pm.setAttr("%s.width"%pm.ls(renderResolutions=True)[0], getConfig(camResX=True))
            pm.setAttr("%s.height"%pm.ls(renderResolutions=True)[0], getConfig(camResY=True))
        elif getProject(all=True): pm.optionMenu(self.menu, e=True, width=85, l=u"<选择项目>")
        else: 
            if pm.optionMenu(self.menu, q=True, numberOfItems=True): 
                for mi in pm.optionMenu(self.menu, q=True, itemListLong=True): 
                    pm.deleteUI(mi)
            pm.optionMenu(self.menu, e=True, width=85, l=u"<配置异常>")

    def __boundingBox__(self):
        allPanels = pm.getPanel(type='modelPanel')
        for p in allPanels:
            pm.modelEditor(p, edit=1, displayAppearance='boundingBox')
    
'''
--------------------------------------------------------------------------------
Tool Initialization at Maya Startup
--------------------------------------------------------------------------------
'''

#initialize plugins
for i in ["pyPBMpegCmd", "CustomDeformers", "animImportExport"]:
    try: pm.loadPlugin(i)
    except: pass

#initialize entrance
if not pm.shelfLayout("PuTao", exists=True):
    pm.mel.eval("addNewShelfTab \"PuTao\";")
Entrance(pm.shelfLayout("PuTao", q=True, fpn=True))

barbarian.reloader.doIt()

print u"╔══════════════════════════════════════════════════════════╗"
print u"╟────────── PUTAOTOOLS INITIALIZATION COMPLETED ───────────╢"
print u"╚══════════════════════════════════════════════════════════╝"
