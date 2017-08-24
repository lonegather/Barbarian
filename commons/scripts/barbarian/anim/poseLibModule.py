#!/usr/bin/python
import maya.mel as mel
import maya.cmds as cmds
import sys
import os
import xml.dom.minidom as minidom
import datetime # Date and time
import shutil   # To copy files
import getpass  # For user name
#import maya.cmds as mc

_version = "6.6.0"
#_undesirableControls = ["animFoster", "parentConstraint"]  # Controls that get filtered out of pose creation
_undesirableControls = ["animFoster"]   # Controls that get filtered out of pose creation
_undesirableAttributes = ["parentSpaceAttributes", "parentConstraint1", "targetWeight"] # Match strings for attributes that get filtered out of pose creation
#_defaultIconsBGColor = "0.4 0.4 0.5"


def getVersion(version = _version):
    return version


def convertOldPosesToXML(directory=None):
    #print "directory = " + str(directory)
    didSomething = 0

    # Get a list of poses in a given directory:
    oldPoses = []
    filesList = os.listdir(directory)

    for f in filesList:
        #print "\nTesting: " + str(f)
        # Get only the files without any extension.
        if os.path.isfile(os.path.join(directory, f)) and f.find('.') == -1:
            oldPoses.append(os.path.join(directory, f))
    #print "oldPoses = " + str(oldPoses)

    if len(oldPoses) == 0:
        return didSomething

    for oldPose in oldPoses:
        # Define variables.
        name = os.path.basename(oldPose)

        # Create the new pose (if it doesn't already exist).
        if not os.path.isfile(os.path.join(directory, name + '.xml')):
            didSomething = 1
            indexTmp = 0
            controls = []
            controlsDico = {} # {'R_toe_CON': ['', ['rotateX', ...], ['0', ...]], ...}
            print "Converting old pose to new poseLib format: " + name

            # Open the text pose file.
            file_object = open(oldPose, "r")
            line = file_object.readline()

            while line:
                # Get the pose index.
                if line.startswith('poseLibIndexOrder'):
                    indexTmp = line.split(' ')[-1]
                    indexTmp = indexTmp[:indexTmp.find('\n')]
                    #print "index = " + str(index)
                # Get the pose info.
                elif line != '\n':
                    infoTmp = line.split(' ')

                    # Make sure the line does have a "control attribute value" structure.
                    if len(infoTmp) == 3:
                        # Get control name.
                        controlTmp = infoTmp[0].split(':')[-1]
                        if controlTmp not in controls:
                            controls.append(controlTmp)
                            controlsDico[controlTmp] = ['', [], [], '']

                        # Get namespace.
                        namespaceTmp = ''
                        if infoTmp[0].find(':') != -1:
                            namespaceTmp = infoTmp[0][0:infoTmp[0].rfind(":")] + ":"

                        # Get attribute name.
                        attributeTmp = infoTmp[1]

                        # Get attribute value.
                        valueTmp = infoTmp[2].strip()

                        controlsDico[controlTmp][0] = namespaceTmp
                        controlsDico[controlTmp][1].append(attributeTmp)
                        controlsDico[controlTmp][2].append(valueTmp)

                line = file_object.readline()
            #print "controlsDico = " + str(controlsDico)

            # Write down the header for the new .XML pose file.
            doc = minidom.Document()
            main_element = doc.createElement('Main')
            doc.appendChild(main_element)
            pose_element = doc.createElement('Pose')
            main_element.appendChild(pose_element)
            pose_element.setAttribute('name', str(name))
            pose_element.setAttribute('author', str(getpass.getuser()))
            pose_element.setAttribute('date', str(str(datetime.datetime.now())[0:str(datetime.datetime.now()).find('.')]))
            pose_element.setAttribute('index', str(indexTmp))
            pose_element.setAttribute('multipleNamespaces', str(False))
            pose_element.setAttribute('modifiedBy', str(getpass.getuser()))
            pose_element.setAttribute('modifiedDate', str(str(datetime.datetime.now())[0:str(datetime.datetime.now()).find('.')]))
            controls_element = doc.createElement('Controls')
            pose_element.appendChild(controls_element)

            # {'R_toe_CON': ['', ['rotateX', ...], ['0', ...], '0'], ...}

            # For every control:
            for c in xrange(len(controls)):
                control_element = doc.createElement('Control')
                controls_element.appendChild(control_element)
                control_element.setAttribute('name', str(controls[c]))
                control_element.setAttribute('namespace', str(controlsDico[controls[c]][0]))

                for d in xrange(len(controlsDico[controls[c]][1])):
                    attribute_element = doc.createElement('Attribute')
                    control_element.appendChild(attribute_element)
                    attribute_element.setAttribute('name', str(controlsDico[controls[c]][1][d]))
                    attribute_element.setAttribute('value', str(controlsDico[controls[c]][2][d]))
            #print doc.toprettyxml()

            file_object = open(os.path.join(directory, name + '.xml'), "w")
            file_object.write(doc.toprettyxml())
            file_object.close()

        # If a ".converted" pose file already exists, then delete it before replacing it with a new backup.
        if os.path.exists(oldPose + '.converted'):
            os.remove(oldPose + '.converted')
        os.rename(oldPose, oldPose + '.converted')

    if didSomething:
         print "Conversion of old poses is done!"

    return didSomething


