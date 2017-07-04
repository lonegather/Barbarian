'''
Created on 2017.6.9

@author: Sam
'''

import pymel.core as pm
from barbarian.utils import getPath, getProject, setProject, getConfig, getHelp, kIcon, kUI

try: import barbarian.model
except Exception, e: pm.confirmDialog(message=u'加载异常：%s'%e, icon="critical")
try: import barbarian.rig
except Exception, e: pm.confirmDialog(message=u'加载异常：%s'%e, icon="critical")
try: import barbarian.anim
except Exception, e: pm.confirmDialog(message=u'加载异常：%s'%e, icon="critical")
try: import barbarian.render
except Exception, e: pm.confirmDialog(message=u'加载异常：%s'%e, icon="critical")
try: import barbarian.fx
except Exception, e: pm.confirmDialog(message=u'加载异常：%s'%e, icon="critical")


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
        
        self.layout = layout
        pm.shelfLayout(layout, e=True, backgroundColor=[0.2,0.2,0.2], spacing=3)
        self.button = pm.iconTextButton("itBtn", style="iconOnly", width=33, 
            image=getPath(kIcon, "logo.png"), parent=layout, command=getHelp)
        self.menu = pm.optionMenu("opMnu", parent=layout, nbg=True, changeCommand=setProject)
        
        projects = getProject(all=True)
        currentMode = pm.setMenuMode()
        
        for prj in projects: pm.menuItem(l=prj)
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
        pm.scriptJob(conditionChange=["ProjectChanged", self.__refreshUI__], parent=self.menu)
        self.__build__()
        self.__refreshUI__()
    
    def __build__(self):
        if pm.control("Form", exists=True): pm.deleteUI("Form")
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
            widgets = pm.layout("horizontalLayout", q=True, ca=True)
            position = 3
            for widget in widgets:
                width = pm.control(widget, q=True, width=True)
                pm.control(widget, e=True, parent=self.layout, width=width)
                pm.shelfLayout(self.layout, e=True, position=(widget, position))
                position = position + 1

    def __refreshUI__(self):
        if getProject(): 
            pm.optionMenu(self.menu, e=True, l="", width=50, v=getProject())
            pm.currentUnit(time=getConfig(time=True))
        else: pm.optionMenu(self.menu, e=True, width=85, l=u"<选择项目>")


'''
--------------------------------------------------------------------------------
Tool Initialization at Maya Startup
--------------------------------------------------------------------------------
'''

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
