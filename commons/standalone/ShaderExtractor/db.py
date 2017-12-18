#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.11.28

@author: Serious Sam
'''

import os, sys

os.environ["ARNOLD_PLUGIN_PATH"] = "C:/solidangle/Custom Shaders/4.1/bin;;C:/solidangle/mtoadeploy/2016/shaders"
os.environ["MTOA_PATH"] = "C:/solidangle/mtoadeploy/2016/"
os.environ["MTOA_TEMPLATES_PATH"] = "C:/solidangle/Custom Shaders/4.1/ae"
os.environ["MTOA_EXTENSIONS_PATH"] = "C:/solidangle/mtoadeploy/2016/extensions"
sys.path.append("C:/solidangle/mtoadeploy/2016/scripts")
sys.path.append("C:/solidangle/mtoadeploy/2016/")

camera_name = "TurnTableCam"

maya_renderer = "%s/bin/Render.exe" % os.getenv("MAYA_LOCATION").replace('\\', '/')
maya_interpreter = "%s/bin/mayapy.exe" % os.getenv("MAYA_LOCATION").replace('\\', '/')
tool_location = "Z:/Workflow/Barbarian_1.0/commons/"
asset_location = "P:/PT/DB/"

init_success_msg = "TurnTable initialization succeeded."
init_failure_msg = "TurnTable initialization failed."
gen_success_msg = "TurnTable generation succeeded."
gen_failure_msg = "TurnTable generation failed."
render_success_msg = "TurnTable renderer succeeded."
render_failure_msg = "TurnTable renderer failed."
com_success_msg = "TurnTable composite succeeded."
com_failure_msg = "TurnTable composite failed."


def get_path(*args):
    path = ""
    for arg in args: path += arg
    return path


def frame():
    return Info.frame


def set_frame(num):
    Info.frame = num
    
    
def request_scene():
    current = 0
    for scene in Info.list:
        if scene["status"] not in ["wait", "done", "failed"]:
            current += 1
    
    if current < Info.concurrent:
        for scene in Info.list:
            if scene["status"] == "wait":
                scene["status"] = "init"
                return scene
    
    return None


def set_concurrent(num):
    Info.concurrent = num
    

def all_done():
    for scene in Info.list:
        if not scene["status"] in ["done", "failed"]:
            return False
    return True


def file_list():
    return Info.list


def add_file(*file_list):
    for f in file_list: Info.list.append(f)


class Info():
    list = []
    frame = 1
    concurrent = 1



