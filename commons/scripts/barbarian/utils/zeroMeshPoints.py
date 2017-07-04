import pymel.core as pm

def run():

	objs = pm.ls(type='mesh')

	meshList = []

	for obj in objs:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
	    par = pm.listRelatives(obj, p = True)[0]

	    if par not in meshList:

	        meshList.append(par)
	        
	for mesh in meshList:

	    pm.polyMoveVertex('%s.vtx[*]'%mesh, constructionHistory = 1, random = 0)
	    
	pm.select(cl = True)