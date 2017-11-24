#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.11.17

@author: Serious Sam
'''

import logging
from PySide import QtCore, QtGui
from barbarian.utils import config
from . import model


status_colors = {"Check": QtGui.QColor(255, 255, 90, 255),
                 "Approve": QtGui.QColor(90, 255, 90, 255),
                 "FinalApprove": QtGui.QColor(90, 255, 90, 255),
                 "Retake": QtGui.QColor(255, 90, 90, 255)}

fonts = {"h4": QtGui.QFont(u"Century Gothic", 11, QtGui.QFont.Normal),
         "h5": QtGui.QFont(u"微软雅黑", 10, 800)}

stage_icons = {"Modeling": QtGui.QPixmap(config.getPath(config.kIcon, "css/stage_mdl.png")),
               "Mod": QtGui.QPixmap(config.getPath(config.kIcon, "css/stage_mdl.png")),
               "Texturing": QtGui.QPixmap(config.getPath(config.kIcon, "css/stage_txt.png")),
               "Texture": QtGui.QPixmap(config.getPath(config.kIcon, "css/stage_txt.png")),
               "Shading": QtGui.QPixmap(config.getPath(config.kIcon, "css/stage_shd.png")),
               "Shader": QtGui.QPixmap(config.getPath(config.kIcon, "css/stage_shd.png")),
               "Rigging": QtGui.QPixmap(config.getPath(config.kIcon, "css/stage_rig.png")),
               "Rig": QtGui.QPixmap(config.getPath(config.kIcon, "css/stage_rig.png")),
               "Layout": QtGui.QPixmap(config.getPath(config.kIcon, "css/stage_lyt.png")),
               "Animation": QtGui.QPixmap(config.getPath(config.kIcon, "css/stage_anm.png")),
               "Lighting": QtGui.QPixmap(config.getPath(config.kIcon, "css/stage_lgt.png")),
               "Fx": QtGui.QPixmap(config.getPath(config.kIcon, "css/stage_vfx.png"))}


class TaskItemDelegate(QtGui.QStyledItemDelegate):
    
    height_data = 57.0
    height_label = 30.0
    margin = 4.0
    thickness = 1.0
    indent_offset = -21
    
    def __init__(self, parent=None):
        super(TaskItemDelegate, self).__init__(parent)
        
    def paint(self, painter, option, index):
        height = self.height_label if index.data(model.TASK_ITEM_TYPE) == model.TASK_LABEL_TYPE else self.height_data
        indent = self.indent_offset if index.data(model.TASK_ITEM_TYPE) == model.TASK_LABEL_TYPE else self.indent_offset*2
        
        item_rect = option.rect.adjusted(indent+1, 1, -1, 0)
        frame_rect = option.rect.adjusted(indent, 0, 0, 0)
        
        painter.save()
        
        painter.setPen(QtGui.QPen(QtGui.QColor(0, 0, 0, 255)))
        painter.drawRect(frame_rect)
        
        if option.state & QtGui.QStyle.State_Selected:
            g_selected = QtGui.QLinearGradient(0, item_rect.y(), 0, item_rect.y()+height)
            g_selected.setColorAt(0.0, QtGui.QColor(50, 30, 100, 255))
            g_selected.setColorAt(self.thickness/height, QtGui.QColor(90, 40, 140, 255))
            g_selected.setColorAt(1.0, QtGui.QColor(100, 50, 150, 255))
            g_selected.setSpread(QtGui.QGradient.ReflectSpread)
            painter.fillRect(item_rect, g_selected)
            
        elif option.state & QtGui.QStyle.State_MouseOver:
            g_hover = QtGui.QLinearGradient(0, item_rect.y(), 0, item_rect.y()+height)
            g_hover.setColorAt(0.0, QtGui.QColor(200, 100, 255, 255))
            g_hover.setColorAt(self.thickness/height, QtGui.QColor(150, 50, 200, 255))
            g_hover.setColorAt(1.0-self.thickness/height, QtGui.QColor(130, 0, 180, 255))
            g_hover.setColorAt(1.0, QtGui.QColor(80, 0, 80, 255))
            painter.fillRect(item_rect, g_hover)
        
        if index.data(model.TASK_ITEM_TYPE) == model.TASK_LABEL_TYPE:
            branch_rect = item_rect.adjusted(1, 6, -1, -6)
            branch_rect.setWidth(16)
            branch_rect.setHeight(16)
            
            label_rect = item_rect.adjusted(-self.indent_offset, 0, 0, 0)
            
            if option.state & QtGui.QStyle.State_Open:
                branch_icon = config.getPath(config.kIcon, "css/branch-open.png")
            else: 
                branch_icon = config.getPath(config.kIcon, "css/branch-closed.png")
              
            painter.drawPixmap(branch_rect, branch_icon)
            painter.setPen(QtGui.QPen(QtGui.QColor(200, 200, 200, 255)))
            painter.setFont(fonts["h5"])
            painter.drawText(label_rect, QtCore.Qt.AlignVCenter, index.data())
            painter.restore()
            
            return
        
        status_rect = QtCore.QRectF(item_rect).adjusted(self.margin, 
                                                          self.margin, -self.margin, -self.margin-1)
        status_rect.setWidth(15)
        status_color = status_colors.get(index.data(model.TASK_STATUS), QtGui.QColor(255, 255, 255, 255))
        status_shade = QtGui.QLinearGradient(0, status_rect.y(), 0, status_rect.y()+status_rect.height())
        status_shade.setColorAt(0.0, QtGui.QColor(0, 0, 0, 255))
        status_shade.setColorAt(8.0/status_rect.height(), QtGui.QColor(255, 255, 255, 50))
        status_shade.setColorAt(1.0-5.0/status_rect.height(), QtGui.QColor(0, 0, 0, 120))
        status_shade.setColorAt(1.0, QtGui.QColor(0, 0, 0, 180))
        
        stage_rect = QtCore.QRect(item_rect.adjusted(self.margin+16, 
                                                     self.margin, -self.margin, -self.margin))
        stage_rect.setWidth(48)
        stage_rect.setHeight(48)
        
        painter.fillRect(status_rect, status_color)
        painter.fillRect(status_rect, status_shade)
        painter.setPen(QtGui.QPen(QtGui.QColor(0, 0, 0, 255)))
        painter.drawRect(status_rect)
        painter.drawPixmap(stage_rect, stage_icons.get(index.data(model.TASK_STAGE), config.getPath(config.kIcon, "css/stage_null.png")))
        
        painter.restore()
    
    def sizeHint(self, option, index):
        height = self.height_label
        if index.data(model.TASK_ITEM_TYPE) == model.TASK_DATA_TYPE: 
            height = self.height_data
        
        return QtCore.QSize(260, height)
    
    
class TaskMineItemDelegate(TaskItemDelegate):
    
    def paint(self, painter, option, index):
        super(TaskMineItemDelegate, self).paint(painter, option, index)
        
        indent = self.indent_offset if index.data(model.TASK_ITEM_TYPE) == model.TASK_LABEL_TYPE else self.indent_offset*2
        item_rect = option.rect.adjusted(indent, 0, 0, 0)
        name_rect = QtCore.QRect(item_rect.adjusted(self.margin+15+self.margin+48+self.margin, 
                                                    self.margin, -self.margin, -self.margin))
        name_rect.setHeight(24)
        
        painter.save()
        
        painter.setFont(fonts["h4"])
        painter.setPen(QtGui.QPen(QtGui.QColor(255, 255, 255, 255)))
        painter.drawText(name_rect, QtCore.Qt.AlignBottom, index.data(model.TASK_NAME))
        
        if index.data(model.TASK_DATE):
            date_rect = QtCore.QRect(item_rect.adjusted(self.margin+15+self.margin+48+self.margin, 
                                                    self.margin+20+self.margin, 
                                                    -self.margin, -self.margin))
            painter.setFont(fonts["h5"])
            painter.setPen(QtGui.QPen(QtGui.QColor(150, 150, 150, 255)))
            painter.drawText(date_rect, QtCore.Qt.AlignVCenter, u"预计完成日期：%s"%index.data(model.TASK_DATE))
        
        painter.restore()
    
    
class TaskCheckItemDelegate(TaskItemDelegate):
    
    def paint(self, painter, option, index):
        super(TaskCheckItemDelegate, self).paint(painter, option, index)
        
        indent = self.indent_offset if index.data(model.TASK_ITEM_TYPE) == model.TASK_LABEL_TYPE else self.indent_offset*2
        item_rect = option.rect.adjusted(indent, 0, 0, 0)
        name_rect = QtCore.QRect(item_rect.adjusted(self.margin+15+self.margin+48+self.margin, 
                                                    self.margin, -self.margin, -self.margin))
        name_rect.setHeight(24)
        
        painter.save()
        
        painter.setFont(fonts["h4"])
        painter.setPen(QtGui.QPen(QtGui.QColor(255, 255, 255, 255)))
        painter.drawText(name_rect, QtCore.Qt.AlignBottom, index.data(model.TASK_NAME))
        
        if index.data(model.TASK_LAST):
            last_rect = QtCore.QRect(item_rect.adjusted(self.margin+15+self.margin+48+self.margin, 
                                                    self.margin+20+self.margin, 
                                                    -self.margin, -self.margin))
            painter.setFont(fonts["h5"])
            painter.setPen(QtGui.QPen(QtGui.QColor(150, 150, 150, 255)))
            painter.drawText(last_rect, QtCore.Qt.AlignVCenter, u"更新于：%s"%index.data(model.TASK_LAST))
        
        painter.restore()
        
        
class TaskAllItemDelegate(TaskItemDelegate):
    
    def paint(self, painter, option, index):
        super(TaskAllItemDelegate, self).paint(painter, option, index)
        
        indent = self.indent_offset if index.data(model.TASK_ITEM_TYPE) == model.TASK_LABEL_TYPE else self.indent_offset*2
        item_rect = option.rect.adjusted(indent, 0, 0, 0)
        name_rect = QtCore.QRect(item_rect.adjusted(self.margin+15+self.margin+48+self.margin, 
                                                    self.margin, -self.margin, -self.margin))
        name_rect.setHeight(24)
        
        painter.save()
        
        painter.setFont(fonts["h4"])
        painter.setPen(QtGui.QPen(QtGui.QColor(255, 255, 255, 255)))
        painter.drawText(name_rect, QtCore.Qt.AlignBottom, index.data(model.TASK_STAGE))
        
        if index.data(model.TASK_ARTIST):
            artist_rect = QtCore.QRect(item_rect.adjusted(self.margin+15+self.margin+48+self.margin, 
                                                    self.margin+20+self.margin, 
                                                    -self.margin, -self.margin))
            artist_rect.setWidth(130)
            painter.setFont(fonts["h5"])
            painter.setPen(QtGui.QPen(QtGui.QColor(150, 150, 150, 255)))
            painter.drawText(artist_rect, QtCore.Qt.AlignVCenter, index.data(model.TASK_ARTIST))
        
        if index.data(model.TASK_DATE):
            date_rect = QtCore.QRect(item_rect.adjusted(self.margin+15+self.margin+160+self.margin, 
                                                      self.margin+20+self.margin, 
                                                      -self.margin, -self.margin))
            painter.setFont(fonts["h5"])
            painter.setPen(QtGui.QPen(QtGui.QColor(120, 120, 120, 255)))
            painter.drawText(date_rect, QtCore.Qt.AlignVCenter, index.data(model.TASK_DATE))
        
        painter.restore()
        
    
    
    