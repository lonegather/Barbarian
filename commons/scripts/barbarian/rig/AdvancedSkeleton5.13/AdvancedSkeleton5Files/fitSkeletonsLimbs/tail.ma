//Maya ASCII 2012 scene
//Name: tail.ma
//Last modified: Sun, Jun 21, 2015 09:43:56 PM
//Codeset: 1252
requires maya "2008";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2012";
fileInfo "version" "2012 x64";
fileInfo "cutIdentifier" "001200000000-796618";
fileInfo "osv" "Microsoft Business Edition, 64-bit  (Build 9200)\n";
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -28.364920918110631 16.13762964876047 10.548625060022481 ;
	setAttr ".r" -type "double3" -17.138352760959116 -73.79999999999832 0 ;
	setAttr ".rp" -type "double3" -8.8817841970012523e-016 0 0 ;
	setAttr ".rpt" -type "double3" 1.5224626229499877e-014 -1.3199315485600268e-015 
		-1.3322676295501878e-014 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999986;
	setAttr ".coi" 35.214773755150382;
	setAttr ".ow" 24.974981546401978;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 0 7.4247611196232981 1.3568931187824473 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.64662851135686283 115.16904290653265 0.28135788656791222 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
	setAttr ".rpt" -type "double3" 0 -4.9303806576310428e-033 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 104.57473067042028;
	setAttr ".ow" 47.10336249915553;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".tp" -type "double3" -0.49772198157973702 10.54327394110028 5.9593642329474026 ;
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.64662851135686283 7.4247611196232981 125.88468913633231 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 122.02946021364146;
	setAttr ".ow" 39.661594702346953;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".tp" -type "double3" -0.63709647730678143 7.0836944868003098 3.4880932958588744 ;
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 131.98434623320694 0.96512194728947165 3.9155667144713204 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
	setAttr ".rpt" -type "double3" 3.0444836807280097e-035 0 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 132.93877903462635;
	setAttr ".ow" 19.352985144391567;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".tp" -type "double3" -0.95502152927679163 0.51447483899569757 3.4294275077891831 ;
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "FitSkeleton";
	addAttr -ci true -sn "visCylinders" -ln "visCylinders" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "visBoxes" -ln "visBoxes" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "visBones" -ln "visBones" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "lockCenterJoints" -ln "lockCenterJoints" -dv 1 -min 0 -max 
		1 -at "bool";
	addAttr -ci true -sn "visGap" -ln "visGap" -dv 0.75 -min 0 -max 1 -at "double";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr ".visBoxes" yes;
	setAttr ".visGap" 1;
createNode nurbsCurve -n "FitSkeletonShape" -p "FitSkeleton";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		6.2169994171495482 3.806814218256566e-016 -6.2169994171495331
		-1.0030808860283082e-015 5.3836482968931744e-016 -8.7921648929985121
		-6.2169994171495393 3.806814218256567e-016 -6.2169994171495393
		-8.7921648929985121 1.9654698504738134e-031 -3.2780950445655398e-015
		-6.2169994171495411 -3.8068142182565665e-016 6.2169994171495366
		-2.6492508711910207e-015 -5.3836482968931764e-016 8.7921648929985139
		6.2169994171495331 -3.806814218256567e-016 6.2169994171495393
		8.7921648929985121 -2.486144740049459e-031 3.9919432940356966e-015
		6.2169994171495482 3.806814218256566e-016 -6.2169994171495331
		-1.0030808860283082e-015 5.3836482968931744e-016 -8.7921648929985121
		-6.2169994171495393 3.806814218256567e-016 -6.2169994171495393
		;
createNode joint -n "Tail0" -p "FitSkeleton";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	addAttr -ci true -k true -sn "flipOrient" -ln "flipOrient" -dv 1 -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.4030713990921328e-015 9.8981703222248214 -1.4368760926321359e-016 ;
	setAttr ".r" -type "double3" -1.669446850353055e-012 -1.478034912110967e-014 2.6637145457256468e-014 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -179.99999999999807 89.999999999999986 0 ;
	setAttr ".dl" yes;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "0Tail";
	setAttr -k on ".fat" 0.5;
	setAttr ".fatYabs" 0.5;
	setAttr ".fatZabs" 0.5;
createNode joint -n "Tail1" -p "Tail0";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 1.0000000000000262 5.3290705182007514e-015 2.5796575675757076e-016 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "30";
	setAttr -k on ".fat" 0.5;
	setAttr ".fatYabs" 0.5;
	setAttr ".fatZabs" 0.5;
createNode joint -n "Tail2" -p "Tail1";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.9999999999999849 3.5527136788005009e-015 -3.9933994346179214e-016 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dl" yes;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "1";
	setAttr -k on ".fat" 0.5;
	setAttr ".fatYabs" 0.5;
	setAttr ".fatZabs" 0.5;
createNode joint -n "Tail3" -p "Tail2";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 1 -1.4210854715202004e-014 -4.4251470645953478e-016 ;
	setAttr ".r" -type "double3" 2.148865823449802e-017 4.0879437567097417e-015 2.4411751103570447e-012 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 0.60235568663633399 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "29";
	setAttr -k on ".fat" 0.5;
	setAttr ".fatYabs" 0.5;
	setAttr ".fatZabs" 0.5;
createNode joint -n "Tail4" -p "Tail3";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 1.0000552650756944 4.7961634663806763e-014 -7.1352021247977456e-017 ;
	setAttr ".r" -type "double3" -4.1369829936317095e-018 7.8700836580456529e-016 -1.2164627733259993e-012 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -0.60235568663634809 ;
	setAttr ".dl" yes;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "2";
	setAttr -k on ".fat" 0.5;
	setAttr ".fatYabs" 0.5;
	setAttr ".fatZabs" 0.5;
createNode joint -n "Tail5" -p "Tail4";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 1.0000000000000293 -2.8421709430404007e-014 -1.3735887224041914e-017 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "28";
	setAttr -k on ".fat" 0.5;
	setAttr ".fatYabs" 0.5;
	setAttr ".fatZabs" 0.5;
createNode joint -n "Tail6" -p "Tail5";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 1.0000000000000018 1.7763568394002505e-015 2.3440857911513872e-016 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dl" yes;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "3";
	setAttr -k on ".fat" 0.5;
	setAttr ".fatYabs" 0.5;
	setAttr ".fatZabs" 0.5;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode displayLayerManager -n "layerManager";
	setAttr ".cdl" 6;
	setAttr -s 11 ".dli[1:10]"  1 2 4 3 5 6 7 9 
		8 11;

connectAttr "Tail0.s" "Tail1.is";
connectAttr "Tail1.s" "Tail2.is";
connectAttr "Tail2.s" "Tail3.is";
connectAttr "Tail3.s" "Tail4.is";
connectAttr "Tail4.s" "Tail5.is";
connectAttr "Tail5.s" "Tail6.is";

// End of tail.ma
