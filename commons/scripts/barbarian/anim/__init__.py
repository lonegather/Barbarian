from pymel.core import *

def cmdPlayblast():
    print "playblast"
    pass


def cmdKeyframe():
    offset = int(textField("animOffsetInput", q=True, tx=True))
    
    animCurves = []
    for ac in ls(type="animCurveTL"): animCurves.append(ac)
    for ac in ls(type="animCurveTA"): animCurves.append(ac)
    for ac in ls(type="animCurveTU"): animCurves.append(ac)
    
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

