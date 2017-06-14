import maya.cmds as cmds

def select_type():
    
    Mesh = cmds.ls(type="mesh")
    NBS = cmds.ls(type="nurbsSurface")
    Locator = cmds.ls(type="locator")
    Joint = cmds.ls(type="joint")
    MUL = cmds.ls(type="multiplyDivide")
    distanceDim = cmds.ls(type="distanceDimShape")
    parentCon = cmds.ls(type="parentConstraint")
    orientCon = cmds.ls(type="orientConstraint")
    pointCon = cmds.ls(type="pointConstraint")
    amiCon = cmds.ls(type="aimConstraint")
    scaleCon = cmds.ls(type="scaleConstraint")
    nurbsCRV = cmds.ls(type="nurbsCurve")
    ikHand = cmds.ls(type="ikHandle")
    ikEff = cmds.ls(type="ikEffector")
    Lattice = cmds.ls(type="lattice")
    baseLatt = cmds.ls(type="baseLattice")
    CLU = cmds.ls(type="clusterHandle")
    
    options = cmds.optionMenuGrp(objType_menu, q=True, v=True)
    
    if options == "mesh":
        cmds.select(Mesh)
        cmds.pickWalk(d="up")

    if options == "nurbsSurface":
        cmds.select(NBS)
        cmds.pickWalk(d="up")

    if options == "joint":
        cmds.select(Joint)

    if options == "locator":
        cmds.select(Locator)
        cmds.pickWalk(d="up")
        
    if options == "ikHandle":
        cmds.select(ikHand)
        
    if options == "ikEffector":
        cmds.select(ikEff)
        
    if options == "nurbsCurve":
        cmds.select(nurbsCRV)
        cmds.pickWalk(d="up")

    if options == "parentConstraint":
        cmds.select(parentCon)

    if options == "orientConstraint":
        cmds.select(orientCon)

    if options == "pointConstraint":
        cmds.select(pointCon)

    if options == "scaleConstraint":
        cmds.select(scaleCon)

    if options == "aimConstraint":
        cmds.select(amiCon)

    if options == "distanceDimension":
        cmds.select(distanceDim)
        cmds.pickWalk(d="up")
        
    if options == "lattice":
        cmds.select(Lattice)
        cmds.pickWalk(d="up")

    if options == "baseLattice":
        cmds.select(baseLatt)
        cmds.pickWalk(d="up")
        
    if options == "cluster":
        cmds.select(CLU)
        cmds.pickWalk(d="up")

def show():
	#    create windows
	windowName = "renameCtrl"

	if cmds.window(windowName, q=True, ex=True):
		cmds.deleteUI(windowName)

	#    Edit windowUI     
	myWindow = cmds.window(windowName, t=u"选择场景物体类型脚本")

	column_layout = cmds.columnLayout(p=myWindow, adj=True, rowSpacing=6)

	objType_menu = cmds.optionMenuGrp(l=u"物体类型", cw=(1,50))
	Center = cmds.menuItem(l="mesh")
	Lift = cmds.menuItem(l="nurbsSurface")
	Right = cmds.menuItem(l="joint")
	Up = cmds.menuItem(l="locator")
	Down = cmds.menuItem(l="ikHandle")
	Front = cmds.menuItem(l="nurbsCurve")
	Back = cmds.menuItem(l="parentConstraint", )
	ori = cmds.menuItem(l="orientConstraint", )
	poi = cmds.menuItem(l="pointConstraint", )
	scal = cmds.menuItem(l="scaleConstraint", )
	ami = cmds.menuItem(l="aimConstraint", )
	ikE = cmds.menuItem(l="ikEffector", )
	Latt = cmds.menuItem(l="lattice", )
	Base = cmds.menuItem(l="baseLattice", )
	Dist = cmds.menuItem(l="distanceDimension")
	Clu = cmds.menuItem(l="cluster")


	create_button = cmds.button(l=u"选择", c="select_type()")

	#    show windowUI
	cmds.window(myWindow, e=True, wh=(200,100))
	cmds.showWindow(myWindow)
