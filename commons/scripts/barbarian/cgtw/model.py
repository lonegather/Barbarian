#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.10.20

@author: Serious Sam
'''

import os, json, logging
from PySide import QtGui, QtCore
from . import database

class TaskWorkModel(QtGui.QStandardItemModel):
    
    dataChanged = QtCore.Signal()
                
    def update(self):
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
            item_date = TaskItem(task, task["date"])
            
            if task["status"] in ["Work", "Wait", "Retake"]: item_parent = task_work
            elif task["status"] == "Check": item_parent = task_check
            elif task["status"] in ["Approve", "FinalApprove"]: item_parent = task_approve
            else: continue
            
            item_parent.appendRow([item_name, item_date])
    
    def columnCount(self, *_):
        return 2
    
    
class TaskCheckModel(QtGui.QStandardItemModel):
    
    dataChanged = QtCore.Signal()
                
    def update(self):
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
            item_date = TaskItem(task, task["date"])
            
            root_items[artist].appendRow([item_name, item_date])
    
    def columnCount(self, *_):
        return 2


class TaskAllModel(QtGui.QStandardItemModel):
    
    dataChanged = QtCore.Signal()
    
    def update(self):
        data = database.getTaskInfo()
        self.clear()
        
        root = self.invisibleRootItem()
        root_items = {}
        for task in data:
            stage = task["stage"]
            if not stage in root_items:
                root_items[stage] = LabelItem(stage)
                root.appendRow([root_items[stage], LabelItem(), LabelItem()])
            
            item_name = TaskItem(task, task["name"])
            item_status = TaskItem(task, task["status"])
            item_artist = TaskItem(task, task["artist"])
            
            root_items[stage].appendRow([item_name, item_status, item_artist])
    
    def columnCount(self, *_):
        return 3
    
    
class FileHistoryModel(QtGui.QStandardItemModel):
    
    dataChanged = QtCore.Signal()
    
    def __init__(self, parent=None):
        super(FileHistoryModel, self).__init__(parent)
        
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
    
    def update(self, task_id, task_stage):
        self._history = database.getFileHistoryInfo(task_id=task_id)
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
            if history["status"] == "Submit":
                file_name = history["file"] if head else ""
                file_path = submit_path if head else historyPath
                for history_item in history_list:
                    if history_item["id"] == history["id"]:
                        history_file = history_item["file"]
                        file_name = history_item["file"]
                
                if not os.path.exists(file_path): history_file = u"路径不存在"
                
                items = []
                items.append(FileItem("%s/%s"%(file_path, file_name), history_file))
                items.append(FileItem("%s/%s"%(file_path, file_name), history["text"]))
                items.append(FileItem("%s/%s"%(file_path, file_name), history["last_update_by"]))
                items.append(FileItem("%s/%s"%(file_path, file_name), history["last_update_time"]))
                
                root.appendRow(items)
                
            head = False
            
            
class FileLinkModel(QtGui.QStandardItemModel):
    
    dataChanged = QtCore.Signal()
    
    def __init__(self, parent=None):
        super(FileLinkModel, self).__init__(parent)
        
    def headerData(self, section, orientation, role):
        if role == QtCore.Qt.DisplayRole:
            if orientation == QtCore.Qt.Horizontal:
                if section == 0:
                    return u"相关文件"
        
    def columnCount(self, *_):
        return 1
    
    def update(self, task_id, task_stage):
        self._filebox = database.getFileBox(task_id, task_stage)
        self.clear()
        
        root = self.invisibleRootItem()
        
        for filebox in self._filebox:
            if filebox["is_submit"]: continue
            if not os.path.exists(filebox["path"]): continue
            
            root.appendRow(FileItem(filebox["path"], filebox["title"]))
    

class LabelItem(QtGui.QStandardItem):
    
    def __init__(self, *args):
        super(LabelItem, self).__init__(*args)
        self.setFlags(QtCore.Qt.ItemIsEnabled)

    
class TaskItem(QtGui.QStandardItem):
    
    def __init__(self, task, *args):
        super(TaskItem, self).__init__(*args)
        self.setFlags(QtCore.Qt.ItemIsSelectable | QtCore.Qt.ItemIsEnabled)
        
        self._task = task
        self._detail = ""
    
    def data(self, role=QtCore.Qt.DisplayRole):
        if role == QtCore.Qt.UserRole: return self._task["id"]
        elif role == QtCore.Qt.UserRole + 1: return self._task["stage"]
        elif role == QtCore.Qt.UserRole + 2: return self._task["name"]
        elif role == QtCore.Qt.UserRole + 3: 
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
        
        return super(TaskItem, self).data(role)
    
    
class FileItem(QtGui.QStandardItem):
    
    def __init__(self, path, *args):
        super(FileItem, self).__init__(*args)
        self.setFlags(QtCore.Qt.ItemIsSelectable | QtCore.Qt.ItemIsEnabled)
        
        self._path = path
        
    def data(self, role=QtCore.Qt.DisplayRole):
        if role == QtCore.Qt.UserRole: return self._path.replace('\\', '/')
    
        return super(FileItem, self).data(role)
    

    
    