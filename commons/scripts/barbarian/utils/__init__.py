# -*- coding: utf-8 -*-

import os
import sys
import xml.sax
import pymel.core as pm
import maya.OpenMaya as om

__all__ = ["debug", "kIcon", "kBinary", "kUI",
           "getPath", "getHelp", "getConfig", "getProject", "setProject"]

kIcon = "../commons/icons/"
kBinary = "../commons/bin/"
kUI = "../commons/ui/"


def debug():
    path = "C:/Users/Administrator/.p2/pool/plugins/org.python.pydev_5.8.0.201706061859/pysrc/"
    if path not in sys.path: sys.path.append(path)
    try: import pydevd
    except: return
    else: pydevd.settrace(stdoutToServer=True, stderrToServer=True, suspend=False)


def getPath(key="", f=""):
    '''
    --------------------------------------------------------------------------------
    Provide Framework Paths
    --------------------------------------------------------------------------------
    '''
    path = os.getenv("BARBARIAN_LOCATION")
    return path + key + f


def getHelp():
    '''
    --------------------------------------------------------------------------------
    Provide Framework Help
    --------------------------------------------------------------------------------
    '''
    pm.webView(url=(getPath("../commons/config/", "help.htm")))
    

def getConfig(**kwargs):
    '''
    --------------------------------------------------------------------------------
    Provide Project Configuration
    --------------------------------------------------------------------------------
    '''
    if not getProject(all=True):
        pm.confirmDialog(message=u'项目配置异常',ma="center", icon="warning", title=u"PuTao")
        raise Exception(u"项目配置异常")
    elif not getProject():
        setProject(pm.layoutDialog(ui=__prompt__))
    
    attrList = ["time", "linear", "camera", "camResX", "camResY", "playblastScale", "animLibPath", "facialLibPath"]
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
            pm.optionVar(sv=("PutaoTools_Project", name))
            pm.optionVar(sv=("PutaoTools_Project_Time", project["time"]))
            pm.optionVar(sv=("PutaoTools_Project_Linear", project["linear"]))
            pm.optionVar(sv=("PutaoTools_Project_Camera", project["camera"]))
            pm.optionVar(iv=("PutaoTools_Project_CamResX", project["camResX"]))
            pm.optionVar(iv=("PutaoTools_Project_CamResY", project["camResY"]))
            pm.optionVar(fv=("PutaoTools_Project_PlayblastScale", project["playblastScale"]))
            pm.optionVar(sv=("PutaoTools_Project_AnimLibPath", project["animLibPath"]))
            pm.optionVar(sv=("PutaoTools_Project_FacialLibPath", project["facialLibPath"]))
            
            pm.condition("ProjectChanged", e=True, state=not pm.condition("ProjectChanged", q=True, state=True))


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
    else:
        currentPrj = pm.optionVar(q="PutaoTools_Project")
        if not currentPrj: 
            currentPrj = pm.layoutDialog(ui=__prompt__)
            for project in projects:
                if project == currentPrj:
                    setProject(currentPrj)
                    return currentPrj
        else: 
            for project in projects:
                if project == currentPrj: return project
            return ""


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
        elif self.current == "playblastScale":
            self.playblastScale = int(content)
        elif self.current == "animLibPath":
            self.animLibPath = content
        elif self.current == "facialLibPath":
            self.facialLibPath = content

def __prompt__():
    form = pm.setParent(q=True)
    pm.formLayout(form, e=True, width=200)
    txt = pm.text(l=u"请选择当前项目：",height=30)
    btn = pm.button(l="Confirm",height=30,command=lambda *args: pm.layoutDialog(dismiss=pm.optionMenu(mnu,q=True,v=True)))
    mnu = pm.optionMenu(height=30)
    prjs = getProject(all=True)
    for prj in prjs:
        pm.menuItem(l=prj, parent=mnu)
    
    edge = 10
    
    pm.formLayout(form, e=True,
                  attachForm=[(txt,'top',edge),
                              (mnu,'top',edge),
                              (txt,'left',edge),
                              (mnu,'right',edge),
                              (btn,'left',edge),
                              (btn,'right',edge),
                              (btn,'bottom',edge)])

def __wireframe__(*args):
    allPanels = pm.getPanel(type='modelPanel')
    for p in allPanels:
        pm.modelEditor(p, edit=1, displayAppearance='boundingBox')

'''
--------------------------------------------------------------------------------
Configuration Setup at Maya Startup
--------------------------------------------------------------------------------
'''
try: pm.condition("ProjectChanged", delete=True)
except: pass
pm.condition("ProjectChanged", state=True)

__handler__ = ConfigHandler()
__parser__ = xml.sax.make_parser()
__parser__.setFeature(xml.sax.handler.feature_namespaces, 0)
__parser__.setContentHandler(__handler__)

try:
    __parser__.parse(getPath("../commons/config/", "config.xml"))
except Exception, e:
    pm.confirmDialog(message=u"加载配置出现问题，无法读取项目列表", title=u"PuTao", icon="warning")
    pm.optionVar(rm="PutaoTools_Project")

if not pm.optionVar(exists="PutaoTools_Project"):
    pm.optionVar(sv=("PutaoTools_Project", ""))
    pm.optionVar(iv=("PutaoTools_Project_Time", 0))
    pm.optionVar(sv=("PutaoTools_Project_Linear", ""))
    pm.optionVar(sv=("PutaoTools_Project_Camera", ""))
    pm.optionVar(iv=("PutaoTools_Project_CamResX", 0))
    pm.optionVar(iv=("PutaoTools_Project_CamResY", 0))
    pm.optionVar(fv=("PutaoTools_Project_PlayblastScale", 0.0))
    pm.optionVar(sv=("PutaoTools_Project_AnimLibPath", ""))
    pm.optionVar(sv=("PutaoTools_Project_FacialLibPath", ""))

om.MSceneMessage.addCallback(om.MSceneMessage.kBeforeSave, __wireframe__)
                 



