#!/usr/local/bin/python2.7
# encoding: utf-8

import pyblish.api


class ValidateStarterAnimation(pyblish.api.InstancePlugin):
    """Each asset must have a single top-level group"""

    label = u"检查动画"
    order = pyblish.api.ValidatorOrder
    hosts = ["maya"]
    families = ["starter.animation"]

    def process(self, instance):
        from maya import cmds

        pass
