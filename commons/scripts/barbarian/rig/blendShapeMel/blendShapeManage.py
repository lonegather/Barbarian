import maya.cmds as cmds
import maya.mel as mel
import maya.OpenMaya as mo
from maya.cmds import *


def blendShapeManage_version():
	version= 'version 1.3'
	return version
	
def meshShapeSel():
	meshShape_sel = cmds.ls(sl=True)	
	sel=[]
	BaseRelatives =cmds.listRelatives(meshShape_sel[0])

	if len(meshShape_sel) > 0 and cmds.nodeType(BaseRelatives[0]) == 'mesh' :
		return meshShape_sel[0]
	else:
		Warning = 'warning "there are no only referenced skinnced meshes in the scene" '
		mel.eval(Warning)
def meshOrig(meshNode):
	MeshOrigList=[]
	Mesh_Orig = cmds.listHistory(meshNode)
	for i in range(len(Mesh_Orig)):
		if cmds.nodeType(Mesh_Orig[i]) == 'mesh' :
			if 'Orig' in Mesh_Orig[i] :
				if Mesh_Orig[i] != None :
					if listConnections(Mesh_Orig[i]+'.worldMesh[0]',source=True) :        
						MeshOrigList.append(Mesh_Orig[i])
	return MeshOrigList


def blendShapeNode_ONOFF():
	BaseHistory =cmds.listHistory(cmds.textFieldGrp('meshShapeText',query =True,text=True))
	Nua = 0
	for i in BaseHistory:
		if cmds.nodeType(i) == 'blendShape' :
			Nua = 1

	return Nua


def blendShapeNode(MeshNode):	
	BaseHistory =cmds.listHistory(MeshNode)
	BlendShapeNode=[]
	for i in BaseHistory:
		if cmds.nodeType(i) != 'blendShape' :	
			pass

		else:
			BlendShapeNode.append(i)

	return BlendShapeNode

def blendShape_Node():	
	BlendShape_Node = blendShapeNode(cmds.textFieldGrp('meshShapeText',query =True,text=True))

	if BlendShape_Node.__len__() != 0:
		BlendShape_N = BlendShape_Node[0]
	else:
		BlendShape_N = ''

	return BlendShape_N

def Create_UI():
	cmds.columnLayout('')
	cmds.textFieldButtonGrp('newNameText',label='Name for new target:',cw3= (120 ,260,80),bl='Create',bc= lambda *args:CreateFinishtextFieldButton())
	cmds.text(label = 'Options',height = 20 )
	cmds.checkBox('HideBox',label='Hide skinned mesh during blendShape target creation' ,height = 20 , value =True)
	cmds.checkBox('CreateBox',label='Create blendShapeNode,if not existing', align='left' ,height = 20 , value =True)
	cmds.checkBox('ConnectBox',label='Connect target to blendShapeNode', align='center',height = 20 , value =True )
	cmds.checkBox('DeleteBox',label='Delete target', align='center',height = 20 , value =False )
	cmds.setParent('..')


def Clone_UI():
	cmds.columnLayout('',adj=True)
	TargetGoemerty = cmds.textFieldButtonGrp('TargetGoemerty',label='Target Goemerty:',tx=meshShapeSel(),cw3= (100 ,280,100),bl='Reload',bc= '',ed=False,eb=False)

	SourceGoemerty = cmds.textFieldButtonGrp('SourceGoemerty',label='Source Goemerty:',cw3= (100 ,280,100),bl='Reload')
	cmds.textFieldButtonGrp('SourceGoemerty',e=True,bc=lambda *args: loadText("SourceGoemerty"))
	cmds.button(label='Apply',c=lambda *args: creativeTargetClone())
	cmds.setParent('..')

def creativeTargetClone():
	TargetGoemerty = cmds.textFieldButtonGrp('TargetGoemerty',query=True,tx=True)
	SourceGoemerty = cmds.textFieldButtonGrp('SourceGoemerty',query=True,tx=True)
	creativeTarget_Clone(TargetGoemerty,SourceGoemerty)


def loadText(FieldButtonGrp):
	selObj= cmds.ls(sl=1)
	if len(selObj) > 0 :
		cmds.textFieldButtonGrp(FieldButtonGrp,edit=True,text=selObj[0])


def Edit_UI():
	cmds.columnLayout(adj=True)

	cmds.rowColumnLayout( numberOfColumns=3, columnWidth=[(1, 300), (2,23),(3, 100)] )

	cmds.text('availableText',l='Available blendShape target: ')
	cmds.text(l='')
	cmds.text('InbetweenText',l='Inbetween weight:')
	
	cmds.columnLayout()
	cmds.popupMenu(mm=True)
	cmds.menuItem(l ="Append",rp= "N",c= lambda *args: CreativeBlendShape().AppendTarget() and freshTargetBlendShape("append"))
	cmds.menuItem(l= "Delete",rp ="S",c= lambda *args: CreativeBlendShape().RemoveTarget() and freshTargetBlendShape("remove"))
	cmds.menuItem(l= "Gian",rp ="W",c= lambda *args: CreativeBlendShape().GainTarget())
	cmds.menuItem(l= "Rename",rp ="E",c= lambda *args: CreativeBlendShape().RenameTarget() and freshTargetBlendShape("append"))
	
	def cbTBS():
		inbetweenWieght(),getBlendShapeIndex()
	
	cmds.textScrollList('targetBlendShapeText',height =  200,width = 300,sc = cbTBS)

	cmds.setParent('..')

	cmds.text(l=' => ')

	cmds.columnLayout()
	text2 = cmds.textScrollList('targetInbetweenText',allowMultiSelection=True, height =  150,width = 100,sc=lambda *args:setBlendShape())
	cmds.floatField('InbetweenField',w=100,en=False)
	cmds.button( l='inputGeomTarget',c=lambda *args:CreativeBlendShape().inputGeomTarget())
	cmds.setParent( '..' )
	cmds.setParent( '..' )

	cmds.text(l= '',h=5)
	b2=cmds.button('EditFinsihButton',label = 'Edit',c=lambda *args: EditFinishButton(),width = 60)
	cmds.setParent('..')


	cmds.columnLayout()
	cmds.frameLayout( w= 425,label='In-between', collapsable = True,labelAlign='top', borderStyle='etchedIn',marginHeight =2,marginWidth =2 ,collapse =True )
	cmds.columnLayout(adj=1)
	cmds.checkBoxGrp('Inbetween',label='Add in-between target:',columnWidth=( 1, 160),of1=lambda *args:inbetweenBox(),on1=lambda *args:inbetweenBox())

	cmds.floatSliderGrp('InbetweenSlider',label ='In-between weight:', field= True,min= -10.00, max =10.00 ,pre =2, enable =False ,adj= 3 ,cw3=( 140, 80,200))
	cmds.button('EditAddbetweenButton',label = 'inbetweenEdit',c=lambda *args: inbetweenEditAddButton(), width = 50,enable=False)
	cmds.setParent( '..' )
	cmds.setParent( '..' )

	cmds.frameLayout( w= 425,label='Mirror Target', collapsable = True, labelAlign='top', borderStyle='etchedIn',marginHeight =2,marginWidth =2 ,collapse =True )
	cmds.columnLayout()
	cmds.textFieldButtonGrp('MirrorTargetText',label='          >>',cw3= (150 ,150,120),bl=' Mirror ',bc= lambda *args: CreativeBlendShape().MirrorBlendShape(0) and freshTargetBlendShape("append"))
	cmds.setParent( '..' )
	cmds.setParent( '..' )
