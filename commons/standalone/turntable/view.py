#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.11.28

@author: Serious Sam
'''

from PySide import QtCore, QtGui
from turntable import db, model, delegate, ui_main
    
    
class MainWindow(ui_main.Ui_MainWindow):
    
    def __init__(self):
        self.window = QtGui.QMainWindow()
        self.setupUi(self.window)
        
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(db.get_path(db.tool_location, "icons/logo.png")), 
                       QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.window.setWindowIcon(icon)
        self.window.setWindowFlags(self.window.windowFlags()|QtCore.Qt.WindowStaysOnTopHint)
        
        self.fileListView.setModel(model.FileListModel())
        self.fileListView.setItemDelegate(delegate.FileDelegate(self.window))
        self.fileListView.setSelectionMode(QtGui.QAbstractItemView.ExtendedSelection)
        self.fileListView.setAcceptDrops(True)
        self.fileListView.setDropIndicatorShown(True)
        
        self.generateButton.clicked.connect(self.onButtonClicked)
        
        self.window.show()
        
    def onButtonClicked(self, *_):
        if not db.file_list(): return
        self.generateButton.setVisible(False)
        self.fileListView.model().start()
            
    
        

