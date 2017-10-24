#!/usr/local/bin/python2.7
# encoding: utf-8

import sys, os, pyblish_lite
sys.path.append(r"C:\cgteamwork\bin\base")
from maya import cmds
from PySide import QtCore, QtGui
from barbarian.utils import ui, config

try:
    from cgtw import *
except: pass


def UI(*_):
    CGTW()


class CGTW(ui.CGTWUI.Ui_CGTWWin):
    
    ip = "10.1.11.100"
    
    def setupUi(self, win=None):
        super(CGTW, self).setupUi(win)
        
        cmds.scriptJob(conditionChange=["ProjectChanged", self.refreshProject], parent=self.window)
        
        QtCore.QObject.connect(self.CGTWCBProject, 
                               QtCore.SIGNAL("activated(int)"), 
                               lambda *_: config.setProject(self.CGTWCBProject.currentText()))
        QtCore.QObject.connect(self.CGTWBtnConnect,
                               QtCore.SIGNAL("clicked()"),
                               self.connect)
        QtCore.QObject.connect(self.CGTWLEDeregister,
                               QtCore.SIGNAL("clicked()"),
                               self.disconnect)
        self.tw = tw(self.ip)
        self.pyblish = pyblish_lite.show(self.CGTWPyblish)
        self.pyblishLayout.addWidget(self.pyblish)
        self.id = ""
        self.project = ""
        
        self.refreshProject()
        
    def refreshProject(self, *_):
        if config.getProject(): 
            if not self.CGTWCBProject.count(): 
                projects = config.getProject(all=True)
                for prj in projects: self.CGTWCBProject.addItem(prj)
            self.CGTWCBProject.setCurrentText(config.getProject())
        elif config.getProject(all=True):
            if not self.CGTWCBProject.count(): 
                projects = config.getProject(all=True)
                for prj in projects: self.CGTWCBProject.addItem(prj)
                self.CGTWCBProject.setCurrentIndex(-1)
            return
        else: 
            while self.CGTWCBProject.count(): 
                self.CGTWCBProject.removeItem(0)
            return
        
        self.project = config.getConfig("database")
        self.refreshUI()
        
    def refreshUI(self):
        self.CGTWLBLUser.setText(u"欢迎，%s"%self.tw.sys().get_account() if self.tw.sys().get_is_login() else u"请登录...")
        self.CGTWLEUsername.setVisible(not self.tw.sys().get_is_login())
        self.CGTWLEPassword.setVisible(not self.tw.sys().get_is_login())
        self.CGTWBtnConnect.setVisible(not self.tw.sys().get_is_login())
        self.CGTWLEDeregister.setVisible(self.tw.sys().get_is_login())
        self.pyblish.setEnabled(self.tw.sys().get_is_login())
        self.CGTWBtnOpen.setEnabled(self.tw.sys().get_is_login())
        self.CGTWLoader.setEnabled(self.tw.sys().get_is_login())
        self.treeWidget.setEnabled(self.tw.sys().get_is_login())
        self.treeWidget.clear()
        
        if self.tw.sys().get_is_login():
            self.id = self.tw.sys().get_account_id()
            
            for task in self.getAssetTask(self.id) or list():
                item = QtGui.QTreeWidgetItem(self.treeWidget)
                item.setText(0, task["asset_task.pipeline"])
                item.setText(1, task["asset.asset_name"])
                item.setText(2, task["asset_task.status"])
        
        assetFound = False        
        for objset in cmds.ls("*.id",
                              long=True,            # Produce full names
                              type="objectSet",     # Only consider objectSets
                              recursive=True,       # Include namespace
                              objectsOnly=True):    # Return objectSet, rather
                                                    # than its members
            if not cmds.objExists(objset + ".id"): continue
            if not cmds.getAttr(objset + ".id") == "pyblish.starter.instance": continue
            if not cmds.objExists(objset + ".family"): continue
            assetFound = True
        
        self.CGTWLoader.setVisible(not assetFound)
        self.pyblish.setVisible(assetFound)
        
        from pprint import pprint
        pprint(self.getAssetList())
    
    def connect(self, *_):
        usr = self.CGTWLEUsername.text()
        pwd = self.CGTWLEPassword.text()
        self.tw.sys().login(usr, pwd, self.ip)
        
        self.refreshUI()
        
    def disconnect(self, *_):
        self.tw.sys().logout()
        
        self.refreshUI()
        
    def getAssetList(self):
        module = self.tw.info_module(self.project, "asset")
        module.init_with_id(module.get_id_list())
        return module.get(["asset.asset_name"])
    
    def getAssetPath(self, asset, identify):
        module = self.tw.info_module(self.project, "asset")
        module.init_with_id([["asset.asset_name", "=", asset]])
        return module.get_dir([identify])[0][identify]+"/"
    
    def getAssetTask(self, account):
        module = self.tw.info_module(self.project, "asset_task")
        module.init_with_filter([["asset_task.account_id", "=", account]])
        return module.get(["asset.asset_name", "asset.cn_name", "asset_task.pipeline", "asset_task.status"])
    
    def getPipeLineInfo(self):
        tw_pipeline = self.tw.pipeline(self.project)
        return tw_pipeline.get_with_module("asset_task", ["name"])
    
    
    


