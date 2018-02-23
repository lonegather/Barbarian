#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.7.10

@author: Sam
'''

import os
import sys
from maya import cmds

ignore_list = [
    'barbarian',
    'barbarian.reloader',
    'barbarian.rig.blendShapeMel.blend',
    'barbarian.rig.blendShapeMel.pathAdd',
]


def doIt(rl=False):

    import barbarian
    from barbarian.utils.ui import QtUI

    if rl:
        cmds.optionVar(rm="PutaoTools_Project")
        mode = cmds.setMenuMode()
        cmds.setMenuMode(mode)
        barbarian.tool.__refreshUI__()
        QtUI.cleanUp()

    base = '%s/' % os.path.dirname(os.path.dirname(__file__)).replace('\\', '/')
    for root, dirs, files in os.walk(base):
        for f in files:
            if f[-3:] == '.py':
                root = root.replace('\\', '/')
                rel_path = os.path.join(root, f).replace('\\', '/').split(base)[-1][:-3].split('/')
                if rel_path[-1] == '__init__':
                    rel_path = rel_path[:-1]
                mod = '.'.join(rel_path)
                if mod in ignore_list: continue
                try:
                    __import__(mod)
                    if rl: reload(sys.modules[mod])
                except Exception as err:
                    print(err)
