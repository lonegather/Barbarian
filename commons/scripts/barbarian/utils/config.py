#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.7.17

@author: Serious Sam
'''

import sys
import xml.dom.minidom
from maya import cmds
from barbarian.utils import ui


class Main(ui.QtUI):
    def __init__(self, uiFile, **info):
        ui.QtUI.__init__(self, uiFile, **info)
        
        cmds.menu(label=u"开发者选项", parent=self.window)
        cmds.menuItem(label=u"连接调试服务器", command=self.debug)
        
    def debug(self, *_):
        path = "C:/Users/Administrator/.p2/pool/plugins/org.python.pydev_5.8.0.201706061859/pysrc/"
        if path not in sys.path: sys.path.append(path)
        try: import pydevd
        except: return
        else: pydevd.settrace(stdoutToServer=True, stderrToServer=True, suspend=False)


class Config(object):
    
    __instance = None
    
    @classmethod
    def instance(cls):
        return cls.__instance
    
    def __init__(self, filePath):
        self.__instance = self
        dom = xml.dom.minidom.parse(filePath)
        self.root = dom.documentElement
    