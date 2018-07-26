from PySide import QtCore,QtGui
from shiboken import wrapInstance
import maya.OpenMaya as om
import maya.OpenMayaUI as omui
import maya.cmds as cmds
import maya.mel as mel
import sys,re


mayaMainWindowPtr = omui.MQtUtil.mainWindow()
mayaMainWindow = wrapInstance(long(mayaMainWindowPtr), QtGui.QWidget) 


def softSelection():
    selection = om.MSelectionList()
    softSelection = om.MRichSelection()
    om.MGlobal.getRichSelection(softSelection)
    softSelection.getSelection(selection)

    dagPath = om.MDagPath()
    component = om.MObject()

    iter = om.MItSelectionList( selection,om.MFn.kMeshVertComponent )
    elements = []
    weights = []
    while not iter.isDone():
        iter.getDagPath( dagPath, component )
        dagPath.pop()
        node = dagPath.fullPathName()
        fnComp = om.MFnSingleIndexedComponent(component)

        for i in range(fnComp.elementCount()):
            #elements.append('%s.vtx[%i]' % (node, fnComp.element(i)))
            elements.append(fnComp.element(i))
            weights.append(fnComp.weight(i).influence())
        iter.next()
    return elements,weights

def ss_skinWeight(skincluster,id,method,blendDQ=False):
    influences = cmds.skinCluster(skincluster,q=True,influence=None)
    deformedGeometryNode = cmds.listRelatives(cmds.ls(selection=True),parent=True)[0]
    elements,weights = softSelection()
    for e in range(len(elements)):
        if blendDQ:
            blendWtAttr = skincluster+'.blendWeights[{}]'.format(e)
            currentWt = cmds.getAttr(blendWtAttr)
            if method == 0:
                cmds.setAttr(blendWtAttr,weights[e]+currentWt)
            elif method == 1:
                cmds.setAttr(blendWtAttr,weights[e]*currentWt)
            elif method == 2:
                cmds.setAttr(blendWtAttr,weights[e])
            continue
        currentWt = cmds.skinPercent(skincluster,
                             deformedGeometryNode+'.vtx[%s]' %elements[e],
                             transform=influences[id],
                             q=True)
        if method == 0:
            cmds.skinPercent(skincluster,
                             deformedGeometryNode+'.vtx[%s]' %elements[e],
                             transformValue=(influences[id],
                                             weights[e]+currentWt),
                             relative=False)
        elif method == 1:
            cmds.skinPercent(skincluster,
                             deformedGeometryNode+'.vtx[%s]' %elements[e],
                             transformValue=(influences[id],
                                             weights[e]*currentWt),
                             relative=False)
        elif method == 2:
            cmds.skinPercent(skincluster,
                             deformedGeometryNode+'.vtx[%s]' %elements[e],
                             transformValue=(influences[id],weights[e]),
                             relative=False)

def ss_blendShapeWeight(*args):
    #args = blendShape name,
    #target shape name,
    #method,
    #global weight = bool
    blendShapeNode = args[0]
    targetShapeNode = args[1]
    method = args[2]
    weightBlendShapeNode = args[3]
    deformedGeometryNode = cmds.listRelatives(cmds.ls(selection=True),parent=True)
    deformedGeometry = cmds.blendShape(blendShapeNode,q=True,geometry=True)
    inputTargetID = deformedGeometry.index(deformedGeometryNode[0])
    blendShapeTargets = cmds.blendShape(blendShapeNode,q=True,target=True)
    inputTargetGroupID = blendShapeTargets.index(targetShapeNode)
    elements,weights = softSelection()
    blendShapeAttr = blendShapeNode+'.inputTarget[{}].inputTargetGroup[{}].targetWeights'.format(inputTargetID,inputTargetGroupID)
    blendShapeWtAttr = blendShapeNode+'.inputTarget[{}].baseWeights'.format(inputTargetID)
    if not weightBlendShapeNode:
        for e in range(len(elements)):
            blendShapeAttrItem = blendShapeAttr+'[{}]'.format(elements[e])
            baseWeightValue = cmds.getAttr(blendShapeAttrItem)
            if method == 0:
                cmds.setAttr(blendShapeAttrItem,weights[e]+baseWeightValue)
            elif method == 1:
                cmds.setAttr(blendShapeAttrItem,weights[e]*baseWeightValue)
            elif method == 2:
                cmds.setAttr(blendShapeAttrItem,weights[e])
    else:
        for e in range(len(elements)):
            blendShapeWtAttrItem = blendShapeWtAttr+'[{}]'.format(elements[e])
            targetWeightValue = cmds.getAttr(blendShapeWtAttrItem)
            if method == 0:
                cmds.setAttr(blendShapeWtAttrItem,weights[e]+targetWeightValue)
            elif method == 1:
                cmds.setAttr(blendShapeWtAttrItem,weights[e]*targetWeightValue)
            elif method == 2:
                cmds.setAttr(blendShapeWtAttrItem,weights[e])

