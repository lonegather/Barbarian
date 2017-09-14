#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.8.23

@author: Serious Sam
'''

import os, sys, codecs, config
from pysideuic import compileUi
from maya import cmds
from ui import PuTaoMainUI


def UI(*_):
    Main('PutaoMain')


class Main(PuTaoMainUI.Ui_PuTaoMain):
    def setupUi(self):
        super(Main, self).setupUi(self.window)
        
        self.scrollField  = cmds.scrollField("PuTaoMainTE", q=True, fpn=True)
        cmds.button("PutaoMainBtnCompile", e=True, command=self.complieUI)
        cmds.button("PutaoMainBtnDebug", e=True, command=self.debug)
        cmds.button("PutaoMainBtnGetEnvAppDir", e=True, command=lambda *_: self.getEnv('MAYA_APP_DIR'))
        cmds.button("PutaoMainBtnGetEnvBarbarian", e=True, command=lambda *_: self.getEnv('BARBARIAN_LOCATION'))
        cmds.button("PutaoMainBtnGetEnvIcon", e=True, command=lambda *_: self.getEnv('XBMLANGPATH'))
        cmds.button("PutaoMainBtnGetEnvLocation", e=True, command=lambda *_: self.getEnv('MAYA_LOCATION'))
        cmds.button("PutaoMainBtnGetEnvModule", e=True, command=lambda *_: self.getEnv('MAYA_MODULE_PATH'))
        cmds.button("PutaoMainBtnGetEnvPlugin", e=True, command=lambda *_: self.getEnv('MAYA_PLUG_IN_PATH'))
        cmds.button("PutaoMainBtnGetEnvPython", e=True, command=lambda *_: self.getEnv('PYTHONPATH'))
        cmds.button("PutaoMainBtnGetEnvScript", e=True, command=lambda *_: self.getEnv('MAYA_SCRIPT_PATH'))
        cmds.button("PutaoMainBtnReload", e=True, command=self.reload)
        
    def getEnv(self, env):
        cmds.scrollField("PuTaoMainTE", e=True, clear=True)
        cmds.scrollField("PuTaoMainTE", e=True, tx="%s:\n"%env)
        paths = os.getenv(env).split(';')
        for p in paths:
            cmds.scrollField("PuTaoMainTE", e=True, ip=0, it="%s\n"%p)
    
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
        try: compileUi(path, output, True)
        except: pass
        os.startfile(__file__.split('main.py')[0]+"ui/")
        output.close()

