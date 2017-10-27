import pyblish.api


class ValidateStarterAnimation(pyblish.api.InstancePlugin):
    """Each asset must have a single top-level group"""

    label = "Animation Check"
    order = pyblish.api.ValidatorOrder
    hosts = ["maya"]
    families = ["starter.animation"]

    def process(self, instance):
        from maya import cmds


