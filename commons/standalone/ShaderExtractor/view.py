#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.11.28

@author: Serious Sam
'''

import os
from PySide import QtCore, QtGui
import db, model, delegate, ui_main
    
    
class MainWindow(ui_main.Ui_MainWindow):
    
    def __init__(self):
        self.window = QtGui.QMainWindow()
        self.setupUi(self.window)
        
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(db.get_path(db.tool_location, "icons/logo.png")), 
                       QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.window.setWindowIcon(icon)
        self.window.setWindowFlags(QtCore.Qt.WindowStaysOnTopHint|QtCore.Qt.WindowTitleHint)
        
        file_list_model = model.FileListModel()
        self.fileListView.setModel(file_list_model)
        self.fileListView.setItemDelegate(delegate.FileDelegate(self.window))
        self.fileListView.setSelectionMode(QtGui.QAbstractItemView.ExtendedSelection)
        self.fileListView.setAcceptDrops(True)
        self.fileListView.setDropIndicatorShown(True)
        self.fileListView.doubleClicked.connect(self.onItemDoubleClicked)
        
        file_list_model.progress.connect(self.onProgress)
        self.generateButton.clicked.connect(self.onButtonClicked)
        
        self.window.show()
        
    def onButtonClicked(self, *_):
        if not db.file_list(): return
        self.frame.setEnabled(False)
        self.generateButton.setText(u"正在执行队列")
        
        db.set_concurrent(self.concurrentSlider.value())
        
        self.fileListView.model().quere()
        
    def onItemDoubleClicked(self, index):
        path = os.path.split(index.data(model.scene_path))[0]
        if os.path.exists(path):
            cmd = "explorer \"%s\"" % path
            cmd = cmd.replace('/', '\\')
            os.system(cmd)
    
    def onProgress(self, *_):
        file_list = db.file_list()
        total = len(file_list)
        num_done, num_failed = 0, 0
        for scene in file_list:
            if scene["status"] == "done": num_done += 1
            if scene["status"] == "failed": num_failed += 1
        num_left = total - num_done - num_failed
        
        if not num_left: 
            self.generateButton.setText(u"队列执行完毕")
            self.infoLable.setText(u"共%s个任务，成功%s个，失败%s个。"%(total, num_done, num_failed))
        else:
            self.infoLable.setText(u"共%s个任务，剩余%s个，成功%s个，失败%s个。"%(total, num_left, num_done, num_failed))
        
            
    
        

