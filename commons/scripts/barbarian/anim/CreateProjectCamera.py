import maya.cmds as mc
from barbarian.utils import *
import pymel.core as pm

class CreateCamera():
    
    wind = "CameraWindow"
    optionM = "optionMenuSet"

    @classmethod
    def CreCam(cls):

        CameraListA = getConfig(camera=True)
        CameraListB = getConfig(camResX=True)
        CameraListC = getConfig(camResY=True)
        
        
        getProject(all=True)
        
        #homeName = mc.cameraView(camera='MainCam')
        # 创建摄像机
        cameraName = CameraListA
        listCam = mc.listCameras(perspective=True)
        
        if not cameraName in listCam:
            createCam = mc.camera(name=cameraName, displayResolution=True)
            mc.rename(cameraName)
            
        width = mc.setAttr("defaultResolution.width", CameraListB)
        height = mc.setAttr("defaultResolution.height", CameraListC)
        
        mc.select(cameraName, r=True)
          
        try:
            add = mc.addAttr(cameraName, ln='Focal_Length', attributeType='double', defaultValue=35, minValue=0, maxValue=200)
            set = mc.setAttr(cameraName+".Focal_Length", edit=True, keyable=True)
            con = mc.connectAttr(cameraName+".Focal_Length", cameraName+"Shape.focalLength", force=True)
            
        except:    
            pass
        
    
    @classmethod
    def CameraUI(cls):
        
        
        if pm.window(cls.wind, exists=True): pm.deleteUI(cls.wind)
        pm.loadUI(f=getPath(kUI, "CameraWindow.ui"))
        pm.window(cls.wind, e=True, mxb=False, leftEdge=100, topEdge=100)
        pm.showWindow(cls.wind)
        
        projects = getProject(all=True)
        
        if projects:
            for project in projects:
                pm.menuItem(l=project, parent=cls.optionM)
            pm.optionMenu(cls.optionM, e=True, changeCommand=setProject)
            if not getProject(): setProject(projects[0])
