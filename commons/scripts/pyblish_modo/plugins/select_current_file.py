import os

import pyblish.api

import lxu.select


@pyblish.api.log
class SelectCurrentFile(pyblish.api.Selector):
    """Inject the current working file into context

    .. note:: This is mandatory for the supplied extractors
    or else they will fail.

    """

    hosts = ['modo']
    version = (0, 1, 0)

    def process_context(self, context):
        """Todo, inject the current working file"""
        current_file = lxu.select.SceneSelection().current().Filename()

        # Maya returns forward-slashes by default
        normalised = os.path.normpath(current_file)

        context.set_data('current_file', value=normalised)
