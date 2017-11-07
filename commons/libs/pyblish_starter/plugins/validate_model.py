#!/usr/local/bin/python2.7
# encoding: utf-8

import pyblish.api


class ValidateStarterModel(pyblish.api.InstancePlugin):

    label = u"检查模型"
    order = pyblish.api.ValidatorOrder
    hosts = ["maya"]
    families = ["starter.model"]

    def process(self, instance):
        from maya import cmds

        pass
