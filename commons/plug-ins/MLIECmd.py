#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.7.16

@author: Serious Sam
'''

import sys, types
import maya.api.OpenMaya as om
from maya import cmds


def maya_useNewAPI():
    """
    The presence of this function tells Maya that the plugin produces, and
    expects to be passed, objects created using the Maya Python API 2.0.
    """
    pass


def initializePlugin(plugin):
    '''
    Initialize the plug-in
    '''
    pluginFn = om.MFnPlugin(plugin)
    try: pluginFn.registerCommand(MotionLibImport.kPluginCommand, MotionLibImport.creator, MotionLibImport.newSyntax)
    except: sys.stderr.write("Failed to register command: %s\n"%MotionLibImport.kPluginCommand);raise
    try: pluginFn.registerCommand(MotionLibExport.kPluginCommand, MotionLibExport.creator)
    except: sys.stderr.write("Failed to register command: %s\n"%MotionLibExport.kPluginCommand);raise


def uninitializePlugin(plugin):
    '''
    Uninitialize the plug-in
    '''
    pluginFn = om.MFnPlugin(plugin)
    try: pluginFn.deregisterCommand(MotionLibImport.kPluginCommand)
    except: sys.stderr.write("Failed to deregister command: %s\n"%MotionLibImport.kPluginCommand);raise
    try: pluginFn.deregisterCommand(MotionLibExport.kPluginCommand)
    except: sys.stderr.write("Failed to deregister command: %s\n"%MotionLibExport.kPluginCommand);raise


class MotionLibImport(om.MPxCommand):
    
    kPluginCommand = "motionImport"
    
    kFlagTime = "-t"
    kFlagTimeLong = "-time"
    kFlagCopy = "-c"
    kFlagCopyLong = "-copy"
    kFlagFile = "-f"
    kFlagFileLong = "-file"
    kFlagMode = "-m"
    kFlagModeLong = "-mode"
    
    @staticmethod
    def creator():
        return MotionLibImport()
    
    @staticmethod
    def newSyntax():
        syntax = om.MSyntax()
        
        syntax.setObjectType(om.MSyntax.kSelectionList)
        syntax.useSelectionAsDefault(True)
        syntax.addFlag(MotionLibImport.kFlagTime, MotionLibImport.kFlagTimeLong, om.MSyntax.kDouble)
        syntax.addFlag(MotionLibImport.kFlagCopy, MotionLibImport.kFlagCopyLong, om.MSyntax.kDouble)
        syntax.addFlag(MotionLibImport.kFlagFile, MotionLibImport.kFlagFileLong, om.MSyntax.kString)
        syntax.addFlag(MotionLibImport.kFlagMode, MotionLibImport.kFlagModeLong, om.MSyntax.kString)
        
        syntax.enableEdit = False
        syntax.enableQuery = False
        
        return syntax
    
    def __init__(self):
        om.MPxCommand.__init__(self)
        
    def doIt(self, argList):
        try: argData = om.MArgDatabase(self.syntax(), argList)
        except RuntimeError: om.MGlobal.displayError('Error while parsing arguments:\n#\t#');raise
        
        self.selection = argData.getObjectList().getSelectionStrings()
        if argData.isFlagSet(self.kFlagCopy): 
            self.copy = argData.flagArgumentDouble(self.kFlagCopy, 0)
        else: 
            self.copy = 1
        if argData.isFlagSet(self.kFlagMode):
            self.mode = argData.flagArgumentString(self.kFlagMode, 0)
            if not self.mode in ["insert", "merge"]:
                om.MGlobal.displayError('Error while parsing arguments: -mode accepts only "insert" or "merge"')
                return
        else: 
            self.mode = "insert"
        if argData.isFlagSet(self.kFlagFile):
            self.file = argData.flagArgumentString(self.kFlagFile, 0)
            if not type(self.file) is types.UnicodeType:
                om.MGlobal.displayError('Error while parsing arguments: -file accepts only string value')
                return
        else: 
            om.MGlobal.displayError('Error while parsing arguments: -f or -file required')
            return
        if argData.isFlagSet(self.kFlagTime):
            try:
                self.time = argData.flagArgumentDouble(self.kFlagTime, 0)
            except:
                om.MGlobal.displayError('Error while parsing arguments: -time accepts only numeric value')
                return
        else: 
            om.MGlobal.displayError('Error while parsing arguments: -t or -time required')
            return
        
        print self.selection, self.copy, self.file, self.time, self.mode
        
        self.option = "targetTime=3;pictures=0;connect=0;option=%s;"%self.mode
        self.option += "time=%d;copies=%d;" % (self.time, self.copy)
        self.namespace = self.file.split("\\")[-1].split(".")[0]
        self.redoIt()
    
    def redoIt(self):
        cmds.file(self.file, type="animImport", ns=self.namespace, options=self.option, 
                  i=True, iv=True, ra=True, mnc=False, pr=True)
    
    def undoIt(self):
        if cmds.objExists(self.selection[0]):
            cmds.delete(self.selection[0])
        cmds.select(clear=True)
        self.redoIt()
    
    def isUndoable(self, *args, **kwargs):
        return True


class MotionLibExport(om.MPxCommand):
    
    kPluginCommand = "motionExport"
    
    @staticmethod
    def creator():
        return MotionLibExport()
    
    def doIt(self, argList):
        print "MotionLibExport: doIt()"
        pass


