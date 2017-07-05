'''
Created on 2017.7.5

@author: Sam
'''

import os
import pymel.core as pm
from barbarian.utils import getConfig
from pymel.internal.pmcmds import file


class AnimRepository(object):
    '''
    classdocs
    '''
    
    @classmethod
    def UI(cls):
        pass
    
    @classmethod
    def getFileList(cls, path):
        p = os.popen("dir \"%s\" *.anim /b" % path)
        fileList = p.read().split("\n")
        p.close()
        del fileList[-1]
        return fileList
    
    @classmethod
    def getDirectoryList(cls, path):
        p = os.popen("dir \"%s\" d /b" % path)
        fileList = p.read().split("\n")
        p.close()
        del fileList[-1]
        return fileList
        
    @classmethod
    def animImport(cls, filePath, time, copies=1):
        fileName = filePath.split("/")[-1]
        fileNameSpace = fileName.split(".")[0]
        opt = "targetTime=3;option=merge;pictures=0;connect=0;"
        opt = opt + "time=%d;" % time
        opt = opt + "copies=%d" % copies
        
        file(filePath, type="animImport", ns=fileNameSpace, options=opt, 
             i=True, iv=True, ra=True, mnc=False, pr=True)
        
    @classmethod
    def animExport(cls, filePath, startTime, endTime):
        opt = "precision=8;intValue=17;nodeNames=1;verboseUnits=0;whichRange=2;"
        opt = opt + "range=%d:%d;" % (startTime, endTime)
        opt = opt + "options=curve;hierarchy=below;controlPoints=0;shapes=0;helpPictures=1;useChannelBox=0;"
        opt = opt + "copyKeyCmd=-animation objects "
        opt = opt + "-time >%d:%d> -float >%d:%d> " % (startTime, endTime, startTime, endTime)
        opt = opt + "-option curve -hierarchy below -controlPoints 0 -shape 0 "
        
        file(filePath, type="animExport", options=opt, 
             force=True, es=True, pr=True)
        
        
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
     
file -force 
     -options "precision=8;intValue=17;nodeNames=1;verboseUnits=0;whichRange=2;range=0:24;options=curve;hierarchy=below;controlPoints=0;shapes=0;helpPictures=1;useChannelBox=0;
               copyKeyCmd=-animation objects -time >0:24> -float >0:24> -option curve -hierarchy below -controlPoints 0 -shape 0 " 
     -typ "animExport" 
     -pr 
     -es 
     "F:/walk.anim";
'''