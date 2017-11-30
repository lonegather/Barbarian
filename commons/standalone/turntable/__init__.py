#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.11.28

@author: Serious Sam
'''

import sys
from PySide import QtGui

if __name__ == "__main__":
    sys.path.append("C:/solidangle/mtoadeploy/2016/scripts")
    sys.path.append(__file__.replace('\\\\', '/').split('turntable/__init__.py')[0])
    
    app = QtGui.QApplication(sys.argv)
    
    from turntable.view import MainWindow
    win = MainWindow()
    
    app.exec_()
    sys.exit()