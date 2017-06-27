import pymel.core as pm
import maya.mel as mm
from barbarian.utils import checkingBoxBase

'''
class checkingBoxCmd(cbb.checkingBoxCmd):
    pass
'''
class checkingBoxUI(checkingBoxBase.checkingBoxUI):
    
    title = 'Checking Box - Model'
    win_height = 530
    def updateList(self, *args):
        checkingBoxBase.checkingBoxUI.updateList(self,*args)
        #checking1()
        clearRedundantShapes()
        clearUnusedNodes()
        clearLightLinkers()
        zeroMeshPoints()
        checkAxis()
        checkNamespace()
        checkSameObjs()
        nameShapes()
        cleanup()
        delHistory()
        checkUVSets()
        checkNormals()
        checkScale()
        checkOthers()
# Cmds ========================================
class checking1(checkingBoxBase.checkingBoxCmd):
    label = u'checking1'
    def cmd(self):
        #self.cont = ''
        print 'checking1'
        self.cont += u'Finish'
        return 1
    def showInfo(self):
        checkingBoxBase.checkingBoxCmd.showInfo(self)
        pm.text(al='left',l='other info')
class clearLightLinkers(checkingBoxBase.checkingBoxCmd):
    label = u'清理灯光链接'
    def cmd(self):
        try:
            mm.eval("jrLightLinksCleanUp")
            self.cont = u'清理完成。'
            return 1
        except:
            self.cont = u'清理失败。'
            return 0

class zeroMeshPoints(checkingBoxBase.checkingBoxCmd):
    label = u'顶点归零'
    def cmd(self):
        try:
            # mm.eval('zeroMeshPoints(1)')
            from barbarian.utils import zeroMeshPoints
            zeroMeshPoints.run()
            self.cont = u'完成归零。'
            return 1
        except:
            self.cont = u'归零失败。'
            return 0

class checkNamespace(checkingBoxBase.checkingBoxCmd):
    label = u'检查namespace'
    def cmd(self):
        from barbarian.utils import checkNamespace
        ins = checkNamespace.CheckNamespace()
        ins.listNamespaces()
        if not ins.state:
            self.cont = u'无namespace。'
            return 1
        else:
            self.cont = u'请删除场景中的Namespace。'
            return 0

class checkSameObjs(checkingBoxBase.checkingBoxCmd):
    label = u'检查同名的物体'
    def cmd(self):
        import barbarian.utils.checkSameName as checkSameName
        ins = checkSameName.checkSameName()
        ins.check()
        if ins.list=={}:
            return 1
        else:
            self.cont = u'点击下列物体名称进行选择'
            return 0
    def showInfo(self):
        checkingBoxBase.checkingBoxCmd.showInfo(self)
        import barbarian.utils.checkSameName as checkSameName
        ins = checkSameName.checkSameName()
        ins.check()
        ins.showUI(self.infoUI)
class checkNormals(checkingBoxBase.checkingBoxCmd):
    label = u'检查法线'
    def cmd(self):
        mm.eval('setNamedPanelLayout "Single Perspective View"')
        pm.modelEditor('modelPanel4',e=1,twoSidedLighting=0,udm=1)
        pm.setFocus('modelPanel4')
        mm.eval('DisplayShaded')
        self.cont = u'单视图显示\n'
        self.cont += u'单个默认灯光\n'
        self.cont += u'使用默认材质显示\n'
        self.cont += u'实体显示\n'
        self.cont += u'\n请检查各物体的法线...\n'
        return .5
class checkOthers(checkingBoxBase.checkingBoxCmd):
    label = u'其它检查项目'
    def cmd(self):
        self.cont = u'请检查：\n'
        self.cont += u'1.模型对称性\n'
        self.cont += u'2.布线结构\n'
        self.cont += u'3.物体穿插\n'
        return .5