def writePose(poseFile=None):
    poseName = poseFile.split("/")[-1].split(".")[0]
    sel = mel.eval('ls -l -sl')
    controls = []
    storedNamespaces = []

    # Get the list of selected channels in the channelBox.
    selectedChannelsTmp = mel.eval('channelBox -q -sma "mainChannelBox"')
    selectedChannels = []

    if selectedChannelsTmp is not None:
        for channel in selectedChannelsTmp:
            selectedChannels.append(mel.eval('longNameOf("' + sel[0] + "." + channel + '")').split('|')[-1].split('.')[-1])
    #print "\nselectedChannels = " + str(selectedChannels)

    # Write down the header for the new .XML pose file.
    doc = minidom.Document()
    main_element = doc.createElement('Main')
    doc.appendChild(main_element)
    pose_element = doc.createElement('Pose')
    main_element.appendChild(pose_element)
    pose_element.setAttribute('name', str(poseName))
    pose_element.setAttribute('author', str(getpass.getuser()))
    pose_element.setAttribute('date', str(str(datetime.datetime.now())[0:str(datetime.datetime.now()).find('.')]))
    pose_element.setAttribute('index', '0')
    pose_element.setAttribute('multipleNamespaces', str(False))
    pose_element.setAttribute('modifiedBy', str(getpass.getuser()))
    pose_element.setAttribute('modifiedDate', str(str(datetime.datetime.now())[0:str(datetime.datetime.now()).find('.')]))
    controls_element = doc.createElement('Controls')
    pose_element.appendChild(controls_element)

    # Filter the undesirable controls:
    for c in xrange(0, len(sel)):
        storeIt = True
        for undesirableControl in _undesirableControls:
            if sel[c].split('|')[-1].find(undesirableControl) != -1:
                storeIt = False
        if storeIt:
            controls.append(sel[c])

    # For every control:
    for i in xrange(0, len(controls)):
        control = controls[i].split("|")[-1].split(':')[-1]
        #print "\ncontrol = " + control

        namespace = ""
        if controls[i].split("|")[-1].find(':') != -1:
            namespace = controls[i].split("|")[-1][0:controls[i].split("|")[-1].rfind(":")] + ":"
        #print "namespace = " + str(namespace)

        # Store the namespaces to check if different characters are selected.
        if namespace not in storedNamespaces:
            storedNamespaces.append(namespace)

        control_element = doc.createElement('Control')
        controls_element.appendChild(control_element)
        control_element.setAttribute('name', str(control))
        control_element.setAttribute('namespace', str(namespace))

        # Check which type of selection we got.
        showType = mel.eval('ls -st ' + controls[i])

        # Are we dealing with a blendshape?
        if showType[1] == "blendShape":
            # First add the envelope attribute.
            attribute_element = doc.createElement('Attribute')
            control_element.appendChild(attribute_element)
            attribute_element.setAttribute('name', "envelope")
            attribute_element.setAttribute('value', str(mel.eval('blendShape -q -envelope ' + controls[i])))

            listOfTargets = mel.eval('aliasAttr -q ' + controls[i])
            #print "listOfTargets = " + str(listOfTargets)

            # If we should only save a pose for the selected channels.
            if len(selectedChannels) != 0:
                listOfTargets = selectedChannels

            for targetTmp in listOfTargets:
                if mel.eval("attributeQuery -node " + controls[i] + " -ex " + targetTmp):
                    if targetTmp.find('[') == -1:
                        attribute_element = doc.createElement('Attribute')
                        control_element.appendChild(attribute_element)
                        attribute_element.setAttribute('name', targetTmp)
                        attribute_element.setAttribute('value', str(mel.eval('getAttr ' + controls[i] + "." + targetTmp)))

        # Are we dealing with a character set?
        elif showType[1] == "character":
            objectsPlusAttributes = mel.eval('sets -q ' + controls[i])

            for objectsPlusAttribute in objectsPlusAttributes:
                control_element = doc.createElement('Control')
                controls_element.appendChild(control_element)
                control_element.setAttribute('name', str(objectsPlusAttribute.split('.')[0].split(':')[-1]))
                control_element.setAttribute('namespace', str(objectsPlusAttribute.split('.')[0].split(':')[0]))
                attribute_element = doc.createElement('Attribute')
                control_element.appendChild(attribute_element)
                attribute_element.setAttribute('name', str(objectsPlusAttribute.split('.')[1]))
                attribute_element.setAttribute('value', str(mel.eval('getAttr ' + objectsPlusAttribute.split('.')[0] + "." + objectsPlusAttribute.split('.')[1])))
        else:
            # Get the list of attributes to save.
            attributes = []
            normalAttributes = mel.eval('listAttr -unlocked -keyable -multi -scalar ' + controls[i])
            #print "\nnormalAttributes = " + str(normalAttributes)

            # Also get extra attributes: if those are custom strings they weren't keyable, so they were not picked-up by the previous survey.
            userDefinedAttributes = mel.eval('listAttr -userDefined -unlocked -keyable -scalar ' + controls[i])
            #print "\nuserDefinedAttributes = " + str(userDefinedAttributes)

            # Concatenate the two attribute lists.
            if userDefinedAttributes is not None:
                attributes = normalAttributes + userDefinedAttributes
            else:
                attributes = normalAttributes

            # Make sure objects with no keyable attribute don't break the process.
            if attributes is not None:
                # Make sure we don't have any doubloons in there.
                attributes = list(set(attributes))

                # Remove undesirable attributes (arrays, matrices, etc...)
                for checkAttribute in attributes[:]:
                    for undesirableAttribute in _undesirableAttributes:
                        if checkAttribute.find(undesirableAttribute) != -1:
                            attributes.remove(checkAttribute)
                #print "\nattributes = " + str(attributes)

                # If we should only save a pose for the selected channels.
                if len(selectedChannels) != 0:
                    attributes = selectedChannels

                # For every attribute:
                for c in xrange(0, len(attributes)):
                    if mel.eval("attributeQuery -node " + controls[i] + " -ex " + attributes[c]):
                        #print "\nattributes[c] = " + str(attributes[c])
                        attribute_element = doc.createElement('Attribute')
                        control_element.appendChild(attribute_element)
                        attribute_element.setAttribute('name', str(attributes[c]))
                        attribute_element.setAttribute('value', str(mel.eval('getAttr ' + controls[i] + '.' + attributes[c])))
    #print doc.toprettyxml()

    # If a ".deleted" pose file already exists, then delete it before replacing it with a new backup.
    if os.path.exists(poseFile):
        if os.path.exists(poseFile + ".deleted"):
            os.remove(poseFile + ".deleted")
        os.rename(poseFile, poseFile + ".deleted")

    if len(storedNamespaces) > 1:
        #print "storedNamespaces = " + str(storedNamespaces)
        pose_element.setAttribute('multipleNamespaces', str(True))

    # Finally write the pose file.
    file_object = open(poseFile, "w")
    file_object.write(doc.toprettyxml())
    file_object.close()


