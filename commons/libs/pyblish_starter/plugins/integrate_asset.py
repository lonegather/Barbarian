#!/usr/local/bin/python2.7
# encoding: utf-8

import pyblish.api


class IntegrateStarterAsset(pyblish.api.InstancePlugin):

    label = u"提交检查"
    order = pyblish.api.IntegratorOrder
    families = [
        "starter.model",
        "starter.rig",
        "starter.animation"
    ]

    def process(self, instance):
        import os, stat, json, shutil, errno
        from barbarian.cgtw import database

        context = instance.context

        if not all(result["success"] for result in context.data["results"]):
            raise Exception(u"任务提交程序已被终止")

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

        assert remotePath, u"找不到输出路径"
        
        historyPath = "%shistory/" % remotePath.split(filename)[0]
        historyPath = historyPath.replace("\\", "/")
        
        try:
            os.makedirs(historyPath)
        except OSError as e:
            if e.errno != errno.EEXIST:  # Already exists
                self.log.critical(u"未知错误，无法保存历史版本")
                raise
            
        latest_history = database.getFileHistoryInfo(instance.data["taskID"])[0]
        latest_filename = self.getVersion(historyPath, filename)
        
        if os.path.isfile(remotePath):
            os.chmod(remotePath, stat.S_IWRITE)
            shutil.copyfile(remotePath, os.path.join(historyPath, latest_filename))
            os.chmod(os.path.join(historyPath, latest_filename), stat.S_IREAD)
            
        self.log.info(remotePath)
            
        try:
            with open("%shistory.json"%historyPath) as f:
                history_list = json.load(f)
        except IOError:
            history_list = []
            
        history_list.append({"file": latest_filename, "id": latest_history["id"]})
        
        with open("%shistory.json"%historyPath, 'w') as f:
            json.dump(history_list, f, indent=4)
        
        remotePath = remotePath.replace("\\", "/")
        shutil.copyfile(filePath, remotePath)
        os.chmod(remotePath, stat.S_IREAD)
        
        database.submit(instance.data["taskID"], remotePath, instance.data["submitText"])

        self.log.info("source: %s target: %s" % (filePath, remotePath))

        if "abc" in instance.data:
            self.log.info("abc: %s" % instance.data["abc"])
            
        from barbarian.cgtw import CGTW
        CGTW.UI().refreshUI()
        
    def getVersion(self, filepath, filename):
        import os
        
        v = 1
        version_name = "%s_v%02d.%s"%(filename.split('.')[0], v, filename.split('.')[1])
        while os.path.isfile(os.path.join(filepath, version_name)):
            v += 1
            version_name = "%s_v%02d.%s"%(filename.split('.')[0], v, filename.split('.')[1])
            
        return version_name

