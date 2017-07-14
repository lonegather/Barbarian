#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.7.5

@author: Sam
'''

from maya import cmds
from barbarian.utils import getPath, kUI

class QtWindow(object):
    
    def __init__(self, ui, **info):
        print info
        
        self.window = cmds.loadUI(f=getPath(kUI, ui))
        
        for item in info:
            self.__setattr__(item, info[item])