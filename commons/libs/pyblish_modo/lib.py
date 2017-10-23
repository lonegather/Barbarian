# Standard library
import os
import inspect
import logging

# Pyblish libraries
import pyblish.api

# Integration libraries
import pyblish_modo

# Host libraries
import lx

def register_plugins():
    # Register accompanying plugins
    package_path = os.path.dirname(pyblish_modo.__file__)
    plugin_path = os.path.join(package_path, 'plugins')

    pyblish.api.register_plugin_path(plugin_path)
    lx.out("Registered %s" % plugin_path)