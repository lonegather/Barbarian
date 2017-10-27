import pyblish.api


class IntegrateStarterAsset(pyblish.api.InstancePlugin):
    """Move user data to shared location

    This plug-in exposes your data to others by encapsulating it
    into a new version.

    Schema:
        Data is written in the following format.
         ____________________
        |                    |
        | version            |
        |  ________________  |
        | |                | |
        | | representation | |
        | |________________| |
        | |                | |
        | | ...            | |
        | |________________| |
        |____________________|

    """

    label = "Starter Asset"
    order = pyblish.api.IntegratorOrder
    families = [
        "starter.model",
        "starter.rig",
        "starter.animation"
    ]

    def process(self, instance):
        import os
        import shutil
        from cgtw import tw
        from maya import cmds

        context = instance.context

        if not all(result["success"] for result in context.data["results"]):
            raise Exception("Atomicity not held, aborting.")

        filePath = instance.data.get("filePath")
        assert filePath, (
            "Incomplete instance \"%s\": "
            "Missing reference to staging area."
            % instance
        )

        filePath = filePath.replace("\\", "/")
        filename = filePath.split('/')[-1]

        remotePath = ""
        for path in instance.data["path"].split(';'):
            if path.split('=')[0] == "work":
                remotePath = os.path.join(path.split('=')[1], filename)

        assert remotePath, "Missing instance path configuration."

        remotePath = remotePath.replace("\\", "/")
        shutil.copyfile(filePath, remotePath)

        t_tw = tw("10.1.11.100")
        assert t_tw.sys().get_is_login(), "Teamwork is not logged in."

        for table in ["asset_task", "shot_task"]:
            t_module = t_tw.task_module(instance.data["database"], table)
            t_module.init_with_id(instance.data["taskID"])
            t_module.submit([remotePath], "")

        self.log.info("source: %s target: %s" % (filePath, remotePath))

        if "abc" in instance.data:
            self.log.info("abc: %s" % instance.data["abc"])

