#!/usr/local/bin/python2.7
# encoding: utf-8

import os
from maya import cmds
from barbarian.utils import ui


def UI(*_):
    RenderSetting("RenderSetting",
                  textWin = "BeathRenderLabel",
                  cameraMenuItem = "BeathRenderOptionMenu",
                  minText = "BeathRenderMin",
                  maxText = "BeathRenderMax",
                  checkbox = "BeathRenderCheckBox")
                

def makeBat(*_):
    RenderSetting.UI().renderCmd()
    
def browse(*_):
    RenderSetting.UI().BrowseWin()


class RenderSetting(ui.QtUI):
    def __init__(self, uiFile, **info):
        ui.QtUI.__init__(self, uiFile, **info)
        
        self.Bin_Path = os.getenv('MAYA_LOCATION') + '/bin/'
        self.Work_Path = cmds.workspace(q=True, fullName=True)
        self.Project_Path = cmds.file(q=1, exn=1)
        self.desktop = os.getenv('USERPROFILE')  + '\\Desktop\\'

        cmds.textField(self.textWin, edit=True, tx=self.Work_Path)
        cmds.textField(self.minText, edit=True, )
        cmds.textField(self.maxText, edit=True, )
        cmds.checkBox(self.checkbox, edit=True, )

        
        cameraName = cmds.listCameras(orthographic=True, perspective=True)
        for item in cameraName:
            cmds.menuItem(l=item, parent=self.cameraMenuItem)
            

    def BrowseWin(self):
        tmp = cmds.fileDialog2(dialogStyle=2, fileMode=3, caption=u'输出路径', okCaption=u'选择路径', cancelCaption=u'取消')
        if tmp: cmds.textField(self.textWin, edit=True, tx=tmp[0])

    def renderCmd(self):
        Tfb = cmds.textField(self.minText, q=True, tx=True)
        Tfc = cmds.textField(self.maxText, q=True, tx=True)
        self.Tmp = cmds.textField(self.textWin, q=True, tx=True)
        
        cameraId =  cmds.optionMenu(self.cameraMenuItem, q=True, v=True)
      
        cmd1 = "\"" + self.Bin_Path + "Render.exe\""
        cmd2 = ' -s ' + Tfb + ' -e ' + Tfc + ' -cam ' + cameraId + ' -rd \"' + self.Tmp + '\" \"' + self.Project_Path + '\"\r\n'
        
        oldFile = os.popen("type %s"%(self.desktop + self.__time__() + ".bat")).read().replace('\n', '\r\n')
        
        if oldFile.find('shutdown')==-1 and cmds.checkBox(self.checkbox, q=True, v=True):
            shutdown = 'shutdown -s -f -t 1'
        else:
            shutdown = ''
        
        ct = open(self.desktop + self.__time__() + ".bat","w")
        ct.write(cmd1 + cmd2 + oldFile + shutdown)
        ct.flush()

    def __time__(self):
        import datetime
        now = datetime.datetime.now()
        return now.strftime('%Y-%m-%d')
    

        
        
        
        
        
