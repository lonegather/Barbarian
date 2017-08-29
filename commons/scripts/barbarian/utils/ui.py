#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.7.5

@author: Serious Sam
'''

import abc
import maya.OpenMaya as om
import maya.OpenMayaUI as omui
from maya import cmds
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
    
    def __init__(self, uiFile, **info):
        try: cmds.deleteUI(self.__UI[self.__class__].window)
        except: pass
        self.window = cmds.loadUI(f=config.getPath(config.kUI, "%s.ui"%uiFile))
        self.__UI.update({self.__class__:self})
        
        width = cmds.window(self.window, q=True, width=True)
        height = cmds.window(self.window, q=True, height=True)
        left = (1920 - width) / 2
        top = (1080 - height) / 2
        cmds.windowPref(self.window, topLeftCorner=[top, left], width=width, height=height)
        
        detector = {"button":cmds.button,
                    "checkBox":cmds.checkBox,
                    "intSlider":cmds.intSlider,
                    "optionMenu":cmds.optionMenu,
                    "progressBar":cmds.progressBar,
                    "radioButton":cmds.radioButton,
                    "text":cmds.text,
                    "textField":cmds.textField,
                    "textScrollList":cmds.textScrollList}
        for item in info:
            found = False
            for target in detector:
                if detector[target](info[item], exists=True):
                    found = True
                    pathList = detector[target](info[item], q=True, fpn=True).split("|")
                    self.__setattr__(item, "%s|%s"%(self.window, '|'.join(pathList[1:])))
                    print "Found %s: <%s|%s>"%(target, self.window, '|'.join(pathList[1:]))
                    break
            
            if not found:
                if cmds.layout(info[item], exists=True):
                    children = cmds.layout(info[item], q=True, fpn=True, ca=True)
                    for child in children:
                        cmds.deleteUI(child)
                    self.__setattr__(item, info[item])
                else:
                    try: 
                        widget = '|'.join(cmds.control(info[item], q=True, fpn=True).split("|")[1:])
                        self.__setattr__(item, "%s|%s"%(self.window, widget))
                    except: cmds.confirmDialog(message=u'未找到控件：'+info[item], icon='warning', title=u'PuTao')
        
        if self.__class__ in self.__messages:
            try: 
                for msg in self.__messages[self.__class__]:
                    om.MMessage.removeCallback(msg)
            except: pass
            self.__messages.update({self.__class__:[]})
            
        self.uiMessage = omui.MUiMessage.addUiDeletedCallback(self.window, self.close)
        
        cmds.showWindow(self.window)
        self.setup()
        
    @abc.abstractmethod
    def setup(self):
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
        om.MMessage.removeCallback(self.uiMessage)
        
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
    
    @property
    def isObsolete(self):
        u'''
        --------------------------------------------------------------------------------
        本属性用于判断当前实例是否处于废弃状态（等待被系统回收），亦即当前窗口是否已被关闭或重载
        Check if this instance is obsolete (closed or reloaded) and waiting for GC.
        --------------------------------------------------------------------------------
        '''
        if not cmds.window(self.window, exists=True): return True
        if not isinstance(self, QtUI): return True
        return not cmds.window(self.window, q=True, visible=True)


class Control(object):
    def __init__(self, name):
        if not cmds.control(name, exists=True):
            cmds.warning("Control '%s' not found."%name)
        self.__name = name
        
    def __str__(self):
        return self.__name
    
    @property
    def annotation(self):
        try: return cmds.control(self, q=True, annotation=True)
        except: return None
    
    @annotation.setter
    def annotation(self, ann):
        try: cmds.control(self, e=True, annotation=ann)
        except: return
    
    @property
    def ann(self):
        return self.annotation
    
    @ann.setter
    def ann(self, ann):
        self.annotation = ann
        
    @property
    def backgroundColor(self):
        try: return cmds.control(self, q=True, backgroundColor=True)
        except: return None
        
    @backgroundColor.setter
    def backgroundColor(self, bgc):
        try: cmds.control(self, e=True, backgroundColor=bgc)
        except: return
