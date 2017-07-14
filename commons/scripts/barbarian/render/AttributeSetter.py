#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.7.12

@author: Sam
'''

import re
from maya import cmds
from barbarian.utils import getPath, kUI

def UI(*_):
    AttributeSetter.new()
    
def execute(*_):
    AttributeSetter.use.execute()

class AttributeSetter(object):
    
    use = None
    
    @classmethod
    def new(cls):
        if cls.use and cmds.window(cls.use.win, exists=True):
            cmds.deleteUI(cls.use.win)
        cls.use = AttributeSetter(cmds.loadUI(f=getPath(kUI, "attributeSetter.ui")))
    
    def __init__(self, win):
        self.win = win
        self.txtObj = win + "|layout|LEObject"
        self.txtAttr = win + "|layout|LEAttribute"
        self.txtVal1 = win + "|layout|LEValue1"
        self.txtVal2 = win + "|layout|LEValue2"
        
        if cmds.windowPref(win, exists=True):
            cmds.windowPref(win, e=True, topLeftCorner=[300,693], width=534, height=48)
            
        cmds.showWindow(win)
        
    def execute(self):
        obj = cmds.textField(self.txtObj, q=True, tx=True)
        attr = cmds.textField(self.txtAttr, q=True, tx=True)
        val1 = cmds.textField(self.txtVal1, q=True, tx=True)
        val2 = cmds.textField(self.txtVal2, q=True, tx=True)
        
        print obj + '.' + attr, val1, val2
        
        try:
            val1 = float(val1)
            val2 = float(val2)
            if not obj or not attr: return
        except: return
        
        regExp = re.compile(obj)
        objs = cmds.ls()
        
        for o in objs:
            if regExp.search(o):
                print o
        
        