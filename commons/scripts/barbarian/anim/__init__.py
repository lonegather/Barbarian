#!/usr/local/bin/python2.7
# encoding: utf-8

from maya import cmds, mel


def snapWorld():
    sels = cmds.ls(sl=True)
    if not sels: return
    tc = mel.eval('$tmpVar=$gPlayBackSlider')
    tcRange = range(*[int(num) for num in cmds.timeControl(tc, q=True, rangeArray=True)])
    if len(tcRange) == 1: tcRange.append(tcRange[0]+1)
    
    for sel in sels:
        cmds.currentTime(tcRange[0])
        cmds.setKeyframe(sel, shape=False)
        tw = cmds.xform(sel, q=True, worldSpace=True, translation=True)
        rw = cmds.xform(sel, q=True, worldSpace=True, rotation=True)
        for ct in tcRange[1:]:
            cmds.currentTime(ct)
            try: cmds.xform(sel, translation=tw, worldSpace=True)
            except: pass
            try: cmds.xform(sel, rotation=rw, worldSpace=True)
            except: pass
            cmds.setKeyframe(sel, shape=False)
    
    cmds.currentTime(tcRange[-1])
    cmds.timeControl(tc, e=True, forceRefresh=True)


def softClusterLaunch():
    import SoftClusterEX
    SoftClusterEX.launch()


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

