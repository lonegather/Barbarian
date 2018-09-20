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
from Qt import QtCore, QtGui, QtWidgets
try: 
    from shiboken import wrapInstance
except ImportError:
    from shiboken2 import wrapInstance
from barbarian.utils import config
from string import replace


class QtUI(object):
    '''
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
        '''
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
        '''
        --------------------------------------------------------------------------------
        本方法用于.ui文件加载完毕后界面的初始化操作，在派生类中重写此方法
        Implement this method in derived class for UI setup when the .ui file was loaded.
        --------------------------------------------------------------------------------
        '''
        pass
    
    def addSceneCallback(self, message, handler):
        '''
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
        '''
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
        '''
        --------------------------------------------------------------------------------
        本属性用于判断当前实例是否处于废弃状态（等待被系统回收），亦即当前窗口是否已被关闭或重载
        Check if this instance is obsolete (closed or reloaded) and waiting for GC.
        --------------------------------------------------------------------------------
        '''
        if not isinstance(self, QtUI): return True
        if not cmds.window(self.window, exists=True): return True
        return not cmds.window(self.window, q=True, visible=True)


class QMayaWindow(QtWidgets.QMainWindow):
    
    __mayaMainWindow = wrapInstance(long(omui.MQtUtil.mainWindow()), QtWidgets.QWidget)
    closed = QtCore.Signal()
    
    def __init__(self):
        super(QMayaWindow, self).__init__(self.__mayaMainWindow)
        
        self.setWindowFlags(QtCore.Qt.Window)
        self.setAttribute(QtCore.Qt.WA_DeleteOnClose, True)
        
        with open(config.getPath(config.kIcon, "css/global.css")) as f:
            css = f.read()
            css = css.replace("{icon_dir}", config.getPath(config.kIcon, "css/"))
        
        self.setStyleSheet(css)
        
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


class OptionMenu(QtWidgets.QComboBox):
    
    def __init__(self, parent=None):
        super(OptionMenu, self).__init__(parent)
        
        self.setModel(config.ProjectModel())
        self.refresh()
        
    def setObjectName(self, name):
        super(OptionMenu, self).setObjectName(name)
        self.activated.connect(lambda *_: config.setProject(self.currentText()))
        # QtCore.QObject.connect(self, QtCore.SIGNAL("activated(int)"), lambda *_: config.setProject(self.currentText()))
        cmds.scriptJob(conditionChange=["ProjectChanged", self.refresh], parent=self.objectName())
        
    def refresh(self, *_):
        if config.getProject():
            self.setCurrentText(config.getProject())
        elif config.getProject(all=True):
            self.setCurrentIndex(-1)
            return
        else: return
    
    def setCurrentText(self, txt):
        for i in range(self.count()):
            if self.itemText(i) == txt:
                self.setCurrentIndex(i)
                break


