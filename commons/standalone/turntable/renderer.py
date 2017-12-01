#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.11.29

@author: Serious Sam
'''

import os, sys, subprocess
import db


if __name__ == "__main__":
    
    target = sys.argv[1]
    output_dir = os.path.split(target)[0] + "/images/"
    renderer = db.maya_renderer
    camera_name = db.camera_name
    frame = sys.argv[2]
    
    cmd = "render -r arnold -s 1 -e {frame} -cam {camera_name} -rd {output_dir} {target}".format(**locals()).replace('/', '\\')
    subprocess.call(cmd)
        
    sys.exit()