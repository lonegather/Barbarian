# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'E:/workspace/PutaoTools/commons/ui/TurntableGenerator.ui'
#
# Created: Tue Nov 28 14:33:21 2017
#      by: pyside-uic 0.2.14 running on PySide 1.2.0
#
# WARNING! All changes made in this file will be lost!

from PySide import QtCore, QtGui

class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.setMinimumSize(QtCore.QSize(274, 266))
        font = QtGui.QFont()
        font.setFamily(u"微软雅黑")
        font.setPointSize(10)
        MainWindow.setFont(font)
        self.centralwidget = QtGui.QWidget(MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.verticalLayout = QtGui.QVBoxLayout(self.centralwidget)
        self.verticalLayout.setObjectName("verticalLayout")
        self.fileListView = QtGui.QListView(self.centralwidget)
        self.fileListView.setObjectName("fileListView")
        self.verticalLayout.addWidget(self.fileListView)
        self.generateButton = QtGui.QPushButton(self.centralwidget)
        self.generateButton.setMinimumSize(QtCore.QSize(0, 50))
        font = QtGui.QFont()
        font.setFamily(u"微软雅黑")
        font.setPointSize(10)
        self.generateButton.setFont(font)
        self.generateButton.setObjectName("generateButton")
        self.verticalLayout.addWidget(self.generateButton)
        MainWindow.setCentralWidget(self.centralwidget)

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        MainWindow.setWindowTitle(QtGui.QApplication.translate("MainWindow", "转台动画生成器", None, QtGui.QApplication.UnicodeUTF8))
        self.generateButton.setText(QtGui.QApplication.translate("MainWindow", "生成", None, QtGui.QApplication.UnicodeUTF8))

