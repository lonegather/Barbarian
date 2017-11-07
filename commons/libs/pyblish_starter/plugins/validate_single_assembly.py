#!/usr/local/bin/python2.7
# encoding: utf-8

import pyblish.api


class ValidateStarterSingleAssembly(pyblish.api.InstancePlugin):
    """Each asset must have a single top-level group"""

    label = u"检查层级"
    order = pyblish.api.ValidatorOrder
    hosts = ["maya"]
    families = ["starter.model", "starter.rig"]

    def process(self, instance):
        from maya import cmds

        assemblies = cmds.ls(str(instance), assemblies=True)
        assert assemblies == [instance.data["name"]], (
            u"场景中有且只能有一个顶层对象 \"%s\"" % instance.data["name"])
