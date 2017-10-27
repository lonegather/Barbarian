import pyblish.api


class ExtractStarterAnimation(pyblish.api.InstancePlugin):
    """Produce an alembic of just point positions and normals.

    Positions and normals are preserved, but nothing more,
    for plain and predictable point caches.

    Limitations:
        - Framerange is bound to current maximum range in Maya

    """

    label = "Starter Animation"
    order = pyblish.api.ExtractorOrder
    hosts = ["maya"]
    families = ["starter.animation"]

    def process(self, instance):
        import os
        from maya import cmds
        from pyblish_starter import api
        from pyblish_starter import maya

        self.log.debug("Loading plug-in..")
        cmds.loadPlugin("AbcExport.mll", quiet=True)

        self.log.info("Extracting animation..")
        dirname = api.format_staging_dir(
            root=instance.context.data["workspaceDir"],
            name=instance.data["name"])
        filename = "%s.mb" % instance.data["name"]
        path = os.path.join(dirname, filename)

        cmds.file(path,
                  force=True,
                  typ="mayaBinary",
                  exportAll=True,
                  preserveReferences=True,
                  constructionHistory=True)

        if "abc" not in instance.data:
            instance.data["abc"] = list()

        for asset in instance.data["assetsIn"].split(';'):
            if not asset: continue
            filename = os.path.join(dirname, "%s.abc" % asset.split(':')[0]).replace("\\", "/")
            maya.export_alembic(
                root=cmds.sets("%s:out_SEL" % asset, q=True)[0],
                file=filename,
                frame_range=(cmds.playbackOptions(query=True, ast=True),
                             cmds.playbackOptions(query=True, aet=True)),
                uv_write=True
            )
            instance.data["abc"].append(filename)

        instance.data["filePath"] = path

        self.log.info("Extracted {instance} to {dirname}".format(**locals()))
