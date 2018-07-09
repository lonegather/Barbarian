#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.6.9

@author: Serious Sam
'''

from maya import cmds, mel
from utils import main, config, cleanUp
import maya.OpenMaya as om
import reloader


class Entrance(object):
    '''
    --------------------------------------------------------------------------------
    Class Representing the Entrance UI
    --------------------------------------------------------------------------------
    '''

    def __init__(self, layout):
        if cmds.control("itBtn", exists=True):
            cmds.deleteUI("itBtn")

        self.layout = layout
        cmds.shelfLayout(layout, e=True, backgroundColor=[0.2, 0.2, 0.2], spacing=3)
        
        self.button = cmds.iconTextButton("itBtn", style="iconOnly", width=33,
                                          image=config.getPath(config.kIcon, "logo.png"), parent=layout)

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
        cmds.menuItem(divider=True)
        cmds.menuItem(label=u'帮助...', command=main.UI)

        try:
            cmds.condition("ProjectChanged", delete=True)
        except:
            pass
        cmds.condition("ProjectChanged", state=True)
        cmds.scriptJob(event=["MenuModeChanged", self.__build__], parent=self.button)
        cmds.scriptJob(event=["NewSceneOpened", self.__refreshUI__], parent=self.button)
        cmds.scriptJob(event=["timeUnitChanged", self.__refreshUI__], parent=self.button)
        cmds.scriptJob(event=["linearUnitChanged", self.__refreshUI__], parent=self.button)
        cmds.scriptJob(conditionChange=["ProjectChanged", self.__refreshUI__], parent=self.button)
        om.MSceneMessage.addCallback(om.MSceneMessage.kBeforeSave, lambda *_: cleanUp('boundingBox'))

        self.__build__()
        self.__refreshUI__()

    def __build__(self):
        while cmds.control("menuSetForm", exists=True): cmds.deleteUI("menuSetForm")
        widgets = cmds.layout(self.layout, q=True, ca=True)
        for widget in widgets:
            isShelfButton = cmds.shelfButton(widget, exists=True)
            if (not isShelfButton) and widget.find("itBtn") == -1:
                cmds.deleteUI(widget)

        try:
            cmds.loadUI(f=config.getPath(config.kUI, "%s.ui" % cmds.setMenuMode()))
        except:
            return

        cmds.shelfLayout(self.layout, e=True, position=(self.button, 1))
        widgets = cmds.layout("menuSetLayout", q=True, ca=True)
        position = 2
        for widget in widgets:
            width = cmds.control(widget, q=True, width=True)
            cmds.control(widget, e=True, parent=self.layout, width=width)
            cmds.shelfLayout(self.layout, e=True, position=(widget, position))
            position += 1

    def __refreshUI__(self):
        if config.getProject():
            import barbarian.utils
            reload(barbarian.utils)
            barbarian.utils.applyConfig()


'''
--------------------------------------------------------------------------------
Tool Initialization at Maya Startup
--------------------------------------------------------------------------------
'''
# initialize entrance
reloader.doIt()
if not cmds.shelfLayout("PuTao", exists=True): mel.eval("addNewShelfTab \"PuTao\";")
tool = Entrance(cmds.shelfLayout("PuTao", q=True, fpn=True))
cmds.headsUpMessage(u'--- 葡萄工具架已完成加载 ---', time=3, verticalOffset=200)
