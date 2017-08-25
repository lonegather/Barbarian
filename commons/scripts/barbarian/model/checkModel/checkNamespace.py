#!/usr/local/bin/python2.7
# encoding: utf-8

from maya import cmds

class CheckNamespace():
	def __init__(self, state = 0):
		
		self.state = state

	def listNamespaces(self):

		cmds.namespace(set = ':')

		nameSpaces = cmds.namespaceInfo(lon = True)

		[nameSpaces.remove(name) for name in ['UI', 'shared']]

		if nameSpaces:
			self.state = 1
		else:
			self.state = 0 