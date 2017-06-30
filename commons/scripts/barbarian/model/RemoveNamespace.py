import maya.cmds as mc

def RemoveNamespace():
    nameSpaces = mc.namespaceInfo(lon = True)
    
    for name in ['UI', 'shared']:
        nameSpaces.remove(name) 
    
    while nameSpaces:
        for names in nameSpaces:
            removeNamespace = mc.namespace(mergeNamespaceWithRoot = True, removeNamespace = names)
        mc.namespace(setNamespace = ":")
        nameSpaces = mc.namespaceInfo(lon = True)
        for name in ['UI', 'shared']:
            nameSpaces.remove(name) 
            
            
    amount = 0
    
    mc.progressWindow(    title="进度",
                                            progress=amount,
                                            status="progress: 0%",
                                            isInterruptable=True )
    while True :
            if mc.progressWindow( query=True, isCancelled=True ) :
                    break
    
            if mc.progressWindow( query=True, progress=True ) >= 1 :
                    break
    
            amount += 1
    
            mc.progressWindow( edit=True, progress=amount, status=('progress: ' + `amount` + '%' ) )
    
    
    mc.progressWindow(endProgress=1)
    
    mc.confirmDialog( title=u'提示', message=u'NameSpace已清理完毕', button=['OK'], defaultButton='OK' )
