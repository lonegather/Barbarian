#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.11.29

@author: Serious Sam
'''

from PySide import QtCore, QtGui
from turntable import model


class FileDelegate(QtGui.QStyledItemDelegate):
    
    item_height = 50
    margin = 5
    
    def __init__(self, parent=None):
        super(FileDelegate, self).__init__(parent)
        
    def paint(self, painter, option, index):
        item_rect = option.rect.adjusted(1, 1, -1, 0)
        frame_rect = option.rect.adjusted(0, 0, -1, 0)
        name_rect = option.rect.adjusted(self.margin, self.margin, -self.margin, 0)
        name_rect.setHeight(20)
        type_rect = option.rect.adjusted(self.margin, self.margin+20+self.margin, -self.margin, -self.margin)
        progress_rect = item_rect.adjusted(2, 2, -2, -2)
        progress_rect.setWidth(progress_rect.width()*index.data(model.scene_progress))
        
        if index.data(model.scene_stat) == "generating":
            painter.fillRect(item_rect, QtGui.QColor(255, 180, 100, 255))
        elif index.data(model.scene_stat) == "rendering":
            painter.fillRect(item_rect, QtGui.QColor(255, 255, 100, 255))
        elif index.data(model.scene_stat) == "compositing":
            painter.fillRect(item_rect, QtGui.QColor(180, 255, 100, 255))
        elif index.data(model.scene_stat) == "done":
            painter.fillRect(item_rect, QtGui.QColor(100, 255, 100, 255))
        elif index.data(model.scene_stat) == "failed":
            painter.fillRect(item_rect, QtGui.QColor(255, 100, 100, 255))
        else: painter.fillRect(item_rect, QtGui.QColor(240, 240, 240, 255))
        
        if index.data(model.scene_stat) == "rendering":
            painter.fillRect(progress_rect, QtGui.QColor(180, 255, 100, 255))
        
        if option.state & QtGui.QStyle.State_Selected:
            g_selected = QtGui.QLinearGradient(0, item_rect.y(), 0, item_rect.y()+item_rect.height())
            g_selected.setColorAt(0.0, QtGui.QColor(100, 100, 100, 200))
            g_selected.setColorAt(1.0/item_rect.height(), QtGui.QColor(100, 100, 100, 30))
            g_selected.setColorAt(1.0-1.0/item_rect.height(), QtGui.QColor(100, 100, 100, 20))
            g_selected.setColorAt(1.0, QtGui.QColor(255, 255, 255, 0))
            g_selected.setSpread(QtGui.QGradient.ReflectSpread)
            painter.fillRect(item_rect, g_selected)
            
        elif option.state & QtGui.QStyle.State_MouseOver:
            g_hover = QtGui.QLinearGradient(0, item_rect.y(), 0, item_rect.y()+item_rect.height())
            g_hover.setColorAt(0.0, QtGui.QColor(255, 255, 255, 200))
            g_hover.setColorAt(1.0/item_rect.height(), QtGui.QColor(255, 255, 255, 50))
            g_hover.setColorAt(1.0-1.0/item_rect.height(), QtGui.QColor(255, 255, 255, 0))
            g_hover.setColorAt(1.0, QtGui.QColor(100, 100, 100, 200))
            painter.fillRect(item_rect, g_hover)
        
        painter.save()
            
        painter.setPen(QtGui.QPen(QtGui.QColor(100, 100, 100, 255)))
        painter.drawRect(frame_rect)
        
        painter.setPen(QtGui.QPen(QtGui.QColor(0, 0, 0, 255)))
        painter.setFont(QtGui.QFont(u"微软雅黑", 11, QtGui.QFont.Normal))
        painter.drawText(name_rect, QtCore.Qt.AlignBottom, index.data(model.scene_name))
        
        status_map = {"wait":u"就绪", "generating":u"正在生成...", 
                      "rendering":u"正在渲染...", "compositing":u"正在合成...", 
                      "done":u"已完成", "failed":u"失败"}
        painter.setFont(QtGui.QFont(u"微软雅黑", 10, QtGui.QFont.Normal))
        painter.setPen(QtGui.QPen(QtGui.QColor(100, 100, 100, 255)))
        painter.drawText(type_rect, QtCore.Qt.AlignBottom, status_map.get(index.data(model.scene_stat), u""))
        
        painter.restore()
        
    def sizeHint(self, option, index):
        return QtCore.QSize(100, self.item_height)
    
    
    