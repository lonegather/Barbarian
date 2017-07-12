from maya import cmds

def RemoveNamespace():
    nameSpaces = cmds.namespaceInfo(lon = True)
    
    for name in ['UI', 'shared']:
        nameSpaces.remove(name) 
    
    cmds.progressWindow(title=u"进度", status=u"清理中...")
    
    while nameSpaces:
        cmds.progressWindow(e=True, progress=0, max=len(nameSpaces))
        for name in nameSpaces:
            cmds.namespace(mergeNamespaceWithRoot = True, removeNamespace = name)
            cmds.progressWindow(e=True, step=1)
        cmds.namespace(setNamespace = ":")
        nameSpaces = cmds.namespaceInfo(lon = True)
        for name in ['UI', 'shared']:
            nameSpaces.remove(name) 
    
    cmds.pause(sec=1)
    cmds.progressWindow(endProgress=1)
    cmds.confirmDialog( title=u'完成', message=u'NameSpace已清理完毕', button=['OK'], defaultButton='OK' )
