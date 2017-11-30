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
    
    cmd = "render -r arnold -s 1 -e 25 -cam {camera_name} -rd {output_dir} {target}".format(**locals()).replace('/', '\\')
    if subprocess.Popen(cmd, shell=True).wait() == 0:
        print db.render_success_msg
        
    sys.exit()