import maya.cmds as cmds
def skinChangeWindow(): 
    Warnings = ['///warning: << same name >>///', '///warning: select << bind-able object >>///', '///warning: select << ONE >>///','']
    ### <<button>> "assign_old_geometry" commend impacrt ###     
    def GEO1Input(*args):
        Geo1Sel = cmds.ls(sl=True)
        if len(Geo1Sel)==1:
            if Geo1Sel[0].find("|")!=-1:
                cmds.textField(textFieldOld, e=True, bgc=(0.9,0.4,0.4), text=Warnings[0])            
            Geo1Relatives = cmds.listRelatives(Geo1Sel[0], shapes=True, ni=True)
            OBJ1types = ['mesh', 'nurbsCurve','nurbsSurface','lattice']      
            if cmds.nodeType(Geo1Relatives) in OBJ1types:
                cmds.textField(textFieldOld, e=True, bgc=(0.4,1,0.4), text=Geo1Sel[0])                
            else:
                cmds.textField(textFieldOld, e=True, bgc=(0.9,0.4,0.4), text=Warnings[1])
        else:
            cmds.textField(textFieldOld, e=True, bgc=(0.9,0.4,0.4), text=Warnings[2])

    ### <<button>> "assign_new_geometry" commend impacrt ###     
    def GEO2Input(*args):
        Geo2Sel = cmds.ls(sl=True)
        if len(Geo2Sel)==1:
            if Geo2Sel[0].find("|")!=-1:
                cmds.textField(textFieldNew, e=True, bgc=(0.9,0.4,0.4), text=Warnings[0])            
            Geo2Relatives = cmds.listRelatives(Geo2Sel[0], shapes=True, ni=True)
            OBJ2types = ['mesh', 'nurbsCurve','nurbsSurface','lattice']      
            if cmds.nodeType(Geo2Relatives) in OBJ2types:
                cmds.textField(textFieldNew, e=True, bgc=(0.4,1,0.4), text=Geo2Sel[0])                
            else:
                cmds.textField(textFieldNew, e=True, bgc=(0.9,0.4,0.4), text=Warnings[1])
        else:
            cmds.textField(textFieldNew, e=True, bgc=(0.9,0.4,0.4), text=Warnings[2])

    ### <<button>> "clear" commend impact ###
    def clear(*args):
        cmds.textField(textFieldOld, edit=True, bgc=(0.267,0.267,0.267), text="")
        cmds.textField(textFieldNew, edit=True, bgc=(0.267,0.267,0.267), text="")
        
    ### <<button>> "changeSkin" commend impact ###
    def changeSkin(*args):
        if cmds.textField(textFieldOld, q=True, text=True) in Warnings:
            cmds.textField(textFieldOld, e=True, bgc=(0.9,0,0), text="!!!!!!!!!!!!!!!!!!!!!!!not right!!!!!!!!!!!!!!!!!!!!!!!!!")
        elif cmds.textField(textFieldNew, q=True, text=True) in Warnings:
            cmds.textField(textFieldNew, e=True, bgc=(0.9,0,0), text="!!!!!!!!!!!!!!!!!!!!!!!not right!!!!!!!!!!!!!!!!!!!!!!!!!")
        else:
            OLD = cmds.textField(textFieldOld,q=True, text=True)
            OLDshape = cmds.listRelatives(OLD, shapes=True, ni=True)
            NEW = cmds.textField(textFieldNew,q=True, text=True)
            NEWshape = cmds.listRelatives(NEW, shapes=True, ni=True)
            SkinCluster = cmds.listConnections(OLDshape, s=True, type='skinCluster')
            JNTs = cmds.listConnections(SkinCluster, s=True, type='joint')
            
            cmds.skinCluster(NEWshape,JNTs,tsb=True,sm=0,)
            cmds.copySkinWeights(OLDshape, NEWshape, nm=True, sa='closestPoint', ia='closestJoint')
            
            
        
        
<<<<<<< .mine
        windowMain = cmds.window( "SCwindow", title = "skinChange_V0.1")
        formMain = cmds.formLayout(numberOfDivisions=100)
        
        # Creating Element <<text>> "skinChange"
        textTitle = cmds.text(label="skinChange", w=306, h=34)
        cmds.formLayout( formMain, edit=True, attachForm=[(textTitle, 'top', 0), ( textTitle, 'left', 6)] )
        #=========================================
        # Creating Element <<button>> "assign_old_object"
        buttonOld = cmds.button( backgroundColor=(1,1,0), label="assign_old_object", w=306, h=34, c=GEO1Input)
        cmds.formLayout( formMain, edit=True, attachForm=[(buttonOld, 'top', 34), ( buttonOld, 'left', 6)] )
        #=========================================
        # Creating Element <<textField>> "GEO1show"
        textFieldOld = cmds.textField( ed=0, w=238, h=23)
        cmds.formLayout( formMain, edit=True, attachForm=[(textFieldOld, 'top', 73), ( textFieldOld, 'left', 41)] )
        #=========================================
        # Creating Element <<button>> "assign_new_object"
        buttonNew = cmds.button( backgroundColor=(0.392157,0.862745,1), label="assign_new_object", w=306, h=34, c=GEO2Input)
        cmds.formLayout( formMain, edit=True, attachForm=[(buttonNew, 'top', 102), ( buttonNew, 'left', 6)] )
        #=========================================
        # Creating Element <<textField>> "GEO2show"
        textFieldNew = cmds.textField( ed=0, w=238, h=23)
        cmds.formLayout( formMain, edit=True, attachForm=[(textFieldNew, 'top', 141), ( textFieldNew, 'left', 41)] )
        #=========================================
        # Creating Element <<button>> "changSkin"
        buttonChange = cmds.button( label="changSkin", w=68, h=34, c=changeSkin)
        cmds.formLayout( formMain, edit=True, attachForm=[(buttonChange, 'top', 187), ( buttonChange, 'left', 41)] )
        #=========================================
        # Creating Element <<button>> "clear"
        buttonClear = cmds.button( label="clear", w=68, h=34, c=clear)
        cmds.formLayout( formMain, edit=True, attachForm=[(buttonClear, 'top', 187), ( buttonClear, 'left', 210)] )
        #=========================================
        
        cmds.setParent( '..' )
        cmds.showWindow( windowMain )
        cmds.window( "SCwindow", edit=True, widthHeight=(320.0, 256.0))

