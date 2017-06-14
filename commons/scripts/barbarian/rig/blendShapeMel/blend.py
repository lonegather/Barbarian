import pathAdd
reload(pathAdd)

from blendShapeManage import *
import blendShapeManage
reload(blendShapeManage)
mel.eval('source gg_BSpiritCorrectiveShape')
blendShapeManage.blendShapeManage_UI()

#把 gg_BSpiritCorrectiveShape 这个放到 C:\Users\你自己的电脑名\Documents\maya\2013-x64\scripts目录下，
#blendShapeManage 放到你自己目录和 C:\Users\你自己的电脑名\Documents\maya\2013-x64\scripts目录下都行。
#然后就愉快的玩耍吧。