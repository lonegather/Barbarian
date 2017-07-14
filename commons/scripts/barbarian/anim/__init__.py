#!/usr/local/bin/python2.7
# encoding: utf-8

from maya.cmds import *
from maya import mel
from barbarian.utils import getPath, getConfig, kUI, kBinary
import os, sys

class PlayblastOption():
    
    win = "playblastOptionDialog"
    textField = "playblastNameInput"
    defaultCB = "playblastCBDefault"
    HUDCB = "playblastCBHUD"
    
    @classmethod
    def UI(cls):
        if window(cls.win, exists=True): deleteUI(cls.win)
        loadUI(f=getPath(kUI, "playblastoption.ui"))
        showWindow(cls.win)
        if not optionVar(exists="PutaoTools_HUD_Animator"):
            checkBox(cls.defaultCB, e=True, value=True)
            textField(cls.textField, e=True, enable=False)
        else:
            checkBox(cls.defaultCB, e=True, value=False)
            textField(cls.textField, e=True, tx=optionVar(q="PutaoTools_HUD_Animator"))
            
        if (not optionVar(exists="PutaoTools_HUD_Padding")) or optionVar(q="PutaoTools_HUD_Padding"):
            checkBox(cls.HUDCB, e=True, value=True)
            optionVar(iv=("PutaoTools_HUD_Padding", 120))
        else: checkBox(cls.HUDCB, e=True, value=False)
      
    @classmethod
    def changeHUD(cls, pb=False):
        name = textField(cls.textField, q=True, tx=True)
        if checkBox(cls.defaultCB, q=True, value=True):
            optionVar(remove="PutaoTools_HUD_Animator")
        else:
            optionVar(sv=("PutaoTools_HUD_Animator", name))
            
        if checkBox(cls.HUDCB, q=True, value=True):
            optionVar(iv=("PutaoTools_HUD_Padding", 120))
        else:
            optionVar(iv=("PutaoTools_HUD_Padding", 0))
            
        if pb: cls.playblast()
        
    @classmethod
    def refreshUI(cls):
        if checkBox(cls.defaultCB, q=True, value=True): 
            textField(cls.textField, e=True, enable=False)
        else: 
            textField(cls.textField, e=True, enable=True)
    
    @classmethod
    def playblast(cls):
        
        fullPath = file(q=1, exn=1)
        fileName = file(q=1, sn=1, shn=1)
        
        try: fullPath.decode("utf-8")
        except:
            confirmDialog(message=u'请勿使用中文路径或文件名',ma="center", 
                      icon="information", title=u"PuTao")
            return
        
        if fileName == '' :
            confirmDialog(message=u'文件未保存',ma="center", 
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
        soundObj = timeControl(soundTmp, q=1, sound=1)
        
        startFrame = playbackOptions(q=1, minTime=1)
        endFrame = playbackOptions(q=1, maxTime=1)
        
        panel = playblast(activeEditor=True).split("|")[-1]
        currentCam = modelPanel(panel, q=True, camera=True)
        cam = listRelatives(currentCam)[0]
        
        padding = 0
        if (not optionVar(exists="PutaoTools_HUD_Padding")) or optionVar(q="PutaoTools_HUD_Padding"):
            optionVar(iv=("PutaoTools_HUD_Padding", 120))
            padding = optionVar(q="PutaoTools_HUD_Padding")
            setAttr(cam+".displayFilmGate", 0)
            setAttr(cam+".displayResolution", 1)
            setAttr(cam+".displayGateMask", 1)
            setAttr(cam+".displayGateMaskOpacity", 1.0)
            setAttr(cam+".displayGateMaskColor",0.0,0.0,0.0,type='double3')
            setAttr(cam+".displaySafeAction", 1)
            setAttr(cam+".overscan", 1)
            setAttr(cam+".filmFit", 1)
            
            select(clear=True)
        
        setAttr("%s.width"%ls(renderResolutions=True)[0], getConfig(camResX=True))
        setAttr("%s.height"%ls(renderResolutions=True)[0], getConfig(camResY=True))
        ha = getAttr(cam+".verticalFilmAperture")
        ar = float(getConfig(camResX=True))/float(getConfig(camResY=True))
        setAttr(cam+".horizontalFilmAperture", lock=False)
        setAttr(cam+".horizontalFilmAperture", ha*ar)
        setAttr("%s.deviceAspectRatio"%ls(renderResolutions=True)[0], ar)
        
        cls.__makeHUD__()
        
        try:
            if soundObj :
                playblastFile = playblast(sound=soundObj, combineSound=True,
                                          st=startFrame, et=endFrame, 
                                          widthHeight=[getConfig(camResX=True), getConfig(camResY=True)+padding], 
                                          percent=getConfig(playblastScale=True), 
                                          filename=videoPath, forceOverwrite=True, 
                                          format='avi', compression='none', quality=100, 
                                          clearCache=True, viewer=False, showOrnaments=True, offScreen=False)
            else :
                playblastFile = playblast(st=startFrame, et=endFrame, 
                                          widthHeight=[getConfig(camResX=True), getConfig(camResY=True)+padding], 
                                          percent=getConfig(playblastScale=True), 
                                          filename=videoPath, forceOverwrite=True, 
                                          format='avi', compression='none', quality=100, 
                                          clearCache=True, viewer=False, showOrnaments=True, offScreen=False)
        except: 
            cls.__clearHUD__()
            setAttr(cam+".filmFit", getConfig(camFilmFit=True))
            return
        
        cls.__clearHUD__()
        setAttr(cam+".filmFit", getConfig(camFilmFit=True))
        
        if playblastFile:    
            mp = getPath(kBinary, "ffmpeg")
            resultCmd = r'%s -i "%s" -vcodec "mpeg4" -y -qscale 0 "%s"' % (mp, os.path.abspath(playblastFile), os.path.abspath(videoOutPath))
            os.system(unicode(resultCmd))
            os.system(r'explorer "%s"' % os.path.abspath(videoOutPath))
            os.remove(playblastFile)

        currentTime(startFrame)
        
    @classmethod
    def __makeHUD__(cls):
        cls.__clearHUD__()
        
        headsUpDisplay("HUD_Time", section=0, block=0, label="Date:",
                       dataFontSize="large", 
                       labelFontSize="large", 
                       blockSize="large", 
                       command=cls.__time__, attachToRefresh=True)
        
        headsUpDisplay("HUD_File", section=2, block=0, label="",
                       dataFontSize="large", 
                       labelFontSize="large", 
                       blockSize="large", 
                       command=cls.__file__, attachToRefresh=True)
        
        headsUpDisplay("HUD_Animator", section=4, block=0, label="Animator:",
                       dataFontSize="large", 
                       labelFontSize="large", 
                       blockSize="large", 
                       command=cls.__animator__, attachToRefresh=True)
        
        headsUpDisplay("HUD_Camera", section=7, block=0, label="Camera:",
                       dataFontSize="large", 
                       labelFontSize="large", 
                       blockSize="large", 
                       command=cls.__camera__, attachToRefresh=True)
        
        headsUpDisplay("HUD_Frame", section=9, block=0, label="Frame:",
                       dataFontSize="large", 
                       labelFontSize="large", 
                       blockSize="large", 
                       command=cls.__frame__, attachToRefresh=True)
    
    @classmethod
    def __clearHUD__(cls):
        for i in range(0, 10):
            headsUpDisplay(rp=[i,0])
        
    @classmethod
    def __frame__(cls):
        start = playbackOptions(q=True, min=True)
        end = playbackOptions(q=True, max=True)
        return "%d(%d-%d)"%(currentTime(q=True), start, end)
    
    @classmethod
    def __animator__(cls):
        if optionVar(exists="PutaoTools_HUD_Animator"):
            return optionVar(q="PutaoTools_HUD_Animator")
        else:
            import getpass
            return getpass.getuser()
        
    @classmethod
    def __file__(cls):
        return file(q=1, sn=1, shn=1).split(".")[0]
    
    @classmethod
    def __camera__(cls):
        panel = playblast(activeEditor=True).split("|")[-1]
        camera = modelPanel(panel, q=True, camera=True)
        cameraShape = listRelatives(camera, shapes=True)
        if cameraShape: camera = cameraShape[0]
        focalLength = getAttr(camera+".focalLength")
        return "%s/%s"%(modelPanel(panel, q=True, camera=True), focalLength)
    
    @classmethod
    def __time__(cls):
        import datetime
        now = datetime.datetime.now()
        return now.strftime('%Y-%m-%d')


def cmdKeyframe():
    try: offset = int(textField("animOffsetInput", q=True, tx=True))
    except:
        confirmDialog(message=u'请输入有效数值：负值为向左移动，正值为向右移动', 
                      icon="information", title=u"PuTao")
        return
    
    animCurves = []
    for ac in ls(type="animCurveTL"): animCurves.append(ac)
    for ac in ls(type="animCurveTA"): animCurves.append(ac)
    for ac in ls(type="animCurveTU"): animCurves.append(ac)
    
    if not len(animCurves): 
        confirmDialog(message=u'未找到关键帧信息', icon="information", title=u"PuTao")
        return
    
    progressWindow(title=u"进度", status=u"处理中...")
    progressWindow(e=True, progress=0, max=len(animCurves))
    
    for ac in animCurves:
        select(ac, r=True)
        keyframe(edit=True, relative=True, timeChange=offset)
        progressWindow(e=True, step=1)
        
    select(clear=True)
    progressWindow(endProgress=1)
    
    tc = mel.eval("$tmpVar = $gPlayBackSlider;")
    sound = timeControl(tc, q=True, sound=True)
    if sound: setAttr(sound+".offset", getAttr(sound+".offset")+offset)

