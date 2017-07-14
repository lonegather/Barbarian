#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.7.12

@author: Sam
'''

import re
from maya import cmds
from barbarian.utils import ui

def UI(*_):
    AttributeSetter("attributeSetter",
                    txtObj="LEObject",
                    txtAttr="LEAttribute",
                    txtVal1="LEValue1",
                    txtVal2="LEValue2")
    
def execute(*_):
    AttributeSetter.getWindow("attributeSetter").execute()

class AttributeSetter(ui.QtWindow):
    def setup(self):
        print ("setup:", self)
    
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
        
        