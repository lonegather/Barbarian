#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.11.29

@author: Serious Sam
'''

import sys
from maya import standalone, cmds
import db


def setup_scene(source, target):
    import pymel.core as pm
    
    pm.openFile(source)
    
    top_level_dag = cmds.ls(assemblies=True)
    top_level_obj = ""
    for dag in top_level_dag:
        if cmds.listRelatives(dag, shapes=True): continue
        child_dag = cmds.listRelatives(dag, children=True)
        for dag in child_dag:
            if dag.count("Main") or dag.count("_Ctrl"):
                top_level_obj = dag
        if top_level_obj: break
    if not top_level_obj:
        return db.gen_failure_msg
    
    pm.delete(top_level_obj)
    pm.saveAs(target)
    
    return db.gen_success_msg


if __name__ == "__main__":

    standalone.initialize(name="python")
    
    print setup_scene(*sys.argv[1:])
    
    cmds.quit(force=True)
    sys.exit()
    


