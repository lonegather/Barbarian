#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.7.12

@author: Sam
'''

import random
from maya import cmds
from maya import mel
from barbarian.utils import ui

def UI(*_):
    AttributeSetter("attributeSetter",
                    txtObj="LEObject",
                    txtAttr="LEAttribute",
                    txtVal1="LEValue1",
                    txtVal2="LEValue2")
    
def execute(*_):
    AttributeSetter.UI().execute()

class AttributeSetter(ui.QtUI):
    def __init__(self, uiFile, **info):
        ui.QtUI.__init__(self, uiFile, **info)
    
    def execute(self):
        obj = cmds.textField(self.txtObj, q=True, tx=True)
        attr = cmds.textField(self.txtAttr, q=True, tx=True)
        val1 = cmds.textField(self.txtVal1, q=True, tx=True)
        val2 = cmds.textField(self.txtVal2, q=True, tx=True)
        
        try:
            val1 = float(val1)
            val2 = float(val2)
            if not obj or not attr: return
        except: 
            cmds.confirmDialog(message=u'无效输入', icon='information', title=u'PuTao')
            return
        
        objs = cmds.ls()
        
        for o in objs:
            if self.__match__(o, obj):
                rand = random.uniform(val1, val2)
                try: cmds.setAttr("%s.%s"%(o, attr), rand)
                except Exception, e:
                    cmds.confirmDialog(message=u'%s'%e, icon='warning', title=u'PuTao')
        
    def __match__(self, obj, exp):
        return mel.eval("gmatch \"%s\" \"%s\";"%(obj, exp))
        
        
        