class ShelfButton(QtWidgets.QPushButton):
    
    selected = QtCore.Signal(object)
    
    def __init__(self, parent):
        super(ShelfButton, self).__init__(parent)
        
        self.data = None
        
        self.setCheckable(True)
        self.setAutoExclusive(True)
        self.labelLayout = QtWidgets.QVBoxLayout(self)
        self.labelLayout.setContentsMargins(10, 10, 10, 10)
        
        self.thumb = QtWidgets.QLabel(self)
        self.thumb.setAlignment(QtCore.Qt.AlignHCenter|QtCore.Qt.AlignVCenter)
        self.thumb.setSizePolicy(QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Expanding))
        self.labelLayout.addWidget(self.thumb)
        
        self.label = QtWidgets.QLabel(self)
        self.label.setAlignment(QtCore.Qt.AlignHCenter)
        self.labelLayout.addWidget(self.label)
        
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        font.setPointSize(10)
        self.label.setFont(font)
        
        self.setStyleSheet("ShelfButton {                                                             \n"
                           "    background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1, \n"
                           "                                      stop:0.00 rgba(200, 200, 200, 255), \n"
                           "                                      stop:0.03 rgba(100, 100, 100, 255), \n"
                           "                                      stop:0.97 rgba(060, 060, 060, 255), \n"
                           "                                      stop:1.00 rgba(020, 020, 020, 255));\n"
                           "    border-style: outset;                                                 \n"
                           "    border-width: 1px;                                                    \n"
                           "    border-radius: 2px;                                                   \n"
                           "    border-color: black;                                                  \n"
                           "    padding: 6px;                                                         \n"
                           "}                                                                         \n"
                           "                                                                          \n"
                           "ShelfButton::indicator {                                                  \n"
                           "    width: 0px;                                                           \n"
                           "    height: 0px;                                                          \n"
                           "}                                                                         \n"
                           "ShelfButton:hover:!checked {                                              \n"
                           "    background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1, \n"
                           "                                      stop:0.00 rgba(200, 200, 200, 255), \n"
                           "                                      stop:0.03 rgba(150, 060, 200, 255), \n"
                           "                                      stop:0.97 rgba(130, 000, 180, 255), \n"
                           "                                      stop:1.00 rgba(050, 050, 050, 255));\n"
                           "}                                                                         \n"
                           "                                                                          \n"
                           "ShelfButton:checked {                                                     \n"
                           "    background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1, \n"
                           "                                      stop:0.00 rgba(050, 030, 100, 255), \n"
                           "                                      stop:0.10 rgba(090, 040, 140, 255), \n"
                           "                                      stop:1.00 rgba(100, 050, 150, 255));\n"
                           "                                      border-style: inset;                \n"
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


class ShelfLayout(QtWidgets.QLayout):
    def __init__(self, parent):
        super(ShelfLayout, self).__init__(parent)
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
        super(ShelfLayout, self).setGeometry(rect)
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


class QShelfView(QtWidgets.QWidget):
    
    kName = "name"
    kData = "data"
    kIcon = "icon"
    kType = "type"
    
    itemSelected = QtCore.Signal(object)
    finished = QtCore.Signal()
    
    def __init__(self, parent=None):
        super(QShelfView, self).__init__(parent)
        self.setObjectName("shelfView")
        
        self.mainLayout = QtWidgets.QStackedLayout(self)
        self.mainLayout.setSpacing(0)
        self.mainLayout.setContentsMargins(0, 0, 0, 0)
        self.mainLayout.setObjectName("shelfViewMainLayout")
        
        self.progressBar = QtWidgets.QProgressBar(self)
        self.progressBar.setMaximumHeight(50)
        self.mainLayout.addWidget(self.progressBar)
        
        self.scrollArea = QtWidgets.QScrollArea(self)
        self.scrollArea.setWidgetResizable(True)
        self.scrollArea.setObjectName("shelfViewScrollArea")
        self.scrollAreaWidgetContents = QtWidgets.QWidget()
        self.scrollAreaWidgetContents.setObjectName("shelfViewScrollAreaWidgetContents")
        self.scrollArea.setWidget(self.scrollAreaWidgetContents)
        self.mainLayout.addWidget(self.scrollArea)
        
        self.shelfLayout = ShelfLayout(self.scrollAreaWidgetContents)
        self.shelfLayout.setObjectName("shelfViewShelfLayout")
        self.scrollAreaWidgetContents.setLayout(self.shelfLayout)
        self.shelfLayout.setSpacing(5)
        
        self.buttons = []
        self.filter = ""
        self.data = None
        
    def setup(self, *itemInfo):
        self.cleanUp()
        
        self.progressBar.setValue(0)
        self.progressBar.setMinimum(0)
        self.progressBar.setMaximum(len(itemInfo)-1)
        self.mainLayout.setCurrentWidget(self.progressBar)
        
        self.picLoadThread = PictureLoadThread(*itemInfo)
        self.picLoadThread.stepped.connect(self.__onPicLoaded__)
        self.picLoadThread.finished.connect(self.__onLoadFinished__)
        self.picLoadThread.start()
        
    def __onPicLoaded__(self, item):
        btn = ShelfButton(self.scrollAreaWidgetContents)
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Expanding)
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
        self.mainLayout.setCurrentWidget(self.scrollArea)
        self.finished.emit()
        self.itemFilter(*self.filter)
    
    @QtCore.Slot(object)
    def emitItem(self, obj):
        self.data = obj
        self.itemSelected.emit(obj)
    
    def itemFilter(self, *tags):
        self.filter = tags
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
        
        
        