||||||| .r49
        windowMain = cmds.window( "SCwindow", title = "skinChange_V0.1")
        formMain = cmds.formLayout(numberOfDivisions=100)
        
        # Creating Element <<text>> "skinChange"
        textTitle = cmds.text(label="skinChange", w=306, h=34)
        cmds.formLayout( formMain, edit=True, attachForm=[(textTitle, 'top', 0), ( textTitle, 'left', 6)] )
        #=========================================
        # Creating Element <<button>> "assign_old_object"
        buttonOld = cmds.button( backgroundColor=(1,1,0), label="assign_old_object", w=306, h=34, c=GEO1Input)
        cmds.formLayout( formMain, edit=True, attachForm=[(buttonOld, 'top', 34), ( buttonOld, 'left', 6)] )
        #=========================================
        # Creating Element <<textField>> "GEO1show"
        textFieldOld = cmds.textField( ed=0, w=238, h=23)
        cmds.formLayout( formMain, edit=True, attachForm=[(textFieldOld, 'top', 73), ( textFieldOld, 'left', 41)] )
        #=========================================
        # Creating Element <<button>> "assign_new_object"
        buttonNew = cmds.button( backgroundColor=(0.392157,0.862745,1), label="assign_new_object", w=306, h=34, c=GEO2Input)
        cmds.formLayout( formMain, edit=True, attachForm=[(buttonNew, 'top', 102), ( buttonNew, 'left', 6)] )
        #=========================================
        # Creating Element <<textField>> "GEO2show"
        textFieldNew = cmds.textField( ed=0, w=238, h=23)
        cmds.formLayout( formMain, edit=True, attachForm=[(textFieldNew, 'top', 141), ( textFieldNew, 'left', 41)] )
        #=========================================
        # Creating Element <<button>> "changSkin"
        buttonChange = cmds.button( label="changSkin", w=68, h=34, c=changeSkin)
        cmds.formLayout( formMain, edit=True, attachForm=[(buttonChange, 'top', 187), ( buttonChange, 'left', 41)] )
        #=========================================
        # Creating Element <<button>> "clear"
        buttonClear = cmds.button( label="clear", w=68, h=34, c=clear)
        cmds.formLayout( formMain, edit=True, attachForm=[(buttonClear, 'top', 187), ( buttonClear, 'left', 210)] )
        #=========================================
        
        cmds.setParent( '..' )
        cmds.showWindow( windowMain )
        cmds.window( "SCwindow", edit=True, widthHeight=(320.0, 256.0))

=======
    ####### create main window #######
    if cmds.window("SCwindow", ex=True):
        cmds.deleteUI ("SCwindow")
    
    windowMain = cmds.window( "SCwindow", title = "skinChange_V0.1")
    formMain = cmds.formLayout(numberOfDivisions=100)
    
    # Creating Element <<text>> "skinChange"
    textTitle = cmds.text(label="skinChange", w=306, h=34)
    cmds.formLayout( formMain, edit=True, attachForm=[(textTitle, 'top', 0), ( textTitle, 'left', 6)] )
    #=========================================
    # Creating Element <<button>> "assign_old_object"
    buttonOld = cmds.button( backgroundColor=(1,1,0), label="assign_old_object", w=306, h=34, c=GEO1Input)
    cmds.formLayout( formMain, edit=True, attachForm=[(buttonOld, 'top', 34), ( buttonOld, 'left', 6)] )
    #=========================================
    # Creating Element <<textField>> "GEO1show"
    textFieldOld = cmds.textField( ed=0, w=238, h=23)
    cmds.formLayout( formMain, edit=True, attachForm=[(textFieldOld, 'top', 73), ( textFieldOld, 'left', 41)] )
    #=========================================
    # Creating Element <<button>> "assign_new_object"
    buttonNew = cmds.button( backgroundColor=(0.392157,0.862745,1), label="assign_new_object", w=306, h=34, c=GEO2Input)
    cmds.formLayout( formMain, edit=True, attachForm=[(buttonNew, 'top', 102), ( buttonNew, 'left', 6)] )
    #=========================================
    # Creating Element <<textField>> "GEO2show"
    textFieldNew = cmds.textField( ed=0, w=238, h=23)
    cmds.formLayout( formMain, edit=True, attachForm=[(textFieldNew, 'top', 141), ( textFieldNew, 'left', 41)] )
    #=========================================
    # Creating Element <<button>> "changSkin"
    buttonChange = cmds.button( label="changSkin", w=68, h=34, c=changeSkin)
    cmds.formLayout( formMain, edit=True, attachForm=[(buttonChange, 'top', 187), ( buttonChange, 'left', 41)] )
    #=========================================
    # Creating Element <<button>> "clear"
    buttonClear = cmds.button( label="clear", w=68, h=34, c=clear)
    cmds.formLayout( formMain, edit=True, attachForm=[(buttonClear, 'top', 187), ( buttonClear, 'left', 210)] )
    #=========================================
    
    cmds.setParent( '..' )
    cmds.showWindow( windowMain )
    cmds.window( "SCwindow", edit=True, widthHeight=(320.0, 256.0))
    
>>>>>>> .r52
