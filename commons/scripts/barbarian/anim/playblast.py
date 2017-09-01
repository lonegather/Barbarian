#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.8.8

@author: Serious Sam
'''

from maya import cmds, mel
from barbarian.utils import ui, config
import os


def UI(*_):
    PlayblastOption("playblastOption",
                    textField = "playblastOptionNameInput",
                    defaultCB = "playblastOptionCBDefault",
                    HUDCB     = "playblastOptionCBHUD")
    
    
def doIt(*_):
    PlayblastOption.playblast()


class PlayblastOption(ui.QtUI):
    def setup(self):
        if not cmds.optionVar(exists="PutaoTools_HUD_Animator"):
            cmds.checkBox(self.defaultCB, e=True, value=True)
            cmds.textField(self.textField, e=True, enable=False)
        else:
            cmds.checkBox(self.defaultCB, e=True, value=False)
            cmds.textField(self.textField, e=True, tx=cmds.optionVar(q="PutaoTools_HUD_Animator"))
            
        if (not cmds.optionVar(exists="PutaoTools_HUD_Padding")) or cmds.optionVar(q="PutaoTools_HUD_Padding"):
            cmds.checkBox(self.HUDCB, e=True, value=True)
            cmds.optionVar(iv=("PutaoTools_HUD_Padding", 120))
        else: cmds.checkBox(self.HUDCB, e=True, value=False)
        
        cmds.checkBox(self.defaultCB, e=True, changeCommand=self.refreshUI)
      
    def changeHUD(self, pb=False):
        name = cmds.textField(self.textField, q=True, tx=True)
        if cmds.checkBox(self.defaultCB, q=True, value=True):
            cmds.optionVar(remove="PutaoTools_HUD_Animator")
        else:
            cmds.optionVar(sv=("PutaoTools_HUD_Animator", name))
            
        if cmds.checkBox(self.HUDCB, q=True, value=True):
            cmds.optionVar(iv=("PutaoTools_HUD_Padding", 120))
        else:
            cmds.optionVar(iv=("PutaoTools_HUD_Padding", 0))
            
        if pb: 
            self.playblast()
            self.close()
        
    def refreshUI(self, *_):
        if cmds.checkBox(self.defaultCB, q=True, value=True): 
            cmds.textField(self.textField, e=True, enable=False)
        else: 
            cmds.textField(self.textField, e=True, enable=True)
    
    @classmethod
    def playblast(cls):
        
        fullPath = cmds.file(q=1, exn=1)
        fileName = cmds.file(q=1, sn=1, shn=1)
        
        if fileName == '' :
            cmds.headsUpMessage(u'文件未保存', time=1)
            return
        
        videoNameList = fileName.split(".")
        videoName = ""
        
        for i in range(len(videoNameList) - 1) :
            videoName = videoName + videoNameList[i]
            if i < len(videoNameList) - 1 :
                videoName = videoName + '.'
        videoOutName = videoName + 'mov'
        videoName = videoName + 'avi'
        
        pathList = fullPath.split(fileName)
        path = ""
        for i in range(len(pathList) - 1) :
            path = path + pathList[i]
            
        videoPath = path + videoName
        videoOutPath = path + videoOutName
        
        soundTmp = mel.eval('$tmpVar=$gPlayBackSlider')
        soundObj = cmds.timeControl(soundTmp, q=1, sound=1)
        
        startFrame = cmds.playbackOptions(q=1, minTime=1)
        endFrame = cmds.playbackOptions(q=1, maxTime=1)
        
        panel = cmds.playblast(activeEditor=True).split("|")[-1]
        currentCam = cmds.modelPanel(panel, q=True, camera=True)
        cam = cmds.listRelatives(currentCam)
        if not cam: cam = currentCam
        else: cam = cam[0]
        
        padding = 0
        if (not cmds.optionVar(exists="PutaoTools_HUD_Padding")) or cmds.optionVar(q="PutaoTools_HUD_Padding"):
            cmds.optionVar(iv=("PutaoTools_HUD_Padding", 120))
            padding = cmds.optionVar(q="PutaoTools_HUD_Padding")
            cmds.setAttr(cam+".displayFilmGate", 0)
            cmds.setAttr(cam+".displayResolution", 1)
            cmds.setAttr(cam+".displayGateMask", 1)
            cmds.setAttr(cam+".displayGateMaskOpacity", 1.0)
            cmds.setAttr(cam+".displayGateMaskColor",0.0,0.0,0.0,type='double3')
            cmds.setAttr(cam+".displaySafeAction", 1)
            cmds.setAttr(cam+".overscan", 1)
            cmds.setAttr(cam+".filmFit", 1)
            
            cmds.select(clear=True)
        
        cmds.setAttr("%s.width"%cmds.ls(renderResolutions=True)[0], config.getConfig('camResX'))
        cmds.setAttr("%s.height"%cmds.ls(renderResolutions=True)[0], config.getConfig('camResY'))
        ha = cmds.getAttr(cam+".verticalFilmAperture")
        ar = float(config.getConfig('camResX'))/float(config.getConfig('camResY'))
        cmds.setAttr(cam+".horizontalFilmAperture", lock=False)
        cmds.setAttr(cam+".horizontalFilmAperture", ha*ar)
        cmds.setAttr("%s.deviceAspectRatio"%cmds.ls(renderResolutions=True)[0], ar)
        
        cls.__makeHUD__()
        
        try:
            if soundObj :
                playblastFile = cmds.playblast(sound=soundObj, combineSound=True,
                                               st=startFrame, et=endFrame, 
                                               widthHeight=[config.getConfig('camResX'), config.getConfig('camResY')+padding], 
                                               percent=config.getConfig('playblastScale'), 
                                               filename=videoPath, forceOverwrite=True, 
                                               format='avi', compression='none', quality=100, 
                                               clearCache=True, viewer=False, showOrnaments=True, offScreen=False)
            else :
                playblastFile = cmds.playblast(st=startFrame, et=endFrame, 
                                               widthHeight=[config.getConfig('camResX'), config.getConfig('camResY')+padding], 
                                               percent=config.getConfig('playblastScale'), 
                                               filename=videoPath, forceOverwrite=True, 
                                               format='avi', compression='none', quality=100, 
                                               clearCache=True, viewer=False, showOrnaments=True, offScreen=False)
        except: 
            cls.__clearHUD__()
            cmds.setAttr(cam+".filmFit", config.getConfig('camFilmFit'))
            return
        
        cls.__clearHUD__()
        cmds.setAttr(cam+".filmFit", config.getConfig('camFilmFit'))
        
        if playblastFile:    
            mp = config.getPath(config.kBinary, "ffmpeg")
            uFile = os.path.abspath(playblastFile.encode('gbk'))
            uOut = os.path.abspath(videoOutPath.encode('gbk'))
            
            resultCmd = r'%s -i "%s" -vcodec "mpeg4" -y -qscale 0 "%s"' % (mp, uFile, uOut)
            os.system(resultCmd)
            os.startfile(uOut)
            os.remove(playblastFile)

        cmds.currentTime(startFrame)
        
    @classmethod
    def __makeHUD__(cls):
        cls.__clearHUD__()
        
        cmds.headsUpDisplay("HUD_Time", section=0, block=0, label="Date:",
                            dataFontSize="large", 
                            labelFontSize="large", 
                            blockSize="large", 
                            command=cls.__time__, attachToRefresh=True)
        
        cmds.headsUpDisplay("HUD_File", section=2, block=0, label="",
                            dataFontSize="large", 
                            labelFontSize="large", 
                            blockSize="large", 
                            command=cls.__file__, attachToRefresh=True)
        
        cmds.headsUpDisplay("HUD_Animator", section=4, block=0, label="Animator:",
                            dataFontSize="large", 
                            labelFontSize="large", 
                            blockSize="large", 
                            command=cls.__animator__, attachToRefresh=True)
        
        cmds.headsUpDisplay("HUD_Check", section=5, block=0, label=cls.__check__(),
                            dataFontSize="large", 
                            labelFontSize="large", 
                            blockSize="large")
        
        cmds.headsUpDisplay("HUD_Camera", section=7, block=0, label="Camera:",
                            dataFontSize="large", 
                            labelFontSize="large", 
                            blockSize="large", 
                            command=cls.__camera__, attachToRefresh=True)
        
        cmds.headsUpDisplay("HUD_Frame", section=9, block=0, label="Frame:",
                            dataFontSize="large", 
                            labelFontSize="large", 
                            blockSize="large", 
                            command=cls.__frame__, attachToRefresh=True)
    
    @classmethod
    def __clearHUD__(cls):
        for i in range(0, 10):
            cmds.headsUpDisplay(rp=[i,0])
        
    @classmethod
    def __frame__(cls):
        start = cmds.playbackOptions(q=True, min=True)
        end = cmds.playbackOptions(q=True, max=True)
        return "%d(%d-%d)"%(cmds.currentTime(q=True), start, end)
    
    @classmethod
    def __file__(cls):
        return cmds.file(q=1, sn=1, shn=1).split(".")[0]
    
    @classmethod
    def __animator__(cls):
        if cmds.optionVar(exists="PutaoTools_HUD_Animator"):
            return cmds.optionVar(q="PutaoTools_HUD_Animator")
        else:
            import getpass
            return getpass.getuser()
        
    @classmethod
    def __check__(cls):
        sf = config.getConfig("startFrame")
        ast = int(cmds.playbackOptions(q=1, ast=1))
        aet = int(cmds.playbackOptions(q=1, aet=1))
        mint = int(cmds.playbackOptions(q=1, min=1))
        maxt = int(cmds.playbackOptions(q=1, max=1))
        if sf != ast:
            cmds.displayColor("headsUpDisplayLabels", 13)
            cmds.displayColor("headsUpDisplayValues", 16)
            return u"警告：初始帧不是第%s帧"%sf
        
        if len(cmds.ls(type='animLayer'))>1:
            cmds.displayColor("headsUpDisplayLabels", 13)
            cmds.displayColor("headsUpDisplayValues", 16)
            return u"警告：侦测到动画层信息"
        
        if len(cmds.ls(type='audio'))>1:
            cmds.displayColor("headsUpDisplayLabels", 17)
            cmds.displayColor("headsUpDisplayValues", 16)
            return u"提示：侦测到多重音轨"
        
        if ast != mint or aet != maxt:
            cmds.displayColor("headsUpDisplayLabels", 17)
            cmds.displayColor("headsUpDisplayValues", 16)
            return u"提示：侦测到时间轴未最大化"
            
        cmds.displayColor("headsUpDisplayLabels", 14)
        cmds.displayColor("headsUpDisplayValues", 16)
        return ""
    
    @classmethod
    def __camera__(cls):
        panel = cmds.playblast(activeEditor=True).split("|")[-1]
        camera = cmds.modelPanel(panel, q=True, camera=True)
        cameraShape = cmds.listRelatives(camera, shapes=True)
        if cameraShape: camera = cameraShape[0]
        focalLength = cmds.getAttr(camera+".focalLength")
        return "%s/%.1f"%(cmds.modelPanel(panel, q=True, camera=True), focalLength)
    
    @classmethod
    def __time__(cls):
        import datetime
        now = datetime.datetime.now()
        return now.strftime('%Y-%m-%d')