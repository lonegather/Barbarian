# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'E:/workspace/PutaoTools/commons/ui/CGTW.ui'
#
# Created: Tue Nov 07 09:31:07 2017
#      by: pyside-uic 0.2.14 running on PySide 1.2.0
#
# WARNING! All changes made in this file will be lost!

from PySide import QtCore, QtGui
from barbarian.utils import ui

class Ui_CGTWWin(ui.QtUI):
    def setupUi(self, CGTWWin):
        CGTWWin.setObjectName("CGTWWin")
        CGTWWin.resize(1024, 600)
        CGTWWin.setMinimumSize(QtCore.QSize(1024, 600))
        self.centralwidget = QtGui.QWidget(CGTWWin)
        self.centralwidget.setObjectName("centralwidget")
        self.verticalLayout_2 = QtGui.QVBoxLayout(self.centralwidget)
        self.verticalLayout_2.setObjectName("verticalLayout_2")
        self.horizontalLayout = QtGui.QHBoxLayout()
        self.horizontalLayout.setObjectName("horizontalLayout")
        self.label = QtGui.QLabel(self.centralwidget)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Preferred)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.label.sizePolicy().hasHeightForWidth())
        self.label.setSizePolicy(sizePolicy)
        self.label.setMaximumSize(QtCore.QSize(50, 16777215))
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        self.label.setFont(font)
        self.label.setObjectName("label")
        self.horizontalLayout.addWidget(self.label)
        self.CGTWCBProject = ui.QOptionMenu(self.centralwidget)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.CGTWCBProject.sizePolicy().hasHeightForWidth())
        self.CGTWCBProject.setSizePolicy(sizePolicy)
        self.CGTWCBProject.setMinimumSize(QtCore.QSize(85, 30))
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        self.CGTWCBProject.setFont(font)
        self.CGTWCBProject.setObjectName("CGTWCBProject")
        self.horizontalLayout.addWidget(self.CGTWCBProject)
        self.CGTWLBLUser = QtGui.QLabel(self.centralwidget)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Preferred)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.CGTWLBLUser.sizePolicy().hasHeightForWidth())
        self.CGTWLBLUser.setSizePolicy(sizePolicy)
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        self.CGTWLBLUser.setFont(font)
        self.CGTWLBLUser.setText("")
        self.CGTWLBLUser.setAlignment(QtCore.Qt.AlignRight|QtCore.Qt.AlignTrailing|QtCore.Qt.AlignVCenter)
        self.CGTWLBLUser.setObjectName("CGTWLBLUser")
        self.horizontalLayout.addWidget(self.CGTWLBLUser)
        self.CGTWLEUsername = QtGui.QLineEdit(self.centralwidget)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.CGTWLEUsername.sizePolicy().hasHeightForWidth())
        self.CGTWLEUsername.setSizePolicy(sizePolicy)
        self.CGTWLEUsername.setMinimumSize(QtCore.QSize(100, 30))
        self.CGTWLEUsername.setMaximumSize(QtCore.QSize(100, 16777215))
        self.CGTWLEUsername.setAlignment(QtCore.Qt.AlignCenter)
        self.CGTWLEUsername.setObjectName("CGTWLEUsername")
        self.horizontalLayout.addWidget(self.CGTWLEUsername)
        self.CGTWLEPassword = QtGui.QLineEdit(self.centralwidget)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.CGTWLEPassword.sizePolicy().hasHeightForWidth())
        self.CGTWLEPassword.setSizePolicy(sizePolicy)
        self.CGTWLEPassword.setMinimumSize(QtCore.QSize(100, 30))
        self.CGTWLEPassword.setMaximumSize(QtCore.QSize(100, 16777215))
        self.CGTWLEPassword.setAlignment(QtCore.Qt.AlignCenter)
        self.CGTWLEPassword.setObjectName("CGTWLEPassword")
        self.horizontalLayout.addWidget(self.CGTWLEPassword)
        self.CGTWBtnConnect = QtGui.QPushButton(self.centralwidget)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.CGTWBtnConnect.sizePolicy().hasHeightForWidth())
        self.CGTWBtnConnect.setSizePolicy(sizePolicy)
        self.CGTWBtnConnect.setMinimumSize(QtCore.QSize(80, 30))
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        self.CGTWBtnConnect.setFont(font)
        self.CGTWBtnConnect.setObjectName("CGTWBtnConnect")
        self.horizontalLayout.addWidget(self.CGTWBtnConnect)
        self.CGTWLEDeregister = QtGui.QPushButton(self.centralwidget)
        self.CGTWLEDeregister.setMinimumSize(QtCore.QSize(80, 30))
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        self.CGTWLEDeregister.setFont(font)
        self.CGTWLEDeregister.setObjectName("CGTWLEDeregister")
        self.horizontalLayout.addWidget(self.CGTWLEDeregister)
        self.verticalLayout_2.addLayout(self.horizontalLayout)
        self.line = QtGui.QFrame(self.centralwidget)
        self.line.setFrameShape(QtGui.QFrame.HLine)
        self.line.setFrameShadow(QtGui.QFrame.Sunken)
        self.line.setObjectName("line")
        self.verticalLayout_2.addWidget(self.line)
        self.horizontalLayout_2 = QtGui.QHBoxLayout()
        self.horizontalLayout_2.setObjectName("horizontalLayout_2")
        self.verticalLayout = QtGui.QVBoxLayout()
        self.verticalLayout.setObjectName("verticalLayout")
        self.treeWidget = QtGui.QTreeWidget(self.centralwidget)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Preferred, QtGui.QSizePolicy.Preferred)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.treeWidget.sizePolicy().hasHeightForWidth())
        self.treeWidget.setSizePolicy(sizePolicy)
        self.treeWidget.setMinimumSize(QtCore.QSize(400, 0))
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        self.treeWidget.setFont(font)
        self.treeWidget.setEditTriggers(QtGui.QAbstractItemView.NoEditTriggers)
        self.treeWidget.setAlternatingRowColors(True)
        self.treeWidget.setIndentation(21)
        self.treeWidget.setAnimated(True)
        self.treeWidget.setObjectName("treeWidget")
        self.verticalLayout.addWidget(self.treeWidget)
        self.horizontalLayout_4 = QtGui.QHBoxLayout()
        self.horizontalLayout_4.setObjectName("horizontalLayout_4")
        self.CGTWBtnRefresh = QtGui.QPushButton(self.centralwidget)
        self.CGTWBtnRefresh.setMinimumSize(QtCore.QSize(0, 30))
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        self.CGTWBtnRefresh.setFont(font)
        self.CGTWBtnRefresh.setObjectName("CGTWBtnRefresh")
        self.horizontalLayout_4.addWidget(self.CGTWBtnRefresh)
        self.CGTWBtnSubmit = QtGui.QPushButton(self.centralwidget)
        self.CGTWBtnSubmit.setMinimumSize(QtCore.QSize(0, 30))
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        self.CGTWBtnSubmit.setFont(font)
        self.CGTWBtnSubmit.setObjectName("CGTWBtnSubmit")
        self.horizontalLayout_4.addWidget(self.CGTWBtnSubmit)
        self.CGTWBtnFinal = QtGui.QPushButton(self.centralwidget)
        self.CGTWBtnFinal.setMinimumSize(QtCore.QSize(0, 30))
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        self.CGTWBtnFinal.setFont(font)
        self.CGTWBtnFinal.setObjectName("CGTWBtnFinal")
        self.horizontalLayout_4.addWidget(self.CGTWBtnFinal)
        self.verticalLayout.addLayout(self.horizontalLayout_4)
        self.verticalLayout.setStretch(0, 1)
        self.horizontalLayout_2.addLayout(self.verticalLayout)
        self.widget = QtGui.QWidget(self.centralwidget)
        self.widget.setMinimumSize(QtCore.QSize(450, 0))
        self.widget.setObjectName("widget")
        self.horizontalLayout_3 = QtGui.QHBoxLayout(self.widget)
        self.horizontalLayout_3.setContentsMargins(0, 0, 0, 0)
        self.horizontalLayout_3.setContentsMargins(0, 0, 0, 0)
        self.horizontalLayout_3.setObjectName("horizontalLayout_3")
        self.CGTWFrmInfo = QtGui.QFrame(self.widget)
        self.CGTWFrmInfo.setObjectName("CGTWFrmInfo")
        self.verticalLayout_3 = QtGui.QVBoxLayout(self.CGTWFrmInfo)
        self.verticalLayout_3.setContentsMargins(0, 0, 0, 0)
        self.verticalLayout_3.setObjectName("verticalLayout_3")
        self.CGTWLBLInfoName = QtGui.QLabel(self.CGTWFrmInfo)
        self.CGTWLBLInfoName.setMinimumSize(QtCore.QSize(0, 30))
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(12)
        font.setWeight(75)
        font.setBold(True)
        self.CGTWLBLInfoName.setFont(font)
        self.CGTWLBLInfoName.setObjectName("CGTWLBLInfoName")
        self.verticalLayout_3.addWidget(self.CGTWLBLInfoName)
        self.CGTWLBLInfoType = QtGui.QLabel(self.CGTWFrmInfo)
        self.CGTWLBLInfoType.setMinimumSize(QtCore.QSize(0, 20))
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        self.CGTWLBLInfoType.setFont(font)
        self.CGTWLBLInfoType.setObjectName("CGTWLBLInfoType")
        self.verticalLayout_3.addWidget(self.CGTWLBLInfoType)
        self.CGTWLBLInfoPipeline = QtGui.QLabel(self.CGTWFrmInfo)
        self.CGTWLBLInfoPipeline.setMinimumSize(QtCore.QSize(0, 20))
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        font.setItalic(True)
        font.setUnderline(False)
        self.CGTWLBLInfoPipeline.setFont(font)
        self.CGTWLBLInfoPipeline.setObjectName("CGTWLBLInfoPipeline")
        self.verticalLayout_3.addWidget(self.CGTWLBLInfoPipeline)
        self.CGTWTWHistory = QtGui.QTreeWidget(self.CGTWFrmInfo)
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        self.CGTWTWHistory.setFont(font)
        self.CGTWTWHistory.setAlternatingRowColors(True)
        self.CGTWTWHistory.setIndentation(21)
        self.CGTWTWHistory.setWordWrap(True)
        self.CGTWTWHistory.setObjectName("CGTWTWHistory")
        self.verticalLayout_3.addWidget(self.CGTWTWHistory)
        self.CGTWTWLink = QtGui.QTreeWidget(self.CGTWFrmInfo)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Minimum)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.CGTWTWLink.sizePolicy().hasHeightForWidth())
        self.CGTWTWLink.setSizePolicy(sizePolicy)
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        self.CGTWTWLink.setFont(font)
        self.CGTWTWLink.setAlternatingRowColors(True)
        self.CGTWTWLink.setIndentation(21)
        self.CGTWTWLink.setObjectName("CGTWTWLink")
        self.verticalLayout_3.addWidget(self.CGTWTWLink)
        self.horizontalLayout_3.addWidget(self.CGTWFrmInfo)
        self.horizontalLayout_2.addWidget(self.widget)
        self.horizontalLayout_2.setStretch(1, 1)
        self.verticalLayout_2.addLayout(self.horizontalLayout_2)
        self.line_2 = QtGui.QFrame(self.centralwidget)
        self.line_2.setFrameShape(QtGui.QFrame.HLine)
        self.line_2.setFrameShadow(QtGui.QFrame.Sunken)
        self.line_2.setObjectName("line_2")
        self.verticalLayout_2.addWidget(self.line_2)
        self.CGTWLBLResult = QtGui.QLabel(self.centralwidget)
        self.CGTWLBLResult.setMinimumSize(QtCore.QSize(0, 30))
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        self.CGTWLBLResult.setFont(font)
        self.CGTWLBLResult.setFrameShape(QtGui.QFrame.StyledPanel)
        self.CGTWLBLResult.setFrameShadow(QtGui.QFrame.Sunken)
        self.CGTWLBLResult.setObjectName("CGTWLBLResult")
        self.verticalLayout_2.addWidget(self.CGTWLBLResult)
        CGTWWin.setCentralWidget(self.centralwidget)

        self.retranslateUi(CGTWWin)
        QtCore.QMetaObject.connectSlotsByName(CGTWWin)

    def retranslateUi(self, CGTWWin):
        CGTWWin.setWindowTitle(QtGui.QApplication.translate("CGTWWin", "Teamwork", None, QtGui.QApplication.UnicodeUTF8))
        self.label.setText(QtGui.QApplication.translate("CGTWWin", "项目：", None, QtGui.QApplication.UnicodeUTF8))
        self.CGTWBtnConnect.setText(QtGui.QApplication.translate("CGTWWin", "登录", None, QtGui.QApplication.UnicodeUTF8))
        self.CGTWLEDeregister.setText(QtGui.QApplication.translate("CGTWWin", "注销", None, QtGui.QApplication.UnicodeUTF8))
        self.treeWidget.headerItem().setText(0, QtGui.QApplication.translate("CGTWWin", "我的任务", None, QtGui.QApplication.UnicodeUTF8))
        self.treeWidget.headerItem().setText(1, QtGui.QApplication.translate("CGTWWin", "截止日期", None, QtGui.QApplication.UnicodeUTF8))
        self.CGTWBtnRefresh.setText(QtGui.QApplication.translate("CGTWWin", "刷新", None, QtGui.QApplication.UnicodeUTF8))
        self.CGTWBtnSubmit.setText(QtGui.QApplication.translate("CGTWWin", "提交检查", None, QtGui.QApplication.UnicodeUTF8))
        self.CGTWBtnFinal.setText(QtGui.QApplication.translate("CGTWWin", "最终提交", None, QtGui.QApplication.UnicodeUTF8))
        self.CGTWLBLInfoName.setText(QtGui.QApplication.translate("CGTWWin", "资产名称", None, QtGui.QApplication.UnicodeUTF8))
        self.CGTWLBLInfoType.setText(QtGui.QApplication.translate("CGTWWin", "资产类型", None, QtGui.QApplication.UnicodeUTF8))
        self.CGTWLBLInfoPipeline.setText(QtGui.QApplication.translate("CGTWWin", "制作阶段", None, QtGui.QApplication.UnicodeUTF8))
        self.CGTWTWHistory.headerItem().setText(0, QtGui.QApplication.translate("CGTWWin", "历史版本", None, QtGui.QApplication.UnicodeUTF8))
        self.CGTWTWHistory.headerItem().setText(1, QtGui.QApplication.translate("CGTWWin", "版本描述", None, QtGui.QApplication.UnicodeUTF8))
        self.CGTWTWHistory.headerItem().setText(2, QtGui.QApplication.translate("CGTWWin", "提交人", None, QtGui.QApplication.UnicodeUTF8))
        self.CGTWTWHistory.headerItem().setText(3, QtGui.QApplication.translate("CGTWWin", "提交时间", None, QtGui.QApplication.UnicodeUTF8))
        self.CGTWTWLink.headerItem().setText(0, QtGui.QApplication.translate("CGTWWin", "相关文件", None, QtGui.QApplication.UnicodeUTF8))
