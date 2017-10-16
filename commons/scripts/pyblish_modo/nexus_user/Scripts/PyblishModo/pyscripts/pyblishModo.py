# python

try:
    import pyblish_modo.lib
except ImportError:
    raise ImportError("Couldn't find pyblish_modo on your PYTHONPATH")

# Register Modo plugins upon startup
pyblish_modo.lib.register_plugins()