#############################################	
	cmds.frameLayout( w= 425,label='Mirror>Target', collapsable = True, labelAlign='top', borderStyle='etchedIn',marginHeight =2,marginWidth =2 ,collapse =True )
	cmds.columnLayout()
	cmds.rowColumnLayout( numberOfColumns=3, columnWidth=[(1, 160), (2, 100), (3, 160)] )
	cmds.textField("targetField",tx="Target",en=0)
	cmds.text(l="       ==>>==")
	cmds.textField("sourceField",tx="Source",en=0)
	cmds.button(l="Target",c=lambda *args:editField("targetField"))
	cmds.text(l="")
	cmds.button(l="Source",c=lambda *args:editField("sourceField"))
	cmds.setParent( '..' )
	cmds.button(l="Apply",w=420,c=lambda *args: CreativeBlendShape().MirrorBlendShape(1))
	cmds.setParent( '..' )
	cmds.setParent( '..' )
##########################################	
	cmds.frameLayout( w= 425,label='BlendTwoAttr', collapsable = True, labelAlign='top', borderStyle='etchedIn',marginHeight =2,marginWidth =2 ,collapse =True )
	cmds.columnLayout()
	cmds.rowColumnLayout( numberOfColumns=3, columnWidth=[(1, 120), (2, 120), (3, 160)] )
	cmds.textField("target_1Field",tx="Target1",en=0)
	cmds.textField("target_2Field",tx="Target2",en=0)
	cmds.text(l="")	
	cmds.button(l="Target1",c=lambda *args:editField("target_1Field"))
	cmds.button(l="Target2",c=lambda *args:editField("target_2Field"))
	cmds.setParent( '..' )
	cmds.button(l="create",w=420,c=lambda *args:CreativeBlendShape().blendTwoAttrCreate())
	cmds.button(l="finish",w=420,c=lambda *args:CreativeBlendShape().blendTwoAttrConnect())

	cmds.setParent( '..' )
	cmds.setParent( '..' )
###################################################

	cmds.setParent( '..' )

def blendShapeManage():
	if cmds.window('blendShapeManage',exists=True):
		cmds.deleteUI('blendShapeManage')
	cmds.window('blendShapeManage',mb=True,t= 'blendShapeManage_'+blendShapeManage_version())
	cmds.menu(l='Eidt')
	cmds.menuItem(l='Append',c=lambda *args:CreativeBlendShape().AppendTarget() and freshTargetBlendShape("append"))
	cmds.menuItem(l='Delete',c=lambda *args:CreativeBlendShape().RemoveTarget() and freshTargetBlendShape("remove"))
	cmds.menuItem(l='Gain',c=lambda *args:CreativeBlendShape().GainTarget())
	cmds.menuItem(l='Rename',c= lambda *args:CreativeBlendShape().RenameTarget() and freshTargetBlendShape("append"))
	cmds.menuItem(l='RevertTarget',c= lambda *args:CreativeBlendShape().GainTarget_All_for())

	cmds.setParent('..')
	cmds.menu(l='help')
	cmds.menuItem(label= "GGHelp" )
	cmds.menuItem(d=True)
	cmds.menuItem(label ="Close",c =lambda *args:cmds.window('blendShapeManage',e=True,vis=0))
	cmds.menuItem(label =blendShapeManage_version())
	cmds.columnLayout('')
	cmds.rowColumnLayout( numberOfColumns=2, columnWidth=[(1, 300),(2,180)] )
	cmds.textFieldGrp('meshShapeText',label='BlendShape mesh',cw2 = (100,200),text=meshShapeSel() ,ed=False) 
	cmds.text(label='-> '+blendShape_Node())
	#cmds.button('buttonBlendShapeMesh',label = 'Reload',c='cmds.button(e=1,)' )
	cmds.setParent('..')

	form = cmds.formLayout()
	tabs = cmds.tabLayout(innerMarginWidth=5, innerMarginHeight=5)
	cmds.formLayout( form, edit=True, attachForm=((tabs, 'top', 0), (tabs, 'left', 0), (tabs, 'bottom', 0), (tabs, 'right', 0)) )
	cmds.columnLayout('child1')
	Create_UI()
	cmds.setParent( '..' )
	cmds.columnLayout('child2')
	Edit_UI()
	cmds.setParent( '..' )
	cmds.columnLayout('child3')
	Clone_UI()
	cmds.setParent( '..' )
	cmds.tabLayout( tabs,cc=lambda *args: freshTargetBlendShape("append"), edit=True,tabLabel=(('child1', 'Create'),('child2', 'Edit'),('child3', 'Clone')))
	cmds.setParent( '..' )

	#cmds.columnLayout('')
	#cmds.textField('', text=meshShapeSel() ,ed=False) 
	#cmds.setParent( '..' )	

	cmds.showWindow('blendShapeManage')
	cmds.window('blendShapeManage',edit=True,w=460,h=600)
	
def freshTargetBlendShape(temp):
	blendShapeMesh = cmds.textFieldGrp('meshShapeText',query =True,text=True) 
	#blendShapeNode(blendShapeMesh)
	indexIntS=[]	
	targetName = targetBlendShapeText()
	if temp == 'append':

		if blendShapeNode_ONOFF() == True:  	
			targetBlendShape=cmds.listAttr(blendShape_Node()+'.weight',multi=True)
			cmds.textScrollList('targetBlendShapeText',edit = True,removeAll = True)
			targetInt=cmds.blendShape(blendShape_Node(),query = True,wc=True)
			if targetInt > 0:
				for t in targetBlendShape:
					#TargetItem =InputTargetGroup(blendShapeNode(blendShapeMesh)[0],t)
					#inputTargetItem = cmds.getAttr(blendShapeNode(blendShapeMesh)[0]+'.inputTarget[0].inputTargetGroup[%d].inputTargetItem' %TargetItem,mi=True)
					#for i in inputTargetItem :
						#indexInt = (i-5000)/1000.0
						#indexIntS += indexInt

					cmds.textScrollList('targetBlendShapeText',edit=True,append= t)
			targetItems= cmds.textScrollList('targetBlendShapeText',query=True,ni= True)	
			cmds.text('availableText',edit=True ,l='Available blendShape target:'+str(targetItems))

	if temp == 'remove':	
		cmds.textScrollList('targetBlendShapeText',edit=True,ri= targetName)
		targetItems= cmds.textScrollList('targetBlendShapeText',query=True,ni= True)		
		cmds.text('availableText',edit=True ,l='Available blendShape target:'+str(targetItems))


def targetBlendShapeText():
	targetBlendShape_Text = cmds.textScrollList('targetBlendShapeText',query= True,selectItem=True)
	if targetBlendShape_Text == None:
		targetBlendShape ='None'
	else:
		targetBlendShape = targetBlendShape_Text[0].split('[')
		return targetBlendShape[0]

def getBlendShapeIndex():
	tragetBlendShapeList = cmds.textScrollList('targetBlendShapeText',q=True,sii = True)

	cmds.floatField('InbetweenField', e=True,v=tragetBlendShapeList[0])

