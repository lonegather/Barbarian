#!/usr/local/bin/python2.7
# encoding: utf-8

import os
from maya import cmds
from barbarian.utils import ui


def UI(*_):
    RenderSetting("RenderSetting",
                  textWin = "BeathRenderLabel",
                  cameraMenuItem = "BeathRenderOptionMenu",
                  renderLayerMenu = "BeathRenderOptionMenu_2",
                  minText = "BeathRenderMin",
                  maxText = "BeathRenderMax")

def doRender(*_):
    RenderSetting.getInstance().renderCmd(0)
    
def makeBat(*_):
    RenderSetting.getInstance().renderCmd(1)
    
def browse(*_):
    RenderSetting.getInstance().BrowseWin()


class RenderSetting(ui.QtWindow):
    def setup(self):
        self.Bin_Path = os.getenv('MAYA_LOCATION') + '/bin/'
        self.Work_Path = cmds.workspace(q=True, fullName=True)
        self.Project_Path = cmds.file(q=1, exn=1)
        self.desktop = os.getenv('USERPROFILE')  + '\\Desktop\\'

        cmds.textField(self.textWin, edit=True, tx=self.Work_Path)
        cmds.textField(self.minText, edit=True, )
        cmds.textField(self.maxText, edit=True, )
        
        cameraName = cmds.listCameras(orthographic=True, perspective=True)
        for item in cameraName:
            cmds.menuItem(l=item, parent=self.cameraMenuItem)
            
        Render_Layer = cmds.ls(type = 'renderLayer' )
        for layer in Render_Layer:
            cmds.menuItem(l=layer, parent=self.renderLayerMenu)

    def BrowseWin(self):
        tmp = cmds.fileDialog2(dialogStyle=2, fileMode=3, caption=u'输出路径', okCaption=u'选择路径', cancelCaption=u'取消')
        if tmp: cmds.textField(self.textWin, edit=True, tx=tmp)

    def renderCmd(self, Type):
        Tfb = cmds.textField(self.minText, q=True, tx=True)
        Tfc = cmds.textField(self.maxText, q=True, tx=True)
        self.Tmp = cmds.textField(self.textWin, q=True, tx=True)
        
        cameraId =  cmds.optionMenu(self.cameraMenuItem, q=True, v=True)
        renderLayerId =  cmds.optionMenu(self.renderLayerMenu, q=True, v=True)
      
        cmd0 = "cd \"" + self.Bin_Path + "\""
        cmd1 = "\"" + self.Bin_Path + "Render.exe\""
        cmd2 = 'Render' + ' -s ' + Tfb + ' -e ' + Tfc + ' -cam ' + cameraId + ' -rl ' + renderLayerId +' -rd \"' + self.Tmp + '\" \"' + self.Project_Path + '\"'
        cmd3 = ' -s ' + Tfb + ' -e ' + Tfc + ' -cam ' + cameraId + ' -rl ' + renderLayerId + ' -rd \"' + self.Tmp + '\" \"' + self.Project_Path + '\"\n'
        
        oldFile = os.popen("type %s"%(self.desktop + self.__time__() + ".bat")).read()
        
        if oldFile == '':
            shutdown = 'shutdown -s -f -t 1'
        else:
            shutdown = ''
        
        if Type == 0:
            os.system(cmd0)
            os.system(cmd2)
        else:
            ct = open(self.desktop + self.__time__() + ".bat","w")
            ct.write(cmd1 + cmd3 + oldFile + shutdown)
            ct.flush()

    def __time__(self):
        import datetime
        now = datetime.datetime.now()
        return now.strftime('%Y-%m-%d')
    

        
        
        
        
        