class checkUVSets(checkingBoxBase.checkingBoxCmd):
    label = u'检查UV'
    def cmd(self):
        cont = u''
        objs = pm.ls(type='mesh')
        for obj in objs:
            auv = pm.polyUVSet(obj, q=1, auv=1)
            if len(auv)>1:
                cont += u'%s存在多个UVSet:\n'%obj
                for uv in auv:
                    cont += '%s,'%uv
                cont += '\n'
                cuv = pm.polyUVSet(obj,q=1, cuv=1)
                if cuv!= 'map1':
                    cont += u'当前UV：%s\n'%cuv
        if cont != '':
            self.cont = cont
            return 0
        else:
            self.cont = u'所有物体UVSet正常！\n'
            self.cont += u'请检查UV是否有重叠和扭曲的情况...\n'
            return .5
class cleanup(checkingBoxBase.checkingBoxCmd):
    label = u'cleanup检查模型错误'
    def cmd(self):
        cmd = r'polyCleanupArgList 3 { "0","2","1","0","1","0","1","0","0","1e-005","0","1e-005","0","1e-005","0","1","1" }'
        objs = pm.ls(type='mesh')
        if objs==[]:
            self.cont = 'No mesh...'
            return 1
        pm.select(objs,r=1)
        result = mm.eval(cmd)
        if result==[]:
            self.cont = 'No items found to cleanup.'
            return 1
        else:
            self.cont = 'hilite:\n'
            for item in result:
                self.cont += item + '\n'
            return .5
class clearUnusedNodes(checkingBoxBase.checkingBoxCmd):
    label = u'清理无用的节点'
    def cmd(self):
        self.cont = ''
        # Get nodes
        cams = mm.eval('listTransforms -cameras')
        lits = mm.eval('listTransforms -lights')
        nodes = pm.ls(type=['displayLayer','renderLayer'])
        try:
            nodes.extend(pm.ls(type='mentalraySubdivApprox'))  # For mental ray
        except:
            pass
        # Del nodes
        self.cont += self.delNodes(cams)    # del cameras
        self.cont += self.delNodes(lits)    # del lights
        self.cont += self.delNodes(nodes)   # del other nodes
        try:
            mm.eval('MLdeleteUnused')       # del shaders
        except:
            self.cont += 'Unused Shader Node\n'
        # Result
        cleanList = u'清理列表：\n'
        cleanList += 'camera\nlight\ndisplayLayer\nrenderLayer\nmentalraySubdivApprox\nUnused Shader Node\n'
        cleanList += '\n'
        if self.cont=='':
            self.cont = cleanList + u'已完全清理!'
            return 1
        else:
            self.cont = cleanList + u'下列节点清理失败：\n' + self.cont
            return 0
    def delNodes(self,nodes):
        defaultNodes = ['top','side','front','persp','defaultLayer','defaultRenderLayer','defaultObjectSet']
        act = ''
        for node in nodes:
            if node not in defaultNodes:
                try:
                    pm.delete( node )
                except:
                    act = node + '\n'
        return act

class nameShapes(checkingBoxBase.checkingBoxCmd):
    label = u'shape名称与transform名称一致'
    def cmd(self):
        self.cont = ''
        do = ''
        notdo = ''
        nodes = pm.ls(type='transform')
        for node in nodes:
            shapes = pm.listRelatives(node,s=1,f=1,type=('mesh','nurbsSurface'))
            if len(shapes):
                print shapes
                shape = shapes[0]
                name = node.rsplit('|',1)[-1] + 'Shape'
                if not shape.endswith(name):
                    try:
                        pm.rename(shape,name)
                        do += '%s       %s\n'%(shape,name)
                    except:
                        notdo += '%s\n'%shape
        if not do=='':
            self.cont += u'重命名物体：\n'
            self.cont += do
        if not notdo=='':
            self.cont += u'重命名失败：\n'
            self.cont += notdo
        if self.cont=='':
            self.cont += u'所有shape名称都与transform名称一致！'
            return 1
        elif notdo=='':
            return 1
        else:
            return 0
class clearRedundantShapes(checkingBoxBase.checkingBoxCmd):
    label = u'清除多余的shape节点'
    def cmd(self):
        count = 0
        nodes = pm.ls(type='transform')
        for node in nodes:
            shapes = pm.listRelatives(node,s=1,f=1,ni=1)
            if shapes!=None and len(shapes)>1:
                shapes.pop(0)
                pm.delete(shapes)
                count += 1
        self.cont = u'处理多余的shape节点： %s\n\n'%count
        self.cont += u'注：\n不处理中介节点'
        return 1