def applyPose(poseFile=None, altKeyDown=0, poseLibApplyIncrement=None):
    #print "poseFile = " + str(poseFile)
    selControlsDico = {} # {'head': ['Ted:FULL:', ['translateX', ...], ...}
    #poseControlsDico = {} # {'head': ['Ted:FULL:'], ...}
    poseControls = []
    melCommand = ''

    sel = mel.eval('ls -sl')

    # Get the list of selected channels in the channelBox.
    selectedChannelsTmp = mel.eval('channelBox -q -sma "mainChannelBox"')
    selectedChannels = []

    if selectedChannelsTmp is not None:
        for channel in selectedChannelsTmp:
            selectedChannels.append(mel.eval('longNameOf("' + sel[0] + "." + channel + '")').split('|')[-1].split('.')[-1])
    #print "selectedChannels = " + str(selectedChannels)

    # Get the list of selected controls.
    if sel is not None:
        for c in xrange(len(sel)):
            # Are we dealing with a character set?
            checkCharacterSet = mel.eval('ls -type "character" ' + sel[c])

            if checkCharacterSet is not None:
                # Deselect the set itself.
                mel.eval('select -d ' + sel[c])

                # Select its members instead.
                membersTmp = mel.eval('sets -q -no ' + sel[c])
                mel.eval('select -add ' + str(membersTmp))

            selectionNamespace = ''

            if sel[c].find(':') != -1:
                selectionNamespace = sel[c][0:sel[c].rfind(":")] + ":"

            selControlsDico[sel[c].split(':')[-1]] = [selectionNamespace, []]
            allAttrTmp = mel.eval('listAttr -unlocked -keyable -multi -scalar ' + sel[c])

            # Make sure objects with no keyable attribute don't break the process.
            if allAttrTmp is not None:
                for d in xrange(len(allAttrTmp)):
                    selControlsDico [sel[c].split(':')[-1]][1].append(allAttrTmp[d])
    #print "selControlsDico = " + str(selControlsDico)

    # Read the actual pose file.
    originalDom = minidom.parse(poseFile)

    for child in originalDom.getElementsByTagName("Control"):
        #poseControlsDico[child.getAttribute("name")] = [child.getAttribute("namespace")]
        poseControls.append(child.getAttribute("namespace") + child.getAttribute("name"))
    #print "poseControlsDico = " + str(poseControlsDico)

    # For each control in the pose...
    for child in originalDom.getElementsByTagName("Control"):
        controlName = child.getAttribute("name")
        poseNamespace = child.getAttribute("namespace")
        """
        # Determine which namespace to use.
        if len(selControlsDico) != 0:
            if controlName in selControlsDico:
                selectionNamespace = selControlsDico[controlName][0]
                poseNamespace = poseControlsDico[controlName][0]

                if mel.eval('radioCollection -q -sl namespaceChoiceRC') == "usePoseNamespaceRB":
                    if poseNamespace == selectionNamespace:
                        namespace = poseControlsDico[controlName][0]
                    else

        elif mel.eval('radioCollection -q -sl namespaceChoiceRC') == "usePoseNamespaceRB":
            namespace = poseControlsDico[controlName][0]

        if mel.eval('radioCollection -q -sl namespaceChoiceRC') == "useCustomNamespaceRB":
            customNamespace = mel.eval('textField -q -text namespaceTextFieldTF')
            if not customNamespace.endswith(":") and customNamespace != "":
                customNamespace = customNamespace + ":"

            namespace = customNamespace
        #print "namespace = " + namespace
        """
        namespace = poseNamespace

        # If there is no selection, then attempt to apply the whole pose.
        if len(selControlsDico) == 0:
            #print "\nNo selection!\n"

            for child2 in child.getElementsByTagName("Attribute"):
                attributeName = child2.getAttribute("name")
                attributeValue = child2.getAttribute("value")

                #print "controlName = " + controlName + " / attributeName = " + attributeName
                #print mel.eval('objExists ' + namespace + controlName + '.' + attributeName)

                # Make sure the control + attribute exist before attempting assign a value.
                if mel.eval('objExists ' + namespace + controlName + '.' + attributeName):

                    # If the ALT key is pressed, then set a fraction of the pose.
                    if altKeyDown:
                        currentValueString = str(mel.eval('getAttr ' + namespace + controlName + '.' + attributeName))
                        currentValueFloat = float(currentValueString) # turns the string into a float if possible
                        poseValueString = str(attributeValue) # capture pose val string for later if it can't float
                        poseValueFloat = float(attributeValue) # convert the pose doc val string to a float if you can

                        if currentValueFloat >= 0 or currentValueFloat <= 0: # if the string is a number of some kind and not just a 0
                            valDifference = float(currentValueFloat - poseValueFloat) # get the difference in values between what is current and what is in the pose
                            modAttrVal = float(valDifference * poseLibApplyIncrement) # multiply the value difference by the increment
                            attributeValue = str(poseValueFloat + modAttrVal) # add the current value plus the incremented value to get the modified value to pass along

                    # Set the attribute.
                    melCommand = 'catchQuiet(`setAttr -clamp ' + namespace + controlName + '.' + attributeName + ' ' + str(attributeValue) + '`); '
                    mel.eval(melCommand)

        # ... But if there is a selection, then apply the pose just to the selected controls.
        else:
            if controlName in selControlsDico:
                poseShouldBeApplied = True
                namespace = selectionNamespace
                #print 'controlName = ' + str(selControlsDico[controlName])

                if mel.eval('radioCollection -q -sl namespaceChoiceRC') == "usePoseNamespaceRB":
                    selectionNamespace = selControlsDico[controlName][0]
                    #poseNamespace = poseControlsDico[controlName][0]
                    #print 'selectionNamespace = ' + str(selectionNamespace)
                    #print 'poseNamespace = ' + str(poseNamespace)
                    #print '\n'

                    if poseNamespace != selectionNamespace:
                        poseShouldBeApplied = False
                    else:
                        namespace = poseNamespace

                if poseShouldBeApplied:
                    for child2 in child.getElementsByTagName("Attribute"):
                        attributeName = child2.getAttribute("name")
                        attributeValue = child2.getAttribute("value")

                        # If the ALT key is pressed, then set a fraction of the pose.
                        if altKeyDown:
                            currentValueString = str(mel.eval('getAttr ' + namespace + controlName + '.' + attributeName))
                            currentValueFloat = float(currentValueString) # turns the string into a float if possible
                            poseValueString = str(attributeValue) # capture pose val string for later if it can't float
                            poseValueFloat = float(attributeValue) # convert the pose doc val string to a float if you can

                            if currentValueFloat >= 0 or currentValueFloat <= 0: # if the string is a number of some kind and not just a 0
                                valDifference = float(currentValueFloat - poseValueFloat) # get the difference in values between what is current and what is in the pose
                                modAttrVal = float(valDifference * poseLibApplyIncrement) # multiply the value difference by the increment
                                attributeValue = str(poseValueFloat + modAttrVal) # add the current value plus the incremented value to get the modified value to pass along

                        # If there are some selected channels in the channelBox, then only apply the pose to those channels.
                        if len(selectedChannels) != 0:
                            #print "Channel(s) selected!"
                            #print "\nattributeName = " + attributeName
                            #print "\nselectedChannels = " + str(selectedChannels)
                            if attributeName in selectedChannels:
                                melCommand = 'catchQuiet(`setAttr -clamp ' + namespace + controlName + '.' + attributeName + ' ' + str(attributeValue) + '`); '
                        else:
                            #print "No channels!"
                            melCommand = 'catchQuiet(`setAttr -clamp ' + namespace + controlName + '.' + attributeName + ' ' + str(attributeValue) + '`); '

                        #print "melCommand = " + str(melCommand)
                        if melCommand != '':
                            mel.eval(melCommand)

    # If the MEL command is empty, then warn the user.
    if melCommand == '':
        mel.eval('warning "The pose was not applied! Please check that the pose controls exist and/or are selected!"')
        return
    else:
        if altKeyDown:
            mel.eval('print "' + str(int((1 - poseLibApplyIncrement) * 100)) + '% of the pose applied!"')
        else:
            mel.eval('print "100% of the pose applied!"')


