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
        import os, json, shutil, errno
        from cgtw import tw

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
        self.log.info(historyPath)
        
        try:
            os.makedirs(historyPath)
        except OSError as e:
            if e.errno != errno.EEXIST:  # Already exists
                self.log.critical(u"未知错误，无法保存历史版本")
                raise
            
        latest_history = self.getHistory(instance)[0]
        latest_filename = self.getVersion(historyPath, filename)
        
        shutil.copyfile(remotePath, os.path.join(historyPath, latest_filename))
            
        try:
            with open("%shistory.json"%historyPath) as f:
                history_list = json.load(f)
        except IOError:
            history_list = []
            
        history_list.append({"file": latest_filename, "id": latest_history["id"]})
        
        with open("%shistory.json"%historyPath, 'w') as f:
            json.dump(history_list, f, indent=4)

        t_tw = tw("10.1.11.100")
        assert t_tw.sys().get_is_login(), u"Teamwork 未登录"
        
        remotePath = remotePath.replace("\\", "/")
        shutil.copyfile(filePath, remotePath)

        for table in ["asset_task", "shot_task"]:
            t_module = t_tw.task_module(instance.data["database"], table)
            t_module.init_with_id(instance.data["taskID"])
            t_module.submit([remotePath], instance.data["submitText"])

        self.log.info("source: %s target: %s" % (filePath, remotePath))

        if "abc" in instance.data:
            self.log.info("abc: %s" % instance.data["abc"])
            
        from barbarian.cgtw import CGTW
        CGTW.UI().refreshInfo()
            
    def getHistory(self, instance):
        from cgtw import tw
        
        t_tw = tw("10.1.11.100")
        assert t_tw.sys().get_is_login(), u"Teamwork 未登录"
        
        for module in ["asset_task", "shot_task"]:
            t_history = t_tw.history(instance.data["database"], module)
            history = t_history.get_with_filter(["text", "last_update_by", "last_update_time"], [["#task_id", "=", instance.data["taskID"]]])
            if not history: continue
        
            return sorted(history, key=lambda x:x["last_update_time"], reverse=True)
        
    def getVersion(self, filepath, filename):
        import os
        
        v = 1
        version_name = "%s_v%02d.%s"%(filename.split('.')[0], v, filename.split('.')[1])
        while os.path.isfile(os.path.join(filepath, version_name)):
            v += 1
            version_name = "%s_v%02d.%s"%(filename.split('.')[0], v, filename.split('.')[1])
            
        return version_name

