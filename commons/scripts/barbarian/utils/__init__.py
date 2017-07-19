#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.6.9

@author: Serious Sam
'''

import os
import sys
import xml.sax
from maya import cmds

__all__ = ["getPath", "kIcon", "kBinary", "kUI",
           "getConfig", "getProject", "setProject"]

kIcon = "../commons/icons/"
kBinary = "../commons/bin/"
kUI = "../commons/ui/"


def getPath(key="", f=""):
    '''
    --------------------------------------------------------------------------------
    Provide Framework Paths
    --------------------------------------------------------------------------------
    '''
    path = os.getenv("BARBARIAN_LOCATION")
    return path + key + f
    

def getConfig(**kwargs):
    '''
    --------------------------------------------------------------------------------
    Provide Project Configuration
    --------------------------------------------------------------------------------
    '''
    if not getProject(all=True):
        cmds.confirmDialog(message=u'项目配置异常',ma="center", icon="warning", title=u"PuTao")
        raise Exception(u"项目配置异常")
    elif not getProject():
        setProject(cmds.layoutDialog(ui=__prompt__))
    
    attrList = ["time", "linear", "camera", "camResX", "camResY", "camFilmFit", "playblastScale", "animLibPath", "facialLibPath"]
    for attr in attrList:
        if attr in kwargs and kwargs[attr]:
            for project in __handler__.config:
                if project["name"] == getProject(): return project[attr]
                
    return None


def setProject(name):
    '''
    --------------------------------------------------------------------------------
    Set Current Project
    --------------------------------------------------------------------------------
    '''
    for project in __handler__.config:
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


def getProject(**kwargs):
    '''
    --------------------------------------------------------------------------------
    Get Current Project or List of Projects Available
    --------------------------------------------------------------------------------
    '''
    projects = []
    for project in __handler__.config:
        projects.append(project["name"])
    if "all" in kwargs and kwargs["all"]:
        return projects
    elif "prompt" in kwargs and kwargs["prompt"] and projects:
        currentPrj = cmds.layoutDialog(ui=__prompt__)
        for project in projects:
            if project == currentPrj:
                setProject(currentPrj)
                return currentPrj
        return cmds.optionVar(q="PutaoTools_Project")
    else:
        currentPrj = cmds.optionVar(q="PutaoTools_Project")
        if (not currentPrj) and projects: 
            currentPrj = cmds.layoutDialog(ui=__prompt__)
            for project in projects:
                if project == currentPrj:
                    setProject(currentPrj)
                    return currentPrj
        else: 
            for project in projects:
                if project == currentPrj: return project
        return u""
    

class ConfigHandler(xml.sax.ContentHandler):
    '''
    --------------------------------------------------------------------------------
    Class Representing the config.xml
    --------------------------------------------------------------------------------
    '''
    def __init__(self):
        
        self.config = []
        
        self.current = ""
        self.time = ""
        self.linear = ""
        self.camera = ""
        self.camResX = ""
        self.camResY = ""
        self.camFilmFit = ""
        self.playblastScale = ""
        self.animLibPath = ""
        self.facialLibPath = ""
    
    def startElement(self, name, attrs):
        xml.sax.ContentHandler.startElement(self, name, attrs)
        self.current = name
        if name == "project":
            self.config.append({"name":attrs["name"]})
            
    def endElement(self, name):
        xml.sax.ContentHandler.endElement(self, name)
        if self.current == "time":
            self.config[len(self.config)-1]["time"] = self.time
        elif self.current == "linear":
            self.config[len(self.config)-1]["linear"] = self.linear
        elif self.current == "camera":
            self.config[len(self.config)-1]["camera"] = self.camera
        elif self.current == "camResX":
            self.config[len(self.config)-1]["camResX"] = self.camResX
        elif self.current == "camResY":
            self.config[len(self.config)-1]["camResY"] = self.camResY
        elif self.current == "camFilmFit":
            self.config[len(self.config)-1]["camFilmFit"] = self.camFilmFit
        elif self.current == "playblastScale":
            self.config[len(self.config)-1]["playblastScale"] = self.playblastScale
        elif self.current == "animLibPath":
            self.config[len(self.config)-1]["animLibPath"] = self.animLibPath
        elif self.current == "facialLibPath":
            self.config[len(self.config)-1]["facialLibPath"] = self.facialLibPath
        self.current = ""
        
    def characters(self, content):
        xml.sax.ContentHandler.characters(self, content)
        if self.current == "time":
            self.time = content
        elif self.current == "linear":
            self.linear = content
        elif self.current == "camera":
            self.camera = content
        elif self.current == "camResX":
            self.camResX = int(content)
        elif self.current == "camResY":
            self.camResY = int(content)
        elif self.current == "camFilmFit":
            self.camFilmFit = int(content)
        elif self.current == "playblastScale":
            self.playblastScale = int(content)
        elif self.current == "animLibPath":
            self.animLibPath = content
        elif self.current == "facialLibPath":
            self.facialLibPath = content

def __prompt__():
    form = cmds.setParent(q=True)
    cmds.formLayout(form, e=True, width=200)
    txt = cmds.text(l=u"请选择当前项目：",height=30)
    btn = cmds.button(l="Confirm",height=30,command=lambda *_: cmds.layoutDialog(dismiss=cmds.optionMenu(mnu,q=True,v=True)))
    mnu = cmds.optionMenu(height=30)
    prjs = getProject(all=True)
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

'''
--------------------------------------------------------------------------------
Configuration Setup at Maya Startup
--------------------------------------------------------------------------------
'''
#initialize plugins
for plugin in ["CustomDeformers", "animImportExport", "MLIECmd"]:
    try: cmds.loadPlugin(plugin, quiet=True)
    except: pass

try: cmds.condition("ProjectChanged", delete=True)
except: pass
cmds.condition("ProjectChanged", state=True)

__handler__ = ConfigHandler()
__parser__ = xml.sax.make_parser()
__parser__.setFeature(xml.sax.handler.feature_namespaces, 0)
__parser__.setContentHandler(__handler__)

try:
    __parser__.parse(getPath("../commons/config/", "config.xml"))
except Exception, e:
    cmds.confirmDialog(message=u"加载配置出现问题，无法读取项目列表", title=u"PuTao", icon="warning")
    cmds.optionVar(rm="PutaoTools_Project")

if not cmds.optionVar(exists="PutaoTools_Project"):
    cmds.optionVar(sv=("PutaoTools_Project", ""))
    cmds.optionVar(iv=("PutaoTools_Project_Time", 0))
    cmds.optionVar(sv=("PutaoTools_Project_Linear", ""))
    cmds.optionVar(sv=("PutaoTools_Project_Camera", ""))
    cmds.optionVar(iv=("PutaoTools_Project_CamResX", 0))
    cmds.optionVar(iv=("PutaoTools_Project_CamResY", 0))
    cmds.optionVar(iv=("PutaoTools_Project_CamFilmFit", 0))
    cmds.optionVar(fv=("PutaoTools_Project_PlayblastScale", 0.0))
    cmds.optionVar(sv=("PutaoTools_Project_AnimLibPath", ""))
    cmds.optionVar(sv=("PutaoTools_Project_FacialLibPath", ""))
                 