def removeControls(poseFile=None):
    # Get the list of selected controls.
    sel = mel.eval('ls -sl')

    if sel is None:
        print "Please select the controls to remove first!"
        return

    # Read the actual pose file.
    originalDom = minidom.parse(poseFile)
    controlsWereNotThere = True

    for child in originalDom.getElementsByTagName("Control"):
        if child.getAttribute("name") in sel:
            child.parentNode.removeChild(child.nextSibling) # This is to avoid the blank line left by the element deletion.
            child.parentNode.removeChild(child)
            controlsWereNotThere = False
    #print originalDom.toxml()

    # The selected controls were not found in the pose.
    if controlsWereNotThere:
        mel.eval('print "The selected control(s) were NOT part of this pose!"')
        return

    # Keep trace of who modified the pose.
    originalDom.getElementsByTagName("Pose")[0].setAttribute('modifiedBy', str(getpass.getuser()))
    originalDom.getElementsByTagName("Pose")[0].setAttribute('modifiedDate', str(str(datetime.datetime.now())[0:str(datetime.datetime.now()).find('.')]))

    # Finally rewrite the pose file.
    file_object = open(poseFile, "w")
    file_object.write(originalDom.toxml())
    file_object.close()

    mel.eval('print "The selected control(s) have been removed from the pose!"')


def selectPoseControls(poseFile=None):
    # Read the actual pose file.
    originalDom = minidom.parse(poseFile)
    allControls = []
    customNamespace = None

    if mel.eval('radioCollection -q -sl namespaceChoiceRC') == "useCustomNamespaceRB":
                customNamespace = mel.eval('textField -q -text namespaceTextFieldTF')
                if not customNamespace.endswith(":") and customNamespace != "":
                    customNamespace = customNamespace + ":"
                    #print "customNamespace = " + customNamespace

    for child in originalDom.getElementsByTagName("Control"):
        if child.getAttribute("name") not in allControls:
            if customNamespace is not None:
                allControls.append(customNamespace + child.getAttribute("name"))
            else:
                allControls.append(child.getAttribute("namespace") + child.getAttribute("name"))

    existingControls = mel.eval("ls " + " ".join(allControls))
    #print "existingControls = " + str(existingControls)

    if existingControls is not None:
        melCommand = "select -r " + " ".join(existingControls)
        mel.eval(melCommand)
        mel.eval('print "The pose controls have been selected!"')
    else:
        mel.eval('print "Could not find specified controls (check namespace)!"')