def ss_deformerWeight(*args):
    #args: deformer name
    #method
    deformedGeometryNode = cmds.listRelatives(cmds.ls(selection=True),parent=True)[0]
    deformer = str(args[0])
    method = args[1]
    elements,weights = softSelection()
    for e in range(len(elements)):
        if method == 0:
            cmds.percent(deformer,deformedGeometryNode+'.vtx[{}]'.format(elements[e]),addPercent=weights[e])
        elif method == 1:
            cmds.percent(deformer,deformedGeometryNode+'.vtx[{}]'.format(elements[e]),multiplyPercent=weights[e])
        elif method == 2:
            cmds.percent(deformer,deformedGeometryNode+'.vtx[{}]'.format(elements[e]),value=weights[e])

class ss_skinWeightUI(QtGui.QWidget):

    def __init__(self):
        super(ss_skinWeightUI, self).__init__()

        self.initUI()

    def initUI(self):
        self.hbl = QtGui.QHBoxLayout()
        self.vbl = QtGui.QVBoxLayout()
        self.setLayout(self.hbl)
        self.initbtn = QtGui.QPushButton('Get selected mesh\'s influences', self)
        self.initbtn.clicked.connect(self.listInfluences)
        self.vbl.addWidget(self.initbtn)
        self.modebtn1 = QtGui.QRadioButton('add weight')
        self.modebtn2 = QtGui.QRadioButton('multiply weight')
        self.modebtn3 = QtGui.QRadioButton('replace weight')
        self.vbl.addWidget(self.modebtn1)
        self.vbl.addWidget(self.modebtn2)
        self.vbl.addWidget(self.modebtn3)
        self.btn = QtGui.QPushButton('Weight It!', self)
        self.btn.clicked.connect(self.skinWeight)
        self.vbl.addWidget(self.btn)
        self.btn2 = QtGui.QPushButton('Weight Dual Quaternion Blend!',self)
        self.btn2.clicked.connect(self.dqWeight)
        self.vbl.addWidget(self.btn2)
        self.hbl.addLayout(self.vbl)
        self.lw = QtGui.QListWidget()
        self.lw.setSelectionMode(QtGui.QAbstractItemView.SingleSelection)
        self.hbl.addWidget(self.lw)
        self.setGeometry(300, 300, 290, 150)
        self.setWindowTitle('Convert Soft Selection To Skin Weight')
        self.show()

    def listInfluences(self):
        self.geomNode = cmds.ls(selection=True)[0]
        self.skincluster = mel.eval('findRelatedSkinCluster("%s")' %self.geomNode)
        self.influences = cmds.skinCluster(self.skincluster,q=True,influence=None)
        self.lw.clear()
        for i in self.influences:
            qlitem = QtGui.QListWidgetItem()
            qlitem.setText(i)
            self.lw.addItem(i)

    def skinWeight(self):
        text = self.lw.currentItem().text()
        if self.modebtn1.isChecked():
            mode=0
        elif self.modebtn2.isChecked():
            mode=1
        elif self.modebtn3.isChecked():
            mode=2
        else:
            mode=2
        inflid = self.influences.index(str(text))
        ss_skinWeight(self.skincluster,inflid,mode)

    def dqWeight(self):
        if self.modebtn1.isChecked():
            mode=0
        elif self.modebtn2.isChecked():
            mode=1
        elif self.modebtn3.isChecked():
            mode=2
        else:
            mode=2
        ss_skinWeight(self.skincluster,-1,mode,True)

