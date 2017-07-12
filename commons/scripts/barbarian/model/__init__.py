from maya import cmds
from barbarian.utils import getPath, kUI


class Renamer(object):
    '''
    --------------------------------------------------------------------------------
    Class Representing the Rename Tool
    --------------------------------------------------------------------------------
    '''
    win              = "renamerWin"
    searchTextField  = "searchInput"
    replaceTextField = "replaceInput"
    renameTextField  = "middleInput"
    prefixTextField  = "prefixInput"
    suffixTextField  = "suffixInput"
    prefixOptionMenu = "prefixCmb"
    
    def __init__(self):
        if cmds.window(Renamer.win, exists=True):
            cmds.deleteUI(Renamer.win)
        
        cmds.loadUI(f=getPath(kUI, "renamer.ui"))
        cmds.showWindow(Renamer.win)
    
    @classmethod
    def rename(cls):

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
        
        name = cmds.textField(cls.renameTextField, q=True, tx=True)
        options = cmds.optionMenu(cls.prefixOptionMenu, q=True, v=True)
    
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
                
            try: suffix = "_" + num_str + "_" + tmp_dic[obj_type]
            except: continue
            
            new_name = prefix + name + suffix
    
            while cmds.objExists(new_name) and new_name != sel:
                num = num + 1
                num_str = "%02d" % num
                new_name = prefix + name + "_" + \
                    num_str + "_" + tmp_dic[obj_type]
    
            cmds.rename(sel, new_name)
        
    @classmethod
    def addPrefix(cls):
        sels = cmds.ls(sl=True)
        name = cmds.textField(cls.prefixTextField, q=True, tx=True)
        
        for sel in sels:
            cmds.rename(sel, name+"_"+sel)
        
    @classmethod
    def addSuffix(cls):
        sels = cmds.ls(sl=True)
        name = cmds.textField(cls.suffixTextField, q=True, tx=True)
        
        for sel in sels:
            cmds.rename(sel, sel+"_"+name)
            
    @classmethod
    def search(cls):
        find_string = cmds.textField(cls.searchTextField, q=True, text=True)
        matches = cmds.ls("*" + find_string + "*", type="transform")
        cmds.select(matches, r=True)
    
    @classmethod
    def replace(cls):
        find_string = cmds.textField(cls.searchTextField, q=True, text=True)
        replace_string = cmds.textField(cls.replaceTextField, q=True, text=True)
        matches = cmds.ls(sl=True)
        
        for match in matches:
            new_name = match.split("|")[-1].replace(find_string, replace_string)
            cmds.rename(match, new_name)