def addReplaceControls(poseFile=None):
    selControlsDico = {}

    sel = mel.eval('ls -sl')

    if sel is None:
        print "Please select the controls to add/replace first!"
        return

    #selectedChannels = mel.eval('channelBox -q -sma "mainChannelBox"')
    #print "selectedChannels = " + str(selectedChannels)

    # Get the list of selected controls and their attributes.
    if sel is not None:
        for c in xrange(len(sel)):
            # Are we dealing with a character set?
            checkCharacterSet = mel.eval('ls -type "character" ' + sel[c])

            if checkCharacterSet is not None:
                # Deselect the set itself.
                mel.eval('select -d ' + sel[c])

                # Select its members instead.
                membersTmp = mel.eval('sets -q -no ' + sel[c])
                mel.eval('select -add ' + str(membersTmp))

            namespace = ''

            if sel[c].find(':') != -1:
                namespace = sel[c][0:sel[c].rfind(":")] + ":"

            selControlsDico[sel[c].split(':')[-1]] = [namespace, []]
            allAttrTmp = mel.eval('listAttr -keyable -multi -unlocked -settable -hasData ' + sel[c])

            for d in xrange(len(allAttrTmp)):
                selControlsDico[sel[c].split(':')[-1]][1].append(allAttrTmp[d])
    #print "selControlsDico = " + str(selControlsDico)

    # Now we have the proper final selection.
    controls = mel.eval('ls -sl')
    controlsWithoutNamespace = []

    for con in controls:
        controlsWithoutNamespace.append(con.split(':')[-1].split('|')[-1].split('.')[0])
    #print "controlsWithoutNamespace = " + str(controlsWithoutNamespace)

    # Read the actual pose file.
    originalDom = minidom.parse(poseFile)

    # First, remove the selected controls from the pose.
    for child in originalDom.getElementsByTagName("Control"):
        if child.getAttribute("name") in controlsWithoutNamespace:
            child.parentNode.removeChild(child.nextSibling) # This is to avoid the blank line left by the element deletion.
            child.parentNode.removeChild(child)

    # Then we add the selected controls.
    for i in xrange(len(controls)):
        control_element = originalDom.createElement("Control")
        originalDom.getElementsByTagName("Controls")[0].appendChild(originalDom.createTextNode("\t"))
        originalDom.getElementsByTagName("Controls")[0].appendChild(control_element)
        control_element.setAttribute('name', str(controls[i].split(':')[-1].split('.')[0]))
        namespace = ""
        if controls[i].find(':') != -1:
            namespace = controls[i][0:controls[i].rfind(":")] + ":"
        control_element.setAttribute('namespace', namespace)
        control_element.appendChild(originalDom.createTextNode("\n\t\t\t\t"))

        # Get the list of attributes to save.
        attributes = []
        normalAttributes = mel.eval('listAttr -unlocked -keyable -multi -scalar ' + controls[i])
        #print "\nnormalAttributes = " + str(normalAttributes)

        # Also get extra attributes: if those are custom strings they weren't keyable, so they were not picked-up by the previous survey.
        userDefinedAttributes = mel.eval('listAttr -userDefined -unlocked -keyable -scalar ' + controls[i])
        #print "\nuserDefinedAttributes = " + str(userDefinedAttributes)

        # Conatenate the two attribute lists.
        if userDefinedAttributes is not None:
            attributes = normalAttributes + userDefinedAttributes
        else:
            attributes = normalAttributes

        # Make sure we don't have any doubloons in there.
        attributes = list(set(attributes))

        # Remove undesirable attributes (arrays, matrices, etc...)
        for undesirableAttribute in _undesirableAttributes:
            if undesirableAttribute in attributes:
                attributes.remove(undesirableAttribute)
        #print "\nattributes = " + str(attributes)

        # For every attribute:
        for c in xrange(0, len(attributes)):
            #print "\nattributes[c] = " + str(attributes[c])
            attribute_element = originalDom.createElement('Attribute')
            control_element.appendChild(attribute_element)
            attribute_element.setAttribute('name', str(attributes[c]))
            attribute_element.setAttribute('value', str(mel.eval('getAttr ' + controls[i] + '.' + attributes[c])))

            if c != (len(attributes) - 1):
                control_element.appendChild(originalDom.createTextNode("\n\t\t\t\t"))
            else:
                control_element.appendChild(originalDom.createTextNode("\n\t\t\t"))
                originalDom.getElementsByTagName("Controls")[0].appendChild(originalDom.createTextNode("\n\t\t"))
    #print originalDom.toxml()

    # Keep trace of who modified the pose.
    originalDom.getElementsByTagName("Pose")[0].setAttribute('modifiedBy', str(getpass.getuser()))
    originalDom.getElementsByTagName("Pose")[0].setAttribute('modifiedDate', str(str(datetime.datetime.now())[0:str(datetime.datetime.now()).find('.')]))

    # Finally rewrite the pose file.
    file_object = open(poseFile, "w")
    file_object.write(originalDom.toxml())
    file_object.close()

    mel.eval('print "The selected control(s) have been replaced/added to the pose!"')


def outputPoseInfo(poseFile=None):
    # Read the actual pose file.
    originalDom = minidom.parse(poseFile)

    print "\n----------------------------------"
    print "Pose name: " + originalDom.getElementsByTagName("Pose")[0].getAttribute("name")
    print "Created: " + originalDom.getElementsByTagName("Pose")[0].getAttribute("date") + "  by: " + originalDom.getElementsByTagName("Pose")[0].getAttribute("author")
    print "Last modified: " + originalDom.getElementsByTagName("Pose")[0].getAttribute("modifiedDate") + "  by: " + originalDom.getElementsByTagName("Pose")[0].getAttribute("modifiedBy")
    print "Display index (irrelevant): " + originalDom.getElementsByTagName("Pose")[0].getAttribute("index")
    print "Multiple namespaces: " + originalDom.getElementsByTagName("Pose")[0].getAttribute("multipleNamespaces")
    print "Number of controls: " + str(len(originalDom.getElementsByTagName("Control")))
    print "----------------------------------"
    mel.eval('print "\\n(Pose info output to the Script Editor)"')


