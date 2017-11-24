#!/usr/local/bin/python2.7
# encoding: utf-8

import os, sys, re, logging, json, shutil, pyperclip
import pyblish_lite, pyblish.util
from barbarian.utils import config
from barbarian.utils.ui import CGTWUI
from PySide import QtCore, QtGui
import maya.OpenMaya as om
from maya import cmds
import model, delegate, database


def UI(*_):
    CGTW()


class CGTW(CGTWUI.Ui_CGTWWin):

    def setupUi(self, win=None):
        super(CGTW, self).setupUi(win)
        
        font_database = QtGui.QFontDatabase()
        font_path = config.getPath(config.kIcon, "css/GOTHICB.TTF")
        font_database.addApplicationFont(font_path)
        
        #回退和发布暂不可用
        self.CGTWBtnFinal.setVisible(False)
        self.CGTWBtnRetake.setVisible(False)
        
        self.CGTWTVTask.setModel(model.TaskWorkModel())
        self.CGTWTVTask.setItemDelegate(delegate.TaskMineItemDelegate(self.window))
        self.CGTWTVTask.clicked.connect(self.onTaskChanged)
        
        self.CGTWTVCheck.setModel(model.TaskCheckModel())
        self.CGTWTVCheck.setItemDelegate(delegate.TaskCheckItemDelegate(self.window))
        self.CGTWTVCheck.clicked.connect(self.onTaskChanged)
        
        task_all_model = model.TaskAllModel()
        task_filter_proxy_model = model.TaskFilterProxyModel()
        task_filter_proxy_model.setSourceModel(task_all_model)
        self.CGTWTVAll.setModel(task_filter_proxy_model)
        self.CGTWTVAll.setItemDelegate(delegate.TaskAllItemDelegate(self.window))
        self.CGTWTVAll.clicked.connect(self.onTaskChanged)
        
        task_filter_model = model.TaskFilterModel()
        task_all_model.taskChanged.connect(lambda *args: task_filter_model.update(*args))
        self.CGTWCBFilter.setModel(task_filter_model)
        self.CGTWCBFilter.currentIndexChanged.connect(self.onFilterChanged)
        
        self.CGTWTVFileHistory.setModel(model.FileHistoryModel())
        self.CGTWTVFileHistory.setDragEnabled(True)
        
        self.CGTWCBFileLink.setModel(model.FileLinkModel())
        self.CGTWCBFileLink.currentIndexChanged.connect(self.onFileboxChanged)
        
        self.CGTWCBFile.setModel(model.FileListModel())
        self.CGTWCBFile.currentIndexChanged.connect(self.onFileChanged)
        
        self.CGTWLVFileLink.setModel(QtGui.QFileSystemModel())
        self.CGTWLVFileLink.setDragEnabled(True)
        
        cmds.control("CGTWPageTask", e=True, backgroundColor=[0.24,0.24,0.24])
        cmds.control("CGTWPageCheck", e=True, backgroundColor=[0.24,0.24,0.24])
        
        cmds.scriptJob(conditionChange=["ProjectChanged", self.refreshUI], parent=self.window)
        
        self.tabWidget.currentChanged.connect(self.onTaskListChanged)
        self.CGTWRBAsset.toggled.connect(self.onTaskListChanged)
        self.CGTWBtnRefresh.clicked.connect(self.refreshUI)
        self.CGTWBtnSubmit.clicked.connect(self.submit)
        self.CGTWBtnFinal.clicked.connect(self.publish)
        self.CGTWBtnRetake.clicked.connect(self.retake)
        self.CGTWBtnConnect.clicked.connect(self.connect)
        self.CGTWLEUsername.returnPressed.connect(self.connect)
        self.CGTWLEPassword.returnPressed.connect(self.connect)
        self.CGTWLEDeregister.clicked.connect(self.disconnect)
        self.CGTWBtnHelp.clicked.connect(self.help)
        self.CGTWTVFileHistory.doubleClicked.connect(self.onHistoryItemDoubleClicked)
        self.CGTWTVFileHistory.customContextMenuRequested.connect(self.showHistoryContextMenu)
        self.CGTWLVFileLink.doubleClicked.connect(self.onLinkItemDoubleClicked)
        self.CGTWLVFileLink.customContextMenuRequested.connect(self.showLinkContextMenu)
        
        self.historyContextMenu = QtGui.QMenu(self.CGTWTVFileHistory)
        self.historyContextMenu.setMinimumSize(QtCore.QSize(150, 30))
        self.historyActionCopy = self.historyContextMenu.addAction(u"拷贝路径")
        self.historyActionRefer = self.historyContextMenu.addAction(u"在当前场景引用")
        self.historyActionBrowse = self.historyContextMenu.addAction(u"在资源管理器中查看...")
        self.historyActionCopy.triggered.connect(self.historyCopyHandler)
        self.historyActionRefer.triggered.connect(self.historyReferHandler)
        self.historyActionBrowse.triggered.connect(self.historyBrowseHandler)
        font = QtGui.QFont()
        font.setFamily(u"微软雅黑")
        font.setPointSize(10)
        self.historyContextMenu.setFont(font)
        
        self.linkContextMenu = QtGui.QMenu(self.CGTWLVFileLink)
        self.linkContextMenu.setMinimumSize(QtCore.QSize(150, 30))
        self.linkActionCopy = self.linkContextMenu.addAction(u"拷贝路径")
        self.linkActionRefer = self.linkContextMenu.addAction(u"在当前场景引用")
        self.linkActionBrowse = self.linkContextMenu.addAction(u"在资源管理器中查看...")
        self.linkActionCopy.triggered.connect(self.linkCopyHandler)
        self.linkActionRefer.triggered.connect(self.linkReferHandler)
        self.linkActionBrowse.triggered.connect(self.linkBrowseHandler)
        font = QtGui.QFont()
        font.setFamily(u"微软雅黑")
        font.setPointSize(10)
        self.linkContextMenu.setFont(font)

        self.id = ""
        self.project = ""
        self.family = {}

        self.refreshUI()
    
    def refreshUI(self, *_):
        self.reset()
        
        if not config.getProject(): return
        
        self.project = config.getConfig("database")
        
        database.getAccountInfo(database.ACCOUNT_LOGGED_IN)
        if database.getAccountInfo(database.ACCOUNT_LOGGED_IN):
            self.id = database.getAccountInfo()
            self.CGTWLBLUser.setText(u"欢迎，%s" % database.getAccountInfo(database.ACCOUNT_NAME))
        else:
            self.id = ""
            self.CGTWLBLUser.setText(u"请登录...")
        
        self.onTaskListChanged()
        
    def reset(self):
        self.clear()
        self.tabWidget.setEnabled(database.getAccountInfo(database.ACCOUNT_LOGGED_IN))
        self.CGTWBtnRefresh.setEnabled(database.getAccountInfo(database.ACCOUNT_LOGGED_IN))
        self.CGTWGBInfo.setEnabled(database.getAccountInfo(database.ACCOUNT_LOGGED_IN))
        self.CGTWLEUsername.setVisible(not database.getAccountInfo(database.ACCOUNT_LOGGED_IN))
        self.CGTWLEPassword.setVisible(not database.getAccountInfo(database.ACCOUNT_LOGGED_IN))
        self.CGTWBtnConnect.setVisible(not database.getAccountInfo(database.ACCOUNT_LOGGED_IN))
        self.CGTWLEDeregister.setVisible(database.getAccountInfo(database.ACCOUNT_LOGGED_IN))
        
        self.CGTWLBLResult.setText("")
        self.CGTWLBLResult.setStyleSheet("background-color: #333333;")
        
    def onTaskListChanged(self, *_):
        self.clear()
        
        if not database.getAccountInfo(database.ACCOUNT_LOGGED_IN): return
        
        self.CGTWLBLResult.setText(u"<font color=black>选择一项任务并提交...</font>")
        self.CGTWLBLResult.setStyleSheet("background-color: #aa33ff;")
        
        index = self.tabWidget.currentIndex()
        table = "asset" if self.CGTWRBAsset.isChecked() else "shot"
        view_list = [self.CGTWTVTask, self.CGTWTVCheck, self.CGTWTVAll]
        view_expand = [True, True, False]
        treeView = view_list[index]
        
        treeView.model().update(table)
        treeView.setColumnWidth(0, 275)
        treeView.update(treeView.currentIndex())
        if view_expand[index]: treeView.expandAll()
        
    def onTaskChanged(self, *_):
        self.clear()
        
        self.CGTWLBLResult.setText(u"<font color=black>选择一项任务并提交...</font>")
        self.CGTWLBLResult.setStyleSheet("background-color: #aa33ff;")
        
        task_id = self.getCurrentTaskInfo(model.TASK_ID)
        
        if not task_id: return
        
        task_stage = self.getCurrentTaskInfo(model.TASK_STAGE)
        task_name = self.getCurrentTaskInfo(model.TASK_NAME)
        task_status = self.getCurrentTaskInfo(model.TASK_STATUS)
        task_detail = self.getCurrentTaskInfo(model.TASK_DETAIL)
        status_color_map = {"Retake": "background-color: rgba(255, 90, 90, 255);",
                      "Check": "background-color: rgba(255, 255, 90, 255);",
                      "Approve": "background-color: rgba(90, 255, 90, 255);",
                      "FinalApprove": "background-color: rgba(90, 255, 90, 255);"}
        status_text_map = {"Retake": "[被回退] ",
                           "Check": "[等待检查] ",
                           "Approve": "[已发布] ",
                           "FinalApprove": "[已发布] "}
        task_history = database.getFileHistoryInfo(task_id)
        
        self.CGTWBtnSubmit.setEnabled(self.tabWidget.currentIndex() == 0)
        self.CGTWBtnRetake.setEnabled(self.tabWidget.currentIndex() == 1)
        self.CGTWBtnFinal.setEnabled(self.tabWidget.currentIndex() == 1)
        
        self.CGTWGBInfo.setTitle(task_name)
        self.CGTWLBLInfoType.setText(task_detail)
        if task_history and task_status in status_color_map:
            self.CGTWLBLStatus.setStyleSheet(status_color_map[task_status])
            self.CGTWLBLStatus.setText(u"<font color=black>%s%s</font>"%
                                       (status_text_map[task_status], 
                                        self.extractText(task_history[0]["text"])))
        
        self.CGTWCBFile.model().update(task_id)
        self.CGTWCBFileLink.model().update(task_id, task_stage)
        
    def onFilterChanged(self, *_):
        tag = self.CGTWCBFilter.currentText()
        self.CGTWTVAll.model().setFilterFixedString(tag)
        
    def onFileChanged(self, *_):
        task_id = self.getCurrentTaskInfo(model.TASK_ID)
        task_stage = self.getCurrentTaskInfo(model.TASK_STAGE)
        file_name = self.CGTWCBFile.currentText()
        
        self.CGTWTVFileHistory.model().update(task_id, task_stage, file_name)
        self.CGTWTVFileHistory.setColumnWidth(0, 200)
        self.CGTWTVFileHistory.setColumnWidth(1, 160)
        self.CGTWTVFileHistory.setColumnWidth(2, 50)
        self.CGTWTVFileHistory.setColumnWidth(3, 50)
        
    def getCurrentTaskInfo(self, role):
        itemList = [self.CGTWTVTask, self.CGTWTVCheck, self.CGTWTVAll]
        treeView = itemList[self.tabWidget.currentIndex()]
        index = treeView.currentIndex()
        return index.data(role)
        
    def onFileboxChanged(self, index):
        path = self.CGTWCBFileLink.itemData(index, model.FILE_PATH)
        
        if not path: return
        
        self.CGTWLVFileLink.model().setRootPath(path)
        self.CGTWLVFileLink.setRootIndex(self.CGTWLVFileLink.model().index(path))
        
    def clear(self):
        self.CGTWBtnSubmit.setEnabled(False)
        self.CGTWBtnRetake.setEnabled(False)
        self.CGTWBtnFinal.setEnabled(False)
        self.CGTWTVFileHistory.model().clear()
        self.CGTWCBFileLink.model().clear()
        #self.CGTWLVFileLink.model().setRootPath("")
        self.CGTWCBFile.clear()
        self.CGTWGBInfo.setTitle(" ")
        self.CGTWLBLInfoType.setText("")
        self.CGTWLBLStatus.setText("")
        self.CGTWLBLStatus.setStyleSheet("border-color: #333333;")
    
    def connect(self, *_):
        usr = self.CGTWLEUsername.text()
        pwd = self.CGTWLEPassword.text()
        database.login(usr, pwd)

        self.refreshUI()

    def disconnect(self, *_):
        database.logout()

        self.refreshUI()
        
    def onHistoryItemDoubleClicked(self, index):
        path = index.data(model.FILE_PATH).replace('/', '\\')
        self.open(path)
    
    def onLinkItemDoubleClicked(self, index):
        file_name = index.data(model.FILE_PATH)
        file_path = index.model().rootPath().replace('/', '\\')
        self.open(os.path.join(file_path, file_name))
        
    def open(self, path):
        file_type = path.split('.')[-1]
        type_map = {"ma": "mayaAscii", "mb": "mayaBinary"}
        if not file_type in type_map: return
        
        if cmds.file(q=True, modified=True):
            result = cmds.confirmDialog(title='Putao', 
                                        message=u"警告：所有未保存的操作将丢失", 
                                        ma="center",
                                        button=[u"继续",u"取消"], 
                                        defaultButton=u"继续", 
                                        cancelButton=u"取消", 
                                        dismissString='No')
            if not result == u"继续": return
        
        cmds.file(path, f=True, o=True, iv=True, typ=type_map[file_type])
        
    
    def showHistoryContextMenu(self, *_):
        index = self.CGTWTVFileHistory.currentIndex()
        path = index.data(model.FILE_PATH)
        if not path: return
        self.historyContextMenu.exec_(QtGui.QCursor.pos()) #modal
        
    def showLinkContextMenu(self, *_):
        index = self.CGTWLVFileLink.currentIndex()
        root = self.CGTWLVFileLink.model().rootPath()
        path = index.data(QtCore.Qt.DisplayRole)
        if not os.path.exists(os.path.join(root, path)): return
        self.linkContextMenu.exec_(QtGui.QCursor.pos()) #modal
        
    def historyCopyHandler(self):
        index = self.CGTWTVFileHistory.currentIndex()
        path = index.data(model.FILE_PATH)
        pyperclip.copy(path)
        
    def linkCopyHandler(self):
        index = self.CGTWLVFileLink.currentIndex()
        root = self.CGTWLVFileLink.model().rootPath()
        path = index.data(QtCore.Qt.DisplayRole)
        pyperclip.copy(os.path.join(root, path).replace("/", "\\"))
        
    def historyReferHandler(self):
        index = self.CGTWTVFileHistory.currentIndex()
        path = index.data(model.FILE_PATH)
        
        if path.count('.ma'): typ = "mayaAscii"
        elif path.count('.mb'): typ = "mayaBinary"
        else: 
            self.CGTWLBLResult.setText(u"<font color=black>错误：选择的文件不能创建引用</font>")
            self.CGTWLBLResult.setStyleSheet("background-color: rgba(255, 90, 90, 255);")
            return
        
        fileName = path.split('/')[-1]
        if len(fileName.split('.ma')) > 1: 
            namespace = fileName.split('.ma')[0]
        else: namespace = fileName.split('.mb')[0]
        
        cmds.file(path, r=True, iv=True, typ=typ, ns=namespace)
    
    def linkReferHandler(self):
        index = self.CGTWLVFileLink.currentIndex()
        root = self.CGTWLVFileLink.model().rootPath()
        name = index.data(QtCore.Qt.DisplayRole)
        path = os.path.dirname(os.path.join(root, name)).replace("/", "\\")
        
        if path.count('.ma'): typ = "mayaAscii"
        elif path.count('.mb'): typ = "mayaBinary"
        else: 
            self.CGTWLBLResult.setText(u"<font color=black>错误：选择的文件不能创建引用</font>")
            self.CGTWLBLResult.setStyleSheet("background-color: rgba(255, 90, 90, 255);")
            return
        
        fileName = path.split('/')[-1]
        if len(fileName.split('.ma')) > 1: 
            namespace = fileName.split('.ma')[0]
        else: namespace = fileName.split('.mb')[0]
        
        cmds.file(path, r=True, iv=True, typ=typ, ns=namespace)
        
    def historyBrowseHandler(self):
        index = self.CGTWTVFileHistory.currentIndex()
        path = os.path.dirname(index.data(model.FILE_PATH)).replace("/", "\\")
        cmd = r'explorer "%s"' % path.encode('gbk')
        os.system(cmd)
    
    def linkBrowseHandler(self):
        index = self.CGTWLVFileLink.currentIndex()
        root = self.CGTWLVFileLink.model().rootPath()
        name = index.data(QtCore.Qt.DisplayRole)
        path = os.path.dirname(os.path.join(root, name)).replace("/", "\\")
        cmd = r'explorer "%s"' % path.encode('gbk')
        os.system(cmd)
        
    def submit(self, *_):
        import pyblish_starter.api as api
        
        index = self.CGTWTVTask.currentIndex()
        task_id = index.data(model.TASK_ID)
        family = index.data(model.TASK_STAGE)
        name = index.data(model.TASK_NAME)

        if family not in config.getConfig("familyMap"):
            self.CGTWLBLResult.setText(u"<font color=black>所选任务不能在Maya中执行</font>")
            self.CGTWLBLResult.setStyleSheet("background-color: rgba(255, 255, 90, 255);")
            return
        
        self.CGTWLBLResult.setText(u"<font color=black>正在提交检查...</font>")
        self.CGTWLBLResult.setStyleSheet("background-color: rgba(90, 255, 255, 255);")
        
        try: cmds.delete("%s_SEL"%name)
        except: pass
        
        api.registered_host().create(name, config.getConfig("familyMap")[family])
        
        cmds.addAttr("%s_SEL"%name, longName="project", dataType="string", hidden=False)
        cmds.addAttr("%s_SEL"%name, longName="pipeline", dataType="string", hidden=False)
        cmds.addAttr("%s_SEL"%name, longName="database", dataType="string", hidden=False)
        cmds.addAttr("%s_SEL"%name, longName="taskID", dataType="string", hidden=False)
        cmds.setAttr("%s_SEL.project"%name, config.getProject(), type="string")
        cmds.setAttr("%s_SEL.pipeline"%name, family, type="string")
        cmds.setAttr("%s_SEL.database"%name, config.getConfig("database"), type="string")
        cmds.setAttr("%s_SEL.taskID"%name, task_id, type="string")
        
        context = pyblish.util.publish()
        self.CGTWLBLResult.setText(u"<font color=black>任务提交成功</font>")
        self.CGTWLBLResult.setStyleSheet("background-color: rgba(90, 255, 90, 255);")
        for result in context.data["results"]:
            if not result["success"]:
                self.CGTWLBLResult.setText(u"<font color=black>错误：%s</font>"%result["error"].message)
                self.CGTWLBLResult.setStyleSheet("background-color: rgba(255, 90, 90, 255);")
                break
        cmds.delete("%s_SEL"%name)
    
    def retake(self, *_):
        index = self.CGTWTVCheck.currentIndex()
        task_id = index.data(model.TASK_ID)
        #tables = ["asset_task", "shot_task"]
        logging.info(task_id)
    
    def publish(self, *_):
        index = self.CGTWTVCheck.currentIndex()
        task_id = index.data(model.TASK_ID)
        #tables = ["asset_task", "shot_task"]
        logging.info(task_id)
        
    def extractText(self, text):
        result = ""
        remove_mode = False
        for char in text:
            if char == '<':
                remove_mode = True
                continue
            if char == '>':
                remove_mode = False
                continue
            if not remove_mode:
                result += char
                
        result = result.split("p, li { white-space: pre-wrap; }")[-1]
        return result
    
    def help(self):
        import webbrowser

        url = 'https://github.com/lonegather/Barbarian/wiki/%E4%BD%BF%E7%94%A8%E5%B8%AE%E5%8A%A9'
        webbrowser.open(url)
        

