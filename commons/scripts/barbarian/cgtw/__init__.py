#!/usr/local/bin/python2.7
# encoding: utf-8

import sys, logging
import pyblish_lite, pyblish
from barbarian.utils import config
from barbarian.utils.ui import CGTWUI
from PySide import QtCore, QtGui
from maya import cmds
import maya.OpenMaya as om
from nt import pipe

try:
    from cgtw import *
except ImportError:
    pass


def UI(*_):
    CGTW()


class CGTW(CGTWUI.Ui_CGTWWin):
    ip = "10.1.11.100"

    def setupUi(self, win=None):
        super(CGTW, self).setupUi(win)

        cmds.scriptJob(conditionChange=["ProjectChanged", self.refreshProject], parent=self.window)
        self.addSceneCallback(om.MSceneMessage.kAfterNew, self.refreshUI)
        self.addSceneCallback(om.MSceneMessage.kAfterOpen, self.refreshUI)
        self.addSceneCallback(om.MSceneMessage.kAfterNew, self.refreshPyblish)
        self.addSceneCallback(om.MSceneMessage.kAfterOpen, self.refreshPyblish)
        self.addSceneCallback(om.MSceneMessage.kBeforeSave, self.refreshPyblish)

        QtCore.QObject.connect(self.CGTWCBProject,
                               QtCore.SIGNAL("activated(int)"),
                               lambda *_: config.setProject(self.CGTWCBProject.currentText()))
        self.treeWidget.itemClicked.connect(self.refreshInfo)
        self.treeWidget.itemDoubleClicked.connect(self.create)
        self.CGTWBtnConnect.clicked.connect(self.connect)
        self.CGTWLEDeregister.clicked.connect(self.disconnect)

        self.tw = tw(self.ip)
        self.pyblish = pyblish_lite.show(self.CGTWPyblish)
        self.pyblishLayout.addWidget(self.pyblish)
        self.id = ""
        self.project = ""
        self.family = {}

        #self.treeWidget.setStyleSheet("")

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

    def refreshUI(self, *_):
        self.CGTWLBLUser.setText(u"欢迎，%s" % self.tw.sys().get_account() if self.tw.sys().get_is_login() else u"请登录...")
        self.CGTWLEUsername.setVisible(not self.tw.sys().get_is_login())
        self.CGTWLEPassword.setVisible(not self.tw.sys().get_is_login())
        self.CGTWBtnConnect.setVisible(not self.tw.sys().get_is_login())
        self.CGTWLEDeregister.setVisible(self.tw.sys().get_is_login())
        self.pyblish.setEnabled(self.tw.sys().get_is_login())
        self.treeWidget.setEnabled(self.tw.sys().get_is_login())
        self.treeWidget.clear()

        self.treeWidget.setColumnWidth(0, 200)
        self.treeWidget.setColumnWidth(1, 45)
        self.treeWidget.setColumnWidth(2, 100)

        if self.tw.sys().get_is_login():
            self.id = self.tw.sys().get_account_id()

            for task in self.getAssetTask(self.id) or list():
                item = QtGui.QTreeWidgetItem(self.treeWidget)
                item.setText(0, "%s: %s" % (task["stage"], task["name"]))
                item.setText(1, task["status"])
                item.setText(2, task["date"])
                
        self.refreshInfo()
                
    def refreshInfo(self, *_):
        if not self.treeWidget.currentItem():
            self.CGTWFrmInfo.setVisible(False)
            return
        
        pipeline = self.treeWidget.currentItem().text(0).split(': ')[0]
        name = self.treeWidget.currentItem().text(0).split(': ')[1]
        
        asset_type = "shot"
        for pipeline_info in self.getPipeLineInfo("asset_task"):
            if pipeline == pipeline_info["name"]:
                asset_type = "asset"
                break
            
        if asset_type == "asset":
            info_module = self.tw.info_module(self.project, "asset")
            cn_name = info_module.get_with_filter(["asset.cn_name"], [["asset.asset_name", "=", name]])
        
            self.CGTWLBLInfoName.setText(name)
            self.CGTWLBLInfoType.setText(cn_name[0]["asset.cn_name"])
            self.CGTWLBLInfoPipeline.setText(pipeline)
        
        elif asset_type == "shot":
            info_module = self.tw.info_module(self.project, "shot")
            cn_name = info_module.get_with_filter(["eps.eps_name"], [["shot.shot", "=", name]])
            
            self.CGTWLBLInfoName.setText(name)
            self.CGTWLBLInfoType.setText(cn_name[0]["eps.eps_name"])
            self.CGTWLBLInfoPipeline.setText(pipeline)
        
        else: return
        
        self.CGTWFrmInfo.setVisible(True)
                
    def refreshPyblish(self, *_):
        win = getattr(pyblish_lite.app, "_window")
        win.reset()

    def assetExists(self, *_):
        for objset in cmds.ls("*.id", long=True, type="objectSet", recursive=True, objectsOnly=True):
            if not cmds.objExists(objset + ".id"): continue
            if not cmds.getAttr(objset + ".id") == "pyblish.starter.instance": continue
            if not cmds.objExists(objset + ".family"): continue
            return True
        return False

    def connect(self, *_):
        usr = self.CGTWLEUsername.text()
        pwd = self.CGTWLEPassword.text()
        self.tw.sys().login(usr, pwd, self.ip)

        self.refreshUI()

    def disconnect(self, *_):
        self.tw.sys().logout()

        self.refreshUI()

    def create(self, *_):
        import pyblish_starter.api as api
        
        family = self.treeWidget.currentItem().text(0).split(': ')[0]
        name = self.treeWidget.currentItem().text(0).split(': ')[1]

        if family not in config.getConfig("familyMap"):
            logging.warning(u'当前任务不能在Maya中执行')
            return

        if self.assetExists():
            if cmds.confirmDialog(title=u"PuTao", message=u'当前场景已经存在资产配置，是否覆盖？',
                                  button=['Yes','No'], defaultButton='Yes', cancelButton='No',
                                  dismissString='No' ) == 'Yes':
                for objset in cmds.ls("*.id", long=True, type="objectSet", recursive=True, objectsOnly=True):
                    if not cmds.objExists(objset + ".id"): continue
                    if not cmds.getAttr(objset + ".id") == "pyblish.starter.instance": continue
                    if not cmds.objExists(objset + ".family"): continue
                    cmds.delete(objset)
                    try: cmds.delete(["out_SEL", "controls_SEL"])
                    except: pass
            else: return
        
        cmds.select(clear=True)
        api.registered_host().create(name, config.getConfig("familyMap")[family])
        
        cmds.addAttr("%s_SEL"%name, longName="project", dataType="string", hidden=False)
        cmds.addAttr("%s_SEL"%name, longName="pipeline", dataType="string", hidden=False)
        cmds.addAttr("%s_SEL"%name, longName="database", dataType="string", hidden=False)
        cmds.setAttr("%s_SEL.project"%name, config.getProject(), type="string")
        cmds.setAttr("%s_SEL.pipeline"%name, family, type="string")
        cmds.setAttr("%s_SEL.database"%name, config.getConfig("database"), type="string")
        
        self.refreshPyblish()
        self.refreshUI()

    def getAssetTask(self, account):
        result = []
        for name in ["asset", "shot"]:
            module = self.tw.task_module(self.project, "%s_task" % name)
            module.init_with_filter([["%s_task.account_id" % name, "=", account],
                                     "and",
                                     ["%s_task.status" % name, "!=", "Approve"]])
            for item in module.get(["%s.%s" % (name, "%s_name" % name if name == "asset" else name),
                                    "%s_task.pipeline" % name,
                                    "%s_task.status" % name,
                                    "%s_task.end_date" % name]) or list():
                result.append({"name": item["%s.%s" % (name, "%s_name" % name if name == "asset" else name)],
                               "stage": item["%s_task.pipeline" % name],
                               "status": item["%s_task.status" % name],
                               "date": item["%s_task.end_date" % name]})
        return result

    def getPipeLineInfo(self, table):
        tw_pipeline = self.tw.pipeline(self.project)
        return tw_pipeline.get_with_module(table, ["name"])
