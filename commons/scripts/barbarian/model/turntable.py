#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.11.21

@author: Serious Sam
'''

import logging
from maya import cmds, mel


def create():
    
    logging.info(match())


def match(obj, exp):
    return mel.eval("gmatch \"%s\" \"%s\";"%(obj, exp))