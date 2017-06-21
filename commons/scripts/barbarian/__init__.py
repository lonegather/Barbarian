'''
Created on 2017.6.9

@author: Sam
'''

import pymel.core as pm
import barbarian.model
import barbarian.rig
import barbarian.anim
import barbarian.render
import barbarian.fx
import barbarian.utils
from barbarian.utils import *


class Entrance(object):
    '''
    --------------------------------------------------------------------------------
    Class Representing the Entrance UI
    --------------------------------------------------------------------------------
    '''
    def __init__(self, layout):
        if pm.control("itBtn", exists=True):
            pm.deleteUI("itBtn")
            pm.deleteUI("opMnu")
        pm.shelfLayout(layout, e=True, spacing=5)
        
        self.widget = None
        self.layout = layout
        self.button = pm.iconTextButton("itBtn", style="iconOnly",
            image=getPath(kIcon, "logo.jpg"), width=33, flat=0, parent=layout, 
            command=pm.Callback(getHelp))
        self.menu = pm.optionMenu("opMnu", parent=layout, changeCommand=setProject)
        
        projects = getProject(all=True)
        currentMode = pm.setMenuMode()
        
        for prj in projects:
            pm.menuItem(l=prj)
        pm.popupMenu(parent=self.layout, allowOptionBoxes=True)
        pm.menuItem(label=u'模型', radioButton=(currentMode == "modelingMenuSet"),
                    command=lambda *args: pm.setMenuMode("modelingMenuSet"))
        pm.menuItem(label=u'绑定', radioButton=(currentMode == "riggingMenuSet"),
                    command=lambda *args: pm.setMenuMode("riggingMenuSet"))
        pm.menuItem(label=u'动画', radioButton=(currentMode == "animationMenuSet"),
                    command=lambda *args: pm.setMenuMode("animationMenuSet"))
        pm.menuItem(label=u'渲染', radioButton=(currentMode == "renderingMenuSet"),
                    command=lambda *args: pm.setMenuMode("renderingMenuSet"))
        pm.menuItem(label=u'特效', radioButton=(currentMode == "dynamicsMenuSet"),
                    command=lambda *args: pm.setMenuMode("dynamicsMenuSet"))
        
        pm.scriptJob(event=["MenuModeChanged", self.__build__], parent=self.button)
        pm.scriptJob(conditionChange=["ProjectChanged", self.__refreshUI__], parent=self.menu)
        self.__build__()
        self.__refreshUI__()
    
    def __build__(self):
        if pm.control("Form", exists=True):
            pm.deleteUI("Form")
        try: self.widget = pm.loadUI(f=getPath(kUI, "%s.ui" % pm.setMenuMode()), verbose=True)
        except: self.widget = None
        else:
            tmp = pm.layout("gridLayout", q=True, ca=True)
            width = pm.control(self.widget, q=True, width=True)
            pm.control(self.widget, e=True, parent=self.layout, width=width)
            pm.shelfLayout(self.layout, e=True, position=(self.button, 1))
            pm.shelfLayout(self.layout, e=True, position=(self.menu, 2))
            pm.shelfLayout(self.layout, e=True, position=(self.widget, 3))

    def __refreshUI__(self):
        if getProject(): pm.optionMenu(self.menu, e=True, l="", width=50, v=getProject())
        else: pm.optionMenu(self.menu, e=True, width=85, l=u"<选择项目>")


'''
--------------------------------------------------------------------------------
Tool Initialization at Maya Startup
--------------------------------------------------------------------------------
'''
#for debug purpose only
debug()

#initialize plugins
for i in ["pyPBMpegCmd", "CustomDeformers"]:
    try: pm.loadPlugin(i)
    except: pass

#initialize entrance
if not pm.shelfLayout("PuTao", exists=True):
    pm.mel.eval("addNewShelfTab \"PuTao\";")
Entrance(pm.shelfLayout("PuTao", q=True, fpn=True))

print u"╔══════════════════════════════════════════════════════════╗"
print u"╟────────── PUTAOTOOLS INITIALIZATION COMPLETED ───────────╢"
print u"╚══════════════════════════════════════════════════════════╝"
