#!/usr/local/bin/python2.7
# encoding: utf-8

from maya import cmds

def run():
	objs = cmds.ls(type='mesh')
	meshList = []
	for obj in objs:
		par = cmds.listRelatives(obj, p = True)[0]
		if par not in meshList:
			meshList.append(par)
	for mesh in meshList:
		cmds.polyMoveVertex('%s.vtx[*]'%mesh, constructionHistory = 1, random = 0)
	cmds.select(cl = True)