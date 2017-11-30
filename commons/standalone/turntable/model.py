#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.11.28

@author: Serious Sam
'''

import os, subprocess
from PySide import QtCore, QtGui
from turntable import db


scene_name = QtCore.Qt.UserRole + 1
scene_type = QtCore.Qt.UserRole + 2
scene_stat = QtCore.Qt.UserRole + 3


class FileListModel(QtCore.QAbstractListModel):
    
    def __init__(self, parent=None):
        super(FileListModel, self).__init__(parent)
        
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
            
            new_file.append({"name":file_name, "source":file_path})
            
        if not new_file: return False
        
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(db.get_path(db.tool_location, "icons/logo.png")), 
                       QtGui.QIcon.Normal, QtGui.QIcon.Off)
        msg = QtGui.QMessageBox()
        msg.setText(u"选择资产类型：")
        msg.setWindowIcon(icon)
        msg.setWindowTitle(u"信息")
        msg.setWindowFlags(msg.windowFlags()|QtCore.Qt.WindowStaysOnTopHint)
        char_btn = msg.addButton(u"角色", QtGui.QMessageBox.ActionRole)
        prop_btn = msg.addButton(u"道具", QtGui.QMessageBox.ActionRole)
        msg.exec_()
        
        if msg.clickedButton() == char_btn: file_type = "char"
        elif msg.clickedButton() == prop_btn: file_type = "prop"
        else: return False
        
        types = {"char": db.char_location, "prop": db.prop_location}
        
        for f in new_file: 
            name = f["name"].split('.')[0]
            f["type"] = file_type
            f["target"] = "%s%s/%s_turntable.mb" % (types[file_type], name, name)
            f["status"] = "init"
        
        db.add_file(*new_file)
        self.dataChanged.emit(QtCore.QModelIndex(), QtCore.QModelIndex())
        
        return True
    
    def start(self):
        maya_gen_path = os.path.join(os.path.split(__file__)[0], "initializer.py").replace('\\', '/')
        command = u"\"%s\" %s"%(db.maya_interpreter, maya_gen_path)
        self.init_monitors = []
        self.gen_monitors = []
        self.render_monitors = []
        self.com_monitors = []
        
        for scene in db.file_list():
            command_full = u"%s %s %s %s"%(command, scene["source"], scene["target"], scene["type"])
            startup_info = subprocess.STARTUPINFO()
            startup_info.dwFlags |= subprocess.STARTF_USESHOWWINDOW
            startup_info.wShowWindow = subprocess.SW_HIDE
            process = subprocess.Popen(command_full, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
            monitor = MonitorThread(process, scene)
            monitor.processCompleted.connect(self.onInitDone)
            monitor.start()
            
            self.init_monitors.append(monitor)
    
    def onInitDone(self, message, scene):
        if message.count(db.init_success_msg):
            print db.init_success_msg
            scene["status"] = "generating"
            maya_gen_path = os.path.join(os.path.split(__file__)[0], "generator.py").replace('\\', '/')
            command = command = u"\"%s\" %s"%(db.maya_interpreter, maya_gen_path)
            command_full = u"%s %s %s %s"%(command, scene["source"], scene["target"], scene["type"])
            startup_info = subprocess.STARTUPINFO()
            startup_info.dwFlags |= subprocess.STARTF_USESHOWWINDOW
            startup_info.wShowWindow = subprocess.SW_HIDE
            process = subprocess.Popen(command_full, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
            monitor = MonitorThread(process, scene)
            monitor.processCompleted.connect(self.onGenDone)
            monitor.start()
            
            self.gen_monitors.append(monitor)
        
        else: 
            scene["status"] = "failed"
            print message
        
        self.dataChanged.emit(QtCore.QModelIndex(), QtCore.QModelIndex())
        
    def onGenDone(self, message, scene):
        if message.count(db.gen_success_msg):
            print db.gen_success_msg
            scene["status"] = "rendering"
            maya_gen_path = os.path.join(os.path.split(__file__)[0], "renderer.py").replace('\\', '/')
            command = command = u"\"%s\" %s"%(db.maya_interpreter, maya_gen_path)
            command_full = u"%s %s"%(command, scene["target"])
            startup_info = subprocess.STARTUPINFO()
            startup_info.dwFlags |= subprocess.STARTF_USESHOWWINDOW
            startup_info.wShowWindow = subprocess.SW_HIDE
            process = subprocess.Popen(command_full, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
            monitor = MonitorThread(process, scene)
            monitor.processCompleted.connect(self.onRenderDone)
            monitor.start()
            
            self.render_monitors.append(monitor)
            
        else: 
            scene["status"] = "failed"
            print message
        
        self.dataChanged.emit(QtCore.QModelIndex(), QtCore.QModelIndex())
        
    def onRenderDone(self, message, scene):
        if message.count(db.render_success_msg):
            print db.render_success_msg
            scene["status"] = "compositing"
            maya_gen_path = os.path.join(os.path.split(__file__)[0], "compositer.py").replace('\\', '/')
            command = command = u"\"%s\" %s"%(db.maya_interpreter, maya_gen_path)
            command_full = u"%s %s"%(command, scene["target"])
            startup_info = subprocess.STARTUPINFO()
            startup_info.dwFlags |= subprocess.STARTF_USESHOWWINDOW
            startup_info.wShowWindow = subprocess.SW_HIDE
            process = subprocess.Popen(command_full, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
            monitor = MonitorThread(process, scene)
            monitor.processCompleted.connect(self.onComDone)
            monitor.start()
            
            self.com_monitors.append(monitor)
            
        else: 
            scene["status"] = "failed"
            print message
            
        self.dataChanged.emit(QtCore.QModelIndex(), QtCore.QModelIndex())
        
    def onComDone(self, message, scene):
        if message.count(db.com_success_msg):
            print db.com_success_msg
            scene["status"] = "done"
            
        else: 
            scene["status"] = "failed"
            print message
            
        self.dataChanged.emit(QtCore.QModelIndex(), QtCore.QModelIndex())
    
    
class MonitorThread(QtCore.QThread):
    
    processCompleted = QtCore.Signal(object, object)
    
    def __init__(self, process, scene):
        super(MonitorThread, self).__init__()
        self.process = process
        self.scene = scene
    
    def run(self):
        message = self.process.communicate()[0]
        self.processCompleted.emit(message, self.scene)
    
        