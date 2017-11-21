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

fonts = {"h3": QtGui.QFont(u"微软雅黑", 15, 900),
         "h4": QtGui.QFont(u"微软雅黑", 12, 400),
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
    
    height_data = 75.0
    height_label = 30.0
    margin = 9
    thickness = 1.0
    
    def __init__(self, parent=None):
        super(TaskItemDelegate, self).__init__(parent)
        
    def paint(self, painter, option, index):
        if index.data(model.TASK_ITEM_TYPE) == model.TASK_LABEL_TYPE: 
            height = self.height_label
            indent = 0
        else: 
            height = self.height_data
            indent = -42
        
        item_rect = option.rect.adjusted(indent, 0, 0, 0)
        
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
            super(TaskItemDelegate, self).paint(painter, option, index)
            return
        
        status_rect = QtCore.QRectF(item_rect).adjusted(self.margin, 
                                                          self.margin, -self.margin, -self.margin)
        status_rect.setWidth(15)
        status_color = status_colors.get(index.data(model.TASK_STATUS), QtGui.QColor(255, 255, 255, 255))
        
        stage_rect = QtCore.QRect(item_rect.adjusted(self.margin+15+self.margin, 
                                                     self.margin, -self.margin, -self.margin))
        stage_rect.setWidth(60)
        stage_rect.setHeight(25)
        
        name_rect = QtCore.QRect(item_rect.adjusted(self.margin+15+self.margin+60+self.margin, 
                                                    self.margin, -self.margin, -self.margin))
        name_rect.setHeight(25)
        
        date_rect = QtCore.QRect(item_rect.adjusted(self.margin+15+self.margin, 
                                                    self.margin+25+self.margin, 
                                                    -self.margin, -self.margin))
        date_rect.setWidth(200)
        
        painter.save()
        
        painter.fillRect(status_rect, status_color)
        painter.drawPixmap(stage_rect, stage_icons.get(index.data(model.TASK_STAGE), config.getPath(config.kIcon, "css/stage_null.png")))
        
        painter.setFont(fonts["h4"])
        painter.setPen(QtGui.QPen(QtGui.QColor(255, 255, 255, 255)))
        painter.drawText(name_rect, index.data(model.TASK_NAME))
        
        if index.data(model.TASK_DATE):
            painter.setFont(fonts["h5"])
            painter.setPen(QtGui.QPen(QtGui.QColor(120, 120, 120, 255)))
            painter.drawText(date_rect, u"截止日期：%s"%index.data(model.TASK_DATE))
        
        painter.restore()
    
    def sizeHint(self, option, index):
        width_map = [250, 100]
        height = self.height_label
        if index.data(model.TASK_ITEM_TYPE) == model.TASK_DATA_TYPE: height = self.height_data
        return QtCore.QSize(width_map[index.column()], height)
        
        
class TaskAllItemDelegate(TaskItemDelegate):
    
    def paint(self, painter, option, index):
        super(TaskAllItemDelegate, self).paint(painter, option, index)
        
        if index.data(model.TASK_ITEM_TYPE) == model.TASK_LABEL_TYPE: indent = 0
        else: indent = -42
        
        item_rect = option.rect.adjusted(indent, 0, 0, 0)
        
        artist_rect = QtCore.QRect(item_rect.adjusted(self.margin+15+self.margin+200+self.margin, 
                                                      self.margin+25+self.margin, 
                                                      -self.margin, -self.margin))
        
        painter.save()
        
        if index.data(model.TASK_ARTIST):
            painter.setFont(fonts["h5"])
            painter.setPen(QtGui.QPen(QtGui.QColor(120, 120, 120, 255)))
            painter.drawText(artist_rect, u"制作者：%s"%index.data(model.TASK_ARTIST))
        
        painter.restore()
        
    
    
    