import barbarian.model.renamer
import barbarian.model.checkModel
import barbarian.model.RemoveNamespace

import pymel.core as pm
from barbarian.utils import *


class Renamer(object):
    '''
    --------------------------------------------------------------------------------
    Class Representing the Rename Tool
    --------------------------------------------------------------------------------
    '''
    win              = "renamerWin"
    renameTextField  = "middleInput"
    prefixTextField  = "prefixInput"
    suffixTextField  = "suffixInput"
    prefixOptionMenu = "prefixCmb"
    prefixCheckBox   = "prefixChk"
    suffixCheckBox   = "suffixChk"
    
    def __init__(self):
        if pm.window(Renamer.win, exists=True):
            pm.deleteUI(Renamer.win)
        
        pm.loadUI(f=getPath(kUI, "renamer.ui"))
        pm.showWindow(Renamer.win)
    
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
    
        sels = pm.ls(sl=True)
        
        name = pm.textField(cls.renameTextField, q=True, tx=True)
        options = pm.optionMenu(cls.prefixOptionMenu, q=True, v=True)
    
        for sel in sels:
    
            pick_walk = pm.pickWalk(sel, d="down")
            pm.select(sel)
            obj_type = pm.objectType(pick_walk)
    
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
            
            if pm.checkBox(cls.prefixCheckBox, q=True, value=True):
                prefix = pm.textField(cls.prefixTextField, q=True, text=True)
                if prefix: prefix = prefix + "_"
                
            suffix = "_" + num_str + "_" + tmp_dic[obj_type]
            useCustomSuffix = pm.checkBox(cls.suffixCheckBox, q=True, value=True)
            if useCustomSuffix:
                suffix = pm.textField(cls.suffixTextField, q=True, text=True)
                if suffix: suffix = "_" + suffix
            
            new_name = prefix + name + suffix
    
            while not useCustomSuffix and pm.objExists(new_name) and new_name != sel:
                num = num + 1
                num_str = "%02d" % num
                new_name = prefix + name + "_" + \
                    num_str + "_" + tmp_dic[obj_type]
    
            pm.rename(sel, new_name)
    
    @classmethod
    def refresh(cls):
        prefChkState = pm.checkBox(cls.prefixCheckBox, q=True, value=True)
        suffChkState = pm.checkBox(cls.suffixCheckBox, q=True, value=True)
        
        pm.textField(cls.prefixTextField, e=True, enable=prefChkState)
        pm.textField(cls.suffixTextField, e=True, enable=suffChkState)
        pm.optionMenu(cls.prefixOptionMenu, e=True, enable=not prefChkState)