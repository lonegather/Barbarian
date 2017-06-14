#########################################################################
# Created on 2016-7-22
# 
# @author: Sam
#########################################################################

import os
import sys
import maya.api.OpenMaya as om
import maya.cmds as cmds
import maya.mel as mel

def maya_useNewAPI():
    """
    The presence of this function tells Maya that the plugin produces, and
    expects to be passed, objects created using the Maya Python API 2.0.
    """
    pass

# command
class PyPBMpegCmd(om.MPxCommand):
    kPluginCmdName = "pyPBMpeg"

    def __init__(self):
        om.MPxCommand.__init__(self)

    @staticmethod
    def cmdCreator():
        return PyPBMpegCmd()

    def doIt(self, args):
        fullPath = cmds.file(q=1, exn=1)
        fileName = cmds.file(q=1, sn=1, shn=1)
        
        if fileName == '' :
            sys.stderr.write("File not saved!")
            return
        
        videoNameList = str(fileName).split(".")
        videoName = ""
        
        for i in range(len(videoNameList) - 1) :
            videoName = videoName + videoNameList[i]
            if i < len(videoNameList) - 1 :
                videoName = videoName + '.'
                
        videoOutName = videoName + 'mov'
        videoName = videoName + 'avi'
        
        
        pathList = str(fullPath).split(fileName)
        path = ""
        for i in range(len(pathList) - 1) :
            path = path + pathList[i]
            
        videoPath = path + videoName
        videoOutPath = path + videoOutName
        
        soundTmp = mel.eval('$tmpVar=$gPlayBackSlider')
        soundObj = cmds.timeControl(soundTmp, q=1, sound=1)
        
        startFrame = cmds.playbackOptions(q=1, minTime=1)
        endFrame = cmds.playbackOptions(q=1, maxTime=1)
        if soundObj :
            playblastFile = cmds.playblast(st = startFrame,
                                           et = endFrame,
                                           format = 'avi',
                                           forceOverwrite = True,
                                           sound = soundObj,
                                           filename = videoPath,
                                           clearCache = 1,
                                           viewer = 0,
                                           showOrnaments = 1,
                                           fp = 4,
                                           percent = 75,
                                           quality = 100,
                                           offScreen = False,
                                           compression = 'none',
                                           widthHeight = [1280, 720])
        else :
            playblastFile = cmds.playblast(st = startFrame,
                                           et = endFrame,
                                           format = 'avi',
                                           forceOverwrite = True,
                                           filename = videoPath,
                                           clearCache = 1,
                                           viewer = 0,
                                           showOrnaments = 1,
                                           fp = 4,
                                           percent = 75,
                                           quality = 100,
                                           offScreen = False,
                                           compression = 'none',
                                           widthHeight = [1280, 720])
        
        mp = os.getenv('BARBARIAN_LOCATION')
        mp += "../commons/bin/ffmpeg.exe"
        resultCmd = r'%s -i %s -vcodec "mpeg4" -y -qscale 0 %s' % (mp, os.path.abspath(playblastFile), os.path.abspath(videoOutPath))
        print(resultCmd + "\n")
        sys.stderr.write('Encodeing...\n')
        out = os.popen(resultCmd).read()
        sys.stderr.write("out: " + out)
        os.remove(playblastFile)
        os.system('explorer "%s"' % os.path.abspath(videoOutPath))
        
        cmds.currentTime(startFrame)
        


# Initialize the plug-in
def initializePlugin(plugin):
    pluginFn = om.MFnPlugin(plugin)
    try:
        pluginFn.registerCommand(
            PyPBMpegCmd.kPluginCmdName, PyPBMpegCmd.cmdCreator
        )
    except:
        sys.stderr.write(
            "Failed to register command: %s\n" % PyPBMpegCmd.kPluginCmdName
        )
        raise


# Uninitialize the plug-in
def uninitializePlugin(plugin):
    pluginFn = om.MFnPlugin(plugin)
    try:
        pluginFn.deregisterCommand(PyPBMpegCmd.kPluginCmdName)
    except:
        sys.stderr.write(
            "Failed to unregister command: %s\n" % PyPBMpegCmd.kPluginCmdName
        )
        raise