class ss_blendShapeWeightUI(QtGui.QWidget):

    def __init__(self):
        super(ss_blendShapeWeightUI, self).__init__()

        self.initUI()

    def initUI(self):
        self.hbl = QtGui.QHBoxLayout()
        self.vbl = QtGui.QVBoxLayout()
        self.setLayout(self.hbl)
        self.initbtn = QtGui.QPushButton('Get selected mesh\'s target blendshapes', self)
        self.initbtn.clicked.connect(self.getBlendShapeAndTargets)
        self.vbl.addWidget(self.initbtn)
        self.modebtn1 = QtGui.QRadioButton('add weight')
        self.modebtn2 = QtGui.QRadioButton('multiply weight')
        self.modebtn3 = QtGui.QRadioButton('replace weight')
        self.vbl.addWidget(self.modebtn1)
        self.vbl.addWidget(self.modebtn2)
        self.vbl.addWidget(self.modebtn3)
        self.btn = QtGui.QPushButton('Weight It!', self)
        self.btn.clicked.connect(self.blendShapeTargetWeight)
        self.btn2 = QtGui.QPushButton('Weight BlendShape!',self)
        self.btn2.clicked.connect(self.blendShapeWeight)
        self.vbl.addWidget(self.btn)
        self.vbl.addWidget(self.btn2)
        self.hbl.addLayout(self.vbl)
        self.lw = QtGui.QListWidget()
        self.lw.setSelectionMode(QtGui.QAbstractItemView.SingleSelection)
        self.hbl.addWidget(self.lw)
        self.setGeometry(300, 300, 290, 150)
        self.setWindowTitle('Convert Soft Selection To Blend Shape Weight')
        self.show()

    def getBlendShapeAndTargets(self):
        self.geomNode = cmds.ls(selection=True)[0]
        defchain = mel.eval('getChain "{}"'.format(self.geomNode))
        self.blendShapeNode = cmds.ls(defchain,exactType='blendShape')[0]
        self.blendShapeTargets = cmds.blendShape(self.blendShapeNode,q=True,target=True)
        self.lw.clear()
        for i in self.blendShapeTargets:
            qlitem = QtGui.QListWidgetItem()
            qlitem.setText(i)
            self.lw.addItem(i)

    def blendShapeTargetWeight(self):
        text = self.lw.currentItem().text()
        if self.modebtn1.isChecked():
            mode=0
        elif self.modebtn2.isChecked():
            mode=1
        elif self.modebtn3.isChecked():
            mode=2
        else:
            mode=2
        ss_blendShapeWeight(self.blendShapeNode,text,mode,False)

    def blendShapeWeight(self):
        text = self.lw.currentItem().text()
        if self.modebtn1.isChecked():
            mode=0
        elif self.modebtn2.isChecked():
            mode=1
        elif self.modebtn3.isChecked():
            mode=2
        else:
            mode=2
        ss_blendShapeWeight(self.blendShapeNode,text,mode,True)


class ss_deformerWeightUI(QtGui.QWidget):

    def __init__(self):
        super(ss_deformerWeightUI, self).__init__()

        self.initUI()

    def initUI(self):
        self.hbl = QtGui.QHBoxLayout()
        self.vbl = QtGui.QVBoxLayout()
        self.setLayout(self.hbl)
        self.initbtn = QtGui.QPushButton('Get selected mesh\'s paintable deformers', self)
        self.initbtn.clicked.connect(self.getDeformers)
        self.vbl.addWidget(self.initbtn)
        self.modebtn1 = QtGui.QRadioButton('add weight')
        self.modebtn2 = QtGui.QRadioButton('multiply weight')
        self.modebtn3 = QtGui.QRadioButton('replace weight')
        self.vbl.addWidget(self.modebtn1)
        self.vbl.addWidget(self.modebtn2)
        self.vbl.addWidget(self.modebtn3)
        self.btn = QtGui.QPushButton('Weight It!', self)
        self.btn.clicked.connect(self.weightDeformer)
        self.vbl.addWidget(self.btn)
        self.hbl.addLayout(self.vbl)
        self.lw = QtGui.QListWidget()
        self.lw.setSelectionMode(QtGui.QAbstractItemView.SingleSelection)
        self.hbl.addWidget(self.lw)
        self.setGeometry(300, 300, 290, 150)
        self.setWindowTitle('Convert Soft Selection To Deformer Weight')
        self.show()

    def getDeformers(self):
        cmds.pickWalk(d='down')
        geomNode = cmds.ls(selection=True)[0]
        self.defchain = mel.eval('getChain "{}"'.format(geomNode))
        ffds = cmds.ls(type='ffd')
        blends = cmds.ls(type='blendShape')
        tweaks = cmds.ls(type='tweak')
        skinclusters = cmds.ls(type='skinCluster')
        muscles = cmds.ls(type='cMuscleSplineDeformer')
        muscles += cmds.ls(type='cMuscleSystem')
        muscles += cmds.ls(type='cMuscleMultiCollide')
        muscles += cmds.ls(type='cMuscleStretch')
        maskeddefs = ffds+blends+tweaks+skinclusters+muscles
        for md in maskeddefs:
            if md in self.defchain:
                self.defchain.remove(md)
        self.lw.clear()
        for i in self.defchain:
            qlitem = QtGui.QListWidgetItem()
            qlitem.setText(i)
            self.lw.addItem(i)

    def weightDeformer(self):
        text = self.lw.currentItem().text()
        if self.modebtn1.isChecked():
            mode=0
        elif self.modebtn2.isChecked():
            mode=1
        elif self.modebtn3.isChecked():
            mode=2
        else:
            mode=2
        ss_deformerWeight(text,mode)

