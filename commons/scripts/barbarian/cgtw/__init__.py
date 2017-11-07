#!/usr/local/bin/python2.7
# encoding: utf-8

import os, sys, logging, json
import pyblish_lite, pyblish.util
from barbarian.utils import config
from barbarian.utils.ui import CGTWUI
from PySide import QtCore, QtGui
from maya import cmds
import maya.OpenMaya as om

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
        
        self.CGTWBtnFinal.setEnabled(False)

        cmds.scriptJob(conditionChange=["ProjectChanged", self.refreshProject], parent=self.window)
        self.addSceneCallback(om.MSceneMessage.kAfterNew, self.refreshUI)
        self.addSceneCallback(om.MSceneMessage.kAfterOpen, self.refreshUI)

        QtCore.QObject.connect(self.CGTWCBProject,
                               QtCore.SIGNAL("activated(int)"),
                               lambda *_: config.setProject(self.CGTWCBProject.currentText()))
        self.treeWidget.itemClicked.connect(self.refreshInfo)
        self.CGTWBtnRefresh.clicked.connect(self.refreshUI)
        self.CGTWBtnSubmit.clicked.connect(self.create)
        self.CGTWBtnConnect.clicked.connect(self.connect)
        self.CGTWLEDeregister.clicked.connect(self.disconnect)

        self.tw = tw(self.ip)
        self.id = ""
        self.project = ""
        self.family = {}

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
        self.CGTWBtnSubmit.setEnabled(False)
        self.CGTWLEUsername.setVisible(not self.tw.sys().get_is_login())
        self.CGTWLEPassword.setVisible(not self.tw.sys().get_is_login())
        self.CGTWBtnConnect.setVisible(not self.tw.sys().get_is_login())
        self.CGTWLEDeregister.setVisible(self.tw.sys().get_is_login())
        self.treeWidget.setEnabled(self.tw.sys().get_is_login())
        self.CGTWLBLResult.setText(u"<font color=black>选择一项任务并提交...</font>")
        self.CGTWLBLResult.setStyleSheet("background-color: #aa33ff;")
        
        self.treeWidget.clear()
        items = {}
        items["Work"] = QtGui.QTreeWidgetItem(self.treeWidget)
        items["Work"].setText(0, u"未完成")
        items["Work"].setFlags(QtCore.Qt.ItemIsEnabled)
        items["Wait"] = items["Work"]
        items["Retake"] = items["Work"]
        items["Check"] = QtGui.QTreeWidgetItem(self.treeWidget)
        items["Check"].setText(0, u"待检查")
        items["Check"].setFlags(QtCore.Qt.ItemIsEnabled)
        items["Approve"] = QtGui.QTreeWidgetItem(self.treeWidget)
        items["Approve"].setText(0, u"已完成")
        items["Approve"].setFlags(QtCore.Qt.ItemIsEnabled)
        items["FinalApprove"] = items["Approve"]

        self.treeWidget.setColumnWidth(0, 250)

        if self.tw.sys().get_is_login():
            self.id = self.tw.sys().get_account_id()
            self.CGTWLBLUser.setText(u"欢迎，[%s] %s" % 
                                     (self.getAccountInfo(self.id, "account.department"), 
                                      self.getAccountInfo(self.id, "account.name")))

            for task in self.getTaskInfo(self.id) or list():
                item = QTreeWidgetTaskItem(task)
                item.setText(0, "%s: %s" % (task["stage"], task["name"]))
                item.setText(1, task["date"])
                items[task["status"]].addChild(item)
            
            for i in items:
                if not items[i].childCount():
                    items[i].setHidden(True)
                
        else:
            self.id = ""
            self.CGTWLBLUser.setText(u"请登录...")
                
        self.refreshInfo()
                
    def refreshInfo(self, *_):      
        self.CGTWLBLResult.setText(u"<font color=black>选择一项任务并提交...</font>")
        self.CGTWLBLResult.setStyleSheet("background-color: #aa33ff;")
          
        currentItem = self.treeWidget.currentItem()
        self.CGTWTWHistory.clear()
        self.CGTWTWLink.clear()

        if not isinstance(currentItem, QTreeWidgetTaskItem):
            self.CGTWBtnSubmit.setEnabled(False)
            self.CGTWFrmInfo.setEnabled(False)
            self.CGTWLBLInfoName.setText("")
            self.CGTWLBLInfoType.setText("")
            self.CGTWLBLInfoPipeline.setText("")
            return
        else: 
            self.CGTWBtnSubmit.setEnabled(True)
            self.CGTWTWLink.setEnabled(True)
        
        pipeline = currentItem.text(0).split(': ')[0]
        name = currentItem.text(0).split(': ')[1]
        historyList = self.getHistory(currentItem.taskID)
        historyPath = "%s/history"%currentItem.submitPath
        
        try:
            with open("%s/history.json"%historyPath) as f:
                history_list = json.load(f)
        except IOError:
            history_list = []
        
        head = True
        for history in historyList:
            history_file = u"当前版本" if head else u"未知版本"
            if history["file"]:
                for history_item in history_list:
                    if history_item["id"] == history["id"]:
                        history_file = history_item["file"]
                item = QtGui.QTreeWidgetItem(self.CGTWTWHistory)
                item.setText(0, history_file)
                item.setText(1, history["text"])
                item.setText(2, history["last_update_by"])
                item.setText(3, history["last_update_time"])
                #self.CGTWTWLink.setItemWidget(item, 1, QtGui.QLabel(history["text"]))
            head = False
                
        self.CGTWTWHistory.setColumnWidth(0, 200)
        self.CGTWTWHistory.setColumnWidth(2, 50)
        
        items = {}
        for filebox in currentItem.filebox:
            if filebox["is_submit"]: continue
            if not os.path.exists(filebox["path"]): continue
            
            if not filebox["title"] in items:
                items[filebox["title"]] = QtGui.QTreeWidgetItem(self.CGTWTWLink)
                items[filebox["title"]].setText(0, filebox["title"])
                items[filebox["title"]].setFlags(QtCore.Qt.ItemIsEnabled)
            for f in os.listdir(filebox["path"]):
                if os.path.isfile(os.path.join(filebox["path"], f)):
                    item = QtGui.QTreeWidgetItem()
                    item.setText(0, f)
                    items[filebox["title"]].addChild(item)
                    
        for i in items:
            if not items[i].childCount():
                items[i].setHidden(True)
        
        asset_type = "shot"
        for pipeline_info in self.getPipeLineInfo("asset_task"):
            if pipeline == pipeline_info["name"]:
                asset_type = "asset"
                break
            
        if asset_type == "asset":
            info_module = self.tw.info_module(self.project, "asset")
            cn_name = info_module.get_with_filter(["asset.cn_name"], 
                                                  [["asset.asset_name", "=", name]])
        
            self.CGTWLBLInfoName.setText(name)
            self.CGTWLBLInfoType.setText(cn_name[0]["asset.cn_name"])
            self.CGTWLBLInfoPipeline.setText(pipeline)
        
        elif asset_type == "shot":
            info_module = self.tw.info_module(self.project, "shot")
            cn_name = info_module.get_with_filter(["eps.eps_name"], 
                                                  [["shot.shot", "=", name]])
            
            self.CGTWLBLInfoName.setText(name)
            self.CGTWLBLInfoType.setText(cn_name[0]["eps.eps_name"])
            self.CGTWLBLInfoPipeline.setText(pipeline)
        
        else: return
        
        self.CGTWFrmInfo.setEnabled(True)

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
        
        currentItem = self.treeWidget.currentItem()
        family = currentItem.text(0).split(': ')[0]
        name = currentItem.text(0).split(': ')[1]

        if family not in config.getConfig("familyMap"):
            self.CGTWLBLResult.setText(u"<font color=black>所选任务不能在Maya中执行</font>")
            self.CGTWLBLResult.setStyleSheet("background-color: rgba(255, 255, 90, 255);")
            return
        
        api.registered_host().create(name, config.getConfig("familyMap")[family])
        
        cmds.addAttr("%s_SEL"%name, longName="project", dataType="string", hidden=False)
        cmds.addAttr("%s_SEL"%name, longName="pipeline", dataType="string", hidden=False)
        cmds.addAttr("%s_SEL"%name, longName="database", dataType="string", hidden=False)
        cmds.addAttr("%s_SEL"%name, longName="taskID", dataType="string", hidden=False)
        cmds.setAttr("%s_SEL.project"%name, config.getProject(), type="string")
        cmds.setAttr("%s_SEL.pipeline"%name, family, type="string")
        cmds.setAttr("%s_SEL.database"%name, config.getConfig("database"), type="string")
        cmds.setAttr("%s_SEL.taskID"%name, currentItem.taskID, type="string")
        
        #self.refreshPyblish()
        context = pyblish.util.publish()
        self.CGTWLBLResult.setText(u"<font color=black>任务提交成功</font>")
        self.CGTWLBLResult.setStyleSheet("background-color: rgba(90, 255, 90, 255);")
        for result in context.data["results"]:
            if not result["success"]:
                self.CGTWLBLResult.setText(u"<font color=black>错误：%s</font>"%result["error"].message)
                self.CGTWLBLResult.setStyleSheet("background-color: rgba(255, 90, 90, 255);")
                break
        cmds.delete("%s_SEL"%name)
        
    def getAccountInfo(self, account_id, account_field):
        info_module = self.tw.info_module("public", "account")
        result = info_module.get_with_filter([account_field], [["account.id", "=", account_id]])
        return result[0][account_field] if result else ""

    def getTaskInfo(self, account):
        result = []
        tables = {"asset": "asset_name", "shot": "shot"}
        for table in tables:
            module = self.tw.task_module(self.project, "%s_task" % table)
            module.init_with_filter([["%s_task.account_id" % table, "=", account]])
            
            for item in module.get(["%s.%s" % (table, tables[table]),
                                    "%s_task.pipeline" % table,
                                    "%s_task.status" % table,
                                    "%s_task.end_date" % table]) or list():
                if not item["%s.%s" % (table, tables[table])]: continue
                
                item_id = item["id"]
                item_name = item["%s.%s" % (table, tables[table])]
                item_stage = item["%s_task.pipeline" % table]
                item_status = item["%s_task.status" % table]
                item_date = item["%s_task.end_date" % table]
                
                result.append({"id": item_id,
                               "name": item_name,
                               "stage": item_stage,
                               "status": item_status,
                               "date": item_date})
            
        return result
    
    def getHistory(self, task_id):
        for module in ["asset_task", "shot_task"]:
            t_history = self.tw.history(self.project, module)
            history = t_history.get_with_filter(["text", "last_update_by", "last_update_time", "step", "file"], 
                                                [["#task_id", "=", task_id]])
            if not history: continue
        
            return sorted(history, key=lambda x:x["last_update_time"], reverse=True)

    def getPipeLineInfo(self, table):
        tw_pipeline = self.tw.pipeline(self.project)
        return tw_pipeline.get_with_module(table, ["name"])
    
    
