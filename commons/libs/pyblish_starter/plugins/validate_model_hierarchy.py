import pyblish.api


class ValidateStarterModelHierarchy(pyblish.api.InstancePlugin):
    """A model hierarchy must reside under a single assembly called "model_GRP"

    - Must reside within `model_GRP` transform

    """

    label = "Hierarchy"
    order = pyblish.api.ValidatorOrder
    hosts = ["maya"]
    families = ["starter.model", "starter.rig"]

    def process(self, instance):
        from maya import cmds

        assert cmds.ls(instance, assemblies=True) == [instance.data["name"]], (
            "The asset must have a single parent called '%s'." % instance.data["name"])