def setBlendShape():
	blendShapeMesh = cmds.textFieldGrp('meshShapeText',query =True,text=True) 
	In = cmds.textScrollList('targetInbetweenText',query=True,si=True)
	tragetBlendShapeSel = targetBlendShapeText()
	#cmds.setAttr(blendShapeNode(blendShapeMesh)+'.'+tragetBlendShapeSel,float(In[0]))

		
def inbetweenEditAddButton():	
	buttonLebal = cmds.button('EditAddbetweenButton',query=True,label=True)
	if buttonLebal == 'inbetweenEdit':
		cmds.button('EditAddbetweenButton',edit=True,label='inbetweenAdd')
		CreativeBlendShape().EditBlendShape()
		cmds.floatSliderGrp('InbetweenSlider',edit=True,v=cmds.getAttr(blendShape_Node()+'.'+targetBlendShapeText()))

		#cmds.textScrollList('targetBlendShapeText',edit = True,enable = False)

	if buttonLebal == 'inbetweenAdd':
		cmds.button('EditAddbetweenButton',edit=True,label='inbetweenEdit')
		CreativeBlendShape().AddInbetweenBlendShape()
		#cmds.textScrollList('targetInbetweenText',edit = True,enable = True)
	

def inbetweenBox():
	if cmds.checkBoxGrp('Inbetween',query=True,v1=True) == 1:
		cmds.floatSliderGrp('InbetweenSlider',edit=True,enable =True)
		cmds.button('EditFinsihButton',edit=True,enable=False)
		cmds.button('EditAddbetweenButton',edit=True,enable=True)
		cmds.textScrollList('targetInbetweenText',edit=True,enable =False)

	else:
		cmds.floatSliderGrp('InbetweenSlider',edit=True,enable =False)
		cmds.button('EditFinsihButton',edit=True,enable=True)
		cmds.button('EditAddbetweenButton',edit=True,enable=False)
		cmds.textScrollList('targetInbetweenText',edit=True,enable =True)	

	#cmds.textScrollList('targetBlendShapeText',edit=True,enable =False)
	#cmds.textScrollList('targetInbetweenText',edit=True,enable =False)	


def inputTargetBlendShape(blendShape):
	inputTarget=cmds.listAttr(blendShape+'.inputTarget[0].inputTargetGroup[0]',multi=True)
	geomTarget=[]
	for i in inputTarget:
		if i.find("inputGeomTarget") != -1:
			geomTarget.append(i)
	return geomTarget

def CreateFinishtextFieldButton():	
	buttonLebal = cmds.textFieldButtonGrp('newNameText',query=True,bl=True)
	if buttonLebal == 'Finish':
		cmds.textFieldButtonGrp('newNameText',edit=True,bl='Create',ed=True)
		CreativeBlendShape().FinishBlendShape()
		cmds.textFieldButtonGrp('newNameText',edit=True,tx='')

	if buttonLebal == 'Create':
		CreativeBlendShape().CreateBlendShape()
		cmds.textFieldButtonGrp('newNameText',edit=True)		

def EditFinishButton():	
	buttonLebal = cmds.button('EditFinsihButton',query=True,label=True)
	if buttonLebal == 'Edit':
		cmds.button('EditFinsihButton',edit=True,label='Finsih')
		cmds.textScrollList('targetBlendShapeText',edit = True,enable = False)
		cmds.textScrollList('targetInbetweenText',edit = True,enable = False)
		CreativeBlendShape().EditBlendShape()

	if buttonLebal == 'Finsih':
		cmds.button('EditFinsihButton',edit=True,label='Edit')
		cmds.textScrollList('targetBlendShapeText',edit = True,enable =True)
		cmds.textScrollList('targetInbetweenText',edit = True,enable = True)
		CreativeBlendShape().EditDoneBlendShape()