class ss_config(object):
    enabled = 1
    undocompressed = 0
    falsecolorenabled = 0
    colorcurve = ''
    curve = ''
    distance = 1.0
    falloff = 1
    presetname = ''
    def __init__(self,name):
        self.querysettings(name)

    def querysettings(self,name=''):
        self.presetname = name
        self.enabled = cmds.softSelect(q=True,softSelectEnabled=True)
        self.distance = cmds.softSelect(q=True,softSelectDistance=True)
        self.curve = cmds.softSelect(q=True,softSelectCurve=True)
        self.colorcurve = cmds.softSelect(q=True,softSelectColorCurve=True)
        self.falloff = cmds.softSelect(q=True,softSelectFalloff=True)
        self.falsecolorenabled = cmds.softSelect(q=True,enableFalseColor=True)
        self.undocompressed = cmds.softSelect(q=True,compressUndo=True)

    def tofilestr(self):
        writestr = '%s \n' %self.presetname
        writestr += 'enabled = %i \n' %self.enabled
        writestr += 'undocompressed = %i \n' %self.undocompressed
        writestr += 'falsecolorenabled = %i \n' %self.falsecolorenabled
        writestr += 'colorcurve = %s \n' %self.colorcurve
        writestr += 'curve = %s \n' %self.curve
        writestr += 'distance = %f \n' %self.distance
        writestr += 'falloff = %i \n' %self.falloff
        return writestr

    def fromstr(self,readstr):
        self.presetname = str(readstr[0].rstrip())
        self.enabled = int(readstr[1].split('=')[1])
        self.undocompressed = int(readstr[2].split('=')[1])
        self.falsecolorenabled = int(readstr[3].split('=')[1])
        self.colorcurve = str(readstr[4].rstrip())
        self.curve = str(readstr[5].rstrip())
        self.distance = float(readstr[6].split('=')[1])
        self.falloff = int(readstr[7].split('=')[1])

    def applysettings(self):
        cmds.softSelect(softSelectEnabled=self.enabled,
                        softSelectDistance=self.distance,
                        softSelectCurve=self.curve,
                        softSelectColorCurve=self.colorcurve,
                        softSelectFalloff=self.falloff,
                        enableFalseColor=self.falsecolorenabled,
                        compressUndo=self.undocompressed)


