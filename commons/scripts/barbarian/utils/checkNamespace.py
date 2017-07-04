import pymel.core as pm

class CheckNamespace():
	def __init__(self, state = 0):
		
		self.state = state

	def listNamespaces(self):

		pm.namespace(set = ':')

		nameSpaces = pm.namespaceInfo(lon = True)

		[nameSpaces.remove(name) for name in ['UI', 'shared']]

		if nameSpaces:
			self.state = 1
		else:
			self.state = 0 