def writeIndexFile(directory=None, poseNames=None):
    print "Writing Poses index file..."

    # Write down the header for the new .XML pose file.
    doc = minidom.Document()
    main_element = doc.createElement('Main')
    doc.appendChild(main_element)
    poses_element = doc.createElement('Poses')
    main_element.appendChild(poses_element)

    # Base the index on the displayed icons...
    if poseNames is None:
        # Get the list of poses in the order in which they're displayed.
        listOfShelfButtons = mel.eval('shelfLayout -q -ca plPosesSL')
        #print "listOfShelfButtons = " + str(listOfShelfButtons)

        # Write the list of poses in the order they appear in the UI.
        for c in xrange(len(listOfShelfButtons)):
            pose_element = doc.createElement('Pose')
            poses_element.appendChild(pose_element)
            pose_element.setAttribute('name', str(mel.eval('shelfButton -q -l ' + listOfShelfButtons[c])))
            pose_element.setAttribute('index', str(c))
            pose_element.setAttribute('BGColor', ' '.join(map(str, mel.eval('shelfButton -q -bgc ' + listOfShelfButtons[c]))))
        #print doc.toprettyxml()
    # ... Or base the index on the pose files names. This means we're creating the index file from scratch, while the icons are not displayed.
    else:
        poseNames = poseNames.split(' ')

        for c in xrange(len(poseNames)):
            pose_element = doc.createElement('Pose')
            poses_element.appendChild(pose_element)
            pose_element.setAttribute('name', str(poseNames[c]))
            pose_element.setAttribute('index', str(c))
            pose_element.setAttribute('BGColor', '0.4 0.4 0.5')
        #print doc.toprettyxml()

    file_object = open(os.path.join(directory, 'posesIndex.pli'), "w")
    file_object.write(doc.toprettyxml())
    file_object.close()


def updateIndexFile(operation=None, directory=None, poseName=None, poseColorAsString=None, index=None):
    print 'Updating Poses index file... (' + operation + ')'

    # Write down the header for the new .XML pose file.
    doc = minidom.Document()
    main_element = doc.createElement('Main')
    doc.appendChild(main_element)
    poses_element = doc.createElement('Poses')
    main_element.appendChild(poses_element)

    # Read the index file.
    originalDom = minidom.parse(os.path.join(directory, 'posesIndex.pli'))

    if operation == 'add':
        for child in originalDom.getElementsByTagName("Pose"):
            pose_element = doc.createElement('Pose')
            poses_element.appendChild(pose_element)
            pose_element.setAttribute('name', child.getAttribute('name'))
            pose_element.setAttribute('index', child.getAttribute('index'))
            pose_element.setAttribute('BGColor', child.getAttribute('BGColor'))

        #print 'Adding: ' + str(poseName) + ' at the end of: ' + str(directory) + 'posesIndex.pli'

        # Add the pose at the end.
        pose_element = doc.createElement('Pose')
        poses_element.appendChild(pose_element)
        pose_element.setAttribute('name', poseName)
        pose_element.setAttribute('index', index)
        pose_element.setAttribute('BGColor', poseColorAsString)

    elif operation == 'remove':
        #print 'I am removing: ' + str(poseName) + ' from the index!'

        for child in originalDom.getElementsByTagName("Pose"):
            if child.getAttribute('name') != poseName:
                #print child.getAttribute('name') + ' is different from: ' + poseName + ', so I keep it!'

                pose_element = doc.createElement('Pose')
                poses_element.appendChild(pose_element)
                pose_element.setAttribute('name', child.getAttribute('name'))
                pose_element.setAttribute('index', child.getAttribute('index'))
                pose_element.setAttribute('BGColor', child.getAttribute('BGColor'))
            #else:
            #    print 'Discarding: ' + str(poseName) + ' from: ' + str(directory) + 'posesIndex.pli'
    #print doc.toprettyxml()

    file_object = open(os.path.join(directory, 'posesIndex.pli'), "w")
    file_object.write(doc.toxml())
    file_object.close()


def readIndexFile(directory=None):
    posesList = []

    # If the poses index file doesn't exist, then create it.
    if not os.path.isfile(os.path.join(directory, 'posesIndex.pli')):
        writeIndexFile(directory)

    # Read the index file.
    originalDom = minidom.parse(os.path.join(directory, 'posesIndex.pli'))

    for child in originalDom.getElementsByTagName("Pose"):
        # Only append the pose if the file exists.
        if os.path.isfile(os.path.join(directory, child.getAttribute("name") + '.xml')):
            posesList.append(child.getAttribute("name"))

            if child.hasAttribute("BGColor"):
                posesList.append(child.getAttribute("BGColor"))
            else:
                posesList.append('0.4 0.4 0.5')
    #print "posesList = " + str(posesList)

    # In case none of the poses referenced in the index file actually exist.
    if not len(posesList):
        posesList = None

    return posesList