class CreativeBlendShape():
	def __init__(self):
		self.blendShapeMesh = cmds.textFieldGrp('meshShapeText',query =True,text=True) 
		self.newNameBlendShape = cmds.textFieldButtonGrp('newNameText',query=True,text=True)
		self.tragetBlendShape = targetBlendShapeText()
		self.BlendShape = blendShapeNode(self.blendShapeMesh)
		self.ConnectBox = cmds.checkBox('ConnectBox',query = True,value=True)
		self.CreateBox = cmds.checkBox('CreateBox',query = True,value=True)
		self.HideBox = cmds.checkBox('HideBox',query = True,value=True)
		self.DeleteBox = cmds.checkBox('DeleteBox',query = True,value=True)

		self.targetInbetween= cmds.textScrollList('targetInbetweenText',query = True,si=True)
		self.InbetweenSlider = cmds.floatSliderGrp('InbetweenSlider',query=True,value =True)
		self.InbetweenField=cmds.floatField('InbetweenField',query=True,value=True)
		self.MirrorTargetText = cmds.textFieldButtonGrp('MirrorTargetText',tx=True,query=True)

	def indexTarget(self):	
		tragetBlendShapeIndex=cmds.listAttr(self.BlendShape[0]+'.weight',multi=True)
		Index=tragetBlendShapeIndex.index(self.tragetBlendShape)
		return Index

	def count(self):
		count = cmds.getAttr(self.BlendShape[0]+'.inputTarget[0].inputTargetGroup' ,mi=True)[-1]+1
		return count

	def tragetIndexItem(self):
		GetWeightIndex = 'source "barbarian/rig/blendShapeMel/gg_BSpiritCorrectiveShape.mel"; gg_GetWeightIndex '+str(self.BlendShape[0])+' '+str(self.tragetBlendShape)+' '

		tragetIndexItem  = mel.eval(GetWeightIndex) 
		return tragetIndexItem 


	def tragetIndexItem_TXET(self):
		tragetIndex = int(self.indexTarget())
		indexItem = []
		inputTargetItem = cmds.getAttr(self.BlendShape[0]+'.inputTarget[0].inputTargetGroup' ,mi=True)
		for i in inputTargetItem:
			inputNone = cmds.getAttr(self.BlendShape[0]+'.inputTarget[0].inputTargetGroup[%d].inputTargetItem' %i,mi=True)
			if inputNone != None :
				indexItem.append(i)
		tragetIndexItem = indexItem[tragetIndex]
		return tragetIndexItem 


	def GainTarget(self):

		#creativeTarget(self.BlendShape[0],[self.tragetBlendShape])
		self.GainTarget_All(self.tragetBlendShape)

	def GainTarget_All(self,tragetBlendShape):
		count = self.count()
		tragetIndexItem =InputTargetGroup(self.BlendShape[0],tragetBlendShape) 
		sel = creativeTarget(self.BlendShape[0],[tragetBlendShape])

		for i in sel:
			get = cmds.getAttr(i+'.'+tragetBlendShape)*1000.0+5000
			shape=cmds.listHistory(i)
			cmds.connectAttr(shape[0] + '.worldMesh[0]',self.BlendShape[0]+'.inputTarget[0].inputTargetGroup[%d].inputTargetItem[%d].inputGeomTarget' %(tragetIndexItem ,get),f=True)			
		cmds.select(self.BlendShape[0])

	def GainTarget_All_for(self):
		tragetBlendShapeIndex=cmds.listAttr(self.BlendShape[0]+'.weight',multi=True)
		amount = 0

		multiple =len(tragetBlendShapeIndex) / 100.0
		x = 0
		if multiple == 0:
			multiple = 1 
		cmds.progressWindow(title= "RevertTarget...",progress= amount,status ="Completed: 0%",isInterruptable =False)
		for i in tragetBlendShapeIndex:
			x += 1
			self.GainTarget_All(i)
			print x
			amount = (x / multiple )
			cmds.progressWindow(edit=True,progress =amount,status =('Complete: ' + str(amount) + '%') )
			cmds.pause( seconds=1 )
		cmds.progressWindow(endProgress=1)
		
	def blendTwoAttrCreate(self):
		blendTwoAttrBase= 'blendTwoAttrBase'
		target_1 = cmds.textField("target_1Field",tx=1,q=True)
		target_2 = cmds.textField("target_2Field",tx=1,q=True)
		target_TwoAttr = creativeTarget(self.BlendShape[0],[target_1,target_2])
		baseMesh  = cmds.createNode('mesh',name=blendTwoAttrBase+'Shape')
		cmds.sets(baseMesh,edit=True,forceElement='initialShadingGroup')
		listMeshShape_Orig = cmds.listRelatives (self.blendShapeMesh,c=True )
		cmds.connectAttr(listMeshShape_Orig[1]+'.outMesh',baseMesh+'.inMesh')

		listTwoAttrBase = cmds.listRelatives(baseMesh,p=True)

		copyMesh = cmds.duplicate(baseMesh)

		cmds.delete(listTwoAttrBase)
		blendShapeTwoAttr = cmds.blendShape(self.BlendShape[0]+'_Grp|'+target_1,self.BlendShape[0]+'_Grp|'+target_2,copyMesh[0],n='blendTwoAttr')
		cmds.setAttr(blendShapeTwoAttr[0] +'.'+target_1,1)
		cmds.setAttr(blendShapeTwoAttr[0] +'.'+target_2,1)

		duplicateMesh(copyMesh,'blendTwoAttr_copyToWork')

		cmds.delete(self.BlendShape[0]+'_Grp|'+target_1,self.BlendShape[0]+'_Grp|'+target_2)
		cmds.rename(copyMesh[0],blendTwoAttrBase)
		cmds.setAttr (blendTwoAttrBase+'.v',0)
		cmds.setAttr (self.blendShapeMesh+'.v',0)
	def blendTwoAttrConnect(self):
		target_1 = cmds.textField("target_1Field",tx=1,q=True)
		target_2 = cmds.textField("target_2Field",tx=1,q=True)
		multiplyTwo = cmds.createNode('multiplyDivide',n='multiplyTwo_'+target_1+target_2)	
	
		cmds.blendShape('blendTwoAttr',edit=True,tc = False,target= ('blendTwoAttrBase',2,'blendTwoAttr_copyToWork',1.0))

		cmds.setAttr('blendTwoAttr'+'.'+target_1,-1)
		cmds.setAttr('blendTwoAttr'+'.'+target_2,-1)
		cmds.setAttr('blendTwoAttr'+'.'+'blendTwoAttr_copyToWork',1)

		duplicateMesh('blendTwoAttrBase',target_1+target_2+'_Two')

		cmds.connectAttr(self.BlendShape[0]+'.'+target_1,multiplyTwo+'.input1X')
		cmds.connectAttr(self.BlendShape[0]+'.'+target_2,multiplyTwo+'.input2X')

		#cmds.blendShape(target_1+target_2+'_Two','blendTwo',n='TwoBlend')

		#if cmds.attributeQuery('blendTwoMesh',node = self.BlendShape[0],ex=True) != 1 :
		count = self.count()
		cmds.blendShape(self.BlendShape[0],edit=True,tc = False,target= (self.blendShapeMesh,int(count),target_1+target_2+'_Two',1.0))
		cmds.connectAttr(multiplyTwo+'.outputX',self.BlendShape[0]+'.'+target_1+target_2+'_Two')
		cmds.delete('blendTwoAttrBase','blendTwoAttr_copyToWork',target_1+target_2+'_Two')
		cmds.setAttr (self.blendShapeMesh+'.v',1)

	def MirrorBlendShape(self, type):
		tragetBlendShapeWeight=cmds.listAttr(self.BlendShape[0]+'.weight',multi=True)
		if type == 0:
			nameMirror = self.MirrorTargetText
		if type == 1:
			nameMirror = cmds.textField("sourceField",tx=1,q=1)
		if type == 0:
			if tragetBlendShapeWeight.__contains__(nameMirror):
				blendShapeExists(nameMirror)
				return 

		GetWeightIndex = 'gg_GetWeightIndex '+str(self.BlendShape[0])+' '+str(nameMirror)+' '
		tragetIndexItem  = mel.eval(GetWeightIndex) 

		shapeToMirror = self.tragetBlendShape

		baseMesh  = cmds.createNode('mesh',name='baseIn_'+self.blendShapeMesh)
		cmds.sets(baseMesh,edit=True,forceElement='initialShadingGroup')
		listMeshShape_Orig =  meshOrig(self.blendShapeMesh)
		print listMeshShape_Orig
		cmds.connectAttr(listMeshShape_Orig[0]+'.outMesh',baseMesh+'.inMesh')
		base = cmds.listRelatives(baseMesh,p=True)[0]
		if type == 0:
			count = self.count()
		if type == 1:
			count = tragetIndexItem
		if type == 0:
			duplicateMesh(self.blendShapeMesh,nameMirror)
			cmds.blendShape(self.BlendShape[0],edit=True,target= (self.blendShapeMesh,int(count),nameMirror,1.0))
			cmds.delete(nameMirror)

		if type == 0:
			sel = creativeTarget(self.BlendShape[0],[self.tragetBlendShape])
		if type == 1:
			sel = creativeTarget(self.BlendShape[0],[cmds.textField("targetField",tx=1,q=1)])

		if type == 0:
			traget_BlendShape = self.tragetBlendShape
		if type == 1:
			traget_BlendShape = cmds.textField("targetField",tx=1,q=1)	
		for i in range(len(sel)):
			if cmds.attributeQuery(traget_BlendShape, node=sel[i], ex=True):	
				Mirrorpirit = "gg_MirrorBlendShape "+str(base)+" "+str(sel[i])+" "+str(nameMirror)+str(i)+'_Mirror'+" "
				print nameMirror+str(i)+'_Mirror'

				Mirrorpirit_run = mel.eval(Mirrorpirit)
				get = cmds.getAttr(sel[i]+'.'+traget_BlendShape)
				if type == 1:				    
					dele =cmds.listConnections(self.BlendShape[0]+'.inputTarget[0].inputTargetGroup[%d].inputTargetItem[%d].inputGeomTarget' %(count,get*1000.0+5000),p=1,s=1)
					if dele != None :
						cmds.disconnectAttr(dele[0] ,self.BlendShape[0]+'.inputTarget[0].inputTargetGroup[%d].inputTargetItem[%d].inputGeomTarget' %(count,get*1000.0+5000))

				cmds.blendShape(self.BlendShape[0] ,edit=True,ib = True,tc = False, target= (self.blendShapeMesh,count,nameMirror+str(i)+'_Mirror',get))
				cmds.rename(nameMirror+str(i)+'_Mirror',nameMirror)
				cmds.delete(sel[i]) 
		cmds.delete(base) 
	def AppendTarget(self):
		selectionObj = cmds.ls(sl=True)
		if blendShapeNode_ONOFF() == True:
			tragetBlendShapeIndex=cmds.listAttr(self.BlendShape[0]+'.weight',multi=True)
		for i in range(len(selectionObj)) :
			if blendShapeNode_ONOFF() == True:
				count = self.count()
	
				if tragetBlendShapeIndex.__contains__(selectionObj[i]) or self.blendShapeMesh in selectionObj[i]:
					print ('Object will not allow alias '+selectionObj[i] +'to be set.  Possibly because an attribute of that name already exists.')
					continue
				else:	
					cmds.blendShape(self.BlendShape[0],edit=True,tc = False,target= (self.blendShapeMesh,int(count+i),selectionObj[i],1.0))
			elif self.blendShapeMesh in selectionObj[i] :
				continue
			else:
				cmds.blendShape(selectionObj[i],self.blendShapeMesh,frontOfChain=True)

	def RemoveTarget(self):

		count = self.count()

		tragetIndexItem = self.tragetIndexItem()

		sel = creativeTarget(self.BlendShape[0],[self.tragetBlendShape])
		tragetBlendShapeIndex=cmds.listAttr(self.BlendShape[0]+'.weight',multi=True)
		for i in sel:
			#sel = 	[sels]	
			#sel = cmds.ls('*'+self.tragetBlendShape+'*',typ = 'transform')		
			get = cmds.getAttr(i+'.'+self.tragetBlendShape)*1000.0+5000
			#et = 6000

			shape=cmds.listHistory(i)
			cmds.connectAttr(shape[0] + '.worldMesh[0]',self.BlendShape[0]+'.inputTarget[0].inputTargetGroup[%d].inputTargetItem[%d].inputGeomTarget' %(tragetIndexItem ,get),f=True)			
			cmds.blendShape(self.BlendShape[0],edit=True,rm=True,t= (self.blendShapeMesh,tragetIndexItem ,i,1))
			cmds.delete(i)
		cmds.select(self.BlendShape[0])
		if cmds.blendShape(self.BlendShape[0],q=1,wc=True) == 0:
			cmds.delete(self.BlendShape[0])


	def RenameTarget(self):
		result = cmds.promptDialog(
		title='Rename Object',
		text = self.tragetBlendShape,
		message='Enter Name:',
		button=['OK', 'Cancel'],
		defaultButton='OK',
		cancelButton='Cancel',
		dismissString='Cancel')

		if result == 'OK':
			text = cmds.promptDialog(query=True, text=True)
			cmds.aliasAttr(text,self.BlendShape[0]+'.'+self.tragetBlendShape)

	def CreateBlendShape(self):
		copyMesh = self.blendShapeMesh+'_copyToWork_'+self.newNameBlendShape

		if cmds.nodeType(blendShapeNode(self.blendShapeMesh)) == 'blendShape' :
			if cmds.blendShape(self.BlendShape[0],q=1,wc=True) != 0:
				tragetBlendShapeIndex=cmds.listAttr(self.BlendShape[0]+'.weight',multi=True)
				if tragetBlendShapeIndex.__contains__(self.newNameBlendShape):
					blendShapeExists(self.newNameBlendShape)
					return
		else:
			pass
			print 'ok'

		duplicateMesh(self.blendShapeMesh,copyMesh)
		SculptGeometryTool = "SculptGeometryTool"
		mel.eval(SculptGeometryTool)
		if int(self.HideBox) == 1:
			cmds.setAttr(self.blendShapeMesh+'.v',0)
		cmds.select(copyMesh)
		cmds.textFieldButtonGrp('newNameText',edit=True,bl='Finish',ed=False)	

	def FinishBlendShape(self):
		blendShapeMesh_copyToWork= self.blendShapeMesh+'_copyToWork_'+self.newNameBlendShape
		CorrectiveShape(blendShapeMesh_copyToWork,self.blendShapeMesh,self.newNameBlendShape).CorrectiveShapeRoutine()
		if int(self.ConnectBox) == 1:
			if blendShapeNode_ONOFF() == True and int(self.CreateBox) == 1 :
				count = self.count()
				cmds.blendShape(self.BlendShape[0],edit=True,tc = False,target= (self.blendShapeMesh,int(count),self.newNameBlendShape,1.0))
			elif blendShapeNode_ONOFF() != True:  		 
				cmds.blendShape(self.newNameBlendShape,self.blendShapeMesh,frontOfChain=True,exclusive= "deformPartition#")
			cmds.setAttr(self.newNameBlendShape+'.v',0)
			
		else:
			print 'Creatr garget ' +self.newNameBlendShape
			cmds.setAttr(self.newNameBlendShape+'.v',1)
		if self.DeleteBox == 1 :
			cmds.delete(self.newNameBlendShape)

		freshTargetBlendShape("append")
		cmds.delete(blendShapeMesh_copyToWork)	
		cmds.setAttr(self.blendShapeMesh+'.v',1)
		cmds.select(self.blendShapeMesh)
		SelectTool= "SelectTool"
		mel.eval(SelectTool)

	def EditBlendShape(self):
		targetBlendShape=cmds.listAttr(self.BlendShape[0]+'.weight',multi=True)
		#[cmds.setAttr(self.BlendShape[0] +'.'+ i,0) for i in targetBlendShape]
		InbetweenField = cmds.getAttr(self.BlendShape[0] +'.'+self.tragetBlendShape)

		if cmds.checkBoxGrp('Inbetween',query=True,v1=True) == 1:		
			set = float(InbetweenField)
		else:
			set = float(self.targetInbetween[0])

		if cmds.checkBoxGrp('Inbetween',query=True,v1=True) == 1:		
			BindPose = self.blendShapeMesh+'_inbetweenBindPose_'+self.tragetBlendShape
		else:
			BindPose = self.blendShapeMesh+'_inBindPose_'+self.tragetBlendShape

		duplicateMesh(self.blendShapeMesh,BindPose)

		cmds.setAttr(self.BlendShape[0] +'.'+self.tragetBlendShape,set)

		vertex = cmds.polyEvaluate(self.blendShapeMesh,vertex=True)
		int(vertex)
		for v in range(vertex) :
			ployPosition=cmds.pointPosition(self.blendShapeMesh +'.vtx[%d]' %v,w =True)
			cmds.move(ployPosition[0],ployPosition[1],ployPosition[2],BindPose+'.vtx[%d]' %v)
		SculptGeometryTool = "SculptGeometryTool"
		mel.eval(SculptGeometryTool)
		cmds.setAttr(self.blendShapeMesh+'.v',0)
		cmds.select(BindPose)



	def EditDoneBlendShape(self):

		cmds.setAttr(self.BlendShape[0] +'.'+self.tragetBlendShape,0)

		blendShapeMesh_inBindPose= self.blendShapeMesh+'_inBindPose_'+self.tragetBlendShape
		inBindPose = 'inBindPose_'+self.tragetBlendShape

		CorrectiveShape(blendShapeMesh_inBindPose,self.blendShapeMesh,inBindPose).CorrectiveShapeRoutine()
		Input = self.tragetIndexItem()

		indexWeight = float(self.targetInbetween[0])*1000.0+5000
		cmds.connectAttr(inBindPose+'.worldMesh[0]',self.BlendShape[0]+'.inputTarget[0].inputTargetGroup[%d].inputTargetItem[%d].inputGeomTarget' %(Input,indexWeight), f =True)

		cmds.textScrollList('targetBlendShapeText',edit = True,enable = True)		
		cmds.setAttr(self.blendShapeMesh+'.v',1)
		cmds.delete(blendShapeMesh_inBindPose,inBindPose)
		cmds.select(self.blendShapeMesh)
		SelectTool= "SelectTool"
		mel.eval(SelectTool)


	def AddInbetweenBlendShape(self):
		targetBlendShape=cmds.listAttr(self.BlendShape[0]+'.weight',multi=True)
		inbetweenBind_Target=self.blendShapeMesh+'_inbetweenBindPose_'+self.tragetBlendShape
		#[cmds.setAttr(self.BlendShape[0] +'.'+ i,0) for i in targetBlendShape]
		cmds.setAttr(self.BlendShape[0] +'.'+self.tragetBlendShape,0)
		InputTarget = self.tragetIndexItem()
		
		inbetweenBindPose = 'inbetweenBindPose_'+self.tragetBlendShape
		CorrectiveShape(inbetweenBind_Target,self.blendShapeMesh,inbetweenBindPose).CorrectiveShapeRoutine()
		cmds.blendShape(self.BlendShape[0],edit=True,tc=False,ib =True,target =(self.blendShapeMesh,int(InputTarget),inbetweenBindPose,float(self.InbetweenSlider)))
		cmds.delete(inbetweenBind_Target,inbetweenBindPose)
		cmds.setAttr(self.blendShapeMesh+'.v',1)
		cmds.select(self.blendShapeMesh)
		SelectTool= "SelectTool"
		mel.eval(SelectTool)

	def inputGeomTarget(self):
		GeomTarget=cmds.ls(sl=True)
		shape=cmds.listHistory(GeomTarget[0])
		Input = self.tragetIndexItem()

		indexWeight = float(self.targetInbetween[0])*1000.0+5000		
		cmds.connectAttr(shape[0]+'.worldMesh[0]',self.BlendShape[0]+'.inputTarget[0].inputTargetGroup[%d].inputTargetItem[%d].inputGeomTarget' %(Input,indexWeight),f=True)
		print GeomTarget