class ss_configUI(QtGui.QWidget):

    def __init__(self):
        super(ss_configUI, self).__init__()
        self.initUI()

    def initUI(self):
        self.configs = {}
        self.hbl = QtGui.QHBoxLayout()
        self.vbl = QtGui.QVBoxLayout()
        self.setLayout(self.hbl)
        self.btn1 = QtGui.QPushButton('add preset')
        self.btn1.clicked.connect(self.addconfig)
        self.btn1b = QtGui.QPushButton('edit preset')
        self.btn1b.clicked.connect(self.editconfig)
        self.btn1c = QtGui.QPushButton('rename preset')
        self.btn1c.clicked.connect(self.renameconfig)
        self.btn2 = QtGui.QPushButton('delete preset')
        self.btn2.clicked.connect(self.deleteconfig)
        self.btn3 = QtGui.QPushButton('save presets to file')
        self.btn3.clicked.connect(self.savetofile)
        self.btn4 = QtGui.QPushButton('load presets from file')
        self.btn4.clicked.connect(self.loadfromfile)
        self.btn5 = QtGui.QPushButton('clear presets')
        self.btn5.clicked.connect(self.clearpresets)
        self.lw = QtGui.QListWidget()
        self.lw.setSelectionMode(QtGui.QAbstractItemView.SingleSelection)
        self.lw.currentItemChanged.connect(self.setconfig)
        self.vbl.addWidget(self.btn1)
        self.vbl.addWidget(self.btn1b)
        self.vbl.addWidget(self.btn1c)
        self.vbl.addWidget(self.btn2)
        self.vbl.addWidget(self.btn3)
        self.vbl.addWidget(self.btn4)
        self.vbl.addWidget(self.btn5)
        self.hbl.addLayout(self.vbl)
        self.hbl.addWidget(self.lw)
        self.setGeometry(300, 300, 290, 150)
        self.setWindowTitle('Manage Soft Select Settings')
        self.show()

    def addconfig(self):
        name, ok = QtGui.QInputDialog.getText(self,'preset name','enter name for current preset')
        if ok:
            newitem = QtGui.QListWidgetItem()
            newitem.setText(name)
            self.lw.addItem(newitem)
            self.configs[name] = ss_config(name)

    def editconfig(self):
        currentconfig = self.lw.currentItem()
        configname = currentconfig.text()
        self.configs[configname].querysettings(configname)

    def renameconfig(self):
        currentconfig = self.lw.currentItem()
        configname = currentconfig.text()
        del self.configs[configname]
        name, ok = QtGui.QInputDialog.getText(self,'change preset name','enter name for current preset')
        if ok:
            currentconfig.setText(name)
            self.configs[name] = ss_config(name)

    def deleteconfig(self):
        currentconfig = self.lw.currentItem()
        configname = currentconfig.text()
        self.lw.takeItem(self.lw.row(currentconfig))
        del currentconfig
        del self.configs[configname]

    def savetofile(self):
        filename = cmds.fileDialog2()
        filewrite = open(filename[0],'w')
        for config in self.configs:
            lines = self.configs[config].tofilestr()
            filewrite.write(lines)
        filewrite.close()

    def loadfromfile(self):
        filename = cmds.fileDialog()
        fileread = open(filename,'r')
        filestr = fileread.readlines()
        self.lw.clear()
        self.configs = {}
        n=0
        for f in range(len(filestr)/8):
            self.configs[str(filestr[n].rstrip())] = ss_config('')
            self.configs[str(filestr[n].rstrip())].fromstr(filestr[n:n+8])
            newitem = QtGui.QListWidgetItem()
            newitem.setText(str(filestr[n].rstrip()))
            self.lw.addItem(newitem)
            n+=8

    def clearpresets(self):
        self.configs = {}
        self.lw.clear()

    def setconfig(self):
        currentconfig = self.lw.currentItem()
        if currentconfig is None:
            return
        configname = str(currentconfig.text())
        self.configs[configname].applysettings()




class ss_toWeightsUI(QtGui.QWidget):

    def __init__(self):
        super(ss_toWeightsUI, self).__init__()

        self.initUI()

    def initUI(self):

        self.setParent(mayaMainWindow)
        self.setWindowFlags(QtCore.Qt.Window)
        self.gbl = QtGui.QGridLayout()
        self.setLayout(self.gbl)
        self.tabs = QtGui.QTabWidget()
        self.tabs.addTab(ss_skinWeightUI(),"skin cluster")
        self.tabs.addTab(ss_blendShapeWeightUI(),"blend shape")
        self.tabs.addTab(ss_deformerWeightUI(),"other")
        self.tabs.addTab(ss_configUI(),"soft select presets")
        self.gbl.addWidget(self.tabs)
        self.setGeometry(300, 300, 290, 150)
        self.setWindowTitle('Convert Soft Selection To Weights')
        self.show()


sswui = ss_toWeightsUI()







