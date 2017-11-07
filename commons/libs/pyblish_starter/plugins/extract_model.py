#!/usr/local/bin/python2.7
# encoding: utf-8

import pyblish.api


class ExtractStarterModel(pyblish.api.InstancePlugin):
    """Produce a stripped down Maya file from instance

    This plug-in takes into account only nodes relevant to models
    and discards anything else, especially deformers along with
    their intermediate nodes.

    """

    label = u"提取Model"
    order = pyblish.api.ExtractorOrder
    hosts = ["maya"]
    families = ["starter.model"]

    def process(self, instance):
        import os
        from maya import cmds
        from PySide import QtGui
        from barbarian.cgtw import CGTW
        from pyblish_starter import api
        from pyblish_maya import maintained_selection

        dirname = api.format_staging_dir(
            root=instance.context.data["workspaceDir"],
            name=instance.data["name"])

        try:
            os.makedirs(dirname)
        except OSError:
            pass
        
        text, ok = QtGui.QInputDialog.getText(CGTW.UI().window, u"提交检查", u"请输入提交描述：")
        assert ok, u"文件提取已被取消"

        filename = "{name}.ma".format(**instance.data)

        path = os.path.join(dirname, filename)

        # Perform extraction
        self.log.info("Performing extraction..")
        with maintained_selection():
            cmds.select(instance, noExpand=True)
            cmds.file(path,
                      force=True,
                      typ="mayaAscii",
                      exportSelected=True,
                      preserveReferences=False,

                      # Construction history inherited from collection
                      # This enables a selective export of nodes relevant
                      # to this particular plug-in.
                      constructionHistory=False)

        instance.data["filePath"] = path
        instance.data["submitText"] = text

        self.log.info("Extracted {instance} to {path}".format(**locals()))
