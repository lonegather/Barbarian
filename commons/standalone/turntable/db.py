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
char_location = "P:/PT/DB/Common/Turntable/CH/" #"E:/turntable/CH/"
prop_location = "P:/PT/DB/Common/Turntable/Prop/" #"E:/turntable/Prop/"
char_light_path = "P:/PT/DB/Common/LGT_CH_Turntable.mb" #"E:/turntable/CH/LGT_CH_Turntable.mb"
prop_light_path = "P:/PT/DB/Common/LGT_Prop_Turntable.mb" #"E:/turntable/Prop/LGT_Prop_Turntable.mb"

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


def file_list():
    return FileInfo.list


def add_file(*file_list):
    for f in file_list: FileInfo.list.append(f)


class FileInfo():
    list = []



