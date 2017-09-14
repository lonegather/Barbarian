#!/usr/local/bin/python2.7
# encoding: utf-8

import sys, os
sys.path.append(r"C:\cgteamwork\bin\base")
from maya import cmds
from barbarian.utils import ui

try:
    from cgtw import *
except: pass


def UI(*_):
    CGTW("CGTW",
         txtUsername = "CGTWLEUsername",
         txtPassword = "CGTWLEPassword",
         btnConnect  = "CGTWBtnConnect",
         lblUser     = "CGTWLBLUser")


class CGTW(ui.QtUI):
    
    ip = "10.1.11.100"
    
    def setupUi(self):
        cmds.button(self.btnConnect, e=True, command=self.connect)
        self.tw = tw(self.ip)
        self.refreshUI()
        
    def refreshUI(self):
        cmds.text(self.lblUser, e=True, label=self.tw.sys().get_account())
    
    def connect(self, *_):
        usr = cmds.textField(self.txtUsername, q=True, tx=True)
        pwd = cmds.textField(self.txtPassword, q=True, tx=True)
        self.tw.sys().login(usr, pwd, self.ip)
        
        self.refreshUI()