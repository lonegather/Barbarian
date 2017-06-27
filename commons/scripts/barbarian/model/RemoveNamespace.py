import pymel.core as pm

def RemoveNamespace():
    nameSpaces = pm.namespaceInfo(lon = True)
    
    for name in ['UI', 'shared']:
        nameSpaces.remove(name) 
    
    while nameSpaces:
        for names in nameSpaces:
            removeNamespace = pm.namespace(mergeNamespaceWithRoot = True, removeNamespace = names)
        pm.namespace(setNamespace = ":")
        nameSpaces = pm.namespaceInfo(lon = True)
        for name in ['UI', 'shared']:
            nameSpaces.remove(name) 
