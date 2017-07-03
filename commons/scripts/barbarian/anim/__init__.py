from pymel.core import *
from barbarian.utils import *


def cmdCameraOperation(option):
    if option == "create":
        pass
    elif option == "lock":
        pass
    elif option == "delete":
        pass


class PlayblastOption():
    
    win = "playblastOptionDialog"
    textField = "playblastNameInput"
    defaultCB = "playblastCBDefault"
    
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
      
    @classmethod
    def changeHUDName(cls, pb=False):
        name = textField(cls.textField, q=True, tx=True)
        if checkBox(cls.defaultCB, q=True, value=True):
            optionVar(remove="PutaoTools_HUD_Animator")
        else:
            optionVar(sv=("PutaoTools_HUD_Animator", name))
            
        if pb: cls.playblast()
        
    @classmethod
    def refreshUI(cls):
        if checkBox(cls.defaultCB, q=True, value=True): 
            textField(cls.textField, e=True, enable=False)
        else: 
            textField(cls.textField, e=True, enable=True)
    
    @classmethod
    def playblast(cls):
        mel.eval("pyPBMpeg")


def cmdKeyframe():
    try: offset = int(textField("animOffsetInput", q=True, tx=True))
    except:
        confirmDialog(message=u'请输入有效数值：负值为向左移动，正值为向右移动',ma="center", 
                      icon="information", title=u"", button=['Confirm'], defaultButton='Confirm')
        return
    
    animCurves = []
    for ac in ls(type="animCurveTL"): animCurves.append(ac)
    for ac in ls(type="animCurveTA"): animCurves.append(ac)
    for ac in ls(type="animCurveTU"): animCurves.append(ac)
    
    if not len(animCurves): 
        confirmDialog(message=u'未找到关键帧信息',ma="center", 
                      icon="information", title=u"", button=['Confirm'], defaultButton='Confirm')
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

