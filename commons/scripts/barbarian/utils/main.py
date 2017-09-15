#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.8.23

@author: Serious Sam
'''

import os, sys, codecs, config
from pysideuic import compileUi
from PySide import QtCore, QtGui
from maya import cmds
from ui.PuTaoMainUI import Ui_PuTaoMain


def UI(*_):
    Main()


class Main(Ui_PuTaoMain):
    def setupUi(self, win=None):
        super(Main, self).setupUi(win)
        
        QtCore.QObject.connect(self.actionDebug, QtCore.SIGNAL("triggered()"), self.debug)
        QtCore.QObject.connect(self.actionCompile, QtCore.SIGNAL("triggered()"), self.complieUI)
        QtCore.QObject.connect(self.actionMAYA_APP_DIR, QtCore.SIGNAL("triggered()"), lambda *_: self.getEnv("MAYA_APP_DIR"))
        QtCore.QObject.connect(self.actionMAYA_LOCATION, QtCore.SIGNAL("triggered()"), lambda *_: self.getEnv("MAYA_LOCATION"))
        QtCore.QObject.connect(self.actionMAYA_MODULE_PATH, QtCore.SIGNAL("triggered()"), lambda *_: self.getEnv("MAYA_MODULE_PATH"))
        QtCore.QObject.connect(self.actionMAYA_PLUG_IN_PATH, QtCore.SIGNAL("triggered()"), lambda *_: self.getEnv("MAYA_PLUG_IN_PATH"))
        QtCore.QObject.connect(self.actionMAYA_SCRIPT_PATH, QtCore.SIGNAL("triggered()"), lambda *_: self.getEnv("MAYA_SCRIPT_PATH"))
        QtCore.QObject.connect(self.actionPYTHONPATH, QtCore.SIGNAL("triggered()"), lambda *_: self.getEnv("PYTHONPATH"))
        QtCore.QObject.connect(self.actionXBMLANGPATH, QtCore.SIGNAL("triggered()"), lambda *_: self.getEnv("XBMLANGPATH"))
        QtCore.QObject.connect(self.actionBARBARIAN_LOCATION, QtCore.SIGNAL("triggered()"), lambda *_: self.getEnv("BARBARIAN_LOCATION"))
        
        QtCore.QObject.connect(self.PutaoMainBtnReload, QtCore.SIGNAL("clicked()"), self.reload)
        
        self.movie = QtGui.QMovie(config.getPath(config.kIcon, "logoBig.gif"))
        self.label.setMovie(self.movie)
        self.movie.start()
        
    def getEnv(self, env):
        txt = "%s:\n"%env
        paths = os.getenv(env).split(';')
        for p in paths: txt += "%s\n"%p
        self.PuTaoMainTE.setText(txt)
    
    def debug(self, *_):
        path = "C:/Users/Administrator/.p2/pool/plugins/org.python.pydev_5.8.0.201706061859/pysrc/"
        if path not in sys.path: sys.path.append(path)
        try: import pydevd
        except: return
        else: pydevd.settrace(stdoutToServer=True, stderrToServer=True, suspend=False)
        
    def reload(self, *_):
        from barbarian import reloader
        reload(reloader)
        
        reloader.doIt(True)
        
    def complieUI(self, *_):
        ff = "UI Files (*.ui)"
        sd = config.getPath(config.kUI)
        path = cmds.fileDialog2(dialogStyle=2, fileMode=1, 
                                fileFilter=ff, startingDirectory=sd, 
                                okCaption=u"编译", cancelCaption=u"取消", 
                                caption=u"选择要编译的UI文件...")
        if not path: return
        else: path = path[0]
        
        fileName = path.split('/')[-1].split('.')[0]+"UI.py"
        output = codecs.open(__file__.split('main.py')[0]+"ui/"+fileName, 'w', "utf-8")
        try: compileUi(path, output, False)
        except: pass
        os.startfile(__file__.split('main.py')[0]+"ui/")
        output.close()

