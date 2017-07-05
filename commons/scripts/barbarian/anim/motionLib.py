'''
Created on 2017.7.5

@author: Sam
'''

import os
import pymel.core as pm
from barbarian.utils import *
from pymel.internal.pmcmds import file


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
        
    @classmethod
    def animImport(cls, filePath, time, copies=1):
        fileName = filePath.split("/")[-1]
        fileNameSpace = fileName.split(".")[0]
        file(i=True, type="animImport", iv=True, ra=True, mnc=False, ns=fileName, )
        
        
'''
file -import 
     -type "animImport"  
     -ignoreVersion 
     -ra true 
     -mergeNamespacesOnClash false 
     -namespace "walk" 
     -options ";targetTime=3;time=10;copies=1;option=merge;pictures=0;connect=0;"  
     -pr 
     "F:/walk.anim";
     
file -import 
     -type "animImport"  
     -ignoreVersion 
     -ra true 
     -mergeNamespacesOnClash false 
     -namespace "walk" 
     -options ";targetTime=3;time=25;copies=2;option=merge;pictures=1;connect=0;"  
     -pr 
     "F:/walk.anim";


     
file -force 
     -options "precision=8;intValue=17;nodeNames=1;verboseUnits=0;whichRange=2;range=0:24;options=curve;hierarchy=below;controlPoints=0;shapes=0;helpPictures=1;useChannelBox=0;copyKeyCmd=-animation objects -time >0:24> -float >0:24> -option curve -hierarchy below -controlPoints 0 -shape 0 " 
     -typ "animExport" 
     -pr 
     -es 
     "F:/walk.anim";

file -force 
     -options "precision=8;intValue=17;nodeNames=1;verboseUnits=0;whichRange=2;range=0:16;options=curve;hierarchy=below;controlPoints=0;shapes=0;helpPictures=1;useChannelBox=0;copyKeyCmd=-animation objects -time >0:16> -float >0:16> -option curve -hierarchy below -controlPoints 0 -shape 0 " 
     -typ "animExport" 
     -pr 
     -es 
     "F:/run.anim";
'''