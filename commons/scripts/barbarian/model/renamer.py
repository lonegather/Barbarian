#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.7.23
@author: Serious Sam
'''

from maya import cmds
from barbarian.utils import ui


def UI(*_):
    Renamer("renamer",
            searchTextField  = "renamerLESearch",
            replaceTextField = "renamerLEReplace",
            renameTextField  = "renamerLEMiddle",
            prefixTextField  = "renamerLEPrefix",
            suffixTextField  = "renamerLESuffix",
            prefixOptionMenu = "renamerCBPrefix")


class Renamer(ui.QtUI):
    '''
    --------------------------------------------------------------------------------
    Class Representing the Rename Tool
    --------------------------------------------------------------------------------
    '''
    def setupUi(self):
        pass
    
    def rename(self, *_):

        prefix_dic = {"Middle": "M", "Left": "L", "Right": "R", "Up": "U",
                     "Down": "D", "Front": "F", "Back": "B"}
    
        dag_type_dic = {"group": "GRP",
                        "mesh": "Geo",
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
        
        name = cmds.textField(self.renameTextField, q=True, tx=True)
        options = cmds.optionMenu(self.prefixOptionMenu, q=True, v=True)
    
        for sel in sels:
            
            if cmds.objectType(sel) == "transform": 
                if not cmds.listRelatives(sel, shapes=True): obj_type = "group"
                else:
                    pick_walk = cmds.pickWalk(sel, d="down")
                    cmds.select(sel)
                    obj_type = cmds.objectType(pick_walk)
            else: obj_type = cmds.objectType(sel)
    
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
        
    def addPrefix(self, *_):
        sels = cmds.ls(sl=True)
        name = cmds.textField(self.prefixTextField, q=True, tx=True)
        
        for sel in sels:
            cmds.rename(sel, name+"_"+sel)
        
    def addSuffix(self, *_):
        sels = cmds.ls(sl=True)
        name = cmds.textField(self.suffixTextField, q=True, tx=True)
        
        for sel in sels:
            cmds.rename(sel, sel+"_"+name)
            
    def search(self, *_):
        find_string = cmds.textField(self.searchTextField, q=True, text=True)
        matches = cmds.ls("*" + find_string + "*", type="transform")
        cmds.select(matches, r=True)
    
    def replace(self, *_):
        find_string = cmds.textField(self.searchTextField, q=True, text=True)
        replace_string = cmds.textField(self.replaceTextField, q=True, text=True)
        matches = cmds.ls(sl=True)
        
        for match in matches:
            new_name = match.split("|")[-1].replace(find_string, replace_string)
            cmds.rename(match, new_name)