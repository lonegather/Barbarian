#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.11.28

@author: Serious Sam
'''

import os, subprocess
from PySide import QtCore, QtGui
import db


scene_name = QtCore.Qt.UserRole + 1
scene_type = QtCore.Qt.UserRole + 2
scene_stat = QtCore.Qt.UserRole + 3
scene_path = QtCore.Qt.UserRole + 4
scene_progress = QtCore.Qt.UserRole + 5


class FileListModel(QtCore.QAbstractListModel):
    
    progress = QtCore.Signal()
    
    def __init__(self, parent=None):
        super(FileListModel, self).__init__(parent)
        self.monitors = []
        
    def rowCount(self, *_):
        return len(db.file_list())
    
    def data(self, index, role=QtCore.Qt.DisplayRole):
        if role == QtCore.Qt.DisplayRole:
            file_name = db.file_list()[index.row()].get("name", "null")
            file_stat = db.file_list()[index.row()].get("status", "null")
            return "[%s] %s" % (file_stat, file_name)
        elif role == scene_name: return db.file_list()[index.row()].get("name", "null")
        elif role == scene_type: return db.file_list()[index.row()].get("type", "null")
        elif role == scene_stat: return db.file_list()[index.row()].get("status", "null")
        elif role == scene_path: return db.file_list()[index.row()].get("target", "null")
        elif role == scene_progress: return db.file_list()[index.row()].get("progress", "null")
    
    def supportedDropActions(self):
        return QtCore.Qt.CopyAction
    
    def flags(self, index):
        defaultFlags = super(FileListModel, self).flags(index)
        return QtCore.Qt.ItemIsDropEnabled | defaultFlags
    
    def mimeTypes(self):
        return ['text/uri-list']
    
    def dropMimeData(self, data, action, row, column, parent):
        new_file = []
        
        for url in data.urls() or list():
            file_path = url.toLocalFile()
            file_name = os.path.split(file_path)[1]
            
            if file_name.split('.')[-1] not in ["ma", "mb"]: continue
            
            new = True
            for f in db.file_list():
                if file_path == f["source"]: new = False
            if not new: continue
            
            target_path = db.asset_location + "Common/Mods/" + file_path.split(db.asset_location)[-1]
            new_file.append({"name":file_name, "source":file_path, "target":target_path, "status":"wait"})
            
        if not new_file: return False
        
        db.add_file(*new_file)
        self.dataChanged.emit(QtCore.QModelIndex(), QtCore.QModelIndex())
        
        return True
    
    def quere(self):
        self.progress.emit()
        if db.all_done(): return
        
        maya_gen_path = os.path.join(os.path.split(__file__)[0], "initializer.py").replace('\\', '/')
        command = u"\"%s\" %s"%(db.maya_interpreter, maya_gen_path)
        scene = db.request_scene()
        while scene:
            command_full = u"%s %s"%(command, scene["target"])
            process = subprocess.Popen(command_full, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
            monitor = MonitorThread(process, scene)
            monitor.processCompleted.connect(self.onInitDone)
            monitor.start()
            self.monitors.append(monitor)
            scene = db.request_scene()
    
    def onInitDone(self, message, scene):
        if message.count(db.init_success_msg):
            print db.init_success_msg
            scene["status"] = "generating"
            maya_gen_path = os.path.join(os.path.split(__file__)[0], "generator.py").replace('\\', '/')
            command = command = u"\"%s\" %s"%(db.maya_interpreter, maya_gen_path)
            command_full = u"%s %s %s"%(command, scene["source"], scene["target"])
            process = subprocess.Popen(command_full, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
            monitor = MonitorThread(process, scene)
            monitor.processCompleted.connect(self.onGenDone)
            monitor.start()
            self.monitors.append(monitor)
        
        else: 
            scene["status"] = "failed"
            self.quere()
            print message
        
        self.dataChanged.emit(QtCore.QModelIndex(), QtCore.QModelIndex())
        
    def onGenDone(self, message, scene):
        if message.count(db.gen_success_msg):
            print db.gen_success_msg
            scene["status"] = "done"
            
        else: 
            scene["status"] = "failed"
            print message
        
        self.quere()
        self.dataChanged.emit(QtCore.QModelIndex(), QtCore.QModelIndex())
    
    
class MonitorThread(QtCore.QThread):
    
    processCompleted = QtCore.Signal(object, object)
    
    def __init__(self, process, scene):
        super(MonitorThread, self).__init__()
        self.process = process
        self.scene = scene
    
    def run(self):
        msg, err = self.process.communicate()
        message = "-------------------output--------------------\n%s" % msg
        if err: message += "\n-------------------error---------------------\n%s" % err
        self.processCompleted.emit(message, self.scene)
        
    
    
    
    
        