class QTreeWidgetTaskItem(QtGui.QTreeWidgetItem):
    
    def __init__(self, task, parent=None):
        super(QTreeWidgetTaskItem, self).__init__(parent)
        self._task = task
        self._filebox = None
        
    def _setup_filebox(self):
        t_tw = tw(CGTW.ip)
        assert t_tw.sys().get_is_login(), u"Teamwork 未登录"
        
        pipeline = t_tw.pipeline(config.getConfig("database"))
        filebox = t_tw.filebox(config.getConfig("database"))
        tables = {"asset": "asset_name", "shot": "shot"}
        for table in tables:
            pipeline_item = pipeline.get_with_filter(["name"], [["module", "=", "%s_task" % table]])
        
            pipeline_id = ""
            for p in pipeline_item or list():
                if p["name"] == self._task["stage"]: pipeline_id = p["id"]
            if not pipeline_id: continue
            
            self._filebox = []
            for filebox_item in filebox.get_with_pipeline_id(pipeline_id, "%s_task" % table) or list():
                info_module = t_tw.info_module(config.getConfig("database"), "%s_task" % table)
                info_module.init_with_filter([["%s_task.id" % table, "=", self._task["id"]]])
                filebox_obj = info_module.get_filebox_with_filebox_id(filebox_item["id"])
                if filebox_obj: self._filebox.append(filebox_obj)
        
        
    @property
    def submitPath(self):
        if not self._filebox: self._setup_filebox()
        
        for filebox in self._filebox or list():
            if filebox["is_submit"]: return filebox["path"]
            
        return ""
    
    @property
    def filebox(self):
        if not self._filebox: self._setup_filebox()
        
        return self._filebox    
    
    @property
    def taskID(self):
        return self._task["id"]
        
        
        
        
