#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.7.17

@author: Serious Sam
'''

import os
from xml.dom import minidom
from maya import cmds


__all__ = ["getProject", "setProject", "getConfig",
           "getPath", "kIcon", "kConfig", "kBinary", "kUI"]


kBinary = "../commons/bin/"
kConfig = "../commons/config/"
kIcon = "../commons/icons/"
kUI = "../commons/ui/"


def getPath(*args):
    '''
    --------------------------------------------------------------------------------
    Provide Framework Paths
    --------------------------------------------------------------------------------
    '''
    path = os.getenv("BARBARIAN_LOCATION")
    for arg in args: path += arg
    return path


def getProject(**kwargs):
    '''
    --------------------------------------------------------------------------------
    Get Current Project or List of Projects Available
    --------------------------------------------------------------------------------
    '''
    return Config.getProject(**kwargs)


def setProject(prj):
    '''
    --------------------------------------------------------------------------------
    Set Current Project
    --------------------------------------------------------------------------------
    '''
    Config.setProject(prj)
    
    
def getConfig(attr, prj=None):
    '''
    --------------------------------------------------------------------------------
    Provide Project Configuration
    --------------------------------------------------------------------------------
    '''
    return Config.getConfig(attr, prj)


class Config(object):
    
    __instance = None
    
    @classmethod
    def instance(cls):
        if not cls.__instance:
            cls.__instance = cls(getPath(kConfig, "config.xml"))
        return cls.__instance
    
    @classmethod
    def getConfig(cls, attr, prj=None):
        if not cls.getProject(all=True):
            cmds.confirmDialog(message=u'项目配置异常',ma="center", icon="warning", title=u"PuTao")
            raise Exception(u"项目配置异常")
        elif not cls.getProject():
            cls.setProject(cmds.layoutDialog(ui=cls.__prompt__))
            
        targetProject = prj if prj in cls.getProject(all=True) else cls.getProject()
            
        for project in cls.instance().data:
            if project["name"] == targetProject: 
                try: return project[attr]
                except: return None
                    
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
        if cmds.optionVar(q="PutaoTools_Project") == name: return
        for project in cls.instance().data:
            if project["name"] == name:
                cmds.optionVar(sv=("PutaoTools_Project", project["name"]))

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
        try: dom = minidom.parse(filePath)
        except:
            cmds.confirmDialog(message=u"加载配置出现问题，无法读取项目列表", title=u"PuTao", icon="warning")
            cmds.optionVar(rm="PutaoTools_Project")
            self.root = None
            return
        self.root = dom.documentElement
    
    @property    
    def data(self):
        projects = []
        if not self.root: return projects
        for project in self.root.childNodes:
            if project.nodeType == self.root.ELEMENT_NODE:
                projects.append({"name":project.getAttribute('name')})
                
                for var in project.childNodes:
                    if var.nodeType == var.ELEMENT_NODE:
                        attrType = var.getAttribute('type')
                        if attrType == 'int':
                            projects[-1][var.nodeName] = int(var.childNodes[0].nodeValue)
                        elif attrType == 'float':
                            projects[-1][var.nodeName] = float(var.childNodes[0].nodeValue)
                        else: projects[-1][var.nodeName] = var.childNodes[0].nodeValue
                
        return projects
        
    