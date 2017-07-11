'''
Created on 2017.7.10

@author: Sam
'''

import pymel.core as pm

def doIt(rl=False):
    pm.optionVar(rm="PutaoTools_Project")
    
    try: 
        import barbarian.utils
        if rl: reload(barbarian.utils)
        import barbarian.model
        if rl: reload(barbarian.model)
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
        import barbarian.render
        if rl: reload(barbarian.render)
        import barbarian.render.selectObjectType
        if rl: reload(barbarian.render.selectObjectType)
        import barbarian.fx
        if rl: reload(barbarian.fx)
    except Exception, e: pm.confirmDialog(message=u'加载异常：%s'%e, title=u"PuTao", icon="critical")
    
    reload(barbarian.reloader)
