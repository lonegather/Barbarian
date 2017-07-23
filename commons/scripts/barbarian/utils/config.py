#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.7.17

@author: Serious Sam
'''

import sys
import xml.dom.minidom
from maya import cmds
from barbarian.utils import ui, getPath


class Main(ui.QtUI):
    def debug(self, *_):
        path = "C:/Users/Administrator/.p2/pool/plugins/org.python.pydev_5.8.0.201706061859/pysrc/"
        if path not in sys.path: sys.path.append(path)
        try: import pydevd
        except: return
        else: pydevd.settrace(stdoutToServer=True, stderrToServer=True, suspend=False)


class Config(object):
    
    __instance = None
    __dic = {}
    
    @classmethod
    def instance(cls):
        if not cls.__instance:
            cls.__instance = cls(getPath("../commons/config/", "config.xml"))
        return cls.__instance
    
    @classmethod
    def getConfig(cls, **kwargs):
        if not cls.getProject(all=True):
            cmds.confirmDialog(message=u'项目配置异常',ma="center", icon="warning", title=u"PuTao")
            raise Exception(u"项目配置异常")
        elif not cls.getProject():
            cls.setProject(cmds.layoutDialog(ui=cls.__prompt__))
        
        attrList = ["time", "linear", "camera", "camResX", "camResY", "camFilmFit", "playblastScale", "animLibPath", "facialLibPath"]
        for attr in attrList:
            if attr in kwargs and kwargs[attr]:
                for project in cls.instance().data:
                    if project["name"] == cls.getProject(): return project[attr]
                    
        return None
    
    @classmethod
    def getProject(cls, **kwargs):
        projects = []
        for prj in cls.instance().data:
            projects.append(prj['name'])
        
        if "all" in kwargs and kwargs["all"]:
            return projects
        elif "prompt" in kwargs and kwargs["prompt"] and projects:
            currentPrj = cmds.layoutDialog(ui=cls.__prompt__)
            for project in projects:
                if project == currentPrj:
                    cls.setProject(currentPrj)
                    return currentPrj
            return cmds.optionVar(q="PutaoTools_Project")
        else:
            currentPrj = cmds.optionVar(q="PutaoTools_Project")
            if (not currentPrj) and projects: 
                currentPrj = cmds.layoutDialog(ui=cls.__prompt__)
                for project in projects:
                    if project == currentPrj:
                        cls.setProject(currentPrj)
                        return currentPrj
            else: 
                for project in projects:
                    if project == currentPrj: return project
            return u""
    
    @classmethod
    def setProject(cls, name):
        for project in cls.instance().data:
            if project["name"] == name:
                cmds.optionVar(sv=("PutaoTools_Project", name))
                cmds.optionVar(sv=("PutaoTools_Project_Time", project["time"]))
                cmds.optionVar(sv=("PutaoTools_Project_Linear", project["linear"]))
                cmds.optionVar(sv=("PutaoTools_Project_Camera", project["camera"]))
                cmds.optionVar(iv=("PutaoTools_Project_CamResX", project["camResX"]))
                cmds.optionVar(iv=("PutaoTools_Project_CamResY", project["camResY"]))
                cmds.optionVar(iv=("PutaoTools_Project_CamFilmFit", project["camFilmFit"]))
                cmds.optionVar(fv=("PutaoTools_Project_PlayblastScale", project["playblastScale"]))
                cmds.optionVar(sv=("PutaoTools_Project_AnimLibPath", project["animLibPath"]))
                cmds.optionVar(sv=("PutaoTools_Project_FacialLibPath", project["facialLibPath"]))
                
                cmds.condition("ProjectChanged", e=True, state=not cmds.condition("ProjectChanged", q=True, state=True))
        
    
    @classmethod
    def __prompt__(cls):
        form = cmds.setParent(q=True)
        cmds.formLayout(form, e=True, width=200)
        txt = cmds.text(l=u"请选择当前项目：",height=30)
        btn = cmds.button(l="Confirm",height=30,command=lambda *_: cmds.layoutDialog(dismiss=cmds.optionMenu(mnu,q=True,v=True)))
        mnu = cmds.optionMenu(height=30)
        prjs = cls.getProject(all=True)
        for prj in prjs:
            cmds.menuItem(l=prj, parent=mnu)
        if cmds.optionVar(q="PutaoTools_Project"):
            cmds.optionMenu(mnu, e=True, v=cmds.optionVar(q="PutaoTools_Project"))
        
        edge = 10
        
        cmds.formLayout(form, e=True,
                        attachForm=[(txt,'top',edge),
                                    (mnu,'top',edge),
                                    (txt,'left',edge),
                                    (mnu,'right',edge),
                                    (btn,'left',edge),
                                    (btn,'right',edge),
                                    (btn,'bottom',edge)])
    
    def __init__(self, filePath):
        dom = xml.dom.minidom.parse(filePath)
        self.root = dom.documentElement
    
    def __getitem__(self, key):
        if key in self.__dic:
            return self.__dic[key]
        return None
    
    def __setitem__(self, key, value):
        self.__dic[key] = value
    
    @property    
    def data(self):
        projects = []
        for node in self.root.childNodes:
            if node.nodeType == self.root.ELEMENT_NODE:
                projects.append({"name":node.getAttribute('name')})
        
        return projects
        
    