def blendShapeExists(name):
	cmds.confirmDialog( title='Warning', message=name +' Possibly because an attribute of that name already exists.', button=['Yes'], defaultButton='Yes' )
	
def duplicateMesh(nodeMesh,nameMesh):
	copyToWorkOn = cmds.duplicate(nodeMesh,rr=True,name= nameMesh )	
	unLock = [cmds.setAttr(nameMesh +'.'+x,keyable=True,lock=False,channelBox=False) for x in ['tx','ty','tz','rx','ry','rz','sx','sy','sz','v']] 
	#cmds.setAttr(self.meshShape_sel+'.v',0)
	cmds.setAttr(nameMesh+'.v',1)


class CorrectiveShape():
	def __init__(self,poesMesh,skinMesh,deformerMesh):
		self.poesMesh = poesMesh 
		self.skinMesh = skinMesh 
		self.deformerMesh = deformerMesh
		self.BlendShape=blendShapeNode(self.skinMesh)
		targetCount=targetBlendShapeText()


	def CorrectiveShapeRoutine(self):
		cmds.select(cl=True)
		#cmds.select(self.skinMesh,self.poesMesh,add=True)

		#CSSCMainRoutine(self.deformerMesh)
		cmds.select(self.poesMesh,self.skinMesh,add=True)
		BSpirit = "gg_BSpiritCorrectiveShape "+str(self.deformerMesh)+" "
		BSpirit_run = mel.eval(BSpirit)	
		cmds.select(cl=True)


