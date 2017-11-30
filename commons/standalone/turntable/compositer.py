#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.11.30

@author: Serious Sam
'''

import os, sys, subprocess
import db


if __name__ == "__main__":
    
    output_dir, output_name = os.path.split(sys.argv[1])
    image_name = "%s_%%02d.tif" % output_name.split('.')[0]
    image_path = "%s/images/%s" % (output_dir, image_name)
    video_path = "%s.mov" % sys.argv[1].split('.')[0]
    ffmpeg_path = db.get_path(db.tool_location, "bin/ffmpeg")
    
    cmd = "{ffmpeg_path} -i \"{image_path}\" -vcodec \"mpeg4\" -y -qscale 0 \"{video_path}\"".format(**locals())
    if subprocess.Popen(cmd, shell=True).wait() == 0:
        print db.com_success_msg
        
    sys.exit()