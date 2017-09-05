#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.9.1

@author: Serious Sam
'''

from maya import cmds
import config


def applyConfig():
    cmds.currentUnit(time=config.getConfig('time'), updateAnimation=False)
    cmds.playbackOptions(min=config.getConfig('startFrame'), ast=config.getConfig('startFrame'))
    cmds.setAttr("%s.width"%cmds.ls(renderResolutions=True)[0], config.getConfig('camResX'))
    cmds.setAttr("%s.height"%cmds.ls(renderResolutions=True)[0], config.getConfig('camResY'))
    
    
def displayAppearance(look):
    allPanels = cmds.getPanel(type='modelPanel')
    for p in allPanels:
        cmds.modelEditor(p, edit=True, displayAppearance=look)