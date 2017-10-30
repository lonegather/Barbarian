#!/usr/local/bin/python2.7
# encoding: utf-8

import pyblish.api


class CollectStarterInstances(pyblish.api.ContextPlugin):
    """Gather instances by objectSet and pre-defined attribute

    This collector takes into account assets that are associated with
    an objectSet and marked with a unique identifier;

    Identifier:
        id (str): "pyblish.starter.instance"

    Supported Families:
        starter.model: Geometric representation of artwork
        starter.rig: An articulated model for animators.
            A rig may contain a series of sets in which to identify
            its contents.

            - cache_SEL: Should contain cachable polygonal meshes
            - controls_SEL: Should contain animatable controllers for animators
            - resources_SEL: Should contain nodes that reference external files

            Limitations:
                - Only Maya is supported
                - One (1) rig per scene file
                - Unmanaged history, it is up to the TD to ensure
                    history is up to par.
        starter.animation: Pointcache of `starter.rig`

    Limitations:
        - Does not take into account nodes connected to those
            within an objectSet. Extractors are assumed to export
            with history preserved, but this limits what they will
            be able to achieve and the amount of data available
            to validators.

    """

    label = "Starter Instances"
    order = pyblish.api.CollectorOrder
    hosts = ["maya"]

    def process(self, context):
        from cgtw import tw
        from maya import cmds
        from barbarian.utils import config

        try:
            # Assertion also made in pyblish_starter.install()
            # but as plug-ins can be used vanilla, the check
            # must also be made here.
            import pyblish_maya
            assert pyblish_maya.is_setup()

        except (ImportError, AssertionError):
            raise RuntimeError("pyblish-starter requires pyblish-maya "
                               "to have been setup.")
            
        self.tw = tw
        
        assert self.tw.sys().get_is_login(), "Teamwork is not logged in."

        for objset in cmds.ls("*.id",
                              long=True,            # Produce full names
                              type="objectSet",     # Only consider objectSets
                              recursive=True,       # Include namespace
                              objectsOnly=True):    # Return objectSet, rather
                                                    # than its members

            if not cmds.objExists(objset + ".id"):
                continue

            if not cmds.getAttr(objset + ".id") == "pyblish.starter.instance":
                continue

            # The developer is responsible for specifying
            # the pipeline of each instance.
            assert cmds.objExists(objset + ".pipeline"), (
                "\"%s\" was missing a pipeline" % objset)

            name = cmds.ls(objset, long=False)[0]  # Use short name
                
            if cmds.objExists("%s.taskID" % name):
                self.register(context, objset)
                continue
            
            project = cmds.getAttr("%s.project" % name)
            pipeline = cmds.getAttr("%s.pipeline" % name)
            database = cmds.getAttr("%s.database" % name)
            
            if config.getConfig("familyMap", project)[pipeline] == "starter.animation":
                assetsIn, assetsEx = "", ""
                
                assetsIncluded = self.getAssetList(database, config.getConfig("excludedType", project), True)
                assetsExcluded = self.getAssetList(database, config.getConfig("excludedType", project), False)
                refs = cmds.file(q=True, reference=True)
                
                for ref in refs:
                    if not cmds.referenceQuery(ref, isLoaded=True): continue
                    namespace = cmds.referenceQuery(ref, namespace=True).split(':')[-1]
                    orig_namespace = ref.split("/")[-1].split(".")[0]
                    if orig_namespace in assetsIncluded:
                        assetsIn += "%s;" % namespace
                    elif orig_namespace in assetsExcluded:
                        assetsEx += "%s;" % namespace
                for asset in assetsIn.split(';'):
                    if not asset: continue
                    cmds.select("%s:out_SEL" % asset, r=True)
                    cmds.sets(e=True, include=str(name))
                
                cmds.addAttr(name, longName="assetsIn", dataType="string", hidden=False)
                cmds.addAttr(name, longName="assetsEx", dataType="string", hidden=False)
                cmds.setAttr("%s.assetsIn" % name, assetsIn, type="string")
                cmds.setAttr("%s.assetsEx" % name, assetsEx, type="string")
    
            elif config.getConfig("familyMap", project)[pipeline] == "starter.rig":
                assert cmds.objExists(name.split('_SEL')[0]), "\"%s\" does not exist." % name.split('_SEL')[0]

                try: cmds.delete(["out_SEL", "controls_SEL"])
                except: pass
                cmds.select(name.split('_SEL')[0], r=True)
                cmds.sets(e=True, include=name)
                cmds.select("%s_Geo"%name.split('_SEL')[0], r=True)
                cmds.sets(name="out_SEL")
                cmds.select("ControlSet", r=True)
                cmds.sets(name="controls_SEL")
                for s in ["out_SEL", "controls_SEL"]:
                    cmds.select(s, r=True, noExpand=True)
                    cmds.sets(e=True, include=name)
    
            elif config.getConfig("familyMap", project)[pipeline] == "starter.model":
                assert cmds.objExists(name.split('_SEL')[0]), "\"%s\" does not exist." % name.split('_SEL')[0]
                
                cmds.select(name, r=True)
                cmds.sets(e=True, include=name)
            
            cmds.select(clear=True)
            cmds.addAttr(name, longName="taskID", dataType="string", hidden=False)
            cmds.addAttr(name, longName="path", dataType="string", hidden=False)
            cmds.setAttr("%s.taskID" % name, self.getTaskID(database, name.split('_SEL')[0], pipeline), type="string")
            cmds.setAttr("%s.path" % name, self.getAssetPath(database, name.split('_SEL')[0], pipeline), type="string")
            
            self.register(context, objset)
            
    def register(self, context, objset):
        from maya import cmds
        
        instance = context.create_instance(objset.split('_SEL')[0])
        instance[:] = cmds.sets(objset, query=True) or list()
        
        # Apply each user defined attribute as data
        for attr in cmds.listAttr(objset, userDefined=True) or list():
            try:
                value = cmds.getAttr(objset + "." + attr)
            except:
                # Some attributes cannot be read directly,
                # such as mesh and color attributes. These
                # are considered non-essential to this
                # particular publishing pipeline.
                value = None

            instance.data[attr] = value

        # Produce diagnostic message for any graphical
        # user interface interested in visualising it.
        self.log.info("Found: \"%s\" " % instance.data["name"])
            
    def getTaskID(self, database, name, pipeline):
        tables = {"asset":"asset_name", "shot":"shot"}
        for table in tables:
            module = self.tw.task_module(database, "%s_task" % table)
            module.init_with_filter([["%s.%s" % (table, tables[table]), "=", name],
                                     "and",
                                     ["%s_task.pipeline" % table, "=", pipeline]])
            if not module.get(["%s_task.id" % table]): continue
            return module.get(["%s_task.id" % table])[0]["%s_task.id" % table]
        return u""
            
    def getAssetList(self, database, filterType, isExcluded):
        result = []

        if not self.tw.sys().get_is_login():
            return result

        filterList = []
        for tp in filterType.split(';'):
            if len(filterList): filterList.append("and" if isExcluded else "or")
            filterList.append(["asset.type_name", "!=" if isExcluded else "=", tp])

        if not filterList:
            filterList.append(["asset.asset_name", "has", "%"])

        module = self.tw.info_module(database, "asset")
        module.init_with_filter(filterList)
        for item in module.get(["asset.asset_name"]) or list():
            result.append(item["asset.asset_name"])

        return result
    
    def getAssetPath(self, database, asset, family):
        path = ""
        tables = {"asset": "asset_name", "shot": "shot"}
        for table in tables:
            pipeline = self.tw.pipeline(database)
            pipeline_id = ""
            for p in pipeline.get_with_filter(["name"], [["module", "=", "%s_task" % table]]) or list():
                if p["name"] == family: pipeline_id = p["id"]
            if not pipeline_id: continue

            filebox = self.tw.filebox(database)
            for filebox_item in filebox.get_with_pipeline_id(pipeline_id, "%s_task" % table) or list():
                info_module = self.tw.info_module(database, "%s_task" % table)
                info_module.init_with_filter([["%s.%s" % (table, tables[table]), "=", asset]])
                filebox_obj = info_module.get_filebox_with_filebox_id(filebox_item["id"])
                if filebox_obj and filebox_obj["sign"]:
                    path += "%s=%s;" % (filebox_obj["sign"], filebox_obj["path"])
        return path
            
