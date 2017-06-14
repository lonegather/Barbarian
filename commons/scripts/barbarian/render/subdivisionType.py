import maya.cmds as cmds

def subdivisionType():
    
    sel = cmds.ls(sl=True)
    subd_type = cmds.intSliderGrp(int_Slider, q=True, v=True)
    options_type = cmds.optionMenuGrp(subdivision_menu, q=True, v=True)
    
    if options_type == "none":
        options_type = 0
    if options_type == "catclark":
        options_type = 1
    if options_type == "linear":
        options_type = 2
    
    for sels in sel:
        
        set_aisIter = cmds.setAttr (sels + ".aiSubdivIterations", subd_type)
        set_aistype = cmds.setAttr (sels + ".aiSubdivType", options_type)
    
def UI():
	windowName = "aiswindow"

	if cmds.window(windowName, q=True, ex=True):
		cmds.deleteUI(windowName)

	#    Edit windowUI     
	myWindow = cmds.window(windowName, t="SubdivisionSelection")
	column_layout = cmds.columnLayout(p=myWindow, adj=True, )

	subdivision_menu = cmds.optionMenuGrp(l="type", cw=(1,50), changeCommand="subdivisionType()")
	none = cmds.menuItem(l="none")
	catclark = cmds.menuItem(l="catclark")
	linear = cmds.menuItem(l="linear")

	int_Slider = cmds.intSliderGrp(label="Iterations", field=True, minValue=0, maxValue=5, fieldMinValue=0, fieldMaxValue=5, value=0, cw=(1,50), cc="subdivisionType()")

	cmds.window(myWindow, e=True, wh=(300,70))
	cmds.showWindow(myWindow)
