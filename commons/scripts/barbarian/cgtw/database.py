#!/usr/local/bin/python2.7
# encoding: utf-8
'''
Created on 2017.11.10

@author: Serious Sam
'''


from cgtw import tw
from barbarian.utils import config


IP = "10.1.11.100"
ACCOUNT_ID = "get_account_id"
ACCOUNT_LOGGED_IN = "get_is_login"
ACCOUNT_NAME = "account.name"
ACCOUNT_DEPARTMENT = "account.department"


tw(IP)


def login(user, password):
    tw.sys().login(user, password, IP)
    
    
def logout():
    tw.sys().logout()


def getAccountInfo(arg=ACCOUNT_ID):
    account_id = tw.sys().get_account_id()
    if arg == ACCOUNT_ID:
        return account_id
    elif arg == ACCOUNT_LOGGED_IN:
        return not (tw.sys().get_account() == u'please login!!!' or tw.sys().get_account() == u'')
    else:
        info_module = tw.info_module("public", "account")
        result = info_module.get_with_filter([arg], [["account.id", "=", account_id]])
        return result[0][arg] if result else ""


def getPipeLineInfo(table):
    tw_pipeline = tw.pipeline(config.getConfig("database"))
    return tw_pipeline.get_with_module(table, ["name"])


def getAssetInfo(name):
    info_module = tw.info_module(config.getConfig("database"), "asset")
    result = info_module.get_with_filter(["asset.cn_name", "asset.type_name"], [["asset.asset_name", "=", name]])
    return result[0]


def getShotInfo(name):
    info_module = tw.info_module(config.getConfig("database"), "shot")
    result = info_module.get_with_filter(["eps.eps_name"], [["shot.shot", "=", name]])
    return result[0]["eps.eps_name"]


def getTaskInfo(**kwargs):
    if not getAccountInfo(ACCOUNT_LOGGED_IN): return []
        
    result = []
    tables = {"asset": "asset_name", "shot": "shot"}
    for table in tables:
        filters = []
        for key in kwargs: 
            if filters: filters.append("and")
            filters.append(["%s_task.%s" % (table, key), "=", kwargs[key]])
        if not filters: filters.append(["%s.%s" % (table, tables[table]), "has", "%"])
            
        module = tw.task_module(config.getConfig("database"), "%s_task" % table)
        module.init_with_filter(filters)
        
        for item in module.get(["%s.%s" % (table, tables[table]),
                                "%s_task.pipeline" % table,
                                "%s_task.status" % table,
                                "%s_task.end_date" % table,
                                "%s_task.artist" % table]) or list():
            if not item["%s.%s" % (table, tables[table])]: continue
            
            result.append({"id": item["id"],
                           "name": item["%s.%s" % (table, tables[table])],
                           "stage": item["%s_task.pipeline" % table],
                           "status": item["%s_task.status" % table],
                           "date": item["%s_task.end_date" % table],
                           "artist": item["%s_task.artist" % table]})
        
    return result


def getCheckInfo():
    result = []
    if not getAccountInfo(ACCOUNT_LOGGED_IN): return result
    
    tables = {"asset": "asset_name", "shot": "shot"}
    for table in tables:
        check_filter = tw.con._send("c_work_flow", "get_check_filter", {"db":config.getConfig("database"), "module":"%s_task"%table})
        if not check_filter: continue
        
        module = tw.task_module(config.getConfig("database"), "%s_task" % table)
        module.init_with_filter(check_filter)
        for item in module.get(["%s.%s" % (table, tables[table]),
                                "%s_task.pipeline" % table,
                                "%s_task.status" % table,
                                "%s_task.end_date" % table,
                                "%s_task.artist" % table]) or list():
            if not item["%s.%s" % (table, tables[table])]: continue
            
            result.append({"id": item["id"],
                           "name": item["%s.%s" % (table, tables[table])],
                           "stage": item["%s_task.pipeline" % table],
                           "status": item["%s_task.status" % table],
                           "date": item["%s_task.end_date" % table],
                           "artist": item["%s_task.artist" % table]})
    
    return result


def getFileHistoryInfo(task_id):
    if not getAccountInfo(ACCOUNT_LOGGED_IN): return []
    
    if task_id == History.task_id: return History.content
    History.task_id = task_id
    
    for module in ["asset_task", "shot_task"]:
        
        t_history = tw.history(config.getConfig("database"), module)
        History.content = t_history.get_with_filter(["text", 
                                                     "last_update_by", 
                                                     "last_update_time", 
                                                     "step", 
                                                     "status",
                                                     "file"], 
                                                    [["#task_id", "=", task_id]])
        if not History.content: continue
        History.content = sorted(History.content, key=lambda x:x["last_update_time"], reverse=True)
    
        return History.content


def getFileBox(task_id, task_stage):
    if not getAccountInfo(ACCOUNT_LOGGED_IN): return []
    
    if task_id == Filebox.task_id: return Filebox.content
    Filebox.task_id = task_id
    
    pipeline = tw.pipeline(config.getConfig("database"))
    filebox = tw.filebox(config.getConfig("database"))
    tables = {"asset": "asset_name", "shot": "shot"}
    for table in tables:
        pipeline_item = pipeline.get_with_filter(["name"], [["module", "=", "%s_task" % table]])
    
        pipeline_id = ""
        for p in pipeline_item or list():
            if p["name"] == task_stage: pipeline_id = p["id"]
        if not pipeline_id: continue
        
        Filebox.content = []
        for filebox_item in filebox.get_with_pipeline_id(pipeline_id, "%s_task" % table) or list():
            info_module = tw.info_module(config.getConfig("database"), "%s_task" % table)
            info_module.init_with_filter([["%s_task.id" % table, "=", task_id]])
            filebox_obj = info_module.get_filebox_with_filebox_id(filebox_item["id"])
            if filebox_obj: Filebox.content.append(filebox_obj)
    
    return Filebox.content


class Filebox:
    task_id = ""
    content = []
    

class History:
    task_id = ""
    content = []
    
    
    