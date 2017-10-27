#!/usr/local/bin/python2.7
# encoding: utf-8

import sys
import pyblish_lite
import barbarian.utils.config as config
from barbarian.utils.ui.CGTWUI import Ui_CGTWWin
from PySide import QtCore, QtGui
from maya import cmds
import maya.OpenMaya as om

try:
    from cgtw import *
except ImportError:
    pass


def UI(*_):
    CGTW()


class CGTW(Ui_CGTWWin):
    ip = "10.1.11.100"

    def setupUi(self, win=None):
        super(CGTW, self).setupUi(win)

        cmds.scriptJob(conditionChange=["ProjectChanged", self.refreshProject], parent=self.window)
        self.addSceneCallback(om.MSceneMessage.kAfterNew, self.refreshUI)
        self.addSceneCallback(om.MSceneMessage.kAfterOpen, self.refreshUI)

        QtCore.QObject.connect(self.CGTWCBProject,
                               QtCore.SIGNAL("activated(int)"),
                               lambda *_: config.setProject(self.CGTWCBProject.currentText()))
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

    def create(self, item, column):
        import pyblish_starter.api as api

        family = item.text(0).split(': ')[0]
        name = item.text(0).split(': ')[1]

        if family not in config.getConfig("familyMap"):
            cmds.confirmDialog(message=u'当前任务不能在Maya中执行', ma="center", icon="warning", title=u"PuTao")
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
                    if config.getConfig("familyMap")[family] == "starter.rig":
                        try: cmds.delete(["out_SEL", "controls_SEL"])
                        except: pass
            else: return

        api.registered_host().create(name, config.getConfig("familyMap")[family])
        assetsIn, assetsEx = "", ""

        if config.getConfig("familyMap")[family] == "starter.animation":
            assetsIncluded = self.getAssetList(config.getConfig("excludedType"), True)
            assetsExcluded = self.getAssetList(config.getConfig("excludedType"), False)
            refs = cmds.file(q=True, reference=True)
            for ref in refs:
                if not cmds.referenceQuery(ref, isLoaded=True): continue
                namespace = cmds.referenceQuery(ref, namespace=True).split(':')[-1]
                orig_namespace = ref.split("/")[-1].split(".")[0]
                if orig_namespace in assetsIncluded:
                    assetsIn += "%s;" % namespace
                elif orig_namespace in assetsExcluded:
                    assetsEx += "%s;" % namespace
            for asset in assetsIn.split(';'):
                if not asset: continue
                cmds.select("%s:out_SEL" % asset, r=True)
                cmds.sets(e=True, include=str("%s_SEL" % name))

        elif config.getConfig("familyMap")[family] == "starter.rig":
            if not cmds.objExists(name):
                cmds.delete("%s_SEL" % name)
                try: cmds.delete(["out_SEL", "controls_SEL"])
                except: pass
                cmds.confirmDialog(message=u'场景中不存在%s'%name, ma="center", icon="warning", title=u"PuTao")
                return
            cmds.select(name, r=True)
            cmds.sets(e=True, include="%s_SEL"%name)
            cmds.select("%s_Geo"%name, r=True)
            cmds.sets(name="out_SEL")
            cmds.select("ControlSet", r=True)
            cmds.sets(name="controls_SEL")
            for s in ["out_SEL", "controls_SEL"]:
                cmds.select(s, r=True, noExpand=True)
                cmds.sets(e=True, include="%s_SEL"%name)

        elif config.getConfig("familyMap")[family] == "starter.model":
            pass

        cmds.addAttr("%s_SEL" % name, longName="database", dataType="string", hidden=False)
        cmds.addAttr("%s_SEL" % name, longName="taskID", dataType="string", hidden=False)
        cmds.addAttr("%s_SEL" % name, longName="path", dataType="string", hidden=False)
        cmds.addAttr("%s_SEL" % name, longName="assetsIn", dataType="string", hidden=False)
        cmds.addAttr("%s_SEL" % name, longName="assetsEx", dataType="string", hidden=False)
        cmds.setAttr("%s_SEL.database" % name, config.getConfig("database"), type="string")
        cmds.setAttr("%s_SEL.taskID" % name, self.getTaskID(name, family), type="string")
        cmds.setAttr("%s_SEL.path" % name, self.getAssetPath(name, family), type="string")
        cmds.setAttr("%s_SEL.assetsIn" % name, assetsIn, type="string")
        cmds.setAttr("%s_SEL.assetsEx" % name, assetsEx, type="string")

        import pyblish_lite
        pyblish_lite.show()

        self.refreshUI()

    def getAssetList(self, filterType, isExcluded):
        result = []

        if not self.tw.sys().get_is_login():
            return result

        filterList = []
        for tp in filterType.split(';'):
            if len(filterList): filterList.append("and" if isExcluded else "or")
            filterList.append(["asset.type_name", "!=" if isExcluded else "=", tp])

        if not filterList:
            filterList.append(["asset.asset_name", "has", "%"])

        module = self.tw.info_module(self.project, "asset")
        module.init_with_filter(filterList)
        for item in module.get(["asset.asset_name"]) or list():
            result.append(item["asset.asset_name"])

        return result

    def getAssetPath(self, asset, family):
        path = ""
        tables = {"asset": "asset_name", "shot": "shot"}
        for table in tables:
            pipeline = self.tw.pipeline(self.project)
            pipeline_id = ""
            for p in pipeline.get_with_filter(["name"], [["module", "=", "%s_task" % table]]):
                if p["name"] == family: pipeline_id = p["id"]
            if not pipeline_id: continue

            filebox = self.tw.filebox(self.project)
            for filebox_item in filebox.get_with_pipeline_id(pipeline_id, "%s_task" % table) or list():
                info_module = self.tw.info_module(self.project, "%s_task" % table)
                info_module.init_with_filter([["%s.%s" % (table, tables[table]), "has", "%"]])
                filebox_obj = info_module.get_filebox_with_filebox_id(filebox_item["id"])
                if filebox_obj and filebox_obj["sign"]:
                    path += "%s=%s;" % (filebox_obj["sign"], filebox_obj["path"])
        return path

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

    def getTaskID(self, name, pipeline):
        tables = {"asset":"asset_name", "shot":"shot"}
        for table in tables:
            module = self.tw.task_module(self.project, "%s_task" % table)
            module.init_with_filter([["%s.%s" % (table, tables[table]), "=", name],
                                     "and",
                                     ["%s_task.pipeline" % table, "=", pipeline]])
            if not module.get(["%s_task.id" % table]): continue
            return module.get(["%s_task.id" % table])[0]["%s_task.id" % table]
        return u""

    def getPipeLineInfo(self):
        tw_pipeline = self.tw.pipeline(self.project)
        return tw_pipeline.get_with_module("asset_task", ["name"])
