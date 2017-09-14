# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'D:/workspace_Python/PutaoTools/commons/ui/PuTaoMain.ui'
#
# Created: Thu Sep 14 21:35:42 2017
#      by: pyside-uic 0.2.14 running on PySide 1.2.0
#
# WARNING! All changes made in this file will be lost!

from PySide import QtCore, QtGui
from barbarian.utils import ui, config


class Ui_PuTaoMain(ui.QtUI):
    def setupUi(self, PuTaoMain):
        PuTaoMain.setObjectName("PuTaoMain")
        PuTaoMain.resize(428, 309)
        PuTaoMain.setMinimumSize(QtCore.QSize(428, 0))
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        PuTaoMain.setFont(font)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(config.getPath(config.kIcon, "logo.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        PuTaoMain.setWindowIcon(icon)
        PuTaoMain.setStyleSheet("QMainWindow{\n"
"    background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1, \n"
"                                      stop:0 rgba(20, 20, 20, 255), \n"
"                                      stop:0.1 rgba(60, 60, 60, 255), \n"
"                                      stop:0.9 rgba(60, 60, 60, 255), \n"
"                                      stop:1 rgba(40, 40, 40, 255));\n"
"    \n"
"}\n"
"\n"
"QTabWidget::pane { /* The tab widget frame */\n"
"    border-top: 1px solid gray;\n"
"    position: absolute;\n"
"    top: -0.1em;\n"
"}\n"
"\n"
"QTabWidget::tab-bar {\n"
"    alignment: center;\n"
"}\n"
"\n"
"/* Style the tab using the tab sub-control. Note that\n"
"    it reads QTabBar _not_ QTabWidget */\n"
"QTabBar::tab {\n"
"    background: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1, \n"
"                                stop:0 rgba(140, 140, 140, 255), \n"
"                                stop:0.3 rgba(50, 50, 50, 255), \n"
"                                stop:1 rgba(80, 80, 80, 255));\n"
"    border: 1px solid gray;\n"
"    border-bottom-color: grey; /* same as the pane color */\n"
"    border-top-left-radius: 6px;\n"
"    border-top-right-radius: 6px;\n"
"    padding: 0px 20px;\n"
"}\n"
"\n"
"QTabBar::tab:selected, QTabBar::tab:hover {\n"
"    background: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1, \n"
"                                stop:0 rgba(140, 140, 140, 255), \n"
"                                stop:0.3 rgba(60, 60, 60, 255), \n"
"                                stop:1 rgba(100, 100, 100, 255));\n"
"}\n"
"\n"
"QTabBar::tab:!selected {\n"
"    margin-top: 2px; /* make non-selected tabs look smaller */\n"
"}\n"
"\n"
"QSlider::groove:horizontal {\n"
"    border: 1px solid #999999;\n"
"    border-style: inset;\n"
"    height: 10px; /* the groove expands to the size of the slider by default. by giving it a height, it has a fixed size */\n"
"    background: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1, \n"
"                                stop:0 rgba(20, 20, 20, 255), \n"
"                                stop:0.3 rgba(40, 40, 40, 255), \n"
"                                stop:1 rgba(50, 50, 50, 255));\n"
"    margin: 2px 0;\n"
"}\n"
"\n"
"QSlider::handle:horizontal {\n"
"    background: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1, \n"
"                                stop:0 rgba(140, 140, 140, 255), \n"
"                                stop:0.3 rgba(80, 80, 80, 255), \n"
"                                stop:1 rgba(100, 100, 100, 255));\n"
"    border: 1px solid gray;\n"
"    border-style: outset;\n"
"    width: 15px;\n"
"    margin: -10px 0; /* handle is placed by default on the contents rect of the groove. Expand outside the groove */\n"
"    border-radius: 6px;\n"
"}\n"
"\n"
"QSlider::handle:horizontal:hover {\n"
"    background: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1, \n"
"                                stop:0 rgba(160, 160, 160, 255), \n"
"                                stop:0.3 rgba(100, 100, 100, 255), \n"
"                                stop:1 rgba(120, 120, 120, 255));\n"
"}\n"
"\n"
"QListWidget {\n"
"    border: 1px solid gray;\n"
"    border-radius: 6px;\n"
"    border-style: inset;\n"
"    background: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1, \n"
"                                stop:0 rgba(20, 20, 20, 255), \n"
"                                stop:0.3 rgba(40, 40, 40, 255), \n"
"                                stop:1 rgba(50, 50, 50, 255));\n"
"    selection-background-color: purple;\n"
"}\n"
"\n"
"QLineEdit {\n"
"    border: 1px solid gray;\n"
"    border-radius: 6px;\n"
"    border-style: inset;\n"
"    background: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1, \n"
"                                stop:0 rgba(20, 20, 20, 255), \n"
"                                stop:0.3 rgba(40, 40, 40, 255), \n"
"                                stop:1 rgba(50, 50, 50, 255));\n"
"    selection-background-color: purple;\n"
"}\n"
"\n"
"QComboBox{\n"
"    border: 1px solid gray;\n"
"    border-style: outset;\n"
"    border-radius: 6px;\n"
"    background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1, \n"
"                                      stop:0 rgba(140, 140, 140, 255), \n"
"                                      stop:0.3 rgba(50, 50, 50, 255), \n"
"                                      stop:1 rgba(80, 80, 80, 255));\n"
"}\n"
"\n"
"QComboBox:!editable:hover{\n"
"    background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1, \n"
"                                      stop:0 rgba(150, 150, 150, 255), \n"
"                                      stop:0.3 rgba(60, 60, 60, 255), \n"
"                                      stop:1 rgba(100, 100, 100, 255));\n"
"}\n"
"\n"
"QComboBox::drop-down {\n"
"    subcontrol-origin: padding;\n"
"    subcontrol-position: top right;\n"
"\n"
"    border-left-width: 1px;\n"
"    border-left-color: darkgray;\n"
"    border-left-style: solid; /* just a single line */\n"
"    border-top-right-radius: 3px; /* same radius as the QComboBox */\n"
"    border-bottom-right-radius: 3px;\n"
"}\n"
"\n"
"QComboBox:!editable:on, QComboBox::drop-down:editable:on{\n"
"    background: qlineargradient(x1: 0, y1: 0, x2: 0, y2: 1,\n"
"                                stop:0 rgba(20, 20, 20, 255), \n"
"                                stop:0.3 rgba(40, 40, 40, 255), \n"
"                                stop:1 rgba(50, 50, 50, 255));\n"
"}\n"
"\n"
"QComboBox QAbstractItemView {\n"
"    border: 1px solid grap;\n"
"    selection-background-color: purple;\n"
"}\n"
"\n"
"QPushButton{\n"
"    background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1, \n"
"                                      stop:0 rgba(150, 150, 150, 255),\n"
"                                      stop:0.48 rgba(80, 80, 80, 255), \n"
"                                      stop:0.52 rgba(50, 50, 50, 255), \n"
"                                      stop:1 rgba(70, 70, 70, 255));\n"
"    border-style: outset;\n"
"    border-width: 1px;\n"
"    border-radius: 6px;\n"
"    border-color: gray;\n"
"    padding: 6px;\n"
"}\n"
"\n"
"QPushButton:hover{\n"
"    background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1, \n"
"                                      stop:0 rgba(150, 150, 150, 255),\n"
"                                      stop:0.48 rgba(90, 90, 90, 255), \n"
"                                      stop:0.52 rgba(60, 60, 60, 255), \n"
"                                      stop:1 rgba(100, 100, 100, 255));\n"
"}\n"
"\n"
"QPushButton:pressed{\n"
"    background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1, \n"
"                                      stop:0 rgba(40, 40, 40, 255), \n"
"                                      stop:0.3 rgba(50, 50, 50, 255), \n"
"                                      stop:1 rgba(70, 70, 70, 255));\n"
"    border-style: inset;\n"
"}")
        self.centralwidget = QtGui.QWidget(PuTaoMain)
        self.centralwidget.setObjectName("centralwidget")
        self.verticalLayout = QtGui.QVBoxLayout(self.centralwidget)
        self.verticalLayout.setObjectName("verticalLayout")
        self.horizontalLayout = QtGui.QHBoxLayout()
        self.horizontalLayout.setObjectName("horizontalLayout")
        self.label = QtGui.QLabel(self.centralwidget)
        self.label.setMinimumSize(QtCore.QSize(333, 129))
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(20)
        font.setWeight(75)
        font.setBold(True)
        self.label.setFont(font)
        self.label.setStyleSheet("QLabel{\n"
"    background-color: white\n"
"}")
        self.label.setText("")
        self.label.setPixmap(QtGui.QPixmap(config.getPath(config.kIcon, "logoBig.png")))
        self.label.setAlignment(QtCore.Qt.AlignCenter)
        self.label.setObjectName("label")
        self.horizontalLayout.addWidget(self.label)
        self.verticalLayout.addLayout(self.horizontalLayout)
        self.PuTaoMainTE = QtGui.QTextEdit(self.centralwidget)
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        self.PuTaoMainTE.setFont(font)
        self.PuTaoMainTE.setLineWrapMode(QtGui.QTextEdit.NoWrap)
        self.PuTaoMainTE.setReadOnly(True)
        self.PuTaoMainTE.setObjectName("PuTaoMainTE")
        self.verticalLayout.addWidget(self.PuTaoMainTE)
        self.horizontalLayout_2 = QtGui.QHBoxLayout()
        self.horizontalLayout_2.setObjectName("horizontalLayout_2")
        self.PutaoMainBtnReload = QtGui.QPushButton(self.centralwidget)
        self.PutaoMainBtnReload.setMinimumSize(QtCore.QSize(0, 50))
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        self.PutaoMainBtnReload.setFont(font)
        self.PutaoMainBtnReload.setObjectName("PutaoMainBtnReload")
        self.horizontalLayout_2.addWidget(self.PutaoMainBtnReload)
        self.verticalLayout.addLayout(self.horizontalLayout_2)
        PuTaoMain.setCentralWidget(self.centralwidget)
        self.menuBar = QtGui.QMenuBar(PuTaoMain)
        self.menuBar.setGeometry(QtCore.QRect(0, 0, 428, 25))
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        self.menuBar.setFont(font)
        self.menuBar.setObjectName("menuBar")
        self.mainMenu = QtGui.QMenu(self.menuBar)
        self.mainMenu.setObjectName("mainMenu")
        self.menu = QtGui.QMenu(self.mainMenu)
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        self.menu.setFont(font)
        self.menu.setObjectName("menu")
        PuTaoMain.setMenuBar(self.menuBar)
        self.actionDebug = QtGui.QAction(PuTaoMain)
        icon1 = QtGui.QIcon()
        icon1.addPixmap(QtGui.QPixmap("../icons/debug.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.actionDebug.setIcon(icon1)
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        self.actionDebug.setFont(font)
        self.actionDebug.setObjectName("actionDebug")
        self.actionPYTHONPATH = QtGui.QAction(PuTaoMain)
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        self.actionPYTHONPATH.setFont(font)
        self.actionPYTHONPATH.setObjectName("actionPYTHONPATH")
        self.actionMAYA_SCRIPT_PATH = QtGui.QAction(PuTaoMain)
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        self.actionMAYA_SCRIPT_PATH.setFont(font)
        self.actionMAYA_SCRIPT_PATH.setObjectName("actionMAYA_SCRIPT_PATH")
        self.actionMAYA_MODULE_PATH = QtGui.QAction(PuTaoMain)
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        self.actionMAYA_MODULE_PATH.setFont(font)
        self.actionMAYA_MODULE_PATH.setObjectName("actionMAYA_MODULE_PATH")
        self.actionMAYA_APP_DIR = QtGui.QAction(PuTaoMain)
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        self.actionMAYA_APP_DIR.setFont(font)
        self.actionMAYA_APP_DIR.setObjectName("actionMAYA_APP_DIR")
        self.actionMAYA_LOCATION = QtGui.QAction(PuTaoMain)
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        self.actionMAYA_LOCATION.setFont(font)
        self.actionMAYA_LOCATION.setObjectName("actionMAYA_LOCATION")
        self.actionMAYA_PLUG_IN_PATH = QtGui.QAction(PuTaoMain)
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        self.actionMAYA_PLUG_IN_PATH.setFont(font)
        self.actionMAYA_PLUG_IN_PATH.setObjectName("actionMAYA_PLUG_IN_PATH")
        self.actionXBMLANGPATH = QtGui.QAction(PuTaoMain)
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        self.actionXBMLANGPATH.setFont(font)
        self.actionXBMLANGPATH.setObjectName("actionXBMLANGPATH")
        self.actionBARBARIAN_LOCATION = QtGui.QAction(PuTaoMain)
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        self.actionBARBARIAN_LOCATION.setFont(font)
        self.actionBARBARIAN_LOCATION.setObjectName("actionBARBARIAN_LOCATION")
        self.actionCompile = QtGui.QAction(PuTaoMain)
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        self.actionCompile.setFont(font)
        self.actionCompile.setObjectName("actionCompile")
        self.menu.addAction(self.actionBARBARIAN_LOCATION)
        self.menu.addAction(self.actionMAYA_APP_DIR)
        self.menu.addAction(self.actionMAYA_LOCATION)
        self.menu.addAction(self.actionMAYA_MODULE_PATH)
        self.menu.addAction(self.actionMAYA_PLUG_IN_PATH)
        self.menu.addAction(self.actionMAYA_SCRIPT_PATH)
        self.menu.addAction(self.actionPYTHONPATH)
        self.menu.addAction(self.actionXBMLANGPATH)
        self.mainMenu.addAction(self.actionDebug)
        self.mainMenu.addSeparator()
        self.mainMenu.addAction(self.actionCompile)
        self.mainMenu.addSeparator()
        self.mainMenu.addAction(self.menu.menuAction())
        self.menuBar.addAction(self.mainMenu.menuAction())

        self.retranslateUi(PuTaoMain)
        
        QtCore.QMetaObject.connectSlotsByName(PuTaoMain)

    def retranslateUi(self, PuTaoMain):
        PuTaoMain.setWindowTitle(QtGui.QApplication.translate("PuTaoMain", "欢迎使用", None, QtGui.QApplication.UnicodeUTF8))
        self.PuTaoMainTE.setHtml(QtGui.QApplication.translate("PuTaoMain", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n"
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n"
"p, li { white-space: pre-wrap; }\n"
"</style></head><body style=\" font-family:\'微软雅黑\'; font-size:10pt; font-weight:400; font-style:normal;\">\n"
"<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:\'SimSun\'; font-size:9pt;\">欢迎使用葡萄工具架！使用过程中有任何意见或建议请联系大圣或胡元亮。</span></p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.PutaoMainBtnReload.setStatusTip(QtGui.QApplication.translate("PuTaoMain", "免重启一键更新", None, QtGui.QApplication.UnicodeUTF8))
        self.PutaoMainBtnReload.setText(QtGui.QApplication.translate("PuTaoMain", "重载/更新", None, QtGui.QApplication.UnicodeUTF8))
        self.mainMenu.setTitle(QtGui.QApplication.translate("PuTaoMain", "开发者选项", None, QtGui.QApplication.UnicodeUTF8))
        self.menu.setTitle(QtGui.QApplication.translate("PuTaoMain", "环境变量", None, QtGui.QApplication.UnicodeUTF8))
        self.actionDebug.setText(QtGui.QApplication.translate("PuTaoMain", "连接调试服务器", None, QtGui.QApplication.UnicodeUTF8))
        self.actionPYTHONPATH.setText(QtGui.QApplication.translate("PuTaoMain", "PYTHONPATH", None, QtGui.QApplication.UnicodeUTF8))
        self.actionMAYA_SCRIPT_PATH.setText(QtGui.QApplication.translate("PuTaoMain", "MAYA_SCRIPT_PATH", None, QtGui.QApplication.UnicodeUTF8))
        self.actionMAYA_MODULE_PATH.setText(QtGui.QApplication.translate("PuTaoMain", "MAYA_MODULE_PATH", None, QtGui.QApplication.UnicodeUTF8))
        self.actionMAYA_APP_DIR.setText(QtGui.QApplication.translate("PuTaoMain", "MAYA_APP_DIR", None, QtGui.QApplication.UnicodeUTF8))
        self.actionMAYA_LOCATION.setText(QtGui.QApplication.translate("PuTaoMain", "MAYA_LOCATION", None, QtGui.QApplication.UnicodeUTF8))
        self.actionMAYA_PLUG_IN_PATH.setText(QtGui.QApplication.translate("PuTaoMain", "MAYA_PLUG_IN_PATH", None, QtGui.QApplication.UnicodeUTF8))
        self.actionXBMLANGPATH.setText(QtGui.QApplication.translate("PuTaoMain", "XBMLANGPATH", None, QtGui.QApplication.UnicodeUTF8))
        self.actionBARBARIAN_LOCATION.setText(QtGui.QApplication.translate("PuTaoMain", "BARBARIAN_LOCATION", None, QtGui.QApplication.UnicodeUTF8))
        self.actionCompile.setText(QtGui.QApplication.translate("PuTaoMain", "编译UI文件...", None, QtGui.QApplication.UnicodeUTF8))