def editField(Field):
	cmds.textField(Field,tx=targetBlendShapeText(),edit=True)


def inbetweenWieght():
	blendShapeMesh = cmds.textFieldGrp('meshShapeText',query =True,text=True) 
	blendShape = blendShapeNode(blendShapeMesh)	
	tragetBlendShapeIndex = targetBlendShapeText()

	tragetIndexItem = CreativeBlendShape().tragetIndexItem()
	print tragetIndexItem 

	inputTargetItem = cmds.getAttr(blendShape[0]+'.inputTarget[0].inputTargetGroup[%d].inputTargetItem' %tragetIndexItem ,mi=True)

	cmds.textScrollList('targetInbetweenText',edit = True,removeAll = True)
	if cmds.checkBoxGrp('Inbetween',query=True,v1=True) == 1:
		cmds.floatSliderGrp('InbetweenSlider',edit=True,v=0)
		#cmds.setAttr(blendShape+'.'+tragetBlendShapeIndex,0 )

	for i in inputTargetItem:
		indexInt = (int(i)-5000)/1000.0
		cmds.textScrollList('targetInbetweenText',edit=True,append=str(indexInt),sii=1)
	cmds.textFieldButtonGrp('MirrorTargetText',label=tragetBlendShapeIndex +' >>',edit=True)



def creativeTarget(blendShape,target=[]):
	listConnect=[]
	listConnect_target=[]
	listConnect_Name=[]
	MeshOrigList=[]
	listTargetBlendShape=cmds.listAttr(blendShape+'.weight',multi=True)
	if cmds.objExists(blendShape+'_Grp') != 1:
		blendShapeGrp = cmds.createNode('transform',name=blendShape+'_Grp')

	for i in listTargetBlendShape:
		targetConnect = cmds.listConnections(blendShape+'.'+i,p=True,s=True,d=False)
		if targetConnect != None:	
			for m in targetConnect:				
				cmds.disconnectAttr(m,blendShape+'.'+i)
			listConnect.append(m)
			listConnect_target.append(i)
		cmds.setAttr(blendShape+"."+i,0)

	MeshOrigList = meshOrig(blendShape)		    

	for x in target:
		if listTargetBlendShape.__contains__(x) != 1 or  'weight[' in x:		
			continue

		tragetIndexItem = InputTargetGroup(blendShape,x) 
		inputTargetItem = cmds.getAttr(blendShape+'.inputTarget[0].inputTargetGroup[%d].inputTargetItem' %tragetIndexItem,mi=True)
		for c in inputTargetItem:
			indexInt = (int(c)-5000)/1000.0

			Mesh = cmds.createNode('mesh',name = x+'_Shape')
			MeshMian = cmds.createNode('mesh',name = x+'_MianShape')

			cmds.sets(Mesh,edit=True,forceElement='initialShadingGroup')	
			listRel = cmds.listRelatives(Mesh,p=True)
			MianlistRel = cmds.listRelatives(MeshMian,p=True)

			cmds.setAttr(blendShape+'.'+x,float(indexInt))
			cmds.connectAttr(blendShape+'.outputGeometry[0]',MeshMian+''+'.inMesh')

			cmds.connectAttr(MeshOrigList[0]+'.outMesh',Mesh+''+'.inMesh')
			copyMesh=cmds.duplicate(Mesh)

			vertex = cmds.polyEvaluate(MeshMian,vertex=True)
			int(vertex)
			for v in range(vertex) :
				ployPosition=cmds.pointPosition(MeshMian +'.vtx[%d]' %v,w =True)
				cmds.move(ployPosition[0],ployPosition[1],ployPosition[2],copyMesh[0]+'.vtx[%d]' %v)

#########################################
			count=str(indexInt).split(".")
			if count[0] == '-0':
				ne = 'm'
			else:
				ne = 'p'

			if float(indexInt) == 1:
				targetName = x
			else:
				targetName = x+'_' + ne + count[1]
			cmds.parent(copyMesh,blendShape+'_Grp')
			ToName = cmds.rename(copyMesh,targetName)
			cmds.addAttr(ToName, longName =x,at ='double')
			cmds.setAttr(ToName+'.'+x ,float(indexInt))

			cmds.setAttr(blendShape+'.'+x,0)
			cmds.delete(listRel,MianlistRel)
			listConnect_Name.append(ToName)

	for i in range(len(listConnect)):
		cmds.connectAttr(listConnect[i],blendShape+'.'+listConnect_target[i])
	return listConnect_Name

