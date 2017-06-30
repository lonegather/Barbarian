import maya.cmds as mc

def RemoveNamespace():
    nameSpaces = mc.namespaceInfo(lon = True)
    
    for name in ['UI', 'shared']:
        nameSpaces.remove(name) 
    
    mc.progressWindow(title=u"进度", status=u"清理中...")
    
    while nameSpaces:
        mc.progressWindow(e=True, progress=0, max=len(nameSpaces))
        for name in nameSpaces:
            mc.namespace(mergeNamespaceWithRoot = True, removeNamespace = name)
            mc.progressWindow(e=True, step=1)
        mc.namespace(setNamespace = ":")
        nameSpaces = mc.namespaceInfo(lon = True)
        for name in ['UI', 'shared']:
            nameSpaces.remove(name) 
    
    mc.pause(sec=1)
    mc.progressWindow(endProgress=1)
    mc.confirmDialog( title=u'完成', message=u'NameSpace已清理完毕', button=['OK'], defaultButton='OK' )