def readCfgFile(directory=None):
    from barbarian.utils.config import getPath
    # Delete me!
    if os.path.exists('F:/maya_scripts/my_scripts/poseLib'):
        directory = 'F:/maya_scripts/my_scripts/poseLib'
    else:
        directory = getPath("../commons/config/")
    print 'PoseLib config directory = ' + directory

    # Read the .cfg file.
    originalDom = minidom.parse(os.path.join(directory, 'poseLib.cfg'))

    # Set the preferences.
    project = None
    projects = ''
    libraryStatus = None
    allThePaths = ''
    privateColor = None
    publicColor = None
    archetypeChoice = None
    castChoice = None
    characterChoice = None
    categoryChoice = None

    # Current choices:
    for child in originalDom.getElementsByTagName("CurrentChoices"):
        libraryStatus = child.getAttribute("library")
        mel.eval('global string $poseLibLibraryStatus = "' + child.getAttribute("library") + '"')
        project = child.getAttribute("project")
        mel.eval('global string $poseLibTextEditor = "' + child.getAttribute("textEditor") + '"')
        mel.eval('global int $poseLibPosesFraction = ' + child.getAttribute("poseFraction"))
        mel.eval('intSliderGrp -e -value ' + child.getAttribute("poseFraction") + ' plPoseFractionISG')
        archetypeChoice = child.getAttribute("archetype")
        castingChoice = child.getAttribute("casting")
        characterChoice = child.getAttribute("character")
        categoryChoice = child.getAttribute("category")

    mel.eval('global string $poseLibCurrentProject = "' + project + '"')

    # Layout:
    for child in originalDom.getElementsByTagName("Layout"):
        privateColor = child.getAttribute("privateColor")
        publicColor = child.getAttribute("publicColor")
        mel.eval('global int $posesToTheRight = ' + child.getAttribute("posesSide"))

        currentWidth = child.getAttribute("optionColumnWidth")
        scrollColumnsWidth = child.getAttribute("scrollColumnsWidth")
        cmds.columnLayout('plOptionsColumn', e=True, w=int(currentWidth))
        mel.eval('rowColumnLayout -e -nc 2 -cw 1 `trunc(' + str((int(scrollColumnsWidth)-1)/2) + ')` -cw 2 `trunc(' + str((int(scrollColumnsWidth)-1)/2) + ')` plCharactersCategoriesRCL')
        #											36								76							30								70
        mel.eval('rowColumnLayout -e -nc 5 -cw 1 `trunc(' + str(int(scrollColumnsWidth)/6.2) + ')` -cw 2 `trunc(' + str(int(scrollColumnsWidth)/3) + ')` -cw 3 `trunc(' + str(int(scrollColumnsWidth)/7.4) + ')` -cw 4 `trunc(' + str(int(scrollColumnsWidth)/3.2) + ')` -cw 5 2 characterCategoryRCL')

    # Projects:
    for child in originalDom.getElementsByTagName("Project"):
        projects = projects + ',' + child.getAttribute("name")
        allThePaths = allThePaths + ',' + child.getAttribute("private") + ',' + child.getAttribute("public")

        if child.getAttribute("name") == project:
            mel.eval('global string $poseLibPrivatePath = "' + child.getAttribute("private") + '"')
            mel.eval('global string $poseLibPublicPath = "' + child.getAttribute("public") + '"')

            if libraryStatus == 'Private':
                mel.eval('optionMenu -e -v "Private" -bgc ' + privateColor + ' libraryStatusChoiceOM')
                mel.eval('global string $poseLibBasePath = "' + child.getAttribute("private") + '"')
            else:
                mel.eval('optionMenu -e -v "Public" -bgc ' + publicColor + ' libraryStatusChoiceOM')
                mel.eval('global string $poseLibBasePath = "' + child.getAttribute("public") + '"')

    mel.eval('global string $poseLibProjects[]; $poseLibProjects = stringToStringArray("' + projects + '", ",")')
    mel.eval('global string $poseLibProjectsPaths[]; $poseLibProjectsPaths = stringToStringArray("' + allThePaths + '", ",")')
    mel.eval('global string $poseLibBasePath; window -e -title ("poseLib v' + _version + ' - " + $poseLibBasePath) poseLibWindow')

    # Namespaces:
    for child in originalDom.getElementsByTagName("Namespaces"):
        mel.eval('radioCollection -e -sl ' + child.getAttribute("choice") + ' namespaceChoiceRC')
        mel.eval('textField -e -text "' + child.getAttribute("customName") + '" namespaceTextFieldTF')

    # Icons:
    for child in originalDom.getElementsByTagName("Icons"):
        mel.eval('global int $poseLibIconsSize[]; $poseLibIconsSize[0] = ' + child.getAttribute("width") + '; $poseLibIconsSize[1] = ' + child.getAttribute("height"))
        mel.eval('global int $poseLibCustomIconsSize[]; $poseLibCustomIconsSize[0] = ' + child.getAttribute("customWidth") + '; $poseLibCustomIconsSize[1] = ' + child.getAttribute("customHeight"))
        mel.eval('global float $poseLibIconsBGColor[]; $poseLibIconsBGColor = {' + child.getAttribute("iconsBGColor").replace(' ', ', ') + '}')

    # Camera:
    for child in originalDom.getElementsByTagName("Camera"):
        mel.eval('global float $poseLibCaptureCameraBGColor[]; $poseLibCaptureCameraBGColor = {' + child.getAttribute("cameraBGColor").replace(' ', ', ') + '}')
        mel.eval('global int $poseLibCaptureCameraFocalLength = ' + child.getAttribute("focalLength"))
        mel.eval('global float $poseLibCaptureCameraNearClip = ' + child.getAttribute("nearClipPlane"))
        mel.eval('global float $poseLibCaptureCameraFarClip = ' + child.getAttribute("farClipPlane"))
        mel.eval('global int $poseLibUseTexturesForIconPreview = ' + child.getAttribute("useTexturesForIconPreview"))

    # Misc:
    for child in originalDom.getElementsByTagName("Misc"):
        mel.eval('global string $poseLibTextEditor = "' + child.getAttribute("textEditor") + '"')

    # --------------------------------------------------
    # Archetype/Casting/Character/Category
    # --------------------------------------------------
    # Now that the basic path variables are set, we can populate the menus.
    mel.eval('poseLibPopulateUIList("archetype")')
    allMenuItems = cmds.optionMenu('plArchetypeChoiceOM', q=True, ill=True)

    for menuItem in allMenuItems:
        if cmds.menuItem(menuItem, q=True, l=True) == archetypeChoice:
            cmds.optionMenu('plArchetypeChoiceOM', e=True, value=archetypeChoice)
            break

    mel.eval('poseLibPopulateUIList("casting")')
    allMenuItems = cmds.optionMenu('plCastingChoiceOM', q=True, ill=True)

    for menuItem in allMenuItems:
        if cmds.menuItem(menuItem, q=True, l=True) == castingChoice:
            cmds.optionMenu('plCastingChoiceOM', e=True, value=castingChoice)
            break

    mel.eval('poseLibPopulateUIList("character")')
    if characterChoice in cmds.textScrollList('plCharacterChoiceTSL', q=True, ai=True):
        cmds.textScrollList('plCharacterChoiceTSL', e=True, si=characterChoice)

    mel.eval('poseLibPopulateUIList("category")')
    if categoryChoice in cmds.textScrollList('plCategoryChoiceTSL', q=True, ai=True):
        cmds.textScrollList('plCategoryChoiceTSL', e=True, si=categoryChoice)