class delHistory(checkingBoxBase.checkingBoxCmd):
    label = u'删除历史'
    def cmd(self):
        self.cont = self.zeroSmooth()
        self.cont += self.unlockNormal()
        self.cont += self.delHistory()
        if self.cont=='':
            self.cont = u'场景中无模型物体！！！'
        return 1
    def delHistory(self):
        cont = ''
        nodes = pm.ls(type=('mesh','nurbsSurface'))
        if nodes!=[]:
            pm.delete(nodes,ch=1)
            cont = u'删除历史：%s\n'%len(nodes)
        return cont
    def unlockNormal(self):
        cont = ''
        nodes = pm.ls(type=('mesh','nurbsSurface'))
        if nodes!=[]:
            pm.polyNormalPerVertex(nodes, ufn=1)
            cont = u'Unlock Normal 节点： %s\n'%len(nodes)
        return cont
    def zeroSmooth(self):
        cont = ''
        nodes = pm.ls(type='polySmoothFace')
        for node in nodes:
            pm.setAttr((node+'.divisions'),0)
        if nodes!=[]:
            cont = u'处理smooth节点： %s\n'%len(nodes)
        return cont

class checkAxis(checkingBoxBase.checkingBoxCmd):
    label = u'轴心点回物体中心，位移旋转缩放属性设为默认值'
    def cmd(self):
        error = ''
        objs = pm.ls(type=('mesh','nurbsSurface'))
        for obj in objs:
            p = pm.listRelatives(obj,p=1,f=1)[0]
            pm.xform(p,cp=1)
            try:
                pm.makeIdentity(p,a=1,t=1,r=1,s=1,n=0)
            except:
                error += '%s\n'%p
        if error!='':
            self.cont = u'以下物体处理失败：\n'
            self.cont += error
            self.cont += u'物体属性被锁定或者被连接，\n请手动检查...'
            return 0.5
        self.cont = u'处理物体： %s\n'%len(objs)
        return 1

class checkScale(checkingBoxBase.checkingBoxCmd):
    label = u'检查模型比例'
    cont = ''
    def cmd(self):
        Max = None
        Min = None
        objs = pm.ls(ni=1,type=['mesh','nurbsSurface'])    #as=1
        for obj in objs:
            #print obj;print Max;print Min
            vis = pm.getAttr((obj+'.v'))
            if vis:
                bbMax = pm.getAttr((obj+'.boundingBoxMax'))[0]
                bbMin = pm.getAttr((obj+'.boundingBoxMin'))[0]
                if Max==None: Max = [bbMax[0],bbMax[1],bbMax[2]]
                else:
                    if bbMax[0]>Max[0]: Max[0] = bbMax[0]
                    if bbMax[1]>Max[1]: Max[1] = bbMax[1]
                    if bbMax[2]>Max[2]: Max[2] = bbMax[2]
                if Min==None: Min = [bbMin[0],bbMin[1],bbMin[2]]
                else:
                    if bbMin[0]<Min[0]: Min[0] = bbMin[0]
                    if bbMin[1]<Min[1]: Min[1] = bbMin[1]
                    if bbMin[2]<Min[2]: Min[2] = bbMin[2]
        if Max==None:
            self.cont = u'场景中没有物体存在。'
        else:
            size = (Max[0]-Min[0],Max[1]-Min[1],Max[2]-Min[2])
            unit = pm.currentUnit(q=1,l=1)
            self.cont = u'场景当前长度单位为：%s\n\n'%unit
            self.cont += u'模型尺寸为：\n'
            scale = 0.1
            unit = 'm'
            self.cont += u'X: %.3f %s\nY: %.3f %s\nZ: %.3f %s\n\n'%(size[0]*scale,unit,size[1]*scale,unit,size[2]*scale,unit,)
            self.cont += u'注：\n不检查隐藏的物体\n'
            self.cont += u'请确保场景中除模型物体以外，\n其它物体（camera, light, Locator...）都已隐藏,'
        return .5


# Main ------------------
def checkModel():
    obj = checkingBoxUI('checkModel')
    obj.build()
    obj.show()