# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'E:/workspace/PutaoTools/commons/ui/CGTW.ui'
#
# Created: Fri Nov 24 16:29:06 2017
#      by: pyside-uic 0.2.14 running on PySide 1.2.0
#
# WARNING! All changes made in this file will be lost!

from PySide import QtCore, QtGui
from .. import ui

class Ui_CGTWWin(ui.QtUI):
    def setupUi(self, CGTWWin):
        CGTWWin.setObjectName("CGTWWin")
        CGTWWin.resize(1200, 600)
        CGTWWin.setMinimumSize(QtCore.QSize(1200, 600))
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
        font.setFamily(u"微软雅黑")
        font.setPointSize(10)
        self.label.setFont(font)
        self.label.setObjectName("label")
        self.horizontalLayout.addWidget(self.label)
        self.CGTWCBProject = ui.OptionMenu(self.centralwidget)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.CGTWCBProject.sizePolicy().hasHeightForWidth())
        self.CGTWCBProject.setSizePolicy(sizePolicy)
        self.CGTWCBProject.setMinimumSize(QtCore.QSize(85, 30))
        font = QtGui.QFont()
        font.setFamily(u"微软雅黑")
        font.setPointSize(10)
        self.CGTWCBProject.setFont(font)
        self.CGTWCBProject.setObjectName("CGTWCBProject")
        self.horizontalLayout.addWidget(self.CGTWCBProject)
        self.CGTWBtnRefresh = QtGui.QPushButton(self.centralwidget)
        self.CGTWBtnRefresh.setMinimumSize(QtCore.QSize(100, 30))
        font = QtGui.QFont()
        font.setFamily(u"微软雅黑")
        font.setPointSize(10)
        self.CGTWBtnRefresh.setFont(font)
        self.CGTWBtnRefresh.setObjectName("CGTWBtnRefresh")
        self.horizontalLayout.addWidget(self.CGTWBtnRefresh)
        self.CGTWBtnHelp = QtGui.QPushButton(self.centralwidget)
        self.CGTWBtnHelp.setMinimumSize(QtCore.QSize(100, 30))
        font = QtGui.QFont()
        font.setFamily(u"微软雅黑")
        font.setPointSize(10)
        self.CGTWBtnHelp.setFont(font)
        self.CGTWBtnHelp.setObjectName("CGTWBtnHelp")
        self.horizontalLayout.addWidget(self.CGTWBtnHelp)
        self.CGTWLBLUser = QtGui.QLabel(self.centralwidget)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Preferred)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.CGTWLBLUser.sizePolicy().hasHeightForWidth())
        self.CGTWLBLUser.setSizePolicy(sizePolicy)
        font = QtGui.QFont()
        font.setFamily(u"微软雅黑")
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
        font.setFamily(u"微软雅黑")
        font.setPointSize(10)
        self.CGTWBtnConnect.setFont(font)
        self.CGTWBtnConnect.setObjectName("CGTWBtnConnect")
        self.horizontalLayout.addWidget(self.CGTWBtnConnect)
        self.CGTWLEDeregister = QtGui.QPushButton(self.centralwidget)
        self.CGTWLEDeregister.setMinimumSize(QtCore.QSize(80, 30))
        font = QtGui.QFont()
        font.setFamily(u"微软雅黑")
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
        self.tabWidget = QtGui.QTabWidget(self.centralwidget)
        self.tabWidget.setMinimumSize(QtCore.QSize(300, 0))
        font = QtGui.QFont()
        font.setFamily(u"微软雅黑")
        font.setPointSize(10)
        self.tabWidget.setFont(font)
        self.tabWidget.setObjectName("tabWidget")
        self.CGTWPageTask = QtGui.QWidget()
        self.CGTWPageTask.setObjectName("CGTWPageTask")
        self.verticalLayout_4 = QtGui.QVBoxLayout(self.CGTWPageTask)
        self.verticalLayout_4.setContentsMargins(0, 0, 0, -1)
        self.verticalLayout_4.setObjectName("verticalLayout_4")
        self.CGTWTVTask = QtGui.QTreeView(self.CGTWPageTask)
        font = QtGui.QFont()
        font.setFamily(u"微软雅黑")
        font.setPointSize(10)
        self.CGTWTVTask.setFont(font)
        self.CGTWTVTask.setAlternatingRowColors(True)
        self.CGTWTVTask.setIndentation(21)
        self.CGTWTVTask.setAnimated(True)
        self.CGTWTVTask.setHeaderHidden(True)
        self.CGTWTVTask.setObjectName("CGTWTVTask")
        self.verticalLayout_4.addWidget(self.CGTWTVTask)
        self.CGTWBtnSubmit = QtGui.QPushButton(self.CGTWPageTask)
        self.CGTWBtnSubmit.setMinimumSize(QtCore.QSize(0, 50))
        font = QtGui.QFont()
        font.setFamily(u"微软雅黑")
        font.setPointSize(10)
        self.CGTWBtnSubmit.setFont(font)
        self.CGTWBtnSubmit.setObjectName("CGTWBtnSubmit")
        self.verticalLayout_4.addWidget(self.CGTWBtnSubmit)
        self.tabWidget.addTab(self.CGTWPageTask, "")
        self.CGTWPageCheck = QtGui.QWidget()
        self.CGTWPageCheck.setObjectName("CGTWPageCheck")
        self.verticalLayout_5 = QtGui.QVBoxLayout(self.CGTWPageCheck)
        self.verticalLayout_5.setContentsMargins(0, 0, 0, -1)
        self.verticalLayout_5.setObjectName("verticalLayout_5")
        self.CGTWTVCheck = QtGui.QTreeView(self.CGTWPageCheck)
        font = QtGui.QFont()
        font.setFamily(u"微软雅黑")
        font.setPointSize(10)
        self.CGTWTVCheck.setFont(font)
        self.CGTWTVCheck.setAlternatingRowColors(True)
        self.CGTWTVCheck.setIndentation(21)
        self.CGTWTVCheck.setAnimated(True)
        self.CGTWTVCheck.setHeaderHidden(True)
        self.CGTWTVCheck.setObjectName("CGTWTVCheck")
        self.verticalLayout_5.addWidget(self.CGTWTVCheck)
        self.horizontalLayout_5 = QtGui.QHBoxLayout()
        self.horizontalLayout_5.setObjectName("horizontalLayout_5")
        self.CGTWBtnRetake = QtGui.QPushButton(self.CGTWPageCheck)
        self.CGTWBtnRetake.setMinimumSize(QtCore.QSize(0, 50))
        font = QtGui.QFont()
        font.setFamily(u"微软雅黑")
        font.setPointSize(10)
        self.CGTWBtnRetake.setFont(font)
        self.CGTWBtnRetake.setObjectName("CGTWBtnRetake")
        self.horizontalLayout_5.addWidget(self.CGTWBtnRetake)
        self.CGTWBtnFinal = QtGui.QPushButton(self.CGTWPageCheck)
        self.CGTWBtnFinal.setMinimumSize(QtCore.QSize(0, 50))
        font = QtGui.QFont()
        font.setFamily(u"微软雅黑")
        font.setPointSize(10)
        self.CGTWBtnFinal.setFont(font)
        self.CGTWBtnFinal.setObjectName("CGTWBtnFinal")
        self.horizontalLayout_5.addWidget(self.CGTWBtnFinal)
        self.verticalLayout_5.addLayout(self.horizontalLayout_5)
        self.tabWidget.addTab(self.CGTWPageCheck, "")
        self.CGTWPageAll = QtGui.QWidget()
        self.CGTWPageAll.setObjectName("CGTWPageAll")
        self.verticalLayout_6 = QtGui.QVBoxLayout(self.CGTWPageAll)
        self.verticalLayout_6.setContentsMargins(0, 0, 0, -1)
        self.verticalLayout_6.setObjectName("verticalLayout_6")
        self.CGTWTVAll = QtGui.QTreeView(self.CGTWPageAll)
        font = QtGui.QFont()
        font.setFamily(u"微软雅黑")
        font.setPointSize(10)
        self.CGTWTVAll.setFont(font)
        self.CGTWTVAll.setAlternatingRowColors(True)
        self.CGTWTVAll.setIndentation(21)
        self.CGTWTVAll.setAnimated(True)
        self.CGTWTVAll.setHeaderHidden(True)
        self.CGTWTVAll.setObjectName("CGTWTVAll")
        self.verticalLayout_6.addWidget(self.CGTWTVAll)
        self.horizontalLayout_3 = QtGui.QHBoxLayout()
        self.horizontalLayout_3.setObjectName("horizontalLayout_3")
        self.CGTWRBAsset = QtGui.QRadioButton(self.CGTWPageAll)
        self.CGTWRBAsset.setMinimumSize(QtCore.QSize(0, 30))
        font = QtGui.QFont()
        font.setFamily(u"微软雅黑")
        font.setPointSize(10)
        self.CGTWRBAsset.setFont(font)
        self.CGTWRBAsset.setChecked(True)
        self.CGTWRBAsset.setObjectName("CGTWRBAsset")
        self.horizontalLayout_3.addWidget(self.CGTWRBAsset)
        self.CGTWRBShot = QtGui.QRadioButton(self.CGTWPageAll)
        self.CGTWRBShot.setMinimumSize(QtCore.QSize(0, 30))
        font = QtGui.QFont()
        font.setFamily(u"微软雅黑")
        font.setPointSize(10)
        self.CGTWRBShot.setFont(font)
        self.CGTWRBShot.setObjectName("CGTWRBShot")
        self.horizontalLayout_3.addWidget(self.CGTWRBShot)
        self.CGTWCBFilter = QtGui.QComboBox(self.CGTWPageAll)
        self.CGTWCBFilter.setMinimumSize(QtCore.QSize(0, 30))
        font = QtGui.QFont()
        font.setFamily(u"微软雅黑")
        font.setPointSize(10)
        self.CGTWCBFilter.setFont(font)
        self.CGTWCBFilter.setObjectName("CGTWCBFilter")
        self.horizontalLayout_3.addWidget(self.CGTWCBFilter)
        self.horizontalLayout_3.setStretch(2, 1)
        self.verticalLayout_6.addLayout(self.horizontalLayout_3)
        self.tabWidget.addTab(self.CGTWPageAll, "")
        self.horizontalLayout_2.addWidget(self.tabWidget)
        self.CGTWGBInfo = QtGui.QGroupBox(self.centralwidget)
        self.CGTWGBInfo.setMinimumSize(QtCore.QSize(450, 0))
        font = QtGui.QFont()
        font.setFamily(u"微软雅黑")
        font.setPointSize(16)
        self.CGTWGBInfo.setFont(font)
        self.CGTWGBInfo.setAlignment(QtCore.Qt.AlignLeading|QtCore.Qt.AlignLeft|QtCore.Qt.AlignVCenter)
        self.CGTWGBInfo.setObjectName("CGTWGBInfo")
        self.gridLayout = QtGui.QGridLayout(self.CGTWGBInfo)
        self.gridLayout.setObjectName("gridLayout")
        self.CGTWLBLInfoType = QtGui.QLabel(self.CGTWGBInfo)
        self.CGTWLBLInfoType.setMinimumSize(QtCore.QSize(0, 20))
        font = QtGui.QFont()
        font.setFamily(u"微软雅黑")
        font.setPointSize(10)
        self.CGTWLBLInfoType.setFont(font)
        self.CGTWLBLInfoType.setObjectName("CGTWLBLInfoType")
        self.gridLayout.addWidget(self.CGTWLBLInfoType, 0, 0, 1, 1)
        self.CGTWLBLStatus = QtGui.QLabel(self.CGTWGBInfo)
        self.CGTWLBLStatus.setMinimumSize(QtCore.QSize(0, 30))
        font = QtGui.QFont()
        font.setFamily(u"微软雅黑")
        font.setPointSize(10)
        self.CGTWLBLStatus.setFont(font)
        self.CGTWLBLStatus.setFrameShape(QtGui.QFrame.StyledPanel)
        self.CGTWLBLStatus.setFrameShadow(QtGui.QFrame.Sunken)
        self.CGTWLBLStatus.setObjectName("CGTWLBLStatus")
        self.gridLayout.addWidget(self.CGTWLBLStatus, 1, 0, 1, 2)
        self.CGTWCBFile = QtGui.QComboBox(self.CGTWGBInfo)
        self.CGTWCBFile.setMinimumSize(QtCore.QSize(200, 30))
        font = QtGui.QFont()
        font.setFamily(u"微软雅黑")
        font.setPointSize(10)
        self.CGTWCBFile.setFont(font)
        self.CGTWCBFile.setObjectName("CGTWCBFile")
        self.gridLayout.addWidget(self.CGTWCBFile, 2, 0, 1, 1)
        self.CGTWCBFileLink = QtGui.QComboBox(self.CGTWGBInfo)
        self.CGTWCBFileLink.setMinimumSize(QtCore.QSize(200, 30))
        font = QtGui.QFont()
        font.setFamily(u"微软雅黑")
        font.setPointSize(10)
        self.CGTWCBFileLink.setFont(font)
        self.CGTWCBFileLink.setObjectName("CGTWCBFileLink")
        self.gridLayout.addWidget(self.CGTWCBFileLink, 2, 1, 1, 1)
        self.CGTWTVFileHistory = QtGui.QTreeView(self.CGTWGBInfo)
        font = QtGui.QFont()
        font.setFamily(u"微软雅黑")
        font.setPointSize(10)
        self.CGTWTVFileHistory.setFont(font)
        self.CGTWTVFileHistory.setContextMenuPolicy(QtCore.Qt.CustomContextMenu)
        self.CGTWTVFileHistory.setDragDropMode(QtGui.QAbstractItemView.DragOnly)
        self.CGTWTVFileHistory.setAlternatingRowColors(True)
        self.CGTWTVFileHistory.setIndentation(0)
        self.CGTWTVFileHistory.setObjectName("CGTWTVFileHistory")
        self.gridLayout.addWidget(self.CGTWTVFileHistory, 3, 0, 1, 1)
        self.CGTWLVFileLink = QtGui.QListView(self.CGTWGBInfo)
        font = QtGui.QFont()
        font.setFamily(u"微软雅黑")
        font.setPointSize(10)
        self.CGTWLVFileLink.setFont(font)
        self.CGTWLVFileLink.setContextMenuPolicy(QtCore.Qt.CustomContextMenu)
        self.CGTWLVFileLink.setDragDropMode(QtGui.QAbstractItemView.DragOnly)
        self.CGTWLVFileLink.setAlternatingRowColors(True)
        self.CGTWLVFileLink.setObjectName("CGTWLVFileLink")
        self.gridLayout.addWidget(self.CGTWLVFileLink, 3, 1, 1, 1)
        self.gridLayout.setColumnStretch(0, 1)
        self.horizontalLayout_2.addWidget(self.CGTWGBInfo)
        self.horizontalLayout_2.setStretch(1, 1)
        self.verticalLayout_2.addLayout(self.horizontalLayout_2)
        self.CGTWLBLResult = QtGui.QLabel(self.centralwidget)
        self.CGTWLBLResult.setMinimumSize(QtCore.QSize(0, 30))
        font = QtGui.QFont()
        font.setFamily(u"微软雅黑")
        font.setPointSize(10)
        self.CGTWLBLResult.setFont(font)
        self.CGTWLBLResult.setContextMenuPolicy(QtCore.Qt.CustomContextMenu)
        self.CGTWLBLResult.setFrameShape(QtGui.QFrame.StyledPanel)
        self.CGTWLBLResult.setFrameShadow(QtGui.QFrame.Sunken)
        self.CGTWLBLResult.setObjectName("CGTWLBLResult")
        self.verticalLayout_2.addWidget(self.CGTWLBLResult)
        self.verticalLayout_2.setStretch(2, 1)
        CGTWWin.setCentralWidget(self.centralwidget)

        self.retranslateUi(CGTWWin)
        self.tabWidget.setCurrentIndex(0)
        QtCore.QMetaObject.connectSlotsByName(CGTWWin)

    def retranslateUi(self, CGTWWin):
        CGTWWin.setWindowTitle(QtGui.QApplication.translate("CGTWWin", "Teamwork", None, QtGui.QApplication.UnicodeUTF8))
        self.label.setText(QtGui.QApplication.translate("CGTWWin", "项目：", None, QtGui.QApplication.UnicodeUTF8))
        self.CGTWBtnRefresh.setText(QtGui.QApplication.translate("CGTWWin", "刷新", None, QtGui.QApplication.UnicodeUTF8))
        self.CGTWBtnHelp.setText(QtGui.QApplication.translate("CGTWWin", "帮助", None, QtGui.QApplication.UnicodeUTF8))
        self.CGTWBtnConnect.setText(QtGui.QApplication.translate("CGTWWin", "登录", None, QtGui.QApplication.UnicodeUTF8))
        self.CGTWLEDeregister.setText(QtGui.QApplication.translate("CGTWWin", "注销", None, QtGui.QApplication.UnicodeUTF8))
        self.CGTWBtnSubmit.setText(QtGui.QApplication.translate("CGTWWin", "提交检查", None, QtGui.QApplication.UnicodeUTF8))
        self.tabWidget.setTabText(self.tabWidget.indexOf(self.CGTWPageTask), QtGui.QApplication.translate("CGTWWin", "我的任务", None, QtGui.QApplication.UnicodeUTF8))
        self.CGTWBtnRetake.setText(QtGui.QApplication.translate("CGTWWin", "回退", None, QtGui.QApplication.UnicodeUTF8))
        self.CGTWBtnFinal.setText(QtGui.QApplication.translate("CGTWWin", "发布", None, QtGui.QApplication.UnicodeUTF8))
        self.tabWidget.setTabText(self.tabWidget.indexOf(self.CGTWPageCheck), QtGui.QApplication.translate("CGTWWin", "检查任务", None, QtGui.QApplication.UnicodeUTF8))
        self.CGTWRBAsset.setText(QtGui.QApplication.translate("CGTWWin", "资产", None, QtGui.QApplication.UnicodeUTF8))
        self.CGTWRBShot.setText(QtGui.QApplication.translate("CGTWWin", "镜头", None, QtGui.QApplication.UnicodeUTF8))
        self.tabWidget.setTabText(self.tabWidget.indexOf(self.CGTWPageAll), QtGui.QApplication.translate("CGTWWin", "所有任务", None, QtGui.QApplication.UnicodeUTF8))
        self.CGTWGBInfo.setTitle(QtGui.QApplication.translate("CGTWWin", "任务详情", None, QtGui.QApplication.UnicodeUTF8))
        self.CGTWLBLInfoType.setText(QtGui.QApplication.translate("CGTWWin", "中文名称/场次", None, QtGui.QApplication.UnicodeUTF8))
        self.CGTWLBLStatus.setText(QtGui.QApplication.translate("CGTWWin", "任务状态", None, QtGui.QApplication.UnicodeUTF8))

