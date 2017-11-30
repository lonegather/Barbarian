#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.11.29

@author: Serious Sam
'''

import sys, math
from maya import standalone, cmds
import db


def setup_scene(source, target, asset_type):
    asset_types = {"char":db.char_light_path, "prop":db.prop_light_path}
    
    pm.openFile(asset_types[asset_type])
    pm.createReference(source)
    
    top_level_dag = cmds.ls(assemblies=True)
    top_level_obj = ""
    for dag in top_level_dag:
        if cmds.listRelatives(dag, shapes=True): continue
        child_dag = cmds.listRelatives(dag, children=True)
        for dag in child_dag:
            if dag.count("_Geo") or dag.count("_Geometry"):
                top_level_obj = dag
        if top_level_obj: break
    if not top_level_obj:
        return db.gen_failure_msg
    
    bounding_box_max = cmds.getAttr("%s.boundingBoxMax"%top_level_obj)[0]
    bounding_box_min = cmds.getAttr("%s.boundingBoxMin"%top_level_obj)[0]
    bb_max_x = max(math.fabs(bounding_box_min[0]), math.fabs(bounding_box_max[0]))
    bb_max_z = max(math.fabs(bounding_box_min[2]), math.fabs(bounding_box_max[2]))
    camera_y = math.sqrt((math.pow(bb_max_x, 2) + math.pow(bounding_box_max[1]*.5, 2) + math.pow(bb_max_z, 2)))
    camera_z = camera_y * 3.6 * (2.6 - min(max(1.0, max(bb_max_x, bb_max_z) / bounding_box_max[1] * 2.0), 1.5))
    angle = math.atan((bounding_box_max[1]*.5 - camera_y)/camera_z)
    
    camera_name = db.camera_name
    if "%sGrp"%camera_name in cmds.ls(assemblies=True):
        try: cmds.delete("%sGrp"%camera_name)
        except: pass
    
    cmds.camera(focalLength=60, displayResolution=True, displayGateMask=True)
    cmds.rename(camera_name)
    cmds.group(camera_name)
    cmds.rename("%sGrp"%camera_name)
    
    cmds.setAttr("%s.translateY"%camera_name, camera_y)
    cmds.setAttr("%s.translateZ"%camera_name, camera_z*math.cos(angle))
    cmds.setAttr("%s.rotateX"%camera_name, angle/math.pi*180)
    
    pm.setKeyframe("%sGrp"%camera_name, outTangentType="linear", time=1, value=0, attribute="rotateY")
    pm.setKeyframe("%sGrp"%camera_name, inTangentType="linear", time=26, value=360, attribute="rotateY")
    
    pm.saveAs(target)
    
    return db.gen_success_msg


if __name__ == "__main__":

    standalone.initialize(name="python")
    
    import pymel.core as pm
    pm.loadPlugin("mtoa.mll", quiet=True)
    
    print setup_scene(*sys.argv[1:])
    
    cmds.quit(force=True)
    
    sys.exit()
    


