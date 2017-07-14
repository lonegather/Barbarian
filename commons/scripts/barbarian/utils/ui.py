#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.7.5

@author: Sam
'''

from maya import cmds
from barbarian.utils import getPath, kUI

class QtWindow(object):
    '''
    Base class for managing windows which loaded from .ui file.
    '''
    __windows = {}
    
    @classmethod
    def getWindow(cls, key):
        return cls.__windows[key]
    
    def __init__(self, ui, **info):
        try: cmds.deleteUI(self.__windows[ui].window)
        except: pass
        self.window = cmds.loadUI(f=getPath(kUI, "%s.ui"%ui))
        self.__windows.update({ui:self})
        
        for item in info:
            self.__setattr__(item, info[item])
        
        cmds.showWindow(self.window)
        self.setup()
        
    def setup(self):
        '''
        Implement this method for UI setup when the .ui file was loaded.
        '''
        pass

