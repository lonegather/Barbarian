'''
Created on 2017.7.5

@author: Sam
'''

import os
import pymel.core as pm
from barbarian.utils import *


class AnimRepository(object):
    '''
    classdocs
    '''
    @classmethod
    def getFileList(cls, path):
        p = os.popen("dir \"%s\" /b" % path)
        fileList = p.read().split("\n")
        p.close()
        del fileList[-1]
        return fileList
        