#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.7.17

@author: Serious Sam
'''

from maya import cmds
from barbarian.utils import ui, debug

class Main(ui.QtUI):
    def __init__(self, uiFile, **info):
        ui.QtUI.__init__(self, uiFile, **info)
        
        cmds.menu(label=u"开发者选项", parent=self.window)
        cmds.menuItem(label=u"连接调试服务器", command=debug)