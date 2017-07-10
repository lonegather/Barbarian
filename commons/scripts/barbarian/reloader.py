'''
Created on 2017.7.10

@author: Sam
'''

import pymel.core as pm

try: 
    import barbarian.utils
    reload(barbarian.utils)
    import barbarian.model
    reload(barbarian.model)
    import barbarian.model.checkModel
    reload(barbarian.model.checkModel)
    import barbarian.model.RemoveNamespace
    reload(barbarian.model.RemoveNamespace)
    import barbarian.rig
    reload(barbarian.rig)
    import barbarian.rig.copySkin
    reload(barbarian.rig.copySkin)
    import barbarian.rig.blendShapeMel.blendShapeManage
    reload(barbarian.rig.blendShapeMel.blendShapeManage)
    import barbarian.anim
    reload(barbarian.anim)
    import barbarian.anim.motionLib
    reload(barbarian.anim.motionLib)
    import barbarian.anim.CreateProjectCamera
    reload(barbarian.anim.CreateProjectCamera)
    import barbarian.render
    reload(barbarian.render)
    import barbarian.render.selectObjectType
    reload(barbarian.render.selectObjectType)
    import barbarian.fx
    reload(barbarian.fx)
except Exception, e: pm.confirmDialog(message=u'加载异常：%s'%e, title=u"PuTao", icon="critical")
