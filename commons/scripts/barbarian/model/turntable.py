﻿#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.11.21

@author: Serious Sam
'''

import os, logging, math, threading
from maya import cmds, mel


def create():
    if not cmds.file(q=1, sn=1, shn=1):
        cmds.headsUpMessage(u'文件未保存', time=1)
        return
    
    file_path = cmds.file(q=1, sn=1)
    workspace = cmds.workspace(q=True, fullName=True)
    output_path = "E:/turntable/"
    maya_location = "\"%s/bin/Render.exe\"" % os.getenv("MAYA_LOCATION")
    
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
        cmds.headsUpMessage(u"找不到有效的几何对象", time=1)
        return
    
    bounding_box_max = cmds.getAttr("%s.boundingBoxMax"%top_level_obj)[0]
    bounding_box_min = cmds.getAttr("%s.boundingBoxMin"%top_level_obj)[0]
    bb_max_x = max(math.fabs(bounding_box_min[0]), math.fabs(bounding_box_max[0]))
    bb_max_z = max(math.fabs(bounding_box_min[2]), math.fabs(bounding_box_max[2]))
    camera_y = math.sqrt((math.pow(bb_max_x, 2) + math.pow(bounding_box_max[1]*.5, 2) + math.pow(bb_max_z, 2)))
    camera_z = camera_y * 3.6 * (2.6 - min(max(1.0, max(bb_max_x, bb_max_z) / bounding_box_max[1] * 2.0), 1.5))
    angle = math.atan((bounding_box_max[1]*.5 - camera_y)/camera_z)
    
    camera_name = "TurnTableCam"
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
    
    min_time = cmds.playbackOptions(q=True, minTime=True)
    max_time = cmds.playbackOptions(q=True, maxTime=True)
    
    cmds.setKeyframe("%sGrp"%camera_name, outTangentType="linear", time=min_time, value=0, attribute="rotateY")
    cmds.setKeyframe("%sGrp"%camera_name, inTangentType="linear", time=max_time, value=360, attribute="rotateY")
    
    cmds.file(save=True)
    
    cmd = "{maya_location} -r arnold -s {min_time} -e {max_time} -cam {camera_name} -rd {output_path} -im name_#.ext {file_path}".format(**locals())
    
    thread = threading.Thread(target=batchRender, args=(cmd,))
    thread.setDaemon(True)
    thread.start()
    
    
def batchRender(command):
    os.system(command)
    
    


