#!/usr/local/bin/python2.7
# encoding: utf-8

from maya import cmds, mel


def snapWorld():
    sels = cmds.ls(sl=True)
    if not sels: return
    tc = mel.eval('$tmpVar=$gPlayBackSlider')
    tcRange = range(*[int(num) for num in cmds.timeControl(tc, q=True, rangeArray=True)])
    if len(tcRange) == 1: tcRange.append(tcRange[0]+1)
    
    sel = sels[-1]
    cmds.currentTime(tcRange[0])
    cmds.autoKeyframe(state=True)
    __keyFrameTransform__(sel, False)
    tw = cmds.xform(sel, q=True, worldSpace=True, translation=True)
    rw = cmds.xform(sel, q=True, worldSpace=True, rotation=True)
    
    if len(sels) == 1:
        for ct in tcRange[1:]:
            cmds.currentTime(ct)
            try: cmds.xform(sel, translation=tw, worldSpace=True)
            except: pass
            try: cmds.xform(sel, rotation=rw, worldSpace=True)
            except: pass
            __keyFrameTransform__(sel)
        __keyFrameTransform__(sel, False)
    else:
        try: cmds.parentConstraint(sels, name='snapTargetParentConstraint', maintainOffset=True)
        except: 
            cmds.headsUpMessage(u'对象属性被锁定，无法吸附目标', time=1)
            return
        for ct in tcRange[1:]:
            cmds.currentTime(ct)
            __keyFrameTransform__(sel)
        __keyFrameTransform__(sel, False)
        cmds.delete('snapTargetParentConstraint')
            
    cmds.currentTime(tcRange[-1])
    cmds.timeControl(tc, e=True, forceRefresh=True)
    

def __keyFrameTransform__(sel, bd=True):
    for attr in ['translateX','translateY','translateZ','rotateX','rotateY','rotateZ']:
        try: cmds.setKeyframe(sel, attribute=attr, shape=False, breakdown=bd)
        except: continue
    


def softClusterLaunch():
    import SoftClusterEX
    SoftClusterEX.launch()


def cmdKeyframe(val=None):
    try: 
        if val != None: offset = val
        else: offset = int(cmds.textField("animOffsetInput", q=True, tx=True))
        if not offset: return
    except:
        cmds.headsUpMessage(u'请输入有效数值：负值为向左移动，正值为向右移动', time=3)
        return
    
    animCurves = []
    for ac in cmds.ls(type="animCurveTL"): animCurves.append(ac)
    for ac in cmds.ls(type="animCurveTA"): animCurves.append(ac)
    for ac in cmds.ls(type="animCurveTU"): animCurves.append(ac)
    
    if not len(animCurves): 
        if val == None: cmds.headsUpMessage(u'未找到关键帧信息', time=3)
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

