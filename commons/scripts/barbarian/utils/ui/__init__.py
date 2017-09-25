#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.7.5

@author: Serious Sam
'''

import abc, math
import maya.OpenMaya as om
import maya.OpenMayaUI as omui
from maya import cmds
from PySide import QtCore, QtGui
from shiboken import wrapInstance
from barbarian.utils import config


class QtUI(object):
    u'''
    --------------------------------------------------------------------------------
    本抽象类用于管理所有从.ui文件加载的窗口
    Abstract class for managing windows which loaded from .ui file.
    注意：本抽象类不能直接实例化，请使用派生类
    NOTE: DO NOT instantiate this class, use derived class instead.
    --------------------------------------------------------------------------------
    '''
    __metaclass__ = abc.ABCMeta
    __UI = {}
    __messages = {}
    
    @classmethod
    def showUIList(cls):
        from pprint import pprint
        print "-"*20
        pprint(cls.__UI)
        print "-"*20
    
    @classmethod
    def UI(cls):
        u'''
        --------------------------------------------------------------------------------
        获取当前派生类的唯一实例，即当前激活的窗口
        Retrieve the instance of the derived class, which is the currently active window.
        --------------------------------------------------------------------------------
        '''
        if cls in cls.__UI:
            if not cls.__UI[cls].isObsolete:
                return cls.__UI[cls]
        return None
    
    @classmethod
    def cleanUp(cls):
        for ui in cls.__UI: 
            if cls.__UI[ui]: 
                try: cls.__UI[ui].close()
                except: pass
    
    def __init__(self, uiFile=None, **info):
        try: cmds.deleteUI(self.__UI[self.__class__].window)
        except: pass
        
        try: self.__UI[self.__class__].window.close()
        except: pass
        
        if self.__class__ in self.__messages:
            for msg in self.__messages[self.__class__]:
                try: om.MMessage.removeCallback(msg)
                except: pass
            self.__messages.update({self.__class__:[]})
            
        self.__UI.update({self.__class__:self})
        
        if uiFile:
            self.window = cmds.loadUI(f=config.getPath(config.kUI, "%s.ui"%uiFile))
            width = cmds.window(self.window, q=True, width=True)
            height = cmds.window(self.window, q=True, height=True)
            left = (1920 - width) / 2
            top = (1080 - height) / 2
            cmds.windowPref(self.window, topLeftCorner=[top, left], width=width, height=height)
            
            detector = {"button"         : cmds.button,
                        "checkBox"       : cmds.checkBox,
                        "intSlider"      : cmds.intSlider,
                        "optionMenu"     : cmds.optionMenu,
                        "progressBar"    : cmds.progressBar,
                        "radioButton"    : cmds.radioButton,
                        "text"           : cmds.text,
                        "textField"      : cmds.textField,
                        "textScrollList" : cmds.textScrollList}
            
            for item in info:
                found = False
                for target in detector:
                    if detector[target](info[item], exists=True):
                        found = True
                        pathList = detector[target](info[item], q=True, fpn=True).split('|')
                        self.__setattr__(item, "%s|%s"%(self.window, '|'.join(pathList[1:])))
                        break
                
                if not found:
                    if cmds.layout(info[item], exists=True):
                        parentList = cmds.layout(info[item], q=True, parent=True).split('|')
                        self.__setattr__(item, "%s|%s|%s"%(self.window, '|'.join(parentList[1:]), info[item]))
                        children = cmds.layout(self.__getattribute__(item), q=True, fpn=True, ca=True)
                        for child in children:
                            cmds.deleteUI(child)
                    else:
                        try: 
                            widget = '|'.join(cmds.control(info[item], q=True, fpn=True).split("|")[1:])
                            self.__setattr__(item, "%s|%s"%(self.window, widget))
                        except: cmds.confirmDialog(message=u'未找到控件：'+info[item], icon='warning', title=u'PuTao')
                        
            self.uiMessage = omui.MUiMessage.addUiDeletedCallback(self.window, self.close)
            cmds.showWindow(self.window)
            self.setupUi()
        
        else:
            self.uiMessage = None
            self.window = QMayaWindow()
            self.window.closed.connect(lambda *_: self.__UI.update({self.__class__:None}))
            self.setupUi(self.window)
        
    @abc.abstractmethod
    def setupUi(self, win=None):
        u'''
        --------------------------------------------------------------------------------
        本方法用于.ui文件加载完毕后界面的初始化操作，在派生类中重写此方法
        Implement this method in derived class for UI setup when the .ui file was loaded.
        --------------------------------------------------------------------------------
        '''
        pass
    
    def addSceneCallback(self, message, handler):
        u'''
        --------------------------------------------------------------------------------
        本方法用于管理 Maya API 中场景事件的回调函数，请使用此方法加载场景相关的回调函数
        Hold callback message IDs, which will be removed when the window is closed.
        --------------------------------------------------------------------------------
        '''
        msg = om.MSceneMessage.addCallback(message, lambda *_: self.isObsolete or handler())
        
        if not self.uiMessage:
            self.window.messages.append(msg)
        else:
            if not self.__class__ in self.__messages:
                self.__messages.update({self.__class__:[]})
            self.__messages[self.__class__].append(msg)
        
    def close(self, *_):
        u'''
        --------------------------------------------------------------------------------
        关闭当前窗口
        Close the window.
        --------------------------------------------------------------------------------
        '''
        print self.window, "closed"
        self.__UI.update({self.__class__:None})
        
        if self.uiMessage: 
            om.MMessage.removeCallback(self.uiMessage)
        else: 
            try: self.window.close()
            except: pass
        
        if self.__class__ in self.__messages:
            for msg in self.__messages[self.__class__]:
                try: om.MMessage.removeCallback(msg)
                except: pass
            self.__messages.update({self.__class__:[]})
        
        try: cmds.deleteUI(self.window)
        except: pass
    
    @property
    def isObsolete(self):
        u'''
        --------------------------------------------------------------------------------
        本属性用于判断当前实例是否处于废弃状态（等待被系统回收），亦即当前窗口是否已被关闭或重载
        Check if this instance is obsolete (closed or reloaded) and waiting for GC.
        --------------------------------------------------------------------------------
        '''
        if not isinstance(self, QtUI): return True
        if not cmds.window(self.window, exists=True): return True
        return not cmds.window(self.window, q=True, visible=True)


class QMayaWindow(QtGui.QMainWindow):
    
    __mayaMainWindow = wrapInstance(long(omui.MQtUtil.mainWindow()), QtGui.QWidget)
    closed = QtCore.Signal()
    
    def __init__(self):
        super(QMayaWindow, self).__init__(self.__mayaMainWindow)
        
        self.setWindowFlags(QtCore.Qt.Window)
        self.setAttribute(QtCore.Qt.WA_DeleteOnClose, True)
        
        self.setStyleSheet("QMayaWindow {                                                             \n"
                           "    background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1, \n"
                           "                                      stop:0 rgba(50, 50, 50, 255),       \n"
                           "                                      stop:0.05 rgba(60, 60, 60, 255),    \n"
                           "                                      stop:0.9 rgba(60, 60, 60, 255),     \n"
                           "                                      stop:1 rgba(50, 50, 50, 255));      \n"
                           "}                                                                         \n"
                           "                                                                          \n"
                           "QPushButton {                                                             \n"
                           "    background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1, \n"
                           "                                      stop:0 rgba(150, 150, 150, 255),    \n"
                           "                                      stop:0.48 rgba(80, 80, 80, 255),    \n"
                           "                                      stop:0.52 rgba(50, 50, 50, 255),    \n"
                           "                                      stop:1 rgba(70, 70, 70, 255));      \n"
                           "    border-style: outset;                                                 \n"
                           "    border-width: 1px;                                                    \n"
                           "    border-radius: 6px;                                                   \n"
                           "    border-color: gray;                                                   \n"
                           "    padding: 6px;                                                         \n"
                           "}                                                                         \n"
                           "                                                                          \n"
                           "QPushButton:hover {                                                       \n"
                           "    background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1, \n"
                           "                                      stop:0 rgba(150, 150, 150, 255),    \n"
                           "                                      stop:0.48 rgba(90, 90, 90, 255),    \n"
                           "                                      stop:0.52 rgba(60, 60, 60, 255),    \n"
                           "                                      stop:1 rgba(100, 100, 100, 255));   \n"
                           "}                                                                         \n"
                           "                                                                          \n"
                           "QPushButton:pressed {                                                     \n"
                           "    background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1, \n"
                           "                                      stop:0 rgba(40, 40, 40, 255),       \n"
                           "                                      stop:0.3 rgba(50, 50, 50, 255),     \n"
                           "                                      stop:1 rgba(70, 70, 70, 255));      \n"
                           "    border-style: inset;                                                  \n"
                           "}                                                                         \n"
                           "                                                                          \n"
                           "QTabWidget::pane {                                                        \n"
                           "    border-top: 1px solid gray;                                           \n"
                           "    position: absolute;                                                   \n"
                           "    top: -0.1em;                                                          \n"
                           "}                                                                         \n"
                           "                                                                          \n"
                           "QTabWidget::tab-bar {                                                     \n"
                           "    alignment: center;                                                    \n"
                           "}                                                                         \n"
                           "                                                                          \n"
                           "QTabBar::tab {                                                            \n"
                           "    background: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1,       \n"
                           "                                stop:0 rgba(140, 140, 140, 255),          \n"
                           "                                stop:0.3 rgba(50, 50, 50, 255),           \n"
                           "                                stop:1 rgba(80, 80, 80, 255));            \n"
                           "    border: 1px solid gray;                                               \n"
                           "    border-bottom-color: grey;                                            \n"
                           "    border-top-left-radius: 6px;                                          \n"
                           "    border-top-right-radius: 6px;                                         \n"
                           "    padding: 0px 15px;                                                    \n"
                           "}                                                                         \n"
                           "                                                                          \n"
                           "QTabBar::tab:selected, QTabBar::tab:hover {                               \n"
                           "    background: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1,       \n"
                           "                                stop:0 rgba(140, 140, 140, 255),          \n"
                           "                                stop:0.3 rgba(60, 60, 60, 255),           \n"
                           "                                stop:1 rgba(100, 100, 100, 255));         \n"
                           "}                                                                         \n"
                           "                                                                          \n"
                           "QTabBar::tab:!selected {                                                  \n"
                           "    margin-top: 2px;                                                      \n"
                           "}                                                                         \n"
                           "                                                                          \n"
                           "QSlider::groove:horizontal {                                              \n"
                           "    border: 1px solid gray;                                               \n"
                           "    border-style: inset;                                                  \n"
                           "    border-radius: 6px;                                                   \n"
                           "    height: 28px;                                                         \n"
                           "    background: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1,       \n"
                           "                                stop:0 rgba(20, 20, 20, 255),             \n"
                           "                                stop:0.3 rgba(40, 40, 40, 255),           \n"
                           "                                stop:1 rgba(50, 50, 50, 255));            \n"
                           "}                                                                         \n"
                           "                                                                          \n"
                           "QSlider::handle:horizontal {                                              \n"
                           "    background: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1,       \n"
                           "                                stop:0 rgba(140, 140, 140, 255),          \n"
                           "                                stop:0.2 rgba(60, 60, 60, 255),           \n"
                           "                                stop:0.8 rgba(60, 60, 60, 255),           \n"
                           "                                stop:1 rgba(100, 100, 100, 255));         \n"
                           "    border: 1px solid gray;                                               \n"
                           "    border-style: outset;                                                 \n"
                           "    width: 26px;                                                          \n"
                           "    margin: 2px 2px;                                                      \n"
                           "    border-radius: 4px;                                                   \n"
                           "}                                                                         \n"
                           "                                                                          \n"
                           "QSlider::handle:horizontal:hover {                                        \n"
                           "    background: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1,       \n"
                           "                                stop:0 rgba(140, 140, 140, 255),          \n"
                           "                                stop:0.2 rgba(80, 80, 80, 255),           \n"
                           "                                stop:0.8 rgba(80, 80, 80, 255),           \n"
                           "                                stop:1 rgba(120, 120, 120, 255));         \n"
                           "}                                                                         \n"
                           "                                                                          \n"
                           "QListWidget {                                                             \n"
                           "    border: 1px solid gray;                                               \n"
                           "    border-radius: 6px;                                                   \n"
                           "    border-style: inset;                                                  \n"
                           "    background: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1,       \n"
                           "                                stop:0 rgba(20, 20, 20, 255),             \n"
                           "                                stop:0.3 rgba(40, 40, 40, 255),           \n"
                           "                                stop:1 rgba(50, 50, 50, 255));            \n"
                           "    selection-background-color: purple;                                   \n"
                           "}                                                                         \n"
                           "                                                                          \n"
                           "QLineEdit {                                                               \n"
                           "    border: 1px solid gray;                                               \n"
                           "    border-radius: 6px;                                                   \n"
                           "    border-style: inset;                                                  \n"
                           "    background: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1,       \n"
                           "                                stop:0 rgba(20, 20, 20, 255),             \n"
                           "                                stop:0.3 rgba(40, 40, 40, 255),           \n"
                           "                                stop:1 rgba(50, 50, 50, 255));            \n"
                           "    selection-background-color: purple;                                   \n"
                           "}                                                                         \n"
                           "                                                                          \n"
                           "QComboBox {                                                               \n"
                           "    border: 1px solid gray;                                               \n"
                           "    border-style: outset;                                                 \n"
                           "    border-radius: 6px;                                                   \n"
                           "    background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1, \n"
                           "                                      stop:0 rgba(140, 140, 140, 255),    \n"
                           "                                      stop:0.3 rgba(50, 50, 50, 255),     \n"
                           "                                      stop:1 rgba(80, 80, 80, 255));      \n"
                           "}                                                                         \n"
                           "                                                                          \n"
                           "QComboBox:!editable:hover {                                               \n"
                           "    background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1, \n"
                           "                                      stop:0 rgba(150, 150, 150, 255),    \n"
                           "                                      stop:0.3 rgba(60, 60, 60, 255),     \n"
                           "                                      stop:1 rgba(100, 100, 100, 255));   \n"
                           "}                                                                         \n"
                           "                                                                          \n"
                           "QComboBox::drop-down {                                                    \n"
                           "    subcontrol-origin: padding;                                           \n"
                           "    subcontrol-position: top right;                                       \n"
                           "                                                                          \n"
                           "    border-left-width: 1px;                                               \n"
                           "    border-left-color: darkgray;                                          \n"
                           "    border-left-style: solid;                                             \n"
                           "    border-top-right-radius: 3px;                                         \n"
                           "    border-bottom-right-radius: 3px;                                      \n"
                           "}                                                                         \n"
                           "                                                                          \n"
                           "QComboBox:!editable:on, QComboBox::drop-down:editable:on {                \n"
                           "    background: qlineargradient(x1: 0, y1: 0, x2: 0, y2: 1,               \n"
                           "                                stop:0 rgba(20, 20, 20, 255),             \n"
                           "                                stop:0.3 rgba(40, 40, 40, 255),           \n"
                           "                                stop:1 rgba(50, 50, 50, 255));            \n"
                           "}                                                                         \n"
                           "                                                                          \n"
                           "QComboBox QAbstractItemView {                                             \n"
                           "    border: 1px solid grap;                                               \n"
                           "    selection-background-color: purple;                                   \n"
                           "}                                                                         \n")
        
        self.messages = []
        self.show()
        
    def __str__(self):
        return self.objectName()
        
    def closeEvent(self, event):
        for msg in self.messages:
            try: om.MMessage.removeCallback(msg)
            except: continue
        self.setParent(None)
        self.closed.emit()
        event.accept()


class QShelfButton(QtGui.QPushButton):
    
    selected = QtCore.Signal(object)
    
    def __init__(self, parent):
        super(QShelfButton, self).__init__(parent)
        
        self.data = None
        
        self.setCheckable(True)
        self.setAutoExclusive(True)
        self.labelLayout = QtGui.QVBoxLayout(self)
        self.labelLayout.setContentsMargins(10, 10, 10, 10)
        
        self.thumb = QtGui.QLabel(self)
        self.thumb.setAlignment(QtCore.Qt.AlignHCenter|QtCore.Qt.AlignVCenter)
        self.thumb.setSizePolicy(QtGui.QSizePolicy(QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Expanding))
        self.labelLayout.addWidget(self.thumb)
        
        self.label = QtGui.QLabel(self)
        self.label.setAlignment(QtCore.Qt.AlignHCenter)
        self.labelLayout.addWidget(self.label)
        
        self.setStyleSheet("QShelfButton {                                                            \n"
                           "    background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1, \n"
                           "                                      stop:0 rgba(120, 120, 120, 255),    \n"
                           "                                      stop:0.1 rgba(50, 50, 50, 255),     \n"
                           "                                      stop:0.8 rgba(60, 60, 60, 255),     \n"
                           "                                      stop:1 rgba(50, 50, 50, 255));      \n"
                           "    border-style: outset;                                                 \n"
                           "    border-width: 1px;                                                    \n"
                           "    border-radius: 6px;                                                   \n"
                           "    border-color: gray;                                                   \n"
                           "    padding: 6px;                                                         \n"
                           "}                                                                         \n"
                           "                                                                          \n"
                           "QShelfButton::indicator {                                                 \n"
                           "    width: 0px;                                                           \n"
                           "    height: 0px;                                                          \n"
                           "}                                                                         \n"
                           "QShelfButton:hover {                                                      \n"
                           "    background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1, \n"
                           "                                      stop:0 rgba(120, 120, 120, 255),    \n"
                           "                                      stop:0.1 rgba(60, 60, 60, 255),     \n"
                           "                                      stop:0.8 rgba(70, 70, 70, 255),     \n"
                           "                                      stop:1 rgba(60, 60, 60, 255));      \n"
                           "}                                                                         \n"
                           "                                                                          \n"
                           "QShelfButton:checked {                                                    \n"
                           "    background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1, \n"
                           "                                      stop:0 rgba(50, 0, 50, 255),        \n"
                           "                                      stop:0.1 rgba(150, 80, 150, 255),   \n"
                           "                                      stop:0.5 rgba(100, 20, 100, 255),   \n"
                           "                                      stop:0.8 rgba(80, 10, 80, 255),     \n"
                           "                                      stop:1 rgba(100, 20, 100, 255));    \n"
                           "    border-style: inset;                                                  \n"
                           "}                                                                         \n")
        
        self.clicked.connect(self.emitEvent)
        self.toggled.connect(self.__setGIF__)
        
    def __setGIF__(self, checked):
        try:
            if checked: self.movie.start()
            else: self.movie.stop()
        except: pass
        
    def __del__(self):
        try: self.label.deleteLater()
        except: pass
        try: self.thumb.deleteLater()
        except: pass
        try: self.movie.deleteLater()
        except: pass
        
    def setIcon(self, icon):
        print icon
        try:
            self.movie = QtGui.QMovie(icon)
            self.thumb.setMovie(self.movie)
            self.movie.start()
            self.movie.stop()
        except:
            self.thumb.setPixmap(QtGui.QPixmap(icon))

    def setText(self, txt):
        self.label.setText(txt)
        
    def setData(self, data):
        self.data = data
        
    def setType(self, tp):
        self.type = tp
    
    @QtCore.Slot(object)
    def emitEvent(self):
        if self.data and self.isChecked(): 
            self.selected.emit(self.data)


class QShelfLayout(QtGui.QLayout):
    def __init__(self, parent):
        super(QShelfLayout, self).__init__(parent)
        self.list = []
        self.cellWidth = 150
        self.cellHeight = 170
        self.columnCount = 1
        
    def __del__(self):
        item = self.takeAt(0)
        while item: 
            del item
            item = self.takeAt(0)
        
    def count(self):
        return len(self.list)

    def addItem(self, item):
        self.list.append(item)

    def itemAt(self, idx):
        if idx >= 0 and idx < len(self.list):
            return self.list[idx]
        return None
    
    def takeAt(self, idx):
        if idx >= 0 and idx < len(self.list):
            take = self.list[idx]
            del self.list[idx]
            return take
        return None

    def setGeometry(self, rect):
        super(QShelfLayout, self).setGeometry(rect)
        if not len(self.list): return
        
        self.columnCount = max(math.floor((rect.width() + self.spacing()) / (self.cellWidth + self.spacing())), 1)
        self.columnSpacing = (rect.width() - self.cellWidth * self.columnCount) / (self.columnCount - 1)
        
        for i in range(self.count()):
            item = self.itemAt(i)
            column = (i % self.columnCount) * (self.cellWidth + self.columnSpacing)
            row = math.floor(i / self.columnCount) * (self.cellHeight + self.spacing())
            item.setGeometry(QtCore.QRect(column, row, self.cellWidth, self.cellHeight))
    
    def sizeHint(self):
        return QtCore.QSize(self.cellWidth * 2 + self.spacing(), self.cellHeight)
    
    def minimumSize(self):
        row = math.floor((self.count() - 1) / self.columnCount) * (self.cellHeight + self.spacing())
        return QtCore.QSize(self.cellWidth * 2 + self.spacing(), row + self.cellHeight)


class QShelfView(QtGui.QWidget):
    
    kName = "name"
    kData = "data"
    kIcon = "icon"
    kType = "type"
    
    itemSelected = QtCore.Signal(object)
    finished = QtCore.Signal()
    
    def __init__(self, parent=None):
        super(QShelfView, self).__init__(parent)
        self.setObjectName("shelfView")
        
        self.mainLayout = QtGui.QStackedLayout(self)
        self.mainLayout.setSpacing(0)
        self.mainLayout.setContentsMargins(0, 0, 0, 0)
        self.mainLayout.setObjectName("shelfViewMainLayout")
        
        self.progressBar = QtGui.QProgressBar(self)
        self.mainLayout.addWidget(self.progressBar)
        
        self.scrollArea = QtGui.QScrollArea(self)
        self.scrollArea.setWidgetResizable(True)
        self.scrollArea.setObjectName("shelfViewScrollArea")
        self.scrollAreaWidgetContents = QtGui.QWidget()
        self.scrollAreaWidgetContents.setObjectName("shelfViewScrollAreaWidgetContents")
        self.scrollArea.setWidget(self.scrollAreaWidgetContents)
        self.mainLayout.addWidget(self.scrollArea)
        
        self.shelfLayout = QShelfLayout(self.scrollAreaWidgetContents)
        self.shelfLayout.setObjectName("shelfViewShelfLayout")
        self.scrollAreaWidgetContents.setLayout(self.shelfLayout)
        self.shelfLayout.setSpacing(5)
        
        self.buttons = []
        self.data = None
        
    def setup(self, *itemInfo):
        self.cleanUp()
        
        self.progressBar.setMinimum(0)
        self.progressBar.setMaximum(len(itemInfo)-1)
        
        self.picLoadThread = PictureLoadThread(*itemInfo)
        self.picLoadThread.stepped.connect(self.__onPicLoaded__)
        self.picLoadThread.finished.connect(self.__onLoadFinished__)
        self.picLoadThread.start()
        
    def __onPicLoaded__(self, item):
        btn = QShelfButton(self.scrollAreaWidgetContents)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Expanding)
        btn.setSizePolicy(sizePolicy)
        btn.setText(item[self.kName])
        btn.setData(item[self.kData])
        btn.setIcon(item[self.kIcon])
        btn.setType(item[self.kType])
        btn.selected.connect(self.emitItem)
        self.shelfLayout.addWidget(btn)
        self.buttons.append(btn)
        
        self.progressBar.setValue(self.progressBar.value()+1)
    
    def __onLoadFinished__(self):
        print "load finished."
        self.mainLayout.setCurrentWidget(self.scrollArea)
        self.finished.emit()
        self.shelfLayout.update()     
    
    @QtCore.Slot(object)
    def emitItem(self, obj):
        self.data = obj
        self.itemSelected.emit(obj)
    
    def itemFilter(self, *tags):
        if not tags:
            for btn in self.buttons:
                self.shelfLayout.addWidget(btn)
                btn.show()
            self.shelfLayout.update()
            return
        
        for btn in self.buttons:
            self.shelfLayout.removeWidget(btn)
            btn.hide()
            for tag in tags:
                if (not btn.type) or btn.type.count(tag):
                    self.shelfLayout.addWidget(btn)
                    btn.show()
                    break
        self.shelfLayout.update()
    
    def cleanUp(self):
        child = self.shelfLayout.takeAt(0)
        while child:
            del child
            child = self.shelfLayout.takeAt(0)
            
        for btn in self.buttons:
            btn.deleteLater()
        self.buttons = []
        
        self.shelfLayout.update()
            
    def currentItem(self):
        return self.data
    
    
class PictureLoadThread(QtCore.QThread):
    
    stepped = QtCore.Signal(object)
    
    def __init__(self, *itemInfo):
        super(PictureLoadThread, self).__init__()
        
        self.itemInfo = itemInfo
        
    def run(self):
        for item in self.itemInfo:
            itemName = item[QShelfView.kName]
            itemIcon = item[QShelfView.kIcon]
            itemData = item[QShelfView.kData]
            try: itemType = item[QShelfView.kType]
            except: itemType = None
            
            self.stepped.emit({QShelfView.kName:itemName, 
                               QShelfView.kIcon:itemIcon, 
                               QShelfView.kData:itemData,
                               QShelfView.kType:itemType})
        
        
        

