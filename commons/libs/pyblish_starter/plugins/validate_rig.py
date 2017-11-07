#!/usr/local/bin/python2.7
# encoding: utf-8

import pyblish.api


class ValidateStarterRig(pyblish.api.InstancePlugin):

    label = u"检查绑定"
    order = pyblish.api.ValidatorOrder
    hosts = ["maya"]
    families = ["starter.rig"]

    def process(self, instance):
        from maya import cmds

        pass
