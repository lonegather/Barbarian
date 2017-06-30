import pymel.core as pm

def cmdPlayblast():
    print "playblast"
    pass


def cmdKeyframe():
    offset = int(textField("animOffsetInput", q=True, tx=True))
    
    animCurves = []
    for ac in pm.ls(type="animCurveTL"): animCurves.append(ac)
    for ac in pm.ls(type="animCurveTA"): animCurves.append(ac)
    for ac in pm.ls(type="animCurveTU"): animCurves.append(ac)
    
    pm.select(animCurves, r=True)
    pm.keyframe(edit=True, relative=True, timeChange=offset)
    pm.select(clear=True)
    
    tc = mel.eval("$tmpVar = $gPlayBackSlider;")
    sound = pm.timeControl(tc, q=True, sound=True)
    if sound: pm.setAttr(sound+".offset", pm.getAttr(sound+".offset")+offset)

