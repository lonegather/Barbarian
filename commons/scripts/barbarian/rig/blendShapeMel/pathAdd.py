import sys
path = ["C:\Users\Administrator\Documents\maya\scripts\Barbarian_Data\Rig\blendShapeMel\blendShapeManage"]

for i in path:
    if i not in sys.path:
        sys.path.append(i)
for i in sys.path:
    print i
    

        
