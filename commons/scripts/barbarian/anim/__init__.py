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
    
    select(animCurves, r=True)
    keyframe(edit=True, relative=True, timeChange=offset)
    select(clear=True)
    
    tc = mel.eval("$tmpVar = $gPlayBackSlider;")
    sound = timeControl(tc, q=True, sound=True)
    if sound: setAttr(sound+".offset", getAttr(sound+".offset")+offset)

