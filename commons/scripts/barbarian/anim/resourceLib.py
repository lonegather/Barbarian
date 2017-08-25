#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.8.25

@author: Serious Sam
'''

from maya import cmds
from barbarian.utils import ui
from barbarian.utils.config import getProject, setProject


def UI(*_):
    ResourceRepository("resourceLib",
                       opMnuProject="resourceLibCBProject",
                       rbChar="resourceLibRBChar",
                       rbProp="resourceLibRBProp",
                       rbScene="resourceLibRBScene",
                       container="resourceLibMayaControlLocator",
                       btnLoad="resourceLibBtnLoad")


class ResourceRepository(ui.QtUI):
    def setup(self):
        cmds.optionMenu(self.opMnuProject, e=True, changeCommand=setProject)
        self.shelf = cmds.shelfLayout(parent=self.container, cellHeight=100, cellWidth=150, spacing=5)
        
        cmds.scriptJob(conditionChange=["ProjectChanged", self.refreshData], parent=self.window)
        
        self.refreshData()
    
    def refreshData(self, *_):
        if getProject(): 
            cmds.optionMenu(self.opMnuProject, e=True, l=u"")
            if not cmds.optionMenu(self.opMnuProject, q=True, numberOfItems=True): 
                projects = getProject(all=True)
                for prj in projects: cmds.menuItem(l=prj, parent=self.opMnuProject)
            cmds.optionMenu(self.opMnuProject, e=True, v=getProject())
        elif getProject(all=True): 
            cmds.optionMenu(self.opMnuProject, e=True, l=u"<选择项目>")
            if not cmds.optionMenu(self.opMnuProject, q=True, numberOfItems=True): 
                projects = getProject(all=True)
                for prj in projects: cmds.menuItem(l=prj, parent=self.opMnuProject)
            return
        else: 
            cmds.optionMenu(self.opMnuProject, e=True, l=u"<配置异常>")
            if cmds.optionMenu(self.opMnuProject, q=True, numberOfItems=True): 
                for mi in cmds.optionMenu(self.opMnuProject, q=True, itemListLong=True): 
                    cmds.deleteUI(mi)
            return
        
        