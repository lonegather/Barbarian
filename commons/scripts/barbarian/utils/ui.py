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
    Base class for managing __windows which loaded from .ui file.
    '''
    __windows = {}
    
    def __init__(self, ui, **info):
        try: cmds.deleteUI(self.__windows[ui].window)
        except: pass
        self.window = cmds.loadUI(f=getPath(kUI, "%s.ui"%ui))
        self.__windows.update({ui:self})
        setattr(self.__class__, ui, self)
        
        for item in info:
            try: widgetPath = '|'.join(cmds.control(info[item], q=True, fpn=True).split("|")[1:])
            except: cmds.confirmDialog(message=u'未找到控件：'+info[item], icon='warning', title=u'PuTao')
            else: self.__setattr__(item, "%s|%s"%(self.window, widgetPath))
        
        self.setup()
        cmds.showWindow(self.window)
        
    @classmethod
    def getWindow(cls, key):
        return cls.__windows[key]
        
    def setup(self):
        '''
        Implement this method for UI setup when the .ui file was loaded.
        '''
        pass