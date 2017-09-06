#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.9.1

@author: Serious Sam
'''

from maya import cmds
import config
from barbarian.anim import cmdKeyframe


def applyConfig():
    cmds.currentUnit(time=config.getConfig('time'), updateAnimation=False)
    
    ast = int(cmds.playbackOptions(q=1, ast=1))
    aet = int(cmds.playbackOptions(q=1, aet=1))
    mint = int(cmds.playbackOptions(q=1, min=1))
    maxt = int(cmds.playbackOptions(q=1, max=1))
    configAST = config.getConfig('startFrame')
    offset = configAST - ast
    cmdKeyframe(offset)
    cmds.currentTime(configAST)
    cmds.playbackOptions(min=mint+offset, max=maxt+offset, ast=ast+offset, aet=aet+offset)
    
    cmds.setAttr("%s.width"%cmds.ls(renderResolutions=True)[0], config.getConfig('camResX'))
    cmds.setAttr("%s.height"%cmds.ls(renderResolutions=True)[0], config.getConfig('camResY'))
    
    
def displayAppearance(look):
    allPanels = cmds.getPanel(type='modelPanel')
    for p in allPanels:
        cmds.modelEditor(p, edit=True, displayAppearance=look)