#!/usr/local/bin/python2.7
# encoding: utf-8

from maya import cmds
from maya import mel
from barbarian.utils import ui, getPath, getConfig, kUI, kBinary
import os, sys


def UI(*_):
    PlayblastOption("playblastoption",
                    textField = "playblastNameInput",
                    defaultCB = "playblastCBDefault",
                    HUDCB = "playblastCBHUD")


class PlayblastOption(ui.QtUI):
    def __init__(self, uiFile, **info):
        ui.QtUI.__init__(self, uiFile, **info)
        
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
        
    def refreshUI(self):
        if cmds.checkBox(self.defaultCB, q=True, value=True): 
            cmds.textField(self.textField, e=True, enable=False)
        else: 
            cmds.textField(self.textField, e=True, enable=True)
    
    @classmethod
    def playblast(cls):
        
        fullPath = cmds.file(q=1, exn=1)
        fileName = cmds.file(q=1, sn=1, shn=1)
        
        try: fullPath.decode("utf-8")
        except:
            cmds.confirmDialog(message=u'请勿使用中文路径或文件名',ma="center", 
                      icon="information", title=u"PuTao")
            return
        
        if fileName == '' :
            cmds.confirmDialog(message=u'文件未保存',ma="center", 
                      icon="information", title=u"PuTao")
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
        cam = cmds.listRelatives(currentCam)[0]
        
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
        
        cmds.setAttr("%s.width"%cmds.ls(renderResolutions=True)[0], getConfig(camResX=True))
        cmds.setAttr("%s.height"%cmds.ls(renderResolutions=True)[0], getConfig(camResY=True))
        ha = cmds.getAttr(cam+".verticalFilmAperture")
        ar = float(getConfig(camResX=True))/float(getConfig(camResY=True))
        cmds.setAttr(cam+".horizontalFilmAperture", lock=False)
        cmds.setAttr(cam+".horizontalFilmAperture", ha*ar)
        cmds.setAttr("%s.deviceAspectRatio"%cmds.ls(renderResolutions=True)[0], ar)
        
        cls.__makeHUD__()
        
        try:
            if soundObj :
                playblastFile = cmds.playblast(sound=soundObj, combineSound=True,
                                               st=startFrame, et=endFrame, 
                                               widthHeight=[getConfig(camResX=True), getConfig(camResY=True)+padding], 
                                               percent=getConfig(playblastScale=True), 
                                               filename=videoPath, forceOverwrite=True, 
                                               format='avi', compression='none', quality=100, 
                                               clearCache=True, viewer=False, showOrnaments=True, offScreen=False)
            else :
                playblastFile = cmds.playblast(st=startFrame, et=endFrame, 
                                               widthHeight=[getConfig(camResX=True), getConfig(camResY=True)+padding], 
                                               percent=getConfig(playblastScale=True), 
                                               filename=videoPath, forceOverwrite=True, 
                                               format='avi', compression='none', quality=100, 
                                               clearCache=True, viewer=False, showOrnaments=True, offScreen=False)
        except: 
            cls.__clearHUD__()
            cmds.setAttr(cam+".filmFit", getConfig(camFilmFit=True))
            return
        
        cls.__clearHUD__()
        cmds.setAttr(cam+".filmFit", getConfig(camFilmFit=True))
        
        if playblastFile:    
            mp = getPath(kBinary, "ffmpeg")
            resultCmd = r'%s -i "%s" -vcodec "mpeg4" -y -qscale 0 "%s"' % (mp, os.path.abspath(playblastFile), os.path.abspath(videoOutPath))
            os.system(unicode(resultCmd))
            os.system(r'explorer "%s"' % os.path.abspath(videoOutPath))
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
    def __animator__(cls):
        if cmds.optionVar(exists="PutaoTools_HUD_Animator"):
            return cmds.optionVar(q="PutaoTools_HUD_Animator")
        else:
            import getpass
            return getpass.getuser()
        
    @classmethod
    def __file__(cls):
        return cmds.file(q=1, sn=1, shn=1).split(".")[0]
    
    @classmethod
    def __camera__(cls):
        panel = cmds.playblast(activeEditor=True).split("|")[-1]
        camera = cmds.modelPanel(panel, q=True, camera=True)
        cameraShape = cmds.listRelatives(camera, shapes=True)
        if cameraShape: camera = cameraShape[0]
        focalLength = cmds.getAttr(camera+".focalLength")
        return "%s/%s"%(cmds.modelPanel(panel, q=True, camera=True), focalLength)
    
    @classmethod
    def __time__(cls):
        import datetime
        now = datetime.datetime.now()
        return now.strftime('%Y-%m-%d')


def cmdKeyframe():
    try: offset = int(cmds.textField("animOffsetInput", q=True, tx=True))
    except:
        cmds.confirmDialog(message=u'请输入有效数值：负值为向左移动，正值为向右移动', 
                           icon="information", title=u"PuTao")
        return
    
    animCurves = []
    for ac in cmds.ls(type="animCurveTL"): animCurves.append(ac)
    for ac in cmds.ls(type="animCurveTA"): animCurves.append(ac)
    for ac in cmds.ls(type="animCurveTU"): animCurves.append(ac)
    
    if not len(animCurves): 
        cmds.confirmDialog(message=u'未找到关键帧信息', icon="information", title=u"PuTao")
        return
    
    cmds.progressWindow(title=u"进度", status=u"处理中...")
    cmds.progressWindow(e=True, progress=0, max=len(animCurves))
    
    for ac in animCurves:
        cmds.select(ac, r=True)
        cmds.keyframe(edit=True, relative=True, timeChange=offset)
        cmds.progressWindow(e=True, step=1)
        
    cmds.select(clear=True)
    cmds.progressWindow(endProgress=1)
    
    tc = mel.eval("$tmpVar = $gPlayBackSlider;")
    sound = cmds.timeControl(tc, q=True, sound=True)
    if sound: cmds.setAttr(sound+".offset", cmds.getAttr(sound+".offset")+offset)