def writeCfgFile(directory=None,
                projects=None,
                projectsPaths=None,
                currentArchetype=None,
                currentCasting=None,
                currentCharacter=None,
                currentCategory=None,
                libraryStatus=None,
                poseFraction=None,
                project=None,
                optionColumnWidth=None,
                scrollColumnsWidth=None,
                posesSide=None,
                privateColor=None,
                publicColor=None,
                customNamespace=None,
                namespaceChoice=None,
                iconsWidth=None,
                iconsHeight=None,
                customIconsWidth=None,
                customIconsHeight=None,
                iconsBGColor=None,
                useTexturesForIconPreview=None,
                iconsFileFormat=None,
                focalLength=None,
                nearClipPlane=None,
                farClipPlane=None,
                cameraBGColor=None,
                textEditor=None
                ):
    # Delete me!
    if os.path.exists('F:/maya_scripts/my_scripts/poseLib'):
        directory = 'F:/maya_scripts/my_scripts/poseLib'
    else:
        directory = cmds.internalVar(userScriptDir=True)
    print 'PoseLib config directory = ' + directory

    projects = projects.split(',')
    projectsPaths = projectsPaths.split(',')

    # Write down the header for the .XML file.
    doc = minidom.Document()
    main_element = doc.createElement('PoseLib')
    doc.appendChild(main_element)
    projects_element = doc.createElement('Projects')
    main_element.appendChild(projects_element)

    # Current choices:
    currentChoices_element = doc.createElement('CurrentChoices')
    main_element.appendChild(currentChoices_element)
    currentChoices_element.setAttribute('archetype', str(currentArchetype))
    currentChoices_element.setAttribute('casting', str(currentCasting))
    currentChoices_element.setAttribute('character', str(currentCharacter))
    currentChoices_element.setAttribute('category', str(currentCategory))
    currentChoices_element.setAttribute('library', str(libraryStatus))
    currentChoices_element.setAttribute('poseFraction', str(poseFraction))
    currentChoices_element.setAttribute('project', str(project))

    # Layout:
    layout_element = doc.createElement('Layout')
    main_element.appendChild(layout_element)
    layout_element.setAttribute('optionColumnWidth', str(optionColumnWidth))
    layout_element.setAttribute('scrollColumnsWidth', str(scrollColumnsWidth))
    layout_element.setAttribute('posesSide', str(posesSide))
    layout_element.setAttribute('privateColor', str(privateColor))
    layout_element.setAttribute('publicColor', str(publicColor))

    # Icons:
    icons_element = doc.createElement('Icons')
    main_element.appendChild(icons_element)
    icons_element.setAttribute('width', str(iconsWidth))
    icons_element.setAttribute('height', str(iconsHeight))
    icons_element.setAttribute('customWidth', str(customIconsWidth))
    icons_element.setAttribute('customHeight', str(customIconsHeight))
    icons_element.setAttribute('iconsBGColor', str(iconsBGColor))
    icons_element.setAttribute('iconsFileFormat', str(iconsFileFormat))

    # Camera:
    camera_element = doc.createElement('Camera')
    main_element.appendChild(camera_element)
    camera_element.setAttribute('focalLength', str(focalLength))
    camera_element.setAttribute('nearClipPlane', str(nearClipPlane))
    camera_element.setAttribute('farClipPlane', str(farClipPlane))
    camera_element.setAttribute('cameraBGColor', str(cameraBGColor))
    camera_element.setAttribute('useTexturesForIconPreview', str(useTexturesForIconPreview))

    # Namespaces:
    namespaces_element = doc.createElement('Namespaces')
    main_element.appendChild(namespaces_element)
    namespaces_element.setAttribute('customName', str(customNamespace))
    namespaces_element.setAttribute('choice', str(namespaceChoice))

    # Misc:
    misc_element = doc.createElement('Misc')
    main_element.appendChild(misc_element)
    misc_element.setAttribute('textEditor', str(textEditor))

    # Write the projects and their paths.
    for c in xrange(len(projects)):
        project_element = doc.createElement('Project')
        projects_element.appendChild(project_element)
        project_element.setAttribute('name', str(projects[c]))
        project_element.setAttribute('private', str(projectsPaths[c*2]))
        project_element.setAttribute('public', str(projectsPaths[(c*2)+1]))

    #print doc.toprettyxml()
    file_object = open(os.path.join(directory, 'poseLib.cfg'), "w")
    file_object.write(doc.toprettyxml())
    file_object.close()