def InputTargetGroup(blendShapeNode,target):
	GetWeightIndex = 'gg_GetWeightIndex '+str(blendShapeNode)+' '+str(target)+' '

	tragetIndexItem  = mel.eval(GetWeightIndex) 
	return tragetIndexItem 


def creativeTarget_Clone(TargetGeo,SourceGeo):
	listConnect=[]
	listConnect_target=[]
	listConnect_get=[]
	SourceOrigList=[]

	blendShapeGrp = cmds.createNode('transform',name=SourceGeo+'_blendShape')
	SourceBlendShape=blendShapeNode(TargetGeo)[0]

	listTargetBlendShape=cmds.listAttr(SourceBlendShape+'.weight',multi=True)
	listShpae  = cmds.listHistory(SourceGeo) 

	for i in listTargetBlendShape:
		targetConnect = cmds.listConnections(SourceBlendShape+'.'+i,p=True,s=True,d=False)
		if targetConnect != None:	
			for m in targetConnect:				
				cmds.disconnectAttr(m,SourceBlendShape+'.'+i)
			listConnect.append(m)
			listConnect_target.append(i)
		else:
			get =i + '>' +str(cmds.getAttr(SourceBlendShape+"."+i))
			listConnect_get.append(get)
		cmds.setAttr(SourceBlendShape+"."+i,0)


	cmds.blendShape(SourceGeo,exclusive = 'deformPartition#',frontOfChain=True,name=SourceGeo+'BlendShape')

	cmds.select(SourceGeo)
	cmds.select(TargetGeo,add=True)	
	CreateWrap = "CreateWrap;"
	mel.eval(CreateWrap)

	SourceOrigList = meshOrig(SourceGeo)
	amount = 0
	multiple =len(listTargetBlendShape) / 100.0
	xi = 0
	if multiple == 0:
		multiple = 1 

	cmds.progressWindow(title= "Clone...",progress= amount,status ="Completed: 0%",isInterruptable =False)

	for x in listTargetBlendShape:
		if listTargetBlendShape.__contains__(x) != 1 or  'weight[' in x:		
			continue
		xi +=1
		tragetIndexItem = InputTargetGroup(SourceBlendShape,x) 
		inputTargetItem = cmds.getAttr(SourceBlendShape+'.inputTarget[0].inputTargetGroup[%d].inputTargetItem' %tragetIndexItem,mi=True)
		for c in inputTargetItem:
			indexInt = (int(c)-5000)/1000.0

			Mesh = cmds.createNode('mesh',name = x+'_Shape')
			MeshMian = cmds.createNode('mesh',name = x+'_MianShape')

			cmds.sets(Mesh,edit=True,forceElement='initialShadingGroup')	
			listRel = cmds.listRelatives(Mesh,p=True)
			MianlistRel = cmds.listRelatives(MeshMian,p=True)

			cmds.setAttr(SourceBlendShape+'.'+x,indexInt)
			cmds.connectAttr(listShpae[0]+'.outMesh',MeshMian+''+'.inMesh')

			cmds.connectAttr(SourceOrigList[0]+'.outMesh',Mesh+''+'.inMesh')
			copyMesh=cmds.duplicate(Mesh)

			vertex = cmds.polyEvaluate(MeshMian,vertex=True)
			int(vertex)
			for v in range(vertex) :
				ployPosition=cmds.pointPosition(MeshMian +'.vtx[%d]' %v,w =True)
				cmds.move(ployPosition[0],ployPosition[1],ployPosition[2],copyMesh[0]+'.vtx[%d]' %v)

			count=str(indexInt).split(".")
			if count[0] == '-0':
				ne = 'm'
			else:
				ne = 'p'

			if float(indexInt) == 1:
				targetName = x 
			else:
				targetName = x+'_'+ str(tragetIndexItem) + '_' + ne + count[1]
			cmds.parent(copyMesh,blendShapeGrp)
			ToName = cmds.rename(copyMesh,targetName)
			cmds.addAttr(ToName, longName =x,at ='double')
			cmds.setAttr(ToName+'.'+x ,float(indexInt))

			cmds.setAttr(SourceBlendShape+'.'+x,0)
			cmds.delete(listRel,MianlistRel)
			if float(indexInt) == 1:

				cmds.blendShape(SourceGeo+'BlendShape',edit=True,tc = False,target= (SourceGeo,xi,ToName,1.0))
			else:

				cmds.blendShape(SourceGeo+'BlendShape',edit=True,ib = True,tc = False, target= (SourceGeo,xi,ToName,float(indexInt)))
			print xi
		amount = (xi / multiple )
		cmds.progressWindow(edit=True,progress =amount,status =('Complete: ' + str(amount) + '%') )
		cmds.pause( seconds=1 )
	cmds.progressWindow(endProgress=1)
		
	SourceGeoHistory =cmds.listHistory(SourceGeo)
	for i in SourceGeoHistory:
		try:
			if cmds.nodeType(i) == 'wrap' :	
				cmds.delete(i)
		except RuntimeError: 
			print 'No wrap deformable .'

	for i in range(len(listConnect)):
		cmds.connectAttr(listConnect[i],SourceBlendShape+'.'+listConnect_target[i])
		cmds.connectAttr(listConnect[i],SourceGeo+'BlendShape'+'.'+listConnect_target[i])

	for i in listConnect_get:
		listConnect_wt = i.split('>')
		cmds.setAttr(SourceBlendShape+'.'+listConnect_wt[0],float(listConnect_wt[1]))
		cmds.setAttr(SourceGeo+'BlendShape'+'.'+listConnect_wt[0],float(listConnect_wt[1]))

