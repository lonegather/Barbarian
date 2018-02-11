# encoding: utf-8
import re
import os
import sys
from PySide import QtGui


if __name__ == '__main__':

    app = QtGui.QApplication(sys.argv)

    dialog = QtGui.QFileDialog()
    dialog.setFileMode(QtGui.QFileDialog.DirectoryOnly)
    directories = dialog.selectedFiles()[0] if dialog.exec_() else ''
    if directories:
        for root, dirs, files in os.walk(directories):
            for f in files:
                if f[-3:] == '.ma':
                    file_path = os.path.join(root, f)
                    print u"正在清理 %s ..." % file_path,
                    with open(file_path, 'r') as old, open('%s.tmp' % file_path, 'wb') as new:
                        end_line = True
                        for line in old:
                            if not end_line or line.count("requires \""):
                                end_line = True if line[-2] == ';' else False
                                continue
                            new.write(line)
                    os.remove(file_path)
                    os.rename('%s.tmp' % file_path, file_path)
                    print(u"清理完毕")

    app.exit()
