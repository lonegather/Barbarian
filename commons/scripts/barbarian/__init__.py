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
        
        from barbarian.utils import getPath, getHelp, kIcon, getProject, getConfig, setProject
        
        self.widget = None
        self.layout = layout
        self.button = pm.iconTextButton("itBtn", style="iconAndTextHorizontal",
            image=getPath(kIcon, "logo.jpg"), width=33, flat=0, parent=layout, 
            backgroundColor=[.2,.2,.2], command=pm.Callback(getHelp))
        self.menu = pm.optionMenu("opMnu", parent=layout, changeCommand=setProject)
        projects = getProject(all=True)
        for prj in projects:
            pm.menuItem(l=prj)
        
        currentMode = pm.setMenuMode()
        state_dic = {"modelingMenuSet": (currentMode == "modelingMenuSet"),
                     "riggingMenuSet": (currentMode == "riggingMenuSet"),
                     "animationMenuSet": (currentMode == "animationMenuSet"),
                     "renderingMenuSet": (currentMode == "renderingMenuSet"),
                     "dynamicsMenuSet": (currentMode == "dynamicsMenuSet")}
    
        pm.popupMenu(parent=self.layout)
        pm.menuItem(label=u'模型', radioButton=state_dic["modelingMenuSet"],
                    command=lambda *args: pm.setMenuMode("modelingMenuSet"))
        pm.menuItem(label=u'绑定', radioButton=state_dic["riggingMenuSet"],
                    command=lambda *args: pm.setMenuMode("riggingMenuSet"))
        pm.menuItem(label=u'动画', radioButton=state_dic["animationMenuSet"],
                    command=lambda *args: pm.setMenuMode("animationMenuSet"))
        pm.menuItem(label=u'渲染', radioButton=state_dic["renderingMenuSet"],
                    command=lambda *args: pm.setMenuMode("renderingMenuSet"))
        pm.menuItem(label=u'特效', radioButton=state_dic["dynamicsMenuSet"],
                    command=lambda *args: pm.setMenuMode("dynamicsMenuSet"))
        
        pm.scriptJob(event=["MenuModeChanged", self.__build__], parent=self.button)
        pm.scriptJob(conditionChange=["ProjectChanged", self.__refreshUI__], parent=self.menu)
        self.__build__()
        self.__refreshUI__()
    
    def __build__(self):
        
        from barbarian.utils import getPath, kUI, getProject
        
        currentMode = pm.setMenuMode()
        if pm.control("Form", exists=True):
            pm.deleteUI("Form")
        try: self.widget = pm.loadUI(f=getPath(kUI, "%s.ui" % currentMode))
        except: self.widget = None
        else:
            width = pm.control(self.widget, q=True, width=True)
            pm.control(self.widget, e=True, parent=self.layout, width=width, enable=bool(getProject()))
            pm.shelfLayout(self.layout, e=True, position=(self.button, 1))
            pm.shelfLayout(self.layout, e=True, position=(self.menu, 2))
            pm.shelfLayout(self.layout, e=True, position=(self.widget, 3))

    def __refreshUI__(self):
        
        from barbarian.utils import getProject
        
        if getProject(): pm.optionMenu(self.menu, e=True, l="", width=50, v=getProject())
        else: pm.optionMenu(self.menu, e=True, width=85, l=u"<选择项目>")
        
        pm.control(self.widget, e=True, enable=bool(getProject()))

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