def CSSCTransform(operationList, selObj,nameMesh):
	#selObj: skinned mesh, tweak node, sculpt mesh, sculpt trans, skinCluster Node
	#operationList: 2d list contain point id and world motion vector.
	skinClusterNode = selObj[4]
	
	motionVectorList = []
	#for each points
	for i in range(len(operationList)/2):
		BSTweak = operationList[i*2 + 1]
		pointID = operationList[2*i]
        P_tTemp = xform(selObj[2] + ".vtx[" + pointID + "]", q = True, t = True, ws = True)
        P_tOffset = xform(selObj[3], q = True, t = True, ws = True)
        P_t = [P_tTemp[0] - P_tOffset[0], P_tTemp[1] - P_tOffset[1], P_tTemp[2] - P_tOffset[2]]

        P = xform(selObj[5] + ".vtx[" + pointID + "]", q = True, t = True, ws = True)
        
        componentName = selObj[0] + ".vtx[" + pointID + "]"
        #for each weight-division
        weightList = skinPercent(skinClusterNode, componentName, q = True, v = True)
        
        thisMatrix = mo.MMatrix()
        nullMatrix = mo.MMatrix()
        mo.MScriptUtil().createMatrixFromList([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], nullMatrix)
        thisMatrix = nullMatrix
        for j in range(len(weightList)):
    
            strj = str(j)
            bindPreMatrix = getAttr(skinClusterNode + ".bindPreMatrix[" + strj + "]")
            drivingMatrix = getAttr(skinClusterNode + ".matrix[" + strj + "]")
            
            bindPreMMatrix = mo.MMatrix()
            drivingMMatrix = mo.MMatrix()
            
            mo.MScriptUtil().createMatrixFromList(bindPreMatrix, bindPreMMatrix)
            mo.MScriptUtil().createMatrixFromList(drivingMatrix, drivingMMatrix)
        
            currentMatrix = bindPreMMatrix * drivingMMatrix * weightList[j]
            
            thisMatrix += currentMatrix
        
        thisMatrixInverse = thisMatrix.inverse()
        PT = mo.MPoint(P_t[0], P_t[1], P_t[2])
        P_ = mo.MPoint()
        P_ = PT * thisMatrixInverse
        
        V = [P_[0] - P[0], P_[1] - P[1], P_[2] - P[2]]
        
        #setAttr(selObj[1] + ".vlist[0].vertex[" + pointID + "].xVertex", V[0])
        #setAttr(selObj[1] + ".vlist[0].vertex[" + pointID + "].yVertex", V[1])
        #setAttr(selObj[1] + ".vlist[0].vertex[" + pointID + "].zVertex", V[2])
        
        #print V
        motionVectorList.append(str(pointID))
        TP = [P_[0], P_[1], P_[2]]
        motionVectorList.append(TP)

	dup = duplicate(selObj[0],name= nameMesh)[0]
	vertex = ls(dup + ".vtx[*]")[0]
	tempSeg = vertex.split(":")[1]
	pointNum = int(tempSeg.split("]")[0]) + 1
    
	for i in range(pointNum):
		stri = str(i)
        P = xform(selObj[5] + ".vtx[" + stri + "]", q = True, t = True, ws = True)
        xform(dup + ".vtx[" + stri + "]", t = P, ws = True) 

	for i in range(len(motionVectorList)/2):
		xform(dup + ".vtx[" + motionVectorList[i*2] + "]", t = motionVectorList[i*2+1],ws = True)
        
	select(dup)
	cluster()
	select(dup)
	delete(ch = True)
	
	
def CSSCTopologyCheck(selectObj):
    #input: skinned mesh, tweak node, scuplt mesh
    #step1: check tweak whether all zero:
    skinnedMesh = selectObj[0]
    tweakNode = selectObj[1]
    sculptMesh = selectObj[2]
    
    vertex = ls(skinnedMesh + ".vtx[*]")[0]
    tempSeg = vertex.split(":")[1]
    pointNum = int(tempSeg.split("]")[0]) + 1
    
    for i in range(pointNum):
        tx = getAttr(tweakNode + ".vlist[0].vertex[" + str(i) + "].xVertex")
        ty = getAttr(tweakNode + ".vlist[0].vertex[" + str(i) + "].yVertex")
        tz = getAttr(tweakNode + ".vlist[0].vertex[" + str(i) + "].zVertex")
        if tx != 0 or ty != 0 or tz != 0:
            confirmDialog(t = "Tweak Node Error", m = "Non-Zero point(s) found in tweak node or skinned object.")
            raise Exception("Tweak Node Error")
    
    #step2: return 2d list contain point id and world motion vector.
    vertex = ls(sculptMesh + ".vtx[*]")[0]
    tempSeg = vertex.split(":")[1]
    pointNum = int(tempSeg.split("]")[0]) + 1
    

    worldVectorInfo = []
    
    for i in range(pointNum):
        worldVector = []
        stri = str(i)
        lpx = getAttr(sculptMesh + ".pnts[" + stri + "].pntx")
        lpy = getAttr(sculptMesh + ".pnts[" + stri + "].pnty")
        lpz = getAttr(sculptMesh + ".pnts[" + stri + "].pntz")
        if lpx != 0 or lpy != 0 or lpz != 0:
            worldVector.append(lpx)
            worldVector.append(lpy)
            worldVector.append(lpz)
            worldVectorInfo.append(stri)
            worldVectorInfo.append(worldVector)
            
    return worldVectorInfo
    

def CSSCSelectionCheck():
    selObjs = ls(sl = True)
    if selObjs == [] or selObjs == None:
        confirmDialog(t = "Selection Error", m = "Select skinned object firstly, then, the sculpted object.")
        raise Exception("Selection Error")
    
    if len(selObjs) != 2:
        confirmDialog(t = "Selection Error", m = "Select skinned object firstly, then, the sculpted object.")
        raise Exception("Selection Error")
    
    operationList = []
    if nodeType(selObjs[0]) != "transform" or nodeType(selObjs[1]) != "transform" or len(selObjs) != 2:
        confirmDialog(t = "Selection Error", m = "Select skinned object firstly, then, the sculpted object.")
        raise Exception("Selection Error")
    
    #skinned object has skincluster node
    allHis = listHistory(selObjs[0])
    foundSkinNode = 0
    for i in range(len(allHis)):
        if nodeType(allHis[i]) == "skinCluster":
            foundSkinNode = 1
            skinClusterNode = allHis[i]
            break
    if foundSkinNode == 0:
        confirmDialog(t = "Selection Error", m = "Select skinned object firstly, then, the sculpted object.")
        raise Exception("Selection Error")
    
    #append shape node and tweak node
    children = listHistory(selObjs[0])
    for i in range(len(children)):
        if nodeType(children[i]) == "mesh" or nodeType(children[i]) == "tweak":
            operationList.append(children[i])
            if len(operationList) == 2:
                break
    
    
    #sculpt object has no skincluster node
    allHis = listHistory(selObjs[1])
    foundSkinNode = 0
    for i in range(len(allHis)):
        if nodeType(allHis[i]) == "skinCluster":
            foundSkinNode = 1
            break
    if foundSkinNode == 1:
        confirmDialog(t = "Selection Error", m = "Select skinned object firstly, then, the sculpted object.")
        raise Exception("Selection Error")
    
    #append shape node for operation
    children = listHistory(selObjs[1])
    for i in range(len(children)):
        if nodeType(children[i]) == "mesh":
            operationList.append(children[i])
            break
    operationList.append(selObjs[1])
    operationList.append(skinClusterNode)
   	
    meshOrig = listRelatives(selObjs[0])
    for i in range(len(meshOrig)):
        if 'Orig' in meshOrig[i] :
            if listConnections(meshOrig[i]+'.worldMesh[0]',source=True) :        
                operationList.append(meshOrig[i])
    #if no problem
    return operationList


def CSSCMainRoutine(nameMesh):
    
    #get the select objects
    #return: skinned mesh, tweak node, scuplt mesh, scuplt tranform, skinCluster Node
    selObj = CSSCSelectionCheck()
    
    #check the select objects
    #return 2d list contain point id and world motion vector.
    operationList = CSSCTopologyCheck(selObj)
    
    #send loop
    #transform
    CSSCTransform(operationList, selObj,nameMesh)

def blendShapeManage_UI():
	selection = cmds.ls(sl=True)	
	if len(selection) > 0 :
		listMesh = cmds.listRelatives(selection[0])
		try:
			if cmds.nodeType(listMesh[0]) == 'mesh':	
				blendShapeManage()
			if blendShapeNode_ONOFF() == True:
				freshTargetBlendShape("append")
		except TypeError:
			print 'No deformable objects selected.'
	else:
		cmds.confirmDialog( title='Warning', message= 'No deformable objects selected.', button=['Yes'], defaultButton='Yes')