#!/usr/local/bin/python2.7
# encoding: utf-8

import sys, os, pyblish_lite
sys.path.append(r"C:\cgteamwork\bin\base")
from maya import cmds
from PySide import QtCore, QtGui
from barbarian.utils import ui

try:
    from cgtw import *
except: pass


def UI(*_):
    CGTW()


class CGTW(ui.CGTWUI.Ui_CGTWWin):
    
    ip = "10.1.11.100"
    project = "proj_pt"
    
    def setupUi(self, win=None):
        super(CGTW, self).setupUi(win)
        
        QtCore.QObject.connect(self.CGTWBtnConnect,
                               QtCore.SIGNAL("clicked()"),
                               self.connect)
        QtCore.QObject.connect(self.CGTWLEDeregister,
                               QtCore.SIGNAL("clicked()"),
                               self.disconnect)
        self.tw = tw(self.ip)
        self.pyblishLayout = QtGui.QVBoxLayout(self.CGTWPyblish)
        self.pyblishLayout.setContentsMargins(0, 0, 0, 0)
        self.pyblish = pyblish_lite.show(self.CGTWPyblish)
        self.pyblishLayout.addWidget(self.pyblish)
        self.id = ""
        
        self.refreshUI()
        
    def refreshUI(self):
        self.CGTWLBLUser.setText(self.tw.sys().get_account() if self.tw.sys().get_is_login() else u"请登录...")
        self.CGTWLEUsername.setVisible(not self.tw.sys().get_is_login())
        self.CGTWLEPassword.setVisible(not self.tw.sys().get_is_login())
        self.CGTWBtnConnect.setVisible(not self.tw.sys().get_is_login())
        self.CGTWLEDeregister.setVisible(self.tw.sys().get_is_login())
        self.pyblish.setEnabled(self.tw.sys().get_is_login())
        self.CGTWTEInfo.setText(" ")
        
        if self.tw.sys().get_is_login():
            self.id = self.tw.sys().get_account_id()
            asset = self.tw.info_module(self.project, "asset_task")
            asset.init_with_filter([["asset.type_name", "=", "Character"]])
            self.info(self.getAssetTask(self.id))
    
    def connect(self, *_):
        usr = self.CGTWLEUsername.text()
        pwd = self.CGTWLEPassword.text()
        self.tw.sys().login(usr, pwd, self.ip)
        
        self.refreshUI()
        
    def disconnect(self, *_):
        self.tw.sys().logout()
        
        self.refreshUI()
        
    def getAssetPath(self, asset, identify):
        module = self.tw.info_module(self.project, "asset")
        module.init_with_filter([["asset.asset_name", "=", asset]])
        return module.get_dir([identify])[0][identify]+"/"
    
    def getAssetTask(self, account):
        module = self.tw.info_module(self.project, "asset_task")
        module.init_with_filter([["asset_task.account_id", "=", account]])
        return module.get(["asset.asset_name", "asset.cn_name", "asset_task.pipeline"])
    
    def getPipeLineInfo(self):
        tw_pipeline = self.tw.pipeline(self.project)
        return tw_pipeline.get_with_module("asset_task", ["name"])
    
    def info(self, messages):
        from pprint import pprint
        pprint(messages)
        if not messages:
            self.CGTWTEInfo.setText(" ")
            return
        
        for msg in messages:
            for field in msg:
                self.CGTWTEInfo.insertPlainText("%s:%s "%(field, msg[field]))
            self.CGTWTEInfo.insertPlainText('\n')
    
    


