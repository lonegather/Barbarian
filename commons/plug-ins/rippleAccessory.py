#!/usr/local/bin/python2.7
# encoding: utf-8
import sys
import maya.OpenMaya as OpenMaya
import maya.OpenMayaMPx as OpenMayaMPx
import math

nodeName= "RippleDeformer"
nodeId = OpenMaya.MTypeId(0x102fff)

class Ripple(OpenMayaMPx.MPxDeformerNode):
	'''
	Commands ----> MPxCommand
	Custom   ----> MPxNode
	Deformer ----> MPxDeformerNode	
	'''
	mObj_Amplitude = OpenMaya.MObject()
	mObj_Displace = OpenMaya.MObject()
	mObj_Matrix = OpenMaya.MObject()
	
	def __init__(self):
		OpenMayaMPx.MPxDeformerNode.__init__(self)
	
	def deform(self,dataBlock,geoIterator,matrix,geometryIndex):	
		input = OpenMayaMPx.cvar.MPxGeometryFilter_input
		# 1. Attach a handle to input Array Attribute.
		dataHandleInputArray = dataBlock.outputArrayValue(input)
		# 2. Jump to particular element
		dataHandleInputArray.jumpToElement(geometryIndex)
		# 3. Attach a handle to specific data block
		dataHandleInputElement = dataHandleInputArray.outputValue()
		# 4. Reach to the child - inputGeom		
		inputGeom = OpenMayaMPx.cvar.MPxGeometryFilter_inputGeom
		dataHandleInputGeom = dataHandleInputElement.child(inputGeom)
		inMesh = dataHandleInputGeom.asMesh()
		
		#Envelope
		envelope = OpenMayaMPx.cvar.MPxGeometryFilter_envelope
		dataHandleEnvelope = dataBlock.inputValue(envelope)
		envelopeValue = dataHandleEnvelope.asFloat()
		
		# Amplitude
		dataHandleAmplitude = dataBlock.inputValue(Ripple.mObj_Amplitude)
		amplitudeValue = dataHandleAmplitude.asFloat()
		
		# Displace
		dataHandleDisplace = dataBlock.inputValue(Ripple.mObj_Displace)
		displaceValue = dataHandleDisplace.asFloat()
		
		# Matrix 
		dataHandleMatrix = dataBlock.inputValue(Ripple.mObj_Matrix)
		matrixValue = dataHandleMatrix.asMatrix()
		
		
		# Read the translation from Matrix
		mTransMatrix = OpenMaya.MTransformationMatrix(matrixValue)
		translationValue = mTransMatrix.getTranslation(OpenMaya.MSpace.kObject)
		
		
		mFloatVectorArray_normal = OpenMaya.MFloatVectorArray()
		mFnMesh = OpenMaya.MFnMesh(inMesh)
		mFnMesh.getVertexNormals(False,mFloatVectorArray_normal,OpenMaya.MSpace.kObject)
		
		mPointArray_meshVert = OpenMaya.MPointArray()
		while( not geoIterator.isDone()):
			pointPosition = geoIterator.position()
			weight = self.weightValue(dataBlock,geometryIndex,geoIterator.index())	
			pointPosition.x  = pointPosition.x + math.sin( geoIterator.index() + displaceValue + translationValue[0] ) * amplitudeValue * mFloatVectorArray_normal[geoIterator.index()].x * weight * envelopeValue
			pointPosition.y  = pointPosition.y + math.sin( geoIterator.index() + displaceValue + translationValue[0] ) * amplitudeValue * mFloatVectorArray_normal[geoIterator.index()].y * weight * envelopeValue
			pointPosition.z  = pointPosition.z + math.sin( geoIterator.index() + displaceValue + translationValue[0] ) * amplitudeValue * mFloatVectorArray_normal[geoIterator.index()].z * weight * envelopeValue
			mPointArray_meshVert.append(pointPosition)
			#geoIterator.setPosition(pointPosition)			
			geoIterator.next()
		geoIterator.setAllPositions(mPointArray_meshVert)
		
		
	def accessoryNodeSetup(self,dagModifier):
		#1. Create Accessory Object.
		mObjLocator = dagModifier.createNode("locator")
		
		#2. Establish Connection
		mFnDependLocator = OpenMaya.MFnDependencyNode(mObjLocator)
		mPlugWorld = mFnDependLocator.findPlug("worldMatrix")
		mObj_WorldAttr = mPlugWorld.attribute()
		
		mStatusConnect = dagModifier.connect(mObjLocator,mObj_WorldAttr,self.thisMObject(),Ripple.mObj_Matrix ) 
		return mStatusConnect
		
	def accessoryAttribute(self):
		return Ripple.mObj_Matrix	
			
			
			
		
def deformerCreator():
	nodePtr = OpenMayaMPx.asMPxPtr(Ripple())
	return nodePtr


def nodeInitializer():	
	'''
	Create Attributes - check
	Attach Attributes - check
	Design Circuitry  - check 
	'''
	
	mFnAttr = OpenMaya.MFnNumericAttribute()
	Ripple.mObj_Amplitude = mFnAttr.create("AmplitudeValue","AmplitudeVal",OpenMaya.MFnNumericData.kFloat,0.0)
	mFnAttr.setKeyable(1)
	mFnAttr.setMin(0.0)
	mFnAttr.setMax(1.0)
	
	Ripple.mObj_Displace = mFnAttr.create("DisplaceValue","DispVal",OpenMaya.MFnNumericData.kFloat,0.0)
	mFnAttr.setKeyable(1)
	mFnAttr.setMin(0.0)
	mFnAttr.setMax(10.0)
	
	# 1. Create Matrix Attribute
	mFnMatrixAttr = OpenMaya.MFnMatrixAttribute()
	Ripple.mObj_Matrix = mFnMatrixAttr.create("MatrixAttribute","matAttr")
	mFnMatrixAttr.setStorable(0)
	mFnMatrixAttr.setConnectable(1)
	
	# 2. Connect with Deformer Node
	Ripple.addAttribute(Ripple.mObj_Amplitude)
	Ripple.addAttribute(Ripple.mObj_Displace)
	Ripple.addAttribute(Ripple.mObj_Matrix)
	
	
	'''
	SWIG - Simplified Wrapper Interface Generator 
	
	'''
	# 3. Designed Circuitry of the node
	outputGeom = OpenMayaMPx.cvar.MPxGeometryFilter_outputGeom 
	Ripple.attributeAffects(Ripple.mObj_Amplitude,outputGeom )
	Ripple.attributeAffects(Ripple.mObj_Displace,outputGeom  )
	Ripple.attributeAffects(Ripple.mObj_Matrix,outputGeom  )
		
	

	
def initializePlugin(mobject):
	mplugin = OpenMayaMPx.MFnPlugin(mobject,"Chayan Vinayak","1.0")
	try:
		mplugin.registerNode(nodeName, nodeId, deformerCreator, nodeInitializer,OpenMayaMPx.MPxNode.kDeformerNode)
		''' This is to explicitly define that weights attribute of the deformer is paintable'''
		OpenMaya.MGlobal.executeCommand("makePaintable -attrType \"multiFloat\" -sm deformer \""+nodeName+"\" \"weights\";")
	except:
		sys.stderr.write("Failed to register node: %s" % nodeName)
		raise

def uninitializePlugin(mobject):
	mplugin = OpenMayaMPx.MFnPlugin(mobject)
	try:
		mplugin.deregisterNode(nodeId)
	except:
		sys.stderr.write("Failed to deregister node: %s" % nodeName)
		raise


	