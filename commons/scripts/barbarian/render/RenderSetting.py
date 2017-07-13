import os
from maya import cmds
from barbarian.utils import getPath, kUI


class RenderSetting():
    
    renderWin = "BeathRender"
    textWin = "BeathRenderLabel"
    minText = "BeathRenderMin"
    maxText = "BeathRenderMax"
    
    Loc_Path = ""
    Bin_Path = ""
    Work_Path = ""
    Project_Path = ""
    Tmp = ""
    Adm = ""
    desktop = ""
    
    @classmethod
    def setPath(cls):
        cls.Loc_Path = os.getenv('MAYA_LOCATION')
        cls.Bin_Path = cls.Loc_Path + '/bin/'
        cls.Work_Path = cmds.workspace(q=True, fullName=True)
        cls.Project_Path = cmds.file(q=1, exn=1)
        cls.Adm = os.getenv('USERPROFILE')
        cls.desktop = cls.Adm  + '\\Desktop\\'

    @classmethod
    def BrowseWin(cls):
        cls.Tmp = cmds.fileDialog2(dialogStyle=2, fileMode=3, caption=u'输出路径', okCaption=u'选择路径', cancelCaption=u'取消')
        if cls.Tmp:
            cls.Tmp = cls.Tmp[0]
            cmds.textField(cls.textWin, edit=True, tx=cls.Tmp)

    @classmethod
    def UI(cls):
        cls.setPath()
        if cmds.window(cls.renderWin, exists=True): cmds.deleteUI(cls.renderWin)
        cmds.loadUI(f=getPath(kUI, "RenderSetting.ui"))
        cmds.window(cls.renderWin, e=True, mxb=False, leftEdge=100, topEdge=100)
        cmds.showWindow(cls.renderWin)
        
        
        cmds.textField(cls.textWin, edit=True, tx=cls.Work_Path)
        cmds.textField(cls.minText, edit=True, )
        cmds.textField(cls.maxText, edit=True, )

    @classmethod
    def renderCmd(cls, Type):
        Tfb = cmds.textField(cls.minText, q=True, tx=True)
        Tfc = cmds.textField(cls.maxText, q=True, tx=True)
        cls.Tmp = cmds.textField(cls.textWin, q=True, tx=True)
        
        cmd0 = "cd \"" + cls.Bin_Path + "\""
        cmd1 = "\"" + cls.Bin_Path + "Render.exe\""
        cmd2 = 'Render -s ' + Tfb + ' -e ' + Tfc + ' -rd \"' + cls.Tmp + '\" \"' + cls.Project_Path + '\"'
        cmd3 = ' -s ' + Tfb + ' -e ' + Tfc + ' -rd \"' + cls.Tmp + '\" \"' + cls.Project_Path + '\"'
        
        if Type == 0:
                    
            os.system(cmd0)
            os.system(cmd2)
            
        else:
            
            ct = open(cls.desktop + cls.__time__() + ".bat","w")
            ct.write(cmd1 + cmd3)
            ct.flush()
            
    @classmethod
    def __time__(cls):
        import datetime
        now = datetime.datetime.now()
        return now.strftime('%Y-%m-%d')
            


