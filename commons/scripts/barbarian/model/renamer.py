import maya.cmds as cmds
import pymel.core as pm

text_find = ""
text_replace = ""
text_prefix = ""
text_suffix = ""
text_button = ""
options_menu = ""

def renameCtrl():

    prefix_dic = {"Middle": "M", "Left": "L", "Right": "R", "Up": "U",
                 "Down": "D", "Front": "F", "Back": "B"}

    dag_type_dic = {"mesh": "Geo",
                    "nurbsSurface": "Nbs",
                    "joint": "Jnt",
                    "clusterHandle": "Cus",
                    "multiplyDivide": "Mul",
                    "plusMinusAverage": "Pma",
                    "locator": "Loc",
                    "distanceDimShape": "Dis",
                    "parentConstraint": "Pat",
                    "orientConstraint": "Oct",
                    "pointConstraint": "Pot",
                    "aimConstraint": "Aim",
                    "poleVectorConstraint": "Pvc",
                    "transform": "GRP",
                    "lattice": "Lie",
                    "baseLattice": "Ble",
                    "ikHandle": "Ikh",
                    "ikEffector": "Ike",
                    "nurbsCurve": "Crv",
                    "deformSine": "Sin",
                    "deformBend": "Ben", }

    dg_type_dic = {"aiStandard": "Ais",
                   "aiSkin": "Sss",
                   "aiAmbientOcclusion": "Aao",
                   "aiUtility": "Aut",
                   "lambert": "Lam",
                   "blinn": "Bli",
                   "surfaceShader": "Sfs", }

    sels = cmds.ls(sl=True)

    name = cmds.textFieldButtonGrp(text_button, q=True, tx=True)
    options = cmds.optionMenuGrp(options_menu, q=True, v=True)

    for sel in sels:

        pick_walk = cmds.pickWalk(sel, d="down")
        cmds.select(sel)
        obj_type = cmds.objectType(pick_walk)

        num = 1
        new_name = ""
        num_str = "%02d" % num

        prefix = prefix_dic[options] + "_"
        tmp_dic = dag_type_dic
        
        for key in dg_type_dic:
            if key == obj_type:
                prefix = ""
                tmp_dic = dg_type_dic
                break

        new_name = prefix + name + "_" + num_str + "_" + tmp_dic[obj_type]

        while cmds.objExists(new_name) and new_name != sel:
            num = num + 1
            num_str = "%02d" % num
            new_name = prefix + name + "_" + \
                num_str + "_" + tmp_dic[obj_type]

        cmds.rename(sel, new_name)


def selectHi():

    cruve_option = cmds.optionMenuGrp(options_menu, q=True, v=True)
    print cruve_option


def get_matches():
    find_string = cmds.textFieldButtonGrp(text_find, q=True, text=True)
    matches = cmds.ls("*" + find_string + "*", type="transform")

    return matches


def replace():
    find_string = cmds.textFieldButtonGrp(text_find, q=True, text=True)
    replace_string = cmds.textFieldButtonGrp(text_replace, q=True, text=True)
    # changed the matches to be based on selection
    matches = cmds.ls(sl=True)

    for match in matches:

        new_name = match.split("|")[-1].replace(find_string, replace_string)
        cmds.rename(match, new_name)


def add_prefix():
    prefix = cmds.textFieldButtonGrp(text_prefix, q=True, text=True)
    matches = cmds.ls(sl=True)

    for match in matches:
        new_name = prefix + match.split("|")[-1]
        cmds.rename(match, new_name)


def add_suffix():
    suffix = cmds.textFieldButtonGrp(text_suffix, q=True, text=True)
    matches = cmds.ls(sl=True)

    for match in matches:
        new_name = match.split("|")[-1] + suffix
        cmds.rename(match, new_name)


def find():
    matches = get_matches()
    cmds.select(matches, r=True)


def show():
    global text_find, text_replace, text_prefix, text_suffix, text_button, options_menu
    #    create windows
    win_name = "renameCtrl"

    if cmds.window(win_name, q=True, ex=True):
        cmds.deleteUI(win_name)

    #    Edit windowUI
    my_win = cmds.window(win_name, t=u'葡萄动画重命名脚本')

    cmds.columnLayout(p=my_win, adj=True, rowSpacing=6)

    text_find = pm.textFieldButtonGrp(
        l=u'查询名', buttonLabel=u'查询', cw=(1, 50), adj=2, buttonCommand=find)
    text_replace = pm.textFieldButtonGrp(
        l=u'替换名', buttonLabel=u'替换', cw=(1, 50), adj=2, buttonCommand=replace)
    text_prefix = pm.textFieldButtonGrp(
        l=u'前缀名', buttonLabel=u'加前缀', cw=(1, 50), adj=2, buttonCommand=add_prefix)
    text_suffix = pm.textFieldButtonGrp(
        l=u'后缀名', buttonLabel=u'加后缀', cw=(1, 50), adj=2, buttonCommand=add_suffix)
    text_button = pm.textFieldButtonGrp(
        l=u'取新名', buttonLabel=u'重命名', cw=(1, 50), adj=2, buttonCommand=renameCtrl)

    options_menu = cmds.optionMenuGrp(l=u'方向', cw=(1, 50))
    cmds.menuItem(l="Middle")
    cmds.menuItem(l="Left")
    cmds.menuItem(l="Right")
    cmds.menuItem(l="Up")
    cmds.menuItem(l="Down")
    cmds.menuItem(l="Front")
    cmds.menuItem(l="Back", )

    #    show windowUI
    cmds.window(my_win, e=True, wh=(300, 190))
    cmds.showWindow(my_win)
