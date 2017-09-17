﻿#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.7.5

@author: Serious Sam
'''

import abc, math
import maya.OpenMaya as om
import maya.OpenMayaUI as omui
from maya import cmds
from xml.dom import minidom
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
    __mayaMainWindow = wrapInstance(long(omui.MQtUtil.mainWindow()), QtGui.QWidget)
    
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
            if cls.__UI[ui]: cls.__UI[ui].close()
    
    def __init__(self, uiFile=None, **info):
        try: cmds.deleteUI(self.__UI[self.__class__].window)
        except: pass
        
        try: self.__UI[self.__class__].window.close()
        except: pass
        
        self.__UI.update({self.__class__:self})
        
        if self.__class__ in self.__messages:
            try: 
                for msg in self.__messages[self.__class__]:
                    om.MMessage.removeCallback(msg)
            except: pass
            self.__messages.update({self.__class__:[]})
        
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
                        print "Found %s: <%s|%s>"%(target, self.window, '|'.join(pathList[1:]))
                        break
                
                if not found:
                    if cmds.layout(info[item], exists=True):
                        parentList = cmds.layout(info[item], q=True, parent=True).split('|')
                        self.__setattr__(item, "%s|%s|%s"%(self.window, '|'.join(parentList[1:]), info[item]))
                        print "Found layout:", "<%s|%s|%s>"%(self.window, '|'.join(parentList[1:]), info[item])
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
            self.window = QtGui.QMainWindow()
            self.window.setParent(self.__mayaMainWindow)
            self.window.setWindowFlags(QtCore.Qt.Window)
            self.window.show()
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
        if self.__class__ in self.__messages:
            try: 
                for msg in self.__messages[self.__class__]:
                    om.MMessage.removeCallback(msg)
            except: pass
            self.__messages.update({self.__class__:[]})
        
        try: 
            self.__UI.update({self.__class__:None})
            cmds.deleteUI(self.window)
        except: pass
        
        if self.uiMessage: om.MMessage.removeCallback(self.uiMessage)
        else: self.window.close()
    
    @property
    def isObsolete(self):
        u'''
        --------------------------------------------------------------------------------
        本属性用于判断当前实例是否处于废弃状态（等待被系统回收），亦即当前窗口是否已被关闭或重载
        Check if this instance is obsolete (closed or reloaded) and waiting for GC.
        --------------------------------------------------------------------------------
        '''
        if not isinstance(self, QtUI): return True
        if not self.uiMessage: return False
        if not cmds.window(self.window, exists=True): return True
        return not cmds.window(self.window, q=True, visible=True)


class QShelfLayout(QtGui.QLayout):
    def __init__(self, parent):
        super(QShelfLayout, self).__init__(parent)
        self.list = []
        self.cellWidth = 150
        self.cellHeight = 100
        self.columnCount = 1
        
    def __del__(self):
        item = self.takeAt(0)
        while item: del item
        
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
    
    def cleanUp(self):
        self.__del__()


class QShelfView(QtGui.QWidget):
    
    kName = "name"
    kFile = "file"
    kPrev = "thumb"
    
    def __init__(self, parent=None):
        super(QShelfView, self).__init__(parent)
        self.setObjectName("shelfView")
        
        self.mainLayout = QtGui.QGridLayout(self)
        self.mainLayout.setSpacing(0)
        self.mainLayout.setContentsMargins(0, 0, 0, 0)
        self.mainLayout.setObjectName("shelfViewMainLayout")
        
        self.scrollArea = QtGui.QScrollArea(self)
        self.scrollArea.setWidgetResizable(True)
        self.scrollArea.setObjectName("shelfViewScrollArea")
        self.scrollAreaWidgetContents = QtGui.QWidget()
        self.scrollAreaWidgetContents.setObjectName("shelfViewScrollAreaWidgetContents")
        self.scrollArea.setWidget(self.scrollAreaWidgetContents)
        self.mainLayout.addWidget(self.scrollArea, 0, 0, 1, 1)
        
        self.shelfLayout = QShelfLayout(self.scrollAreaWidgetContents)
        self.shelfLayout.setObjectName("shelfViewShelfLayout")
        self.scrollAreaWidgetContents.setLayout(self.shelfLayout)
        self.shelfLayout.setSpacing(10)
        
    def setup(self, *itemInfo):
        self.shelfLayout.cleanUp()
        for item in itemInfo:
            btn = QtGui.QPushButton(self.scrollAreaWidgetContents)
            btn.setText(item[self.kName])
            sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Expanding)
            btn.setSizePolicy(sizePolicy)
            self.shelfLayout.addWidget(btn)
            
    def currentItem(self):
        return

