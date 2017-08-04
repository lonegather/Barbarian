#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.7.10

@author: Sam
'''

from maya import cmds

def doIt(rl=False):
    if rl: 
        cmds.optionVar(rm="PutaoTools_Project")
        currentMode = cmds.setMenuMode()
        cmds.setMenuMode(currentMode)
    
    try: 
        import barbarian.utils
        if rl: reload(barbarian.utils)
        import barbarian.utils.ui
        if rl: 
            barbarian.utils.ui.QtUI.cleanUp()
            reload(barbarian.utils.ui)
        import barbarian.utils.config
        if rl: reload(barbarian.utils.config)
        
        import barbarian.cgtw
        if rl: reload(barbarian.cgtw)
        
        import barbarian.model
        if rl: reload(barbarian.model)
        import barbarian.model.renamer
        if rl: reload(barbarian.model.renamer)
        import barbarian.model.checkModel
        if rl: reload(barbarian.model.checkModel)
        import barbarian.model.RemoveNamespace
        if rl: reload(barbarian.model.RemoveNamespace)
        
        import barbarian.rig
        if rl: reload(barbarian.rig)
        import barbarian.rig.copySkin
        if rl: reload(barbarian.rig.copySkin)
        import barbarian.rig.blendShapeMel.blendShapeManage
        if rl: reload(barbarian.rig.blendShapeMel.blendShapeManage)
        
        import barbarian.anim
        if rl: reload(barbarian.anim)
        import barbarian.anim.motionLib
        if rl: reload(barbarian.anim.motionLib)
        import barbarian.anim.CreateProjectCamera
        if rl: reload(barbarian.anim.CreateProjectCamera)
        import barbarian.anim.poseLibModule
        if rl: reload(barbarian.anim.poseLibModule)
        
        import barbarian.render
        if rl: reload(barbarian.render)
        import barbarian.render.selectObjectType
        if rl: reload(barbarian.render.selectObjectType)
        import barbarian.render.AttributeSetter
        if rl: reload(barbarian.render.AttributeSetter)
        import barbarian.render.RenderSetting
        if rl: reload(barbarian.render.RenderSetting)
        
        import barbarian.fx
        if rl: reload(barbarian.fx)
        
        import SoftClusterEX
        if rl: reload(SoftClusterEX)
        
    except Exception, e: cmds.confirmDialog(message=u'加载异常：%s'%e, title=u"PuTao", icon="critical")
    
    if rl: reload(barbarian.reloader)
