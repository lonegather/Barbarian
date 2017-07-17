#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.7.5

@author: Serious Sam
'''

import maya.OpenMaya as om

from maya import cmds
from barbarian.utils import getPath, kUI

class QtUI(object):
    u'''
    --------------------------------------------------------------------------------
    本抽象类用于管理所有从.ui文件加载的窗口
    Abstract class for managing windows which loaded from .ui file.
    注意：本抽象类不能直接实例化，请使用派生类
    NOTE: DO NOT instantiate this class, use derived class instead.
    --------------------------------------------------------------------------------
    '''
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
    
    def __init__(self, uiFile, **info):
        u'''
        --------------------------------------------------------------------------------
        本方法用于.ui文件加载完毕后界面的初始化操作，在派生类中重写此方法
        Implement this method in derived class for UI setup when the .ui file was loaded.
        --------------------------------------------------------------------------------
        '''
        if self.__class__ == QtUI:
            raise RuntimeError(u"%s 是抽象类，不能被实例化"%QtUI)
            
        try: cmds.deleteUI(self.__UI[self.__class__].window)
        except: pass
        self.window = cmds.loadUI(f=getPath(kUI, "%s.ui"%uiFile))
        self.__UI.update({self.__class__:self})
        
        if cmds.windowPref(self.window, exists=True):
            width = cmds.windowPref(self.window, q=True, width=True)
            height = cmds.windowPref(self.window, q=True, height=True)
            left = (1920 - width) / 2
            top = (1080 - height) / 2
            cmds.windowPref(self.window, e=True, topLeftCorner=[top, left])
        
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
        
        cmds.showWindow(self.window)
    
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
    
    @property
    def isObsolete(self):
        u'''
        --------------------------------------------------------------------------------
        本属性用于判断当前实例是否处于废弃状态（等待被系统回收），亦即当前窗口是否已被关闭
        Check if this instance is obsolete and waiting for gc.
        --------------------------------------------------------------------------------
        '''
        if not cmds.window(self.window, exists=True): return True
        if not isinstance(self, QtUI): return True
        return not cmds.window(self.window, q=True, visible=True)

