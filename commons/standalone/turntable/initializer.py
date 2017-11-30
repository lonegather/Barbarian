#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.11.29

@author: Serious Sam
'''

import os, sys, errno
import db


if __name__ == "__main__":
    source = sys.argv[1]
    target = sys.argv[2]
    asset_type = sys.argv[3]
    
    target_dir = os.path.split(target)[0]
    target_image_dir = target_dir + "/images/"
    
    try:
        os.makedirs(target_dir)
    except OSError as e:
        if e.errno != errno.EEXIST:  # Already exists
            print db.init_failure_msg
            sys.exit(1)
            
    try:
        os.makedirs(target_image_dir)
    except OSError as e:
        if e.errno != errno.EEXIST:  # Already exists
            print db.init_failure_msg
            sys.exit(1)
    
    print db.init_success_msg
    sys.exit(0)
    
    