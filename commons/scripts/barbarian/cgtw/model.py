#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.10.20

@author: Serious Sam
'''

import os, json, logging
from PySide import QtGui, QtCore
from . import database


TASK_DATA_TYPE = "task.data"
TASK_LABEL_TYPE = "task.label"

TASK_ITEM_TYPE = QtCore.Qt.UserRole
TASK_ID = QtCore.Qt.UserRole + 1
TASK_STAGE = QtCore.Qt.UserRole + 2
TASK_NAME = QtCore.Qt.UserRole + 3
TASK_DATE = QtCore.Qt.UserRole + 4
TASK_LAST = QtCore.Qt.UserRole + 5
TASK_ARTIST = QtCore.Qt.UserRole + 6
TASK_STATUS = QtCore.Qt.UserRole + 7
TASK_DETAIL = QtCore.Qt.UserRole + 8
TASK_FILTER = QtCore.Qt.UserRole + 9

FILE_PATH = QtCore.Qt.UserRole


class TaskModel(QtGui.QStandardItemModel):
    
    def update(self, table):
        pass
    
    def columnCount(self, *_):
        return 1
    
    def data(self, index, role=QtCore.Qt.DisplayRole):       
        return super(TaskModel, self).data(index, role)


class TaskWorkModel(TaskModel):
                
    def update(self, table):
        data = database.getTaskInfo(account_id = database.getAccountInfo())
        self.clear()
        
        root = self.invisibleRootItem()
        task_work = LabelItem(u"未完成")
        task_check = LabelItem(u"待检查")
        task_approve = LabelItem(u"已完成")
        
        root.appendRow([task_work, LabelItem()])
        root.appendRow([task_check, LabelItem()])
        root.appendRow([task_approve, LabelItem()])
        
        for task in data:
            item_name = TaskItem(task, "%s: %s" % (task["stage"], task["name"]))
            
            if task["status"] in ["Work", "Wait", "Retake"]: item_parent = task_work
            elif task["status"] == "Check": item_parent = task_check
            elif task["status"] in ["Approve", "FinalApprove"]: item_parent = task_approve
            else: continue
            
            item_parent.appendRow(item_name)
            
        if not task_approve.hasChildren(): root.removeRow(2)
        if not task_check.hasChildren(): root.removeRow(1)
        if not task_work.hasChildren(): root.removeRow(0)
    
    
class TaskCheckModel(TaskModel):
                
    def update(self, table):
        data = database.getCheckInfo()
        self.clear()
        
        root = self.invisibleRootItem()
        root_items = {}
        for task in data:
            artist = task["artist"]
            if not artist in root_items:
                root_items[artist] = LabelItem(artist)
                root.appendRow([root_items[artist], LabelItem()])
            
            item_name = TaskItem(task, "%s: %s" % (task["stage"], task["name"]))
            
            root_items[artist].appendRow(item_name)


class TaskAllModel(TaskModel):
    
    taskChanged = QtCore.Signal(object)
    
    def update(self, table):
        data = database.getTaskInfo(table=table)
        self.clear()
        
        root = self.invisibleRootItem()
        root_items = {}
        for task in data:
            name = task["name"]
            tag = task["filter"]
            if not name in root_items:
                suffix = u"- %s"%task["detail"] if task["detail"] else ""
                root_items[name] = LabelItem(u"%s %s"%(name, suffix), tag)
                root.appendRow([root_items[name], LabelItem()])
            
            item_name = TaskItem(task, name, tag)
            
            root_items[name].appendRow(item_name)
            
        self.taskChanged.emit(data)
            
            
class TaskFilterModel(QtGui.QStandardItemModel):
    
    def update(self, data):
        self.clear()
        
        root = self.invisibleRootItem()
        root.appendRow(QtGui.QStandardItem("All"))
        filter_list = []
        
        for task in data:
            filter_type = task.get("filter", "")
            
            if not filter_type or filter_type in filter_list: continue
            filter_list.append(filter_type)
            root.appendRow(QtGui.QStandardItem(filter_type))
    
    def columnCount(self, *_):
        return 1
    
    
class TaskFilterProxyModel(QtGui.QSortFilterProxyModel):
    
    def __init__(self, *_):
        super(TaskFilterProxyModel, self).__init__(*_)
        self.setFilterRole(TASK_FILTER)
    
    def filterAcceptsRow(self, *_):
        if self.filterRegExp().pattern() == "All": return True
        return super(TaskFilterProxyModel, self).filterAcceptsRow(*_)
        
    def update(self, table):
        self.sourceModel().update(table)
        
    def columnCount(self, *_):
        return 1
    
    
class FileHistoryModel(QtGui.QStandardItemModel):
        
    def headerData(self, section, orientation, role):
        if role == QtCore.Qt.DisplayRole:
            if orientation == QtCore.Qt.Horizontal:
                if section == 0:
                    return u"历史版本"
                elif section == 1:
                    return u"版本描述"
                elif section == 2:
                    return u"提交者"
                elif section == 3:
                    return u"提交时间"
                
    def columnCount(self, *_):
        return 4
    
    def flags(self, index):
        defaultFlags = super(FileHistoryModel, self).flags(index)
        return QtCore.Qt.ItemIsDragEnabled | defaultFlags
    
    def mimeData(self, indexes):
        mime_data = QtCore.QMimeData()
        for index in indexes:
            if index.isValid():
                mime_data.setUrls(["file:///%s"%index.data(QtCore.Qt.UserRole)])
        return mime_data
    
    def mimeTypes(self):
        return ['text/uri-list']
    
    def update(self, task_id, task_stage, task_file):
        self._history = database.getFileHistoryInfo(task_id)
        self._filebox = database.getFileBox(task_id, task_stage)
        self.clear()
        
        root = self.invisibleRootItem()
        submit_path = ""
        head = True
        
        for filebox in self._filebox or list():
            if filebox["is_submit"]: submit_path = filebox["path"]
            
        historyPath = "%s/history"%submit_path
        
        try:
            with open("%s/history.json"%historyPath) as f:
                history_list = json.load(f)
        except IOError:
            history_list = []
        
        for history in self._history or list():
            history_file = u"当前版本" if head else u"未知版本"
            if history["status"] == "Submit" and history["file"] == task_file:
                file_name = history["file"] if head else ""
                file_path = submit_path if head else historyPath
                for history_item in history_list:
                    if history_item["id"] == history["id"]:
                        history_file = history_item["file"]
                        file_name = history_item["file"]
                
                if not os.path.exists(file_path): history_file = u"文件不存在"
                if head and not os.path.isfile(os.path.join(file_path, file_name)): history_file = u"文件不存在"
                
                items = []
                path = "%s/%s"%(file_path, file_name)
                items.append(FileItem(path, history_file))
                items.append(FileItem(path, history["text"]))
                items.append(FileItem(path, history["last_update_by"]))
                items.append(FileItem(path, history["last_update_time"]))
                
                root.appendRow(items)
                
                head = False
            
            
class FileLinkModel(QtGui.QStandardItemModel):
        
    def columnCount(self, *_):
        return 1
    
    def update(self, task_id, task_stage):
        self._filebox = database.getFileBox(task_id, task_stage)
        self.clear()
        
        root = self.invisibleRootItem()
        publish_dir = ""
        
        for filebox in self._filebox:
            if filebox["is_submit"]: continue
            if filebox["sign"] == "publish": publish_dir = filebox["path"]
            
            try:
                if not os.path.exists(filebox["path"]): 
                    continue
            except TypeError:
                continue
            
            root.appendRow(FileItem(filebox["path"], filebox["title"]))
            
        return publish_dir


class FileListModel(QtGui.QStandardItemModel):
        
    def update(self, task_id):
        self._history = database.getFileHistoryInfo(task_id)
        
        self.clear()
        
        root = self.invisibleRootItem()
        file_list = []
        
        for history in self._history:
            if not history["file"] or history["file"] in file_list: continue
            file_list.append(history["file"])
            root.appendRow(QtGui.QStandardItem(history["file"]))


class LabelItem(QtGui.QStandardItem):
    
    def __init__(self, text=None, tag=None):
        super(LabelItem, self).__init__(text)
        self.setFlags(QtCore.Qt.ItemIsEnabled)
        self._tag = tag
        
        if text: self.setToolTip(text)
        
    def data(self, role=QtCore.Qt.DisplayRole):
        if role == TASK_ITEM_TYPE: return TASK_LABEL_TYPE
        elif role == TASK_FILTER: return self._tag
        
        return super(LabelItem, self).data(role)

    
class TaskItem(QtGui.QStandardItem):
    
    def __init__(self, task, text=None, tag=None):
        super(TaskItem, self).__init__(text)
        self.setFlags(QtCore.Qt.ItemIsSelectable | QtCore.Qt.ItemIsEnabled)
        
        self._task = task
        self._tag = tag
        self._detail = ""
        
        if task["status"] == "Retake":
            self.setForeground(QtGui.QBrush(QtCore.Qt.red))
        elif task["status"] == "Check":
            self.setForeground(QtGui.QBrush(QtCore.Qt.yellow))
        elif task["status"] in ["Approve", "FinalApprove"]:
            self.setForeground(QtGui.QBrush(QtCore.Qt.green))
    
    def data(self, role=QtCore.Qt.DisplayRole):
        if role == QtCore.Qt.FontRole and self._task["status"] == "Retake": 
            bold_font = QtGui.QFont()
            bold_font.setBold(True)
            return bold_font
        
        elif role == TASK_ITEM_TYPE: return TASK_DATA_TYPE
        elif role == TASK_ID: return self._task["id"]
        elif role == TASK_STAGE: return self._task["stage"]
        elif role == TASK_NAME: return self._task["name"]
        elif role == TASK_DATE: return self._task["date"]
        elif role == TASK_LAST: return self._task["latest"]
        elif role == TASK_ARTIST: return self._task["artist"]
        elif role == TASK_STATUS: return self._task["status"]
        elif role == TASK_DETAIL: 
            if not self._detail:
                asset_type = "shot"
                for pipeline_info in database.getPipeLineInfo("asset_task"):
                    if self._task["stage"] == pipeline_info["name"]:
                        asset_type = "asset"
                        break
                if asset_type == "asset":
                    asset = database.getAssetInfo(self._task["name"])
                    self._detail = u"[%s]%s" % (asset["asset.type_name"], asset["asset.cn_name"])
                elif asset_type == "shot":
                    self._detail = database.getShotInfo(self._task["name"])
                
            return self._detail
        elif role == TASK_FILTER: return self._tag
        
        return super(TaskItem, self).data(role)
    
    
class FileItem(QtGui.QStandardItem):
    
    def __init__(self, path, *args):
        super(FileItem, self).__init__(*args)
        self.setFlags(QtCore.Qt.ItemIsSelectable | QtCore.Qt.ItemIsEnabled)
        
        self._path = path
        
    def data(self, role=QtCore.Qt.DisplayRole):
        if role == FILE_PATH: return self._path.replace('\\', '/')
    
        return super(FileItem, self).data(role)
    

    
    