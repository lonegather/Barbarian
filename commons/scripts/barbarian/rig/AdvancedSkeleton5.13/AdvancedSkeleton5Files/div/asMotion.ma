//Maya ASCII 2012 scene
//Name: asMotion.ma
//Last modified: Mon, Aug 19, 2013 10:45:00 AM
//Codeset: 1252
requires maya "2008";
currentUnit -l centimeter -a degree -t pal;
fileInfo "application" "maya";
fileInfo "product" "Maya 2012";
fileInfo "version" "2012 x64";
fileInfo "cutIdentifier" "001200000000-796618";
fileInfo "osv" "Microsoft Business Edition, 64-bit  (Build 9200)\n";
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -14.820868495418472 11.019568683633983 16.234237123802711 ;
	setAttr ".r" -type "double3" -15.214922707227053 -38.599999999999852 -1.0174252606651623e-015 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999986;
	setAttr ".ncp" 1;
	setAttr ".coi" 22.127963807743839;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -0.16815896682188436 5.9460951942780502 1.6139774508625875 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 100.10000000000002 2.2226664952995633e-014 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 1;
	setAttr ".coi" 100.1;
	setAttr ".ow" 22.579641313590376;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 100.1 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 1;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 100.1 5.8908553300922533 2.7574966224068307 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 1;
	setAttr ".coi" 100.1;
	setAttr ".ow" 18.592014585530997;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "Group";
	addAttr -ci true -sn "timing" -ln "timing" -at "double";
createNode transform -n "run_female:Group" -p "Group";
	setAttr ".v" no;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode joint -n "run_female:Root_M" -p "run_female:Group";
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" 89.999999999999972 0 89.999999999999972 ;
createNode joint -n "run_female:Spine1_M" -p "run_female:Root_M";
	setAttr ".t" -type "double3" 0.790664306481629 -5.5511151231257827e-017 1.1102230246251565e-016 ;
createNode joint -n "run_female:Spine2_M" -p "run_female:Spine1_M";
	setAttr ".t" -type "double3" 0.790664306481629 2.2204460492503131e-016 -2.2204460492503131e-016 ;
createNode joint -n "run_female:Chest_M" -p "run_female:Spine2_M";
	setAttr ".t" -type "double3" 0.68845511400517179 -6.106226635438361e-016 -3.8857805861880479e-016 ;
createNode joint -n "run_female:Scapula_R" -p "run_female:Chest_M";
	setAttr ".t" -type "double3" 0.71146805441475713 -1.1102230246251565e-016 -0.27601391079496795 ;
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 0.99999999999999967 0.99999999999999978 0.99999999999999967 ;
	setAttr ".jo" -type "double3" -138.99428182178374 89.999998181660999 131.00571810258651 ;
createNode joint -n "run_female:Shoulder_R" -p "run_female:Scapula_R";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 0.70947081409118673 -1.7763568394002505e-015 0 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 0 -4.9999999999999707 0 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "run_female:Elbow_R" -p "run_female:Shoulder_R";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 1.5708746117179739 -6.4025101154108199e-007 3.0819210006249875e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -22.437790504454139 9.2565781855129838 -3.8002443944682045 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "run_female:Wrist_R" -p "run_female:Elbow_R";
	setAttr ".t" -type "double3" 1.544187994768472 -1.491892237304171e-006 8.8467722436647023e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 4.9153865449787855 -4.9817091591942955 -0.42788023520528529 ;
createNode joint -n "run_female:WristENd_R" -p "run_female:Wrist_R";
	setAttr ".t" -type "double3" 1 0 2.2204460492503131e-016 ;
	setAttr ".r" -type "double3" 1.9245617303760405 0.11648861672277798 -5.7408703792188138 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -1.924561730376031 -0.11648861672278395 5.7408703792188165 ;
createNode joint -n "run_female:Neck_M" -p "run_female:Chest_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 1.3193399122742271 -7.7715611723760958e-016 4.6629367034256575e-015 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 1 1 0.99999999999999978 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "run_female:Head_M" -p "run_female:Neck_M";
	setAttr ".t" -type "double3" 0.78270576193444086 -3.5527136788005009e-015 3.7747582837255322e-015 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999978 0.99999999999999978 ;
	setAttr ".jo" -type "double3" 0.74260503053646509 0 0 ;
createNode joint -n "run_female:Hair_M" -p "run_female:Head_M";
	setAttr ".t" -type "double3" 1.6637195600180252 3.1801229238756606e-015 -2.2021511348050822e-015 ;
createNode joint -n "run_female:Scapula_L" -p "run_female:Chest_M";
	setAttr ".t" -type "double3" 0.71146805441476069 -7.7715611723760958e-016 0.2760139107949664 ;
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 1 1.0000000000000002 0.99999999999999967 ;
	setAttr ".jo" -type "double3" 21.162675565639997 90.000001471433407 111.16267439949191 ;
createNode joint -n "run_female:Shoulder_L" -p "run_female:Scapula_L";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.70947081409118673 3.5527136788005009e-015 8.8817841970012523e-016 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 0 -4.999999999999944 0 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "run_female:Elbow_L" -p "run_female:Shoulder_L";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -1.5708746116017371 2.1394946134734028e-006 -6.6020715250303397e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -22.66334400629254 9.2417399593854324 -3.8365062113221096 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "run_female:Wrist_L" -p "run_female:Elbow_L";
	setAttr ".t" -type "double3" -1.5441879947602484 4.8049725513976682e-006 -2.3068607202247904e-006 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 2.6205232789389603 -4.9948059572064007 -0.22831092408200465 ;
createNode joint -n "run_female:WristENd_L" -p "run_female:Wrist_L";
	setAttr ".t" -type "double3" -1 0 0 ;
	setAttr ".r" -type "double3" 1.0887042116436532 2.7683551143625205 -3.2216285703639405 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -1.0887042116436452 -2.7683551143625262 3.2216285703639396 ;
createNode joint -n "run_female:Hip_R" -p "run_female:Root_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.35254912946042172 0.10286232435237826 -0.48790404193790671 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 0 0 179.49262008406379 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "run_female:Knee_R" -p "run_female:Hip_R";
	setAttr ".t" -type "double3" 2.1069606749728766 -9.2153837449870935e-008 3.4932323700331835e-009 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 2.3559827166828313 -0.11134981366725165 2.7044078809298253 ;
createNode joint -n "run_female:Ankle_R" -p "run_female:Knee_R";
	setAttr ".t" -type "double3" 2.6880118218361586 -2.2204460492503131e-015 2.3425705819590803e-013 ;
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" -0.01912299287235154 0 -2.1993176213308532 ;
createNode joint -n "run_female:Toes_R" -p "run_female:Ankle_R";
	setAttr ".t" -type "double3" 0.64070561067942533 -0.94569566424534335 -0.0003156346291482981 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 0.99999999999999944 0.99999999999999933 0.99999999999999944 ;
	setAttr ".jo" -type "double3" 0.0074414175309780234 0.017646304569237537 -66.912523711885243 ;
createNode joint -n "run_female:MiddleToe2_R" -p "run_female:Toes_R";
	setAttr ".t" -type "double3" 0.5840372867607474 -1.0453593546344564e-010 -4.4408920985006262e-016 ;
	setAttr ".ro" 5;
createNode joint -n "run_female:Hip_L" -p "run_female:Root_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.35254912946042349 0.10286232435236956 0.48790404193790887 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 0 0 -0.5073799159362834 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "run_female:Knee_L" -p "run_female:Hip_L";
	setAttr ".t" -type "double3" -2.1069606749728802 9.1904736265746578e-008 -7.6191639664102695e-009 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -1.3770994885831538 0.065097401003612013 2.7059151941015744 ;
createNode joint -n "run_female:Ankle_L" -p "run_female:Knee_L";
	setAttr ".t" -type "double3" -2.6880118218361604 2.2759572004815709e-015 -2.3325785747374539e-013 ;
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" -0.019122992872322851 -4.8531412986198669e-020 -2.1993176213308683 ;
createNode joint -n "run_female:Toes_L" -p "run_female:Ankle_L";
	setAttr ".t" -type "double3" -0.64070561067942533 0.94569566424534135 0.00031563463551187443 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1 ;
	setAttr ".jo" -type "double3" 0.0074414175305822028 0.017646304569392198 -66.912523713079963 ;
createNode joint -n "run_female:MiddleToe2_L" -p "run_female:Toes_L";
	setAttr ".t" -type "double3" -0.58403728676074662 8.8860363511855667e-011 1.1102230246251565e-016 ;
	setAttr ".ro" 5;
createNode transform -n "run_male:Group" -p "Group";
	setAttr ".v" no;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode joint -n "run_male:Root_M" -p "run_male:Group";
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" 89.999999999999972 0 89.999999999999972 ;
createNode joint -n "run_male:Spine1_M" -p "run_male:Root_M";
	setAttr ".t" -type "double3" 0.790664306481629 -5.5511151231257827e-017 1.1102230246251565e-016 ;
createNode joint -n "run_male:Spine2_M" -p "run_male:Spine1_M";
	setAttr ".t" -type "double3" 0.790664306481629 2.2204460492503131e-016 -2.2204460492503131e-016 ;
createNode joint -n "run_male:Chest_M" -p "run_male:Spine2_M";
	setAttr ".t" -type "double3" 0.68845511400517179 -6.106226635438361e-016 -3.8857805861880479e-016 ;
createNode joint -n "run_male:Scapula_R" -p "run_male:Chest_M";
	setAttr ".t" -type "double3" 0.71146805441475713 -1.1102230246251565e-016 -0.27601391079496795 ;
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 0.99999999999999967 0.99999999999999978 0.99999999999999967 ;
	setAttr ".jo" -type "double3" -138.99428182178374 89.999998181660999 131.00571810258651 ;
createNode joint -n "run_male:Shoulder_R" -p "run_male:Scapula_R";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 0.70947081409118673 -1.7763568394002505e-015 0 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 0 -4.9999999999999698 0 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "run_male:Elbow_R" -p "run_male:Shoulder_R";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 1.5708746117179739 -6.4025101154108199e-007 3.0819210006249875e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -22.437790504454139 9.2565781855129838 -3.8002443944682045 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "run_male:Wrist_R" -p "run_male:Elbow_R";
	setAttr ".t" -type "double3" 1.544187994768472 -1.491892237304171e-006 8.8467722436647023e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 4.9153865449787846 -4.9817091591942946 -0.42788023520528523 ;
createNode joint -n "run_male:WristENd_R" -p "run_male:Wrist_R";
	setAttr ".t" -type "double3" 1 0 2.2204460492503131e-016 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -1.924561730376031 -0.11648861672278391 5.7408703792188165 ;
createNode joint -n "run_male:Neck_M" -p "run_male:Chest_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 1.3193399122742271 -7.7715611723760958e-016 4.6629367034256575e-015 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 1 1 0.99999999999999978 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "run_male:Head_M" -p "run_male:Neck_M";
	setAttr ".t" -type "double3" 0.78270576193444086 -3.5527136788005009e-015 3.7747582837255322e-015 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999978 0.99999999999999978 ;
	setAttr ".jo" -type "double3" 0.74260503053646509 0 0 ;
createNode joint -n "run_male:Hair_M" -p "run_male:Head_M";
	setAttr ".t" -type "double3" 1.6637195600180252 3.1801229238756606e-015 -2.2021511348050822e-015 ;
createNode joint -n "run_male:Scapula_L" -p "run_male:Chest_M";
	setAttr ".t" -type "double3" 0.71146805441476069 -7.7715611723760958e-016 0.2760139107949664 ;
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 1 1.0000000000000002 0.99999999999999967 ;
	setAttr ".jo" -type "double3" 21.162675733280164 90.000001471433407 111.16267458577006 ;
createNode joint -n "run_male:Shoulder_L" -p "run_male:Scapula_L";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.70947081409118673 3.5527136788005009e-015 8.8817841970012523e-016 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 0 -4.999999999999944 0 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "run_male:Elbow_L" -p "run_male:Shoulder_L";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -1.5708746116017371 2.1394946134734028e-006 -6.6020715250303397e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -22.663344006292533 9.2417399593854324 -3.8365062113221096 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "run_male:Wrist_L" -p "run_male:Elbow_L";
	setAttr ".t" -type "double3" -1.5441879947602484 4.8049725513976682e-006 -2.3068607202247904e-006 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 2.6205232789389603 -4.9948059572063999 -0.22831092408200465 ;
createNode joint -n "run_male:WristENd_L" -p "run_male:Wrist_L";
	setAttr ".t" -type "double3" -1 0 0 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -1.0887042116436452 -2.7683551143625258 3.2216285703639396 ;
createNode joint -n "run_male:Hip_R" -p "run_male:Root_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.35254912946042172 0.10286232435237826 -0.48790404193790671 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 0 0 179.49262008406379 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "run_male:Knee_R" -p "run_male:Hip_R";
	setAttr ".t" -type "double3" 2.1069606749728766 -9.2153837449870935e-008 3.4932323700331835e-009 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 2.3559827166828309 -0.11134981366725165 2.7044078809298253 ;
createNode joint -n "run_male:Ankle_R" -p "run_male:Knee_R";
	setAttr ".t" -type "double3" 2.6880118218361586 -2.2204460492503131e-015 2.3425705819590803e-013 ;
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" -0.01912299287235154 4.8531412986198675e-020 -2.1993176213308536 ;
createNode joint -n "run_male:Toes_R" -p "run_male:Ankle_R";
	setAttr ".t" -type "double3" 0.64070561067942533 -0.94569566424534335 -0.0003156346291482981 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 0.99999999999999944 0.99999999999999933 0.99999999999999944 ;
	setAttr ".jo" -type "double3" 0.0074414175309780234 0.017646304569237537 -66.912523711885243 ;
createNode joint -n "run_male:MiddleToe2_R" -p "run_male:Toes_R";
	setAttr ".t" -type "double3" 0.5840372867607474 -1.0453593546344564e-010 -4.4408920985006262e-016 ;
	setAttr ".ro" 5;
createNode joint -n "run_male:Hip_L" -p "run_male:Root_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.35254912946042349 0.10286232435236956 0.48790404193790887 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 0 0 -0.5073799159362834 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "run_male:Knee_L" -p "run_male:Hip_L";
	setAttr ".t" -type "double3" -2.1069606749728802 9.1904736265746578e-008 -7.6191639664102695e-009 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -1.3770994885831533 0.065097401003611985 2.7059151941015727 ;
createNode joint -n "run_male:Ankle_L" -p "run_male:Knee_L";
	setAttr ".t" -type "double3" -2.6880118218361604 2.2759572004815709e-015 -2.3325785747374539e-013 ;
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" -0.019122992872322851 -4.8531412986198669e-020 -2.1993176213308683 ;
createNode joint -n "run_male:Toes_L" -p "run_male:Ankle_L";
	setAttr ".t" -type "double3" -0.64070561067942533 0.94569566424534135 0.00031563463551187443 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1 ;
	setAttr ".jo" -type "double3" 0.0074414175305822028 0.017646304569392198 -66.912523713079963 ;
createNode joint -n "run_male:MiddleToe2_L" -p "run_male:Toes_L";
	setAttr ".t" -type "double3" -0.58403728676074662 8.8860363511855667e-011 1.1102230246251565e-016 ;
	setAttr ".ro" 5;
createNode transform -n "walk_angry:Group" -p "Group";
	setAttr ".v" no;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode joint -n "walk_angry:Root_M" -p "walk_angry:Group";
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" 89.999999999999972 0 89.999999999999972 ;
createNode joint -n "walk_angry:Spine1_M" -p "walk_angry:Root_M";
	setAttr ".t" -type "double3" 0.790664306481629 -5.5511151231257827e-017 1.1102230246251565e-016 ;
createNode joint -n "walk_angry:Spine2_M" -p "walk_angry:Spine1_M";
	setAttr ".t" -type "double3" 0.790664306481629 2.2204460492503131e-016 -2.2204460492503131e-016 ;
createNode joint -n "walk_angry:Chest_M" -p "walk_angry:Spine2_M";
	setAttr ".t" -type "double3" 0.68845511400517179 -6.106226635438361e-016 -3.8857805861880479e-016 ;
createNode joint -n "walk_angry:Scapula_R" -p "walk_angry:Chest_M";
	setAttr ".t" -type "double3" 0.71146805441475713 -1.1102230246251565e-016 -0.27601391079496795 ;
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 0.99999999999999967 0.99999999999999978 0.99999999999999967 ;
	setAttr ".jo" -type "double3" -138.99428182178374 89.999998181660999 131.00571810258651 ;
createNode joint -n "walk_angry:Shoulder_R" -p "walk_angry:Scapula_R";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 0.70947081409118673 -1.7763568394002505e-015 0 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 0 -4.9999999999999698 0 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_angry:Elbow_R" -p "walk_angry:Shoulder_R";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 1.5708746117179739 -6.4025101154108199e-007 3.0819210006249875e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -22.437790504454139 9.2565781855129838 -3.8002443944682045 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_angry:Wrist_R" -p "walk_angry:Elbow_R";
	setAttr ".t" -type "double3" 1.544187994768472 -1.491892237304171e-006 8.8467722436647023e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 4.9153865449787846 -4.9817091591942946 -0.42788023520528523 ;
createNode joint -n "walk_angry:WristENd_R" -p "walk_angry:Wrist_R";
	setAttr ".t" -type "double3" 1 0 2.2204460492503131e-016 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -1.924561730376031 -0.11648861672278391 5.7408703792188165 ;
createNode joint -n "walk_angry:Neck_M" -p "walk_angry:Chest_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 1.3193399122742271 -7.7715611723760958e-016 4.6629367034256575e-015 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 1 1 0.99999999999999978 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_angry:Head_M" -p "walk_angry:Neck_M";
	setAttr ".t" -type "double3" 0.78270576193444086 -3.5527136788005009e-015 3.7747582837255322e-015 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999978 0.99999999999999978 ;
	setAttr ".jo" -type "double3" 0.74260503053646509 0 0 ;
createNode joint -n "walk_angry:Hair_M" -p "walk_angry:Head_M";
	setAttr ".t" -type "double3" 1.6637195600180252 3.1801229238756606e-015 -2.2021511348050822e-015 ;
createNode joint -n "walk_angry:Scapula_L" -p "walk_angry:Chest_M";
	setAttr ".t" -type "double3" 0.71146805441476069 -7.7715611723760958e-016 0.2760139107949664 ;
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 1 1.0000000000000002 0.99999999999999967 ;
	setAttr ".jo" -type "double3" 21.162675733280164 90.000001471433407 111.16267458577006 ;
createNode joint -n "walk_angry:Shoulder_L" -p "walk_angry:Scapula_L";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.70947081409118673 3.5527136788005009e-015 8.8817841970012523e-016 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 0 -4.999999999999944 0 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_angry:Elbow_L" -p "walk_angry:Shoulder_L";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -1.5708746116017371 2.1394946134734028e-006 -6.6020715250303397e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -22.663344006292533 9.2417399593854324 -3.8365062113221096 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_angry:Wrist_L" -p "walk_angry:Elbow_L";
	setAttr ".t" -type "double3" -1.5441879947602484 4.8049725513976682e-006 -2.3068607202247904e-006 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 2.6205232789389603 -4.9948059572063999 -0.22831092408200465 ;
createNode joint -n "walk_angry:WristENd_L" -p "walk_angry:Wrist_L";
	setAttr ".t" -type "double3" -1 0 0 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -1.0887042116436452 -2.7683551143625258 3.2216285703639396 ;
createNode joint -n "walk_angry:Hip_R" -p "walk_angry:Root_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.35254912946042172 0.10286232435237826 -0.48790404193790671 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 0 0 179.49262008406379 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_angry:Knee_R" -p "walk_angry:Hip_R";
	setAttr ".t" -type "double3" 2.1069606749728766 -9.2153837449870935e-008 3.4932323700331835e-009 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 2.3559827166828309 -0.11134981366725165 2.7044078809298253 ;
createNode joint -n "walk_angry:Ankle_R" -p "walk_angry:Knee_R";
	setAttr ".t" -type "double3" 2.6880118218361586 -2.2204460492503131e-015 2.3425705819590803e-013 ;
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" -0.01912299287235154 4.8531412986198675e-020 -2.1993176213308536 ;
createNode joint -n "walk_angry:Toes_R" -p "walk_angry:Ankle_R";
	setAttr ".t" -type "double3" 0.64070561067942533 -0.94569566424534335 -0.0003156346291482981 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 0.99999999999999944 0.99999999999999933 0.99999999999999944 ;
	setAttr ".jo" -type "double3" 0.0074414175309780234 0.017646304569237537 -66.912523711885243 ;
createNode joint -n "walk_angry:MiddleToe2_R" -p "walk_angry:Toes_R";
	setAttr ".t" -type "double3" 0.5840372867607474 -1.0453593546344564e-010 -4.4408920985006262e-016 ;
	setAttr ".ro" 5;
createNode joint -n "walk_angry:Hip_L" -p "walk_angry:Root_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.35254912946042349 0.10286232435236956 0.48790404193790887 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 0 0 -0.5073799159362834 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_angry:Knee_L" -p "walk_angry:Hip_L";
	setAttr ".t" -type "double3" -2.1069606749728802 9.1904736265746578e-008 -7.6191639664102695e-009 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -1.3770994885831533 0.065097401003611985 2.7059151941015727 ;
createNode joint -n "walk_angry:Ankle_L" -p "walk_angry:Knee_L";
	setAttr ".t" -type "double3" -2.6880118218361604 2.2759572004815709e-015 -2.3325785747374539e-013 ;
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" -0.019122992872322851 -4.8531412986198669e-020 -2.1993176213308683 ;
createNode joint -n "walk_angry:Toes_L" -p "walk_angry:Ankle_L";
	setAttr ".t" -type "double3" -0.64070561067942533 0.94569566424534135 0.00031563463551187443 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1 ;
	setAttr ".jo" -type "double3" 0.0074414175305822028 0.017646304569392198 -66.912523713079963 ;
createNode joint -n "walk_angry:MiddleToe2_L" -p "walk_angry:Toes_L";
	setAttr ".t" -type "double3" -0.58403728676074662 8.8860363511855667e-011 1.1102230246251565e-016 ;
	setAttr ".ro" 5;
createNode transform -n "walk_cool:Group" -p "Group";
	setAttr ".v" no;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode joint -n "walk_cool:Root_M" -p "walk_cool:Group";
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" 89.999999999999972 0 89.999999999999972 ;
createNode joint -n "walk_cool:Spine1_M" -p "walk_cool:Root_M";
	setAttr ".t" -type "double3" 0.790664306481629 -5.5511151231257827e-017 1.1102230246251565e-016 ;
createNode joint -n "walk_cool:Spine2_M" -p "walk_cool:Spine1_M";
	setAttr ".t" -type "double3" 0.790664306481629 2.2204460492503131e-016 -2.2204460492503131e-016 ;
createNode joint -n "walk_cool:Chest_M" -p "walk_cool:Spine2_M";
	setAttr ".t" -type "double3" 0.68845511400517179 -6.106226635438361e-016 -3.8857805861880479e-016 ;
createNode joint -n "walk_cool:Scapula_R" -p "walk_cool:Chest_M";
	setAttr ".t" -type "double3" 0.71146805441475713 -1.1102230246251565e-016 -0.27601391079496795 ;
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 0.99999999999999967 0.99999999999999978 0.99999999999999967 ;
	setAttr ".jo" -type "double3" -138.99428182178374 89.999998181660999 131.00571810258651 ;
createNode joint -n "walk_cool:Shoulder_R" -p "walk_cool:Scapula_R";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 0.70947081409118673 -1.7763568394002505e-015 0 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 0 -4.9999999999999707 0 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_cool:Elbow_R" -p "walk_cool:Shoulder_R";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 1.5708746117179739 -6.4025101154108199e-007 3.0819210006249875e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -22.437790504454139 9.2565781855129838 -3.8002443944682045 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_cool:Wrist_R" -p "walk_cool:Elbow_R";
	setAttr ".t" -type "double3" 1.544187994768472 -1.491892237304171e-006 8.8467722436647023e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 4.9153865449787855 -4.9817091591942955 -0.42788023520528529 ;
createNode joint -n "walk_cool:WristENd_R" -p "walk_cool:Wrist_R";
	setAttr ".t" -type "double3" 1 0 2.2204460492503131e-016 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -1.924561730376031 -0.11648861672278395 5.7408703792188165 ;
createNode joint -n "walk_cool:Neck_M" -p "walk_cool:Chest_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 1.3193399122742271 -7.7715611723760958e-016 4.6629367034256575e-015 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 1 1 0.99999999999999978 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_cool:Head_M" -p "walk_cool:Neck_M";
	setAttr ".t" -type "double3" 0.78270576193444086 -3.5527136788005009e-015 3.7747582837255322e-015 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999978 0.99999999999999978 ;
	setAttr ".jo" -type "double3" 0.74260503053646509 0 0 ;
createNode joint -n "walk_cool:Hair_M" -p "walk_cool:Head_M";
	setAttr ".t" -type "double3" 1.6637195600180252 3.1801229238756606e-015 -2.2021511348050822e-015 ;
createNode joint -n "walk_cool:Scapula_L" -p "walk_cool:Chest_M";
	setAttr ".t" -type "double3" 0.71146805441476069 -7.7715611723760958e-016 0.2760139107949664 ;
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 1 1.0000000000000002 0.99999999999999967 ;
	setAttr ".jo" -type "double3" 21.162675565639997 90.000001471433407 111.16267439949191 ;
createNode joint -n "walk_cool:Shoulder_L" -p "walk_cool:Scapula_L";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.70947081409118673 3.5527136788005009e-015 8.8817841970012523e-016 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 0 -4.999999999999944 0 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_cool:Elbow_L" -p "walk_cool:Shoulder_L";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -1.5708746116017371 2.1394946134734028e-006 -6.6020715250303397e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -22.66334400629254 9.2417399593854324 -3.8365062113221096 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_cool:Wrist_L" -p "walk_cool:Elbow_L";
	setAttr ".t" -type "double3" -1.5441879947602484 4.8049725513976682e-006 -2.3068607202247904e-006 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 2.6205232789389603 -4.9948059572064007 -0.22831092408200465 ;
createNode joint -n "walk_cool:WristENd_L" -p "walk_cool:Wrist_L";
	setAttr ".t" -type "double3" -1 0 0 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -1.0887042116436452 -2.7683551143625262 3.2216285703639396 ;
createNode joint -n "walk_cool:Hip_R" -p "walk_cool:Root_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.35254912946042172 0.10286232435237826 -0.48790404193790671 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 0 0 179.49262008406379 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_cool:Knee_R" -p "walk_cool:Hip_R";
	setAttr ".t" -type "double3" 2.1069606749728766 -9.2153837449870935e-008 3.4932323700331835e-009 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 2.3559827166828313 -0.11134981366725165 2.7044078809298253 ;
createNode joint -n "walk_cool:Ankle_R" -p "walk_cool:Knee_R";
	setAttr ".t" -type "double3" 2.6880118218361586 -2.2204460492503131e-015 2.3425705819590803e-013 ;
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" -0.01912299287235154 0 -2.1993176213308532 ;
createNode joint -n "walk_cool:Toes_R" -p "walk_cool:Ankle_R";
	setAttr ".t" -type "double3" 0.64070561067942533 -0.94569566424534335 -0.0003156346291482981 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 0.99999999999999944 0.99999999999999933 0.99999999999999944 ;
	setAttr ".jo" -type "double3" 0.0074414175309780234 0.017646304569237537 -66.912523711885243 ;
createNode joint -n "walk_cool:MiddleToe2_R" -p "walk_cool:Toes_R";
	setAttr ".t" -type "double3" 0.5840372867607474 -1.0453593546344564e-010 -4.4408920985006262e-016 ;
	setAttr ".ro" 5;
createNode joint -n "walk_cool:Hip_L" -p "walk_cool:Root_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.35254912946042349 0.10286232435236956 0.48790404193790887 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 0 0 -0.5073799159362834 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_cool:Knee_L" -p "walk_cool:Hip_L";
	setAttr ".t" -type "double3" -2.1069606749728802 9.1904736265746578e-008 -7.6191639664102695e-009 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -1.3770994885831538 0.065097401003612013 2.7059151941015744 ;
createNode joint -n "walk_cool:Ankle_L" -p "walk_cool:Knee_L";
	setAttr ".t" -type "double3" -2.6880118218361604 2.2759572004815709e-015 -2.3325785747374539e-013 ;
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" -0.019122992872322851 -4.8531412986198669e-020 -2.1993176213308683 ;
createNode joint -n "walk_cool:Toes_L" -p "walk_cool:Ankle_L";
	setAttr ".t" -type "double3" -0.64070561067942533 0.94569566424534135 0.00031563463551187443 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1 ;
	setAttr ".jo" -type "double3" 0.0074414175305822028 0.017646304569392198 -66.912523713079963 ;
createNode joint -n "walk_cool:MiddleToe2_L" -p "walk_cool:Toes_L";
	setAttr ".t" -type "double3" -0.58403728676074662 8.8860363511855667e-011 1.1102230246251565e-016 ;
	setAttr ".ro" 5;
createNode transform -n "walk_cute:Group" -p "Group";
	setAttr ".v" no;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode joint -n "walk_cute:Root_M" -p "walk_cute:Group";
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" 89.999999999999972 0 89.999999999999972 ;
createNode joint -n "walk_cute:Spine1_M" -p "walk_cute:Root_M";
	setAttr ".t" -type "double3" 0.790664306481629 -5.5511151231257827e-017 1.1102230246251565e-016 ;
createNode joint -n "walk_cute:Spine2_M" -p "walk_cute:Spine1_M";
	setAttr ".t" -type "double3" 0.790664306481629 2.2204460492503131e-016 -2.2204460492503131e-016 ;
createNode joint -n "walk_cute:Chest_M" -p "walk_cute:Spine2_M";
	setAttr ".t" -type "double3" 0.68845511400517179 -6.106226635438361e-016 -3.8857805861880479e-016 ;
createNode joint -n "walk_cute:Scapula_R" -p "walk_cute:Chest_M";
	setAttr ".t" -type "double3" 0.71146805441475713 -1.1102230246251565e-016 -0.27601391079496795 ;
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 0.99999999999999967 0.99999999999999978 0.99999999999999967 ;
	setAttr ".jo" -type "double3" -138.99428182178374 89.999998181660999 131.00571810258651 ;
createNode joint -n "walk_cute:Shoulder_R" -p "walk_cute:Scapula_R";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 0.70947081409118673 -1.7763568394002505e-015 0 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 0 -4.9999999999999707 0 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_cute:Elbow_R" -p "walk_cute:Shoulder_R";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 1.5708746117179739 -6.4025101154108199e-007 3.0819210006249875e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -22.437790504454139 9.2565781855129838 -3.8002443944682045 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_cute:Wrist_R" -p "walk_cute:Elbow_R";
	setAttr ".t" -type "double3" 1.544187994768472 -1.491892237304171e-006 8.8467722436647023e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 4.9153865449787855 -4.9817091591942955 -0.42788023520528529 ;
createNode joint -n "walk_cute:WristENd_R" -p "walk_cute:Wrist_R";
	setAttr ".t" -type "double3" 1 0 2.2204460492503131e-016 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -1.924561730376031 -0.11648861672278395 5.7408703792188165 ;
createNode joint -n "walk_cute:Neck_M" -p "walk_cute:Chest_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 1.3193399122742271 -7.7715611723760958e-016 4.6629367034256575e-015 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 1 1 0.99999999999999978 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_cute:Head_M" -p "walk_cute:Neck_M";
	setAttr ".t" -type "double3" 0.78270576193444086 -3.5527136788005009e-015 3.7747582837255322e-015 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999978 0.99999999999999978 ;
	setAttr ".jo" -type "double3" 0.74260503053646509 0 0 ;
createNode joint -n "walk_cute:Hair_M" -p "walk_cute:Head_M";
	setAttr ".t" -type "double3" 1.6637195600180252 3.1801229238756606e-015 -2.2021511348050822e-015 ;
createNode joint -n "walk_cute:Scapula_L" -p "walk_cute:Chest_M";
	setAttr ".t" -type "double3" 0.71146805441476069 -7.7715611723760958e-016 0.2760139107949664 ;
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 1 1.0000000000000002 0.99999999999999967 ;
	setAttr ".jo" -type "double3" 21.162675565639997 90.000001471433407 111.16267439949191 ;
createNode joint -n "walk_cute:Shoulder_L" -p "walk_cute:Scapula_L";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.70947081409118673 3.5527136788005009e-015 8.8817841970012523e-016 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 0 -4.999999999999944 0 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_cute:Elbow_L" -p "walk_cute:Shoulder_L";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -1.5708746116017371 2.1394946134734028e-006 -6.6020715250303397e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -22.66334400629254 9.2417399593854324 -3.8365062113221096 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_cute:Wrist_L" -p "walk_cute:Elbow_L";
	setAttr ".t" -type "double3" -1.5441879947602484 4.8049725513976682e-006 -2.3068607202247904e-006 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 2.6205232789389603 -4.9948059572064007 -0.22831092408200465 ;
createNode joint -n "walk_cute:WristENd_L" -p "walk_cute:Wrist_L";
	setAttr ".t" -type "double3" -1 0 0 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -1.0887042116436452 -2.7683551143625262 3.2216285703639396 ;
createNode joint -n "walk_cute:Hip_R" -p "walk_cute:Root_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.35254912946042172 0.10286232435237826 -0.48790404193790671 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 0 0 179.49262008406379 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_cute:Knee_R" -p "walk_cute:Hip_R";
	setAttr ".t" -type "double3" 2.1069606749728766 -9.2153837449870935e-008 3.4932323700331835e-009 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 2.3559827166828313 -0.11134981366725165 2.7044078809298253 ;
createNode joint -n "walk_cute:Ankle_R" -p "walk_cute:Knee_R";
	setAttr ".t" -type "double3" 2.6880118218361586 -2.2204460492503131e-015 2.3425705819590803e-013 ;
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" -0.01912299287235154 0 -2.1993176213308532 ;
createNode joint -n "walk_cute:Toes_R" -p "walk_cute:Ankle_R";
	setAttr ".t" -type "double3" 0.64070561067942533 -0.94569566424534335 -0.0003156346291482981 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 0.99999999999999944 0.99999999999999933 0.99999999999999944 ;
	setAttr ".jo" -type "double3" 0.0074414175309780234 0.017646304569237537 -66.912523711885243 ;
createNode joint -n "walk_cute:MiddleToe2_R" -p "walk_cute:Toes_R";
	setAttr ".t" -type "double3" 0.5840372867607474 -1.0453593546344564e-010 -4.4408920985006262e-016 ;
	setAttr ".ro" 5;
createNode joint -n "walk_cute:Hip_L" -p "walk_cute:Root_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.35254912946042349 0.10286232435236956 0.48790404193790887 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 0 0 -0.5073799159362834 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_cute:Knee_L" -p "walk_cute:Hip_L";
	setAttr ".t" -type "double3" -2.1069606749728802 9.1904736265746578e-008 -7.6191639664102695e-009 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -1.3770994885831538 0.065097401003612013 2.7059151941015744 ;
createNode joint -n "walk_cute:Ankle_L" -p "walk_cute:Knee_L";
	setAttr ".t" -type "double3" -2.6880118218361604 2.2759572004815709e-015 -2.3325785747374539e-013 ;
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" -0.019122992872322851 -4.8531412986198669e-020 -2.1993176213308683 ;
createNode joint -n "walk_cute:Toes_L" -p "walk_cute:Ankle_L";
	setAttr ".t" -type "double3" -0.64070561067942533 0.94569566424534135 0.00031563463551187443 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1 ;
	setAttr ".jo" -type "double3" 0.0074414175305822028 0.017646304569392198 -66.912523713079963 ;
createNode joint -n "walk_cute:MiddleToe2_L" -p "walk_cute:Toes_L";
	setAttr ".t" -type "double3" -0.58403728676074662 8.8860363511855667e-011 1.1102230246251565e-016 ;
	setAttr ".ro" 5;
createNode transform -n "walk_female:Group" -p "Group";
	setAttr ".v" no;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode joint -n "walk_female:Root_M" -p "walk_female:Group";
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" 89.999999999999972 0 89.999999999999972 ;
createNode joint -n "walk_female:Spine1_M" -p "walk_female:Root_M";
	setAttr ".t" -type "double3" 0.790664306481629 -5.5511151231257827e-017 1.1102230246251565e-016 ;
createNode joint -n "walk_female:Spine2_M" -p "walk_female:Spine1_M";
	setAttr ".t" -type "double3" 0.790664306481629 2.2204460492503131e-016 -2.2204460492503131e-016 ;
createNode joint -n "walk_female:Chest_M" -p "walk_female:Spine2_M";
	setAttr ".t" -type "double3" 0.68845511400517179 -6.106226635438361e-016 -3.8857805861880479e-016 ;
createNode joint -n "walk_female:Scapula_R" -p "walk_female:Chest_M";
	setAttr ".t" -type "double3" 0.71146805441475713 -1.1102230246251565e-016 -0.27601391079496795 ;
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 0.99999999999999967 0.99999999999999978 0.99999999999999967 ;
	setAttr ".jo" -type "double3" -138.99428182178374 89.999998181660999 131.00571810258651 ;
createNode joint -n "walk_female:Shoulder_R" -p "walk_female:Scapula_R";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 0.70947081409118673 -1.7763568394002505e-015 0 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 0 -4.9999999999999707 0 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_female:Elbow_R" -p "walk_female:Shoulder_R";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 1.5708746117179739 -6.4025101154108199e-007 3.0819210006249875e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -22.437790504454139 9.2565781855129838 -3.8002443944682045 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_female:Wrist_R" -p "walk_female:Elbow_R";
	setAttr ".t" -type "double3" 1.544187994768472 -1.491892237304171e-006 8.8467722436647023e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 4.9153865449787855 -4.9817091591942955 -0.42788023520528529 ;
createNode joint -n "walk_female:WristENd_R" -p "walk_female:Wrist_R";
	setAttr ".t" -type "double3" 1 0 2.2204460492503131e-016 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -1.924561730376031 -0.11648861672278395 5.7408703792188165 ;
createNode joint -n "walk_female:Neck_M" -p "walk_female:Chest_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 1.3193399122742271 -7.7715611723760958e-016 4.6629367034256575e-015 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 1 1 0.99999999999999978 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_female:Head_M" -p "walk_female:Neck_M";
	setAttr ".t" -type "double3" 0.78270576193444086 -3.5527136788005009e-015 3.7747582837255322e-015 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999978 0.99999999999999978 ;
	setAttr ".jo" -type "double3" 0.74260503053646509 0 0 ;
createNode joint -n "walk_female:Hair_M" -p "walk_female:Head_M";
	setAttr ".t" -type "double3" 1.6637195600180252 3.1801229238756606e-015 -2.2021511348050822e-015 ;
createNode joint -n "walk_female:Scapula_L" -p "walk_female:Chest_M";
	setAttr ".t" -type "double3" 0.71146805441476069 -7.7715611723760958e-016 0.2760139107949664 ;
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 1 1.0000000000000002 0.99999999999999967 ;
	setAttr ".jo" -type "double3" 21.162675565639997 90.000001471433407 111.16267439949191 ;
createNode joint -n "walk_female:Shoulder_L" -p "walk_female:Scapula_L";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.70947081409118673 3.5527136788005009e-015 8.8817841970012523e-016 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 0 -4.999999999999944 0 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_female:Elbow_L" -p "walk_female:Shoulder_L";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -1.5708746116017371 2.1394946134734028e-006 -6.6020715250303397e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -22.66334400629254 9.2417399593854324 -3.8365062113221096 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_female:Wrist_L" -p "walk_female:Elbow_L";
	setAttr ".t" -type "double3" -1.5441879947602484 4.8049725513976682e-006 -2.3068607202247904e-006 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 2.6205232789389603 -4.9948059572064007 -0.22831092408200465 ;
createNode joint -n "walk_female:WristENd_L" -p "walk_female:Wrist_L";
	setAttr ".t" -type "double3" -1 0 0 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -1.0887042116436452 -2.7683551143625262 3.2216285703639396 ;
createNode joint -n "walk_female:Hip_R" -p "walk_female:Root_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.35254912946042172 0.10286232435237826 -0.48790404193790671 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 0 0 179.49262008406379 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_female:Knee_R" -p "walk_female:Hip_R";
	setAttr ".t" -type "double3" 2.1069606749728766 -9.2153837449870935e-008 3.4932323700331835e-009 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 2.3559827166828313 -0.11134981366725165 2.7044078809298253 ;
createNode joint -n "walk_female:Ankle_R" -p "walk_female:Knee_R";
	setAttr ".t" -type "double3" 2.6880118218361586 -2.2204460492503131e-015 2.3425705819590803e-013 ;
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" -0.01912299287235154 0 -2.1993176213308532 ;
createNode joint -n "walk_female:Toes_R" -p "walk_female:Ankle_R";
	setAttr ".t" -type "double3" 0.64070561067942533 -0.94569566424534335 -0.0003156346291482981 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 0.99999999999999944 0.99999999999999933 0.99999999999999944 ;
	setAttr ".jo" -type "double3" 0.0074414175309780234 0.017646304569237537 -66.912523711885243 ;
createNode joint -n "walk_female:MiddleToe2_R" -p "walk_female:Toes_R";
	setAttr ".t" -type "double3" 0.5840372867607474 -1.0453593546344564e-010 -4.4408920985006262e-016 ;
	setAttr ".ro" 5;
createNode joint -n "walk_female:Hip_L" -p "walk_female:Root_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.35254912946042349 0.10286232435236956 0.48790404193790887 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 0 0 -0.5073799159362834 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_female:Knee_L" -p "walk_female:Hip_L";
	setAttr ".t" -type "double3" -2.1069606749728802 9.1904736265746578e-008 -7.6191639664102695e-009 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -1.3770994885831538 0.065097401003612013 2.7059151941015744 ;
createNode joint -n "walk_female:Ankle_L" -p "walk_female:Knee_L";
	setAttr ".t" -type "double3" -2.6880118218361604 2.2759572004815709e-015 -2.3325785747374539e-013 ;
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" -0.019122992872322851 -4.8531412986198669e-020 -2.1993176213308683 ;
createNode joint -n "walk_female:Toes_L" -p "walk_female:Ankle_L";
	setAttr ".t" -type "double3" -0.64070561067942533 0.94569566424534135 0.00031563463551187443 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1 ;
	setAttr ".jo" -type "double3" 0.0074414175305822028 0.017646304569392198 -66.912523713079963 ;
createNode joint -n "walk_female:MiddleToe2_L" -p "walk_female:Toes_L";
	setAttr ".t" -type "double3" -0.58403728676074662 8.8860363511855667e-011 1.1102230246251565e-016 ;
	setAttr ".ro" 5;
createNode transform -n "walk_macho:Group" -p "Group";
	setAttr ".v" no;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode joint -n "walk_macho:Root_M" -p "walk_macho:Group";
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" 89.999999999999972 0 89.999999999999972 ;
createNode joint -n "walk_macho:Spine1_M" -p "walk_macho:Root_M";
	setAttr ".t" -type "double3" 0.790664306481629 -5.5511151231257827e-017 1.1102230246251565e-016 ;
createNode joint -n "walk_macho:Spine2_M" -p "walk_macho:Spine1_M";
	setAttr ".t" -type "double3" 0.790664306481629 2.2204460492503131e-016 -2.2204460492503131e-016 ;
createNode joint -n "walk_macho:Chest_M" -p "walk_macho:Spine2_M";
	setAttr ".t" -type "double3" 0.68845511400517179 -6.106226635438361e-016 -3.8857805861880479e-016 ;
createNode joint -n "walk_macho:Scapula_R" -p "walk_macho:Chest_M";
	setAttr ".t" -type "double3" 0.71146805441475713 -1.1102230246251565e-016 -0.27601391079496795 ;
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 0.99999999999999967 0.99999999999999978 0.99999999999999967 ;
	setAttr ".jo" -type "double3" -138.99428182178374 89.999998181660999 131.00571810258651 ;
createNode joint -n "walk_macho:Shoulder_R" -p "walk_macho:Scapula_R";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 0.70947081409118673 -1.7763568394002505e-015 0 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 0 -4.9999999999999698 0 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_macho:Elbow_R" -p "walk_macho:Shoulder_R";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 1.5708746117179739 -6.4025101154108199e-007 3.0819210006249875e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -22.437790504454139 9.2565781855129838 -3.8002443944682045 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_macho:Wrist_R" -p "walk_macho:Elbow_R";
	setAttr ".t" -type "double3" 1.544187994768472 -1.491892237304171e-006 8.8467722436647023e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 4.9153865449787846 -4.9817091591942946 -0.42788023520528523 ;
createNode joint -n "walk_macho:WristENd_R" -p "walk_macho:Wrist_R";
	setAttr ".t" -type "double3" 1 0 2.2204460492503131e-016 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -1.924561730376031 -0.11648861672278391 5.7408703792188165 ;
createNode joint -n "walk_macho:Neck_M" -p "walk_macho:Chest_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 1.3193399122742271 -7.7715611723760958e-016 4.6629367034256575e-015 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 1 1 0.99999999999999978 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_macho:Head_M" -p "walk_macho:Neck_M";
	setAttr ".t" -type "double3" 0.78270576193444086 -3.5527136788005009e-015 3.7747582837255322e-015 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999978 0.99999999999999978 ;
	setAttr ".jo" -type "double3" 0.74260503053646509 0 0 ;
createNode joint -n "walk_macho:Hair_M" -p "walk_macho:Head_M";
	setAttr ".t" -type "double3" 1.6637195600180252 3.1801229238756606e-015 -2.2021511348050822e-015 ;
createNode joint -n "walk_macho:Scapula_L" -p "walk_macho:Chest_M";
	setAttr ".t" -type "double3" 0.71146805441476069 -7.7715611723760958e-016 0.2760139107949664 ;
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 1 1.0000000000000002 0.99999999999999967 ;
	setAttr ".jo" -type "double3" 21.162675733280164 90.000001471433407 111.16267458577006 ;
createNode joint -n "walk_macho:Shoulder_L" -p "walk_macho:Scapula_L";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.70947081409118673 3.5527136788005009e-015 8.8817841970012523e-016 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 0 -4.999999999999944 0 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_macho:Elbow_L" -p "walk_macho:Shoulder_L";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -1.5708746116017371 2.1394946134734028e-006 -6.6020715250303397e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -22.663344006292533 9.2417399593854324 -3.8365062113221096 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_macho:Wrist_L" -p "walk_macho:Elbow_L";
	setAttr ".t" -type "double3" -1.5441879947602484 4.8049725513976682e-006 -2.3068607202247904e-006 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 2.6205232789389603 -4.9948059572063999 -0.22831092408200465 ;
createNode joint -n "walk_macho:WristENd_L" -p "walk_macho:Wrist_L";
	setAttr ".t" -type "double3" -1 0 0 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -1.0887042116436452 -2.7683551143625258 3.2216285703639396 ;
createNode joint -n "walk_macho:Hip_R" -p "walk_macho:Root_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.35254912946042172 0.10286232435237826 -0.48790404193790671 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 0 0 179.49262008406379 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_macho:Knee_R" -p "walk_macho:Hip_R";
	setAttr ".t" -type "double3" 2.1069606749728766 -9.2153837449870935e-008 3.4932323700331835e-009 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 2.3559827166828309 -0.11134981366725165 2.7044078809298253 ;
createNode joint -n "walk_macho:Ankle_R" -p "walk_macho:Knee_R";
	setAttr ".t" -type "double3" 2.6880118218361586 -2.2204460492503131e-015 2.3425705819590803e-013 ;
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" -0.01912299287235154 4.8531412986198675e-020 -2.1993176213308536 ;
createNode joint -n "walk_macho:Toes_R" -p "walk_macho:Ankle_R";
	setAttr ".t" -type "double3" 0.64070561067942533 -0.94569566424534335 -0.0003156346291482981 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 0.99999999999999944 0.99999999999999933 0.99999999999999944 ;
	setAttr ".jo" -type "double3" 0.0074414175309780234 0.017646304569237537 -66.912523711885243 ;
createNode joint -n "walk_macho:MiddleToe2_R" -p "walk_macho:Toes_R";
	setAttr ".t" -type "double3" 0.5840372867607474 -1.0453593546344564e-010 -4.4408920985006262e-016 ;
	setAttr ".ro" 5;
createNode joint -n "walk_macho:Hip_L" -p "walk_macho:Root_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.35254912946042349 0.10286232435236956 0.48790404193790887 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 0 0 -0.5073799159362834 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_macho:Knee_L" -p "walk_macho:Hip_L";
	setAttr ".t" -type "double3" -2.1069606749728802 9.1904736265746578e-008 -7.6191639664102695e-009 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -1.3770994885831533 0.065097401003611985 2.7059151941015727 ;
createNode joint -n "walk_macho:Ankle_L" -p "walk_macho:Knee_L";
	setAttr ".t" -type "double3" -2.6880118218361604 2.2759572004815709e-015 -2.3325785747374539e-013 ;
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" -0.019122992872322851 -4.8531412986198669e-020 -2.1993176213308683 ;
createNode joint -n "walk_macho:Toes_L" -p "walk_macho:Ankle_L";
	setAttr ".t" -type "double3" -0.64070561067942533 0.94569566424534135 0.00031563463551187443 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1 ;
	setAttr ".jo" -type "double3" 0.0074414175305822028 0.017646304569392198 -66.912523713079963 ;
createNode joint -n "walk_macho:MiddleToe2_L" -p "walk_macho:Toes_L";
	setAttr ".t" -type "double3" -0.58403728676074662 8.8860363511855667e-011 1.1102230246251565e-016 ;
	setAttr ".ro" 5;
createNode transform -n "walk_male:Group" -p "Group";
	setAttr ".v" no;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode joint -n "walk_male:Root_M" -p "walk_male:Group";
	setAttr ".ove" yes;
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" 89.999999999999972 0 89.999999999999972 ;
createNode joint -n "walk_male:Spine1_M" -p "walk_male:Root_M";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.790664306481629 -5.5511151231257827e-017 1.1102230246251565e-016 ;
createNode joint -n "walk_male:Spine2_M" -p "walk_male:Spine1_M";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.790664306481629 2.2204460492503131e-016 -2.2204460492503131e-016 ;
createNode joint -n "walk_male:Chest_M" -p "walk_male:Spine2_M";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.68845511400517179 -6.106226635438361e-016 -3.8857805861880479e-016 ;
createNode joint -n "walk_male:Scapula_R" -p "walk_male:Chest_M";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.71146805441475713 -1.1102230246251565e-016 -0.27601391079496795 ;
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 0.99999999999999967 0.99999999999999978 0.99999999999999967 ;
	setAttr ".jo" -type "double3" -138.99428182178374 89.999998181660999 131.00571810258651 ;
createNode joint -n "walk_male:Shoulder_R" -p "walk_male:Scapula_R";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.70947081409118673 -1.7763568394002505e-015 0 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 0 -4.9999999999999689 0 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_male:Elbow_R" -p "walk_male:Shoulder_R";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 1.5708746117179739 -6.4025101154108199e-007 3.0819210006249875e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -22.437790504454139 9.2565781855129838 -3.8002443944682045 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_male:Wrist_R" -p "walk_male:Elbow_R";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 1.544187994768472 -1.491892237304171e-006 8.8467722436647023e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 4.9153865449787837 -4.9817091591942937 -0.42788023520528518 ;
createNode joint -n "walk_male:WristENd_R" -p "walk_male:Wrist_R";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 1 0 2.2204460492503131e-016 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -1.924561730376031 -0.11648861672278385 5.7408703792188165 ;
createNode joint -n "walk_male:Neck_M" -p "walk_male:Chest_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 1.3193399122742271 -7.7715611723760958e-016 4.6629367034256575e-015 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 1 1 0.99999999999999978 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_male:Head_M" -p "walk_male:Neck_M";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.78270576193444086 -3.5527136788005009e-015 3.7747582837255322e-015 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999978 0.99999999999999978 ;
	setAttr ".jo" -type "double3" 0.74260503053646509 0 0 ;
createNode joint -n "walk_male:Hair_M" -p "walk_male:Head_M";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 1.6637195600180252 3.1801229238756606e-015 -2.2021511348050822e-015 ;
createNode joint -n "walk_male:Scapula_L" -p "walk_male:Chest_M";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.71146805441476069 -7.7715611723760958e-016 0.2760139107949664 ;
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 1 1.0000000000000002 0.99999999999999967 ;
	setAttr ".jo" -type "double3" 21.16267566993135 90.000001471433421 111.16267445163759 ;
createNode joint -n "walk_male:Shoulder_L" -p "walk_male:Scapula_L";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -0.70947081409118673 3.5527136788005009e-015 8.8817841970012523e-016 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 0 -4.999999999999944 0 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_male:Elbow_L" -p "walk_male:Shoulder_L";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -1.5708746116017371 2.1394946134734028e-006 -6.6020715250303397e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -22.66334400629253 9.2417399593854324 -3.8365062113221087 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_male:Wrist_L" -p "walk_male:Elbow_L";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -1.5441879947602484 4.8049725513976682e-006 -2.3068607202247904e-006 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 2.6205232789389603 -4.994805957206399 -0.22831092408200465 ;
createNode joint -n "walk_male:WristENd_L" -p "walk_male:Wrist_L";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -1 0 0 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -1.0887042116436452 -2.7683551143625253 3.2216285703639396 ;
createNode joint -n "walk_male:Hip_R" -p "walk_male:Root_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -0.35254912946042172 0.10286232435237826 -0.48790404193790671 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 0 0 179.49262008406379 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_male:Knee_R" -p "walk_male:Hip_R";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 2.1069606749728766 -9.2153837449870935e-008 3.4932323700331835e-009 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 2.35598271668283 -0.11134981366725165 2.7044078809298253 ;
createNode joint -n "walk_male:Ankle_R" -p "walk_male:Knee_R";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 2.6880118218361586 -2.2204460492503131e-015 2.3425705819590803e-013 ;
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" -0.01912299287235154 0 -2.1993176213308541 ;
createNode joint -n "walk_male:Toes_R" -p "walk_male:Ankle_R";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.64070561067942533 -0.94569566424534335 -0.0003156346291482981 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 0.99999999999999944 0.99999999999999933 0.99999999999999944 ;
	setAttr ".jo" -type "double3" 0.0074414175309780234 0.017646304569237537 -66.912523711885243 ;
createNode joint -n "walk_male:MiddleToe2_R" -p "walk_male:Toes_R";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.5840372867607474 -1.0453593546344564e-010 -4.4408920985006262e-016 ;
	setAttr ".ro" 5;
createNode joint -n "walk_male:Hip_L" -p "walk_male:Root_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -0.35254912946042349 0.10286232435236956 0.48790404193790887 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 0 0 -0.5073799159362834 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_male:Knee_L" -p "walk_male:Hip_L";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -2.1069606749728802 9.1904736265746578e-008 -7.6191639664102695e-009 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -1.3770994885831529 0.065097401003611957 2.7059151941015709 ;
createNode joint -n "walk_male:Ankle_L" -p "walk_male:Knee_L";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -2.6880118218361604 2.2759572004815709e-015 -2.3325785747374539e-013 ;
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" -0.019122992872322851 -4.8531412986198669e-020 -2.1993176213308683 ;
createNode joint -n "walk_male:Toes_L" -p "walk_male:Ankle_L";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -0.64070561067942533 0.94569566424534135 0.00031563463551187443 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1 ;
	setAttr ".jo" -type "double3" 0.0074414175305822028 0.017646304569392198 -66.912523713079963 ;
createNode joint -n "walk_male:MiddleToe2_L" -p "walk_male:Toes_L";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -0.58403728676074662 8.8860363511855667e-011 1.1102230246251565e-016 ;
	setAttr ".ro" 5;
createNode transform -n "walk_proud:Group" -p "Group";
	setAttr ".v" no;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode joint -n "walk_proud:Root_M" -p "walk_proud:Group";
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" 89.999999999999972 0 89.999999999999972 ;
createNode joint -n "walk_proud:Spine1_M" -p "walk_proud:Root_M";
	setAttr ".t" -type "double3" 0.790664306481629 -5.5511151231257827e-017 1.1102230246251565e-016 ;
createNode joint -n "walk_proud:Spine2_M" -p "walk_proud:Spine1_M";
	setAttr ".t" -type "double3" 0.790664306481629 2.2204460492503131e-016 -2.2204460492503131e-016 ;
createNode joint -n "walk_proud:Chest_M" -p "walk_proud:Spine2_M";
	setAttr ".t" -type "double3" 0.68845511400517179 -6.106226635438361e-016 -3.8857805861880479e-016 ;
createNode joint -n "walk_proud:Scapula_R" -p "walk_proud:Chest_M";
	setAttr ".t" -type "double3" 0.71146805441475713 -1.1102230246251565e-016 -0.27601391079496795 ;
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 0.99999999999999967 0.99999999999999978 0.99999999999999967 ;
	setAttr ".jo" -type "double3" -138.99428182178374 89.999998181660999 131.00571810258651 ;
createNode joint -n "walk_proud:Shoulder_R" -p "walk_proud:Scapula_R";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 0.70947081409118673 -1.7763568394002505e-015 0 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 0 -4.9999999999999707 0 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_proud:Elbow_R" -p "walk_proud:Shoulder_R";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 1.5708746117179739 -6.4025101154108199e-007 3.0819210006249875e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -22.437790504454139 9.2565781855129838 -3.8002443944682045 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_proud:Wrist_R" -p "walk_proud:Elbow_R";
	setAttr ".t" -type "double3" 1.544187994768472 -1.491892237304171e-006 8.8467722436647023e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 4.9153865449787855 -4.9817091591942955 -0.42788023520528529 ;
createNode joint -n "walk_proud:WristENd_R" -p "walk_proud:Wrist_R";
	setAttr ".t" -type "double3" 1 0 2.2204460492503131e-016 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -1.924561730376031 -0.11648861672278395 5.7408703792188165 ;
createNode joint -n "walk_proud:Neck_M" -p "walk_proud:Chest_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 1.3193399122742271 -7.7715611723760958e-016 4.6629367034256575e-015 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 1 1 0.99999999999999978 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_proud:Head_M" -p "walk_proud:Neck_M";
	setAttr ".t" -type "double3" 0.78270576193444086 -3.5527136788005009e-015 3.7747582837255322e-015 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999978 0.99999999999999978 ;
	setAttr ".jo" -type "double3" 0.74260503053646509 0 0 ;
createNode joint -n "walk_proud:Hair_M" -p "walk_proud:Head_M";
	setAttr ".t" -type "double3" 1.6637195600180252 3.1801229238756606e-015 -2.2021511348050822e-015 ;
createNode joint -n "walk_proud:Scapula_L" -p "walk_proud:Chest_M";
	setAttr ".t" -type "double3" 0.71146805441476069 -7.7715611723760958e-016 0.2760139107949664 ;
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 1 1.0000000000000002 0.99999999999999967 ;
	setAttr ".jo" -type "double3" 21.162675565639997 90.000001471433407 111.16267439949191 ;
createNode joint -n "walk_proud:Shoulder_L" -p "walk_proud:Scapula_L";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.70947081409118673 3.5527136788005009e-015 8.8817841970012523e-016 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 0 -4.999999999999944 0 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_proud:Elbow_L" -p "walk_proud:Shoulder_L";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -1.5708746116017371 2.1394946134734028e-006 -6.6020715250303397e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -22.66334400629254 9.2417399593854324 -3.8365062113221096 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_proud:Wrist_L" -p "walk_proud:Elbow_L";
	setAttr ".t" -type "double3" -1.5441879947602484 4.8049725513976682e-006 -2.3068607202247904e-006 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 2.6205232789389603 -4.9948059572064007 -0.22831092408200465 ;
createNode joint -n "walk_proud:WristENd_L" -p "walk_proud:Wrist_L";
	setAttr ".t" -type "double3" -1 0 0 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -1.0887042116436452 -2.7683551143625262 3.2216285703639396 ;
createNode joint -n "walk_proud:Hip_R" -p "walk_proud:Root_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.35254912946042172 0.10286232435237826 -0.48790404193790671 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 0 0 179.49262008406379 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_proud:Knee_R" -p "walk_proud:Hip_R";
	setAttr ".t" -type "double3" 2.1069606749728766 -9.2153837449870935e-008 3.4932323700331835e-009 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 2.3559827166828313 -0.11134981366725165 2.7044078809298253 ;
createNode joint -n "walk_proud:Ankle_R" -p "walk_proud:Knee_R";
	setAttr ".t" -type "double3" 2.6880118218361586 -2.2204460492503131e-015 2.3425705819590803e-013 ;
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" -0.01912299287235154 0 -2.1993176213308532 ;
createNode joint -n "walk_proud:Toes_R" -p "walk_proud:Ankle_R";
	setAttr ".t" -type "double3" 0.64070561067942533 -0.94569566424534335 -0.0003156346291482981 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 0.99999999999999944 0.99999999999999933 0.99999999999999944 ;
	setAttr ".jo" -type "double3" 0.0074414175309780234 0.017646304569237537 -66.912523711885243 ;
createNode joint -n "walk_proud:MiddleToe2_R" -p "walk_proud:Toes_R";
	setAttr ".t" -type "double3" 0.5840372867607474 -1.0453593546344564e-010 -4.4408920985006262e-016 ;
	setAttr ".ro" 5;
createNode joint -n "walk_proud:Hip_L" -p "walk_proud:Root_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.35254912946042349 0.10286232435236956 0.48790404193790887 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 0 0 -0.5073799159362834 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_proud:Knee_L" -p "walk_proud:Hip_L";
	setAttr ".t" -type "double3" -2.1069606749728802 9.1904736265746578e-008 -7.6191639664102695e-009 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -1.3770994885831538 0.065097401003612013 2.7059151941015744 ;
createNode joint -n "walk_proud:Ankle_L" -p "walk_proud:Knee_L";
	setAttr ".t" -type "double3" -2.6880118218361604 2.2759572004815709e-015 -2.3325785747374539e-013 ;
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" -0.019122992872322851 -4.8531412986198669e-020 -2.1993176213308683 ;
createNode joint -n "walk_proud:Toes_L" -p "walk_proud:Ankle_L";
	setAttr ".t" -type "double3" -0.64070561067942533 0.94569566424534135 0.00031563463551187443 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1 ;
	setAttr ".jo" -type "double3" 0.0074414175305822028 0.017646304569392198 -66.912523713079963 ;
createNode joint -n "walk_proud:MiddleToe2_L" -p "walk_proud:Toes_L";
	setAttr ".t" -type "double3" -0.58403728676074662 8.8860363511855667e-011 1.1102230246251565e-016 ;
	setAttr ".ro" 5;
createNode transform -n "walk_sad:Group" -p "Group";
	setAttr ".v" no;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode joint -n "walk_sad:Root_M" -p "walk_sad:Group";
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" 89.999999999999972 0 89.999999999999972 ;
createNode joint -n "walk_sad:Spine1_M" -p "walk_sad:Root_M";
	setAttr ".t" -type "double3" 0.790664306481629 -5.5511151231257827e-017 1.1102230246251565e-016 ;
createNode joint -n "walk_sad:Spine2_M" -p "walk_sad:Spine1_M";
	setAttr ".t" -type "double3" 0.790664306481629 2.2204460492503131e-016 -2.2204460492503131e-016 ;
createNode joint -n "walk_sad:Chest_M" -p "walk_sad:Spine2_M";
	setAttr ".t" -type "double3" 0.68845511400517179 -6.106226635438361e-016 -3.8857805861880479e-016 ;
createNode joint -n "walk_sad:Scapula_R" -p "walk_sad:Chest_M";
	setAttr ".t" -type "double3" 0.71146805441475713 -1.1102230246251565e-016 -0.27601391079496795 ;
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 0.99999999999999967 0.99999999999999978 0.99999999999999967 ;
	setAttr ".jo" -type "double3" -138.99428182178374 89.999998181660999 131.00571810258651 ;
createNode joint -n "walk_sad:Shoulder_R" -p "walk_sad:Scapula_R";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 0.70947081409118673 -1.7763568394002505e-015 0 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 0 -4.9999999999999707 0 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_sad:Elbow_R" -p "walk_sad:Shoulder_R";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 1.5708746117179739 -6.4025101154108199e-007 3.0819210006249875e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -22.437790504454139 9.2565781855129838 -3.8002443944682045 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_sad:Wrist_R" -p "walk_sad:Elbow_R";
	setAttr ".t" -type "double3" 1.544187994768472 -1.491892237304171e-006 8.8467722436647023e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 4.9153865449787855 -4.9817091591942955 -0.42788023520528529 ;
createNode joint -n "walk_sad:WristENd_R" -p "walk_sad:Wrist_R";
	setAttr ".t" -type "double3" 1 0 2.2204460492503131e-016 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -1.924561730376031 -0.11648861672278395 5.7408703792188165 ;
createNode joint -n "walk_sad:Neck_M" -p "walk_sad:Chest_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 1.3193399122742271 -7.7715611723760958e-016 4.6629367034256575e-015 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 1 1 0.99999999999999978 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_sad:Head_M" -p "walk_sad:Neck_M";
	setAttr ".t" -type "double3" 0.78270576193444086 -3.5527136788005009e-015 3.7747582837255322e-015 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999978 0.99999999999999978 ;
	setAttr ".jo" -type "double3" 0.74260503053646509 0 0 ;
createNode joint -n "walk_sad:Hair_M" -p "walk_sad:Head_M";
	setAttr ".t" -type "double3" 1.6637195600180252 3.1801229238756606e-015 -2.2021511348050822e-015 ;
createNode joint -n "walk_sad:Scapula_L" -p "walk_sad:Chest_M";
	setAttr ".t" -type "double3" 0.71146805441476069 -7.7715611723760958e-016 0.2760139107949664 ;
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 1 1.0000000000000002 0.99999999999999967 ;
	setAttr ".jo" -type "double3" 21.162675565639997 90.000001471433407 111.16267439949191 ;
createNode joint -n "walk_sad:Shoulder_L" -p "walk_sad:Scapula_L";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.70947081409118673 3.5527136788005009e-015 8.8817841970012523e-016 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 0 -4.999999999999944 0 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_sad:Elbow_L" -p "walk_sad:Shoulder_L";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -1.5708746116017371 2.1394946134734028e-006 -6.6020715250303397e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -22.66334400629254 9.2417399593854324 -3.8365062113221096 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_sad:Wrist_L" -p "walk_sad:Elbow_L";
	setAttr ".t" -type "double3" -1.5441879947602484 4.8049725513976682e-006 -2.3068607202247904e-006 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 2.6205232789389603 -4.9948059572064007 -0.22831092408200465 ;
createNode joint -n "walk_sad:WristENd_L" -p "walk_sad:Wrist_L";
	setAttr ".t" -type "double3" -1 0 0 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -1.0887042116436452 -2.7683551143625262 3.2216285703639396 ;
createNode joint -n "walk_sad:Hip_R" -p "walk_sad:Root_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.35254912946042172 0.10286232435237826 -0.48790404193790671 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 0 0 179.49262008406379 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_sad:Knee_R" -p "walk_sad:Hip_R";
	setAttr ".t" -type "double3" 2.1069606749728766 -9.2153837449870935e-008 3.4932323700331835e-009 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 2.3559827166828313 -0.11134981366725165 2.7044078809298253 ;
createNode joint -n "walk_sad:Ankle_R" -p "walk_sad:Knee_R";
	setAttr ".t" -type "double3" 2.6880118218361586 -2.2204460492503131e-015 2.3425705819590803e-013 ;
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" -0.01912299287235154 0 -2.1993176213308532 ;
createNode joint -n "walk_sad:Toes_R" -p "walk_sad:Ankle_R";
	setAttr ".t" -type "double3" 0.64070561067942533 -0.94569566424534335 -0.0003156346291482981 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 0.99999999999999944 0.99999999999999933 0.99999999999999944 ;
	setAttr ".jo" -type "double3" 0.0074414175309780234 0.017646304569237537 -66.912523711885243 ;
createNode joint -n "walk_sad:MiddleToe2_R" -p "walk_sad:Toes_R";
	setAttr ".t" -type "double3" 0.5840372867607474 -1.0453593546344564e-010 -4.4408920985006262e-016 ;
	setAttr ".ro" 5;
createNode joint -n "walk_sad:Hip_L" -p "walk_sad:Root_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.35254912946042349 0.10286232435236956 0.48790404193790887 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 0 0 -0.5073799159362834 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_sad:Knee_L" -p "walk_sad:Hip_L";
	setAttr ".t" -type "double3" -2.1069606749728802 9.1904736265746578e-008 -7.6191639664102695e-009 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -1.3770994885831538 0.065097401003612013 2.7059151941015744 ;
createNode joint -n "walk_sad:Ankle_L" -p "walk_sad:Knee_L";
	setAttr ".t" -type "double3" -2.6880118218361604 2.2759572004815709e-015 -2.3325785747374539e-013 ;
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" -0.019122992872322851 -4.8531412986198669e-020 -2.1993176213308683 ;
createNode joint -n "walk_sad:Toes_L" -p "walk_sad:Ankle_L";
	setAttr ".t" -type "double3" -0.64070561067942533 0.94569566424534135 0.00031563463551187443 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1 ;
	setAttr ".jo" -type "double3" 0.0074414175305822028 0.017646304569392198 -66.912523713079963 ;
createNode joint -n "walk_sad:MiddleToe2_L" -p "walk_sad:Toes_L";
	setAttr ".t" -type "double3" -0.58403728676074662 8.8860363511855667e-011 1.1102230246251565e-016 ;
	setAttr ".ro" 5;
createNode transform -n "walk_sneak:Group" -p "Group";
	setAttr ".v" no;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode joint -n "walk_sneak:Root_M" -p "walk_sneak:Group";
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" 89.999999999999972 0 89.999999999999972 ;
createNode joint -n "walk_sneak:Spine1_M" -p "walk_sneak:Root_M";
	setAttr ".t" -type "double3" 0.790664306481629 -5.5511151231257827e-017 1.1102230246251565e-016 ;
createNode joint -n "walk_sneak:Spine2_M" -p "walk_sneak:Spine1_M";
	setAttr ".t" -type "double3" 0.790664306481629 2.2204460492503131e-016 -2.2204460492503131e-016 ;
createNode joint -n "walk_sneak:Chest_M" -p "walk_sneak:Spine2_M";
	setAttr ".t" -type "double3" 0.68845511400517179 -6.106226635438361e-016 -3.8857805861880479e-016 ;
createNode joint -n "walk_sneak:Scapula_R" -p "walk_sneak:Chest_M";
	setAttr ".t" -type "double3" 0.71146805441475713 -1.1102230246251565e-016 -0.27601391079496795 ;
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 0.99999999999999967 0.99999999999999978 0.99999999999999967 ;
	setAttr ".jo" -type "double3" -138.99428182178374 89.999998181660999 131.00571810258651 ;
createNode joint -n "walk_sneak:Shoulder_R" -p "walk_sneak:Scapula_R";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 0.70947081409118673 -1.7763568394002505e-015 0 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 0 -4.9999999999999707 0 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_sneak:Elbow_R" -p "walk_sneak:Shoulder_R";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 1.5708746117179739 -6.4025101154108199e-007 3.0819210006249875e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -22.437790504454139 9.2565781855129838 -3.8002443944682045 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_sneak:Wrist_R" -p "walk_sneak:Elbow_R";
	setAttr ".t" -type "double3" 1.544187994768472 -1.491892237304171e-006 8.8467722436647023e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 4.9153865449787855 -4.9817091591942955 -0.42788023520528529 ;
createNode joint -n "walk_sneak:WristENd_R" -p "walk_sneak:Wrist_R";
	setAttr ".t" -type "double3" 1 0 2.2204460492503131e-016 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -1.924561730376031 -0.11648861672278395 5.7408703792188165 ;
createNode joint -n "walk_sneak:Neck_M" -p "walk_sneak:Chest_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" 1.3193399122742271 -7.7715611723760958e-016 4.6629367034256575e-015 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 1 1 0.99999999999999978 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_sneak:Head_M" -p "walk_sneak:Neck_M";
	setAttr ".t" -type "double3" 0.78270576193444086 -3.5527136788005009e-015 3.7747582837255322e-015 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999978 0.99999999999999978 ;
	setAttr ".jo" -type "double3" 0.74260503053646509 0 0 ;
createNode joint -n "walk_sneak:Hair_M" -p "walk_sneak:Head_M";
	setAttr ".t" -type "double3" 1.6637195600180252 3.1801229238756606e-015 -2.2021511348050822e-015 ;
createNode joint -n "walk_sneak:Scapula_L" -p "walk_sneak:Chest_M";
	setAttr ".t" -type "double3" 0.71146805441476069 -7.7715611723760958e-016 0.2760139107949664 ;
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 1 1.0000000000000002 0.99999999999999967 ;
	setAttr ".jo" -type "double3" 21.162675565639997 90.000001471433407 111.16267439949191 ;
createNode joint -n "walk_sneak:Shoulder_L" -p "walk_sneak:Scapula_L";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.70947081409118673 3.5527136788005009e-015 8.8817841970012523e-016 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 0 -4.999999999999944 0 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_sneak:Elbow_L" -p "walk_sneak:Shoulder_L";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -1.5708746116017371 2.1394946134734028e-006 -6.6020715250303397e-007 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -22.66334400629254 9.2417399593854324 -3.8365062113221096 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_sneak:Wrist_L" -p "walk_sneak:Elbow_L";
	setAttr ".t" -type "double3" -1.5441879947602484 4.8049725513976682e-006 -2.3068607202247904e-006 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" 2.6205232789389603 -4.9948059572064007 -0.22831092408200465 ;
createNode joint -n "walk_sneak:WristENd_L" -p "walk_sneak:Wrist_L";
	setAttr ".t" -type "double3" -1 0 0 ;
	setAttr ".ro" 5;
	setAttr ".jo" -type "double3" -1.0887042116436452 -2.7683551143625262 3.2216285703639396 ;
createNode joint -n "walk_sneak:Hip_R" -p "walk_sneak:Root_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.35254912946042172 0.10286232435237826 -0.48790404193790671 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 0 0 179.49262008406379 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_sneak:Knee_R" -p "walk_sneak:Hip_R";
	setAttr ".t" -type "double3" 2.1069606749728766 -9.2153837449870935e-008 3.4932323700331835e-009 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 2.3559827166828313 -0.11134981366725165 2.7044078809298253 ;
createNode joint -n "walk_sneak:Ankle_R" -p "walk_sneak:Knee_R";
	setAttr ".t" -type "double3" 2.6880118218361586 -2.2204460492503131e-015 2.3425705819590803e-013 ;
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" -0.01912299287235154 0 -2.1993176213308532 ;
createNode joint -n "walk_sneak:Toes_R" -p "walk_sneak:Ankle_R";
	setAttr ".t" -type "double3" 0.64070561067942533 -0.94569566424534335 -0.0003156346291482981 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 0.99999999999999944 0.99999999999999933 0.99999999999999944 ;
	setAttr ".jo" -type "double3" 0.0074414175309780234 0.017646304569237537 -66.912523711885243 ;
createNode joint -n "walk_sneak:MiddleToe2_R" -p "walk_sneak:Toes_R";
	setAttr ".t" -type "double3" 0.5840372867607474 -1.0453593546344564e-010 -4.4408920985006262e-016 ;
	setAttr ".ro" 5;
createNode joint -n "walk_sneak:Hip_L" -p "walk_sneak:Root_M";
	addAttr -ci true -k true -sn "twistAmount" -ln "twistAmount" -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "twistAddition" -ln "twistAddition" -at "double";
	setAttr ".t" -type "double3" -0.35254912946042349 0.10286232435236956 0.48790404193790887 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 0 0 -0.5073799159362834 ;
	setAttr -k on ".twistAmount" 0.25;
createNode joint -n "walk_sneak:Knee_L" -p "walk_sneak:Hip_L";
	setAttr ".t" -type "double3" -2.1069606749728802 9.1904736265746578e-008 -7.6191639664102695e-009 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -1.3770994885831538 0.065097401003612013 2.7059151941015744 ;
createNode joint -n "walk_sneak:Ankle_L" -p "walk_sneak:Knee_L";
	setAttr ".t" -type "double3" -2.6880118218361604 2.2759572004815709e-015 -2.3325785747374539e-013 ;
	setAttr ".ro" 3;
	setAttr ".jo" -type "double3" -0.019122992872322851 -4.8531412986198669e-020 -2.1993176213308683 ;
createNode joint -n "walk_sneak:Toes_L" -p "walk_sneak:Ankle_L";
	setAttr ".t" -type "double3" -0.64070561067942533 0.94569566424534135 0.00031563463551187443 ;
	setAttr ".ro" 5;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1 ;
	setAttr ".jo" -type "double3" 0.0074414175305822028 0.017646304569392198 -66.912523713079963 ;
createNode joint -n "walk_sneak:MiddleToe2_L" -p "walk_sneak:Toes_L";
	setAttr ".t" -type "double3" -0.58403728676074662 8.8860363511855667e-011 1.1102230246251565e-016 ;
	setAttr ".ro" 5;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode displayLayerManager -n "layerManager";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode animCurveTL -n "run_female:Root_M_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 0.011997635101785475 1.525 0.032586164728163808
		 3.0458333333333334 0.052482932545956394 4.5708333333333337 0.090290978668566169 6.0958333333333332 0.14929438401449066
		 7.6208333333333336 0.17580463809080088 9.1416666666666675 0.2030499794726594 10.666666666666666 0.23498248760628643
		 12.191666666666666 0.26635924761879787 13.7125 0.27872019264281706 15.2375 0.27814258568742994
		 16.7625 0.27375725669446094 18.2875 0.27007262385865427 19.808333333333334 0.24496327162269788
		 21.333333333333332 0.20640783924944728 22.858333333333334 0.17410801738653345 24.379166666666666 0.14073595330208377
		 25.904166666666665 0.096151256295081908 27.429166666666667 0.049865364173600192 28.954166666666666 0.030044060204058792
		 30.475 0.018877125190563494 32 0.010571372024953642;
createNode animCurveTL -n "run_female:Root_M_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 5.5147535071453015 1.525 5.6118783052675312
		 3.0458333333333334 5.7108317570732314 4.5708333333333337 6.0032701855634132 6.0958333333333332 6.2859804677688889
		 7.6208333333333336 6.3955539482280814 9.1416666666666675 6.4960211036258659 10.666666666666666 6.3883360910573384
		 12.191666666666666 6.2772455485191578 13.7125 5.9857048383244624 15.2375 5.6918333058863908
		 16.7625 5.6419624710428833 18.2875 5.5925010725306263 19.808333333333334 5.8471825546554914
		 21.333333333333332 6.0928149110753296 22.858333333333334 6.2567679768598916 24.379166666666666 6.4051614638062775
		 25.904166666666665 6.3089231203176812 27.429166666666667 6.2129213177695375 28.954166666666666 6.0048002814814705
		 30.475 5.7948517029225668 32 5.6507156295843082;
createNode animCurveTL -n "run_female:Root_M_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -0.37617006165153893 1.525 -0.46038023991838217
		 3.0458333333333334 -0.54794785480428199 4.5708333333333337 -0.56360658528944729 6.0958333333333332 -0.59279785933126694
		 7.6208333333333336 -0.64667337861225171 9.1416666666666675 -0.71169707993401143 10.666666666666666 -0.68837226309924815
		 12.191666666666666 -0.67221208697757606 13.7125 -0.64291449217209196 15.2375 -0.62319808560026269
		 16.7625 -0.66394854156960914 18.2875 -0.70827047758082229 19.808333333333334 -0.66191945219546577
		 21.333333333333332 -0.6363280957084958 22.858333333333334 -0.62356206919629653 24.379166666666666 -0.62498533512162757
		 25.904166666666665 -0.55689329126764897 27.429166666666667 -0.4921655035596102 28.954166666666666 -0.39019407237999998
		 30.475 -0.30022474126994542 32 -0.3361755931023182;
createNode animCurveTA -n "run_female:Root_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -1.4863452205877514 1.525 -2.4497447781865929
		 3.0458333333333334 -3.4190239069790844 4.5708333333333337 -2.6636958694822992 6.0958333333333332 -1.9240707902304131
		 7.6208333333333336 -1.9924765296737366 9.1416666666666675 -2.0592355509420885 10.666666666666666 -2.0853347330715266
		 12.191666666666666 -2.1190372953996013 13.7125 -0.13691612838763514 15.2375 1.8337425528028792
		 16.7625 2.8887021823460879 18.2875 3.9714371852913808 19.808333333333334 3.6019998155411184
		 21.333333333333332 3.2198749602349075 22.858333333333334 2.9309774527086958 24.379166666666666 2.6222421388030877
		 25.904166666666665 3.0171516208184395 27.429166666666667 3.4159587030719019 28.954166666666666 2.351210358666795
		 30.475 1.2878806680460055 32 -0.12395995841298175;
createNode animCurveTA -n "run_female:Root_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -3.5185334766140204 1.525 -2.5048194637683943
		 3.0458333333333334 -1.4472457548371507 4.5708333333333337 0.56525536358864226 6.0958333333333332 2.5896181004557368
		 7.6208333333333336 2.6592210494690458 9.1416666666666675 2.8298952566994835 10.666666666666666 3.105538793105159
		 12.191666666666666 3.378987693791121 13.7125 4.1423121602722075 15.2375 4.8870861717784706
		 16.7625 5.5842660546488974 18.2875 6.2731896259895423 19.808333333333334 4.3272637764265873
		 21.333333333333332 2.3234086620346601 22.858333333333334 1.5990253659890026 24.379166666666666 0.82126870688147302
		 25.904166666666665 1.1193335449797812 27.429166666666667 1.4168828802313866 28.954166666666666 1.0323302864491197
		 30.475 0.6349350281681666 32 -1.4660050121132102;
createNode animCurveTA -n "run_female:Root_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 10.85178633911076 1.525 11.4675959172323
		 3.0458333333333334 12.064608671717332 4.5708333333333337 12.74311334493602 6.0958333333333332 13.452814768240376
		 7.6208333333333336 14.332132066386466 9.1416666666666675 15.228129627877294 10.666666666666666 13.992406610682618
		 12.191666666666666 12.757324462083817 13.7125 11.730436406198775 15.2375 10.74233750018028
		 16.7625 10.917629857605601 18.2875 11.095661130771514 19.808333333333334 11.679686332726014
		 21.333333333333332 12.280958800030641 22.858333333333334 13.29889193533487 24.379166666666666 14.310190178101303
		 25.904166666666665 14.185751411400394 27.429166666666667 14.070478932110486 28.954166666666666 12.600817006365887
		 30.475 11.175810960761428 32 10.974994642307465;
createNode animCurveTA -n "run_female:Spine1_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -2.9207924919425761 1.525 -1.1211627269484359
		 3.0458333333333334 0.68513809198451514 4.5708333333333337 2.999353902617548 6.0958333333333332 5.336573418791315
		 7.6208333333333336 6.5896905750654629 9.1416666666666675 7.8795610487974193 10.666666666666666 7.3427577376408824
		 12.191666666666666 6.7783628290746751 13.7125 4.4124148082276644 15.2375 2.0496364773744893
		 16.7625 1.8548481268456891 18.2875 1.6501009404288451 19.808333333333334 -1.0124621273481942
		 21.333333333333332 -3.7237172625002692 22.858333333333334 -4.9844666971578073 24.379166666666666 -6.2435671763318457
		 25.904166666666665 -5.8547719662173057 27.429166666666667 -5.4895697334310558 28.954166666666666 -3.8435187127987738
		 30.475 -2.1806941968051934 32 -2.5920991006768532;
createNode animCurveTA -n "run_female:Spine1_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 5.5355250160303697 1.525 4.0000269135447093
		 3.0458333333333334 2.4474267022502278 4.5708333333333337 -0.46978382920186618 6.0958333333333332 -3.3430997691309314
		 7.6208333333333336 -3.7328690018930479 9.1416666666666675 -4.2111579565338504 10.666666666666666 -5.4998004050490232
		 12.191666666666666 -6.7702725236697674 13.7125 -8.1175603730712993 15.2375 -9.3749258579430013
		 16.7625 -10.630472934972126 18.2875 -11.89181793489875 19.808333333333334 -8.4173850381297335
		 21.333333333333332 -4.9880546295362418 22.858333333333334 -3.5251320364675363 24.379166666666666 -2.0565985669511604
		 25.904166666666665 -2.5534937294724176 27.429166666666667 -3.0483643503331685 28.954166666666666 -1.5967506242476599
		 30.475 -0.22083464167912395 32 2.6877558460290381;
createNode animCurveTA -n "run_female:Spine1_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -3.3317264457833073 1.525 -3.7737788577262639
		 3.0458333333333334 -4.2695770945127869 4.5708333333333337 -5.2693482664388984 6.0958333333333332 -6.3942458215472504
		 7.6208333333333336 -7.1722194309340805 9.1416666666666675 -7.9718829754598772 10.666666666666666 -6.5902255125720526
		 12.191666666666666 -5.2029404096923555 13.7125 -4.2850367191113046 15.2375 -3.3282328152558129
		 16.7625 -3.5166089385902817 18.2875 -3.7102582475398451 19.808333333333334 -5.5004658898546062
		 21.333333333333332 -7.4525909576013465 22.858333333333334 -9.4200447505412068 24.379166666666666 -11.398128664775808
		 25.904166666666665 -10.905901220360031 27.429166666666667 -10.439222650140913 28.954166666666666 -9.0396438912719059
		 30.475 -7.6445202578967422 32 -5.431091557999788;
createNode animCurveTA -n "run_female:Spine2_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 0.70084474417015463 1.525 -0.052461625069146631
		 3.0458333333333334 -0.79907635380878794 4.5708333333333337 -1.4006517415727111 6.0958333333333332 -1.9897963317115743
		 7.6208333333333336 -2.4585246100055929 9.1416666666666675 -2.9385073400344965 10.666666666666666 -2.6925628091670153
		 12.191666666666666 -2.4447149572143805 13.7125 -1.2123563763757812 15.2375 0.006234752952327163
		 16.7625 0.38278764692068712 18.2875 0.77547463097661407 19.808333333333334 1.6450376152163246
		 21.333333333333332 2.4887771861167511 22.858333333333334 2.8872920799809312 24.379166666666666 3.2731865633120032
		 25.904166666666665 3.2497397648641058 27.429166666666667 3.2281039162119525 28.954166666666666 2.2703447129974408
		 30.475 1.3409718750647917 32 1.0005031099002335;
createNode animCurveTA -n "run_female:Spine2_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -4.7972544764541123 1.525 -3.8751522079084153
		 3.0458333333333334 -2.9469650894314352 4.5708333333333337 -1.5901093934919901 6.0958333333333332 -0.24016374912940505
		 7.6208333333333336 -0.1245733897851975 9.1416666666666675 0.0069340071258907768 10.666666666666666 0.1955055216552177
		 12.191666666666666 0.38768728746134329 13.7125 0.71653947725295342 15.2375 1.0557479421677378
		 16.7625 1.4011557374317809 18.2875 1.7543048677644111 19.808333333333334 0.15156913814378029
		 21.333333333333332 -1.4601238238516536 22.858333333333334 -2.2046682999740335 24.379166666666666 -2.948792751126756
		 25.904166666666665 -2.5336686427141388 27.429166666666667 -2.1275327885641291 28.954166666666666 -2.40585916720166
		 30.475 -2.6918413900552278 32 -3.7582758123107003;
createNode animCurveTA -n "run_female:Spine2_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 7.9264961457476657 1.525 8.2587798085051158
		 3.0458333333333334 8.5794347128226196 4.5708333333333337 9.0787304952425512 6.0958333333333332 9.5621728408136057
		 7.6208333333333336 9.9660021417081985 9.1416666666666675 10.378868843249345 10.666666666666666 9.6685420254439851
		 12.191666666666666 8.9598322355257469 13.7125 8.448714114129185 15.2375 7.9486057244797195
		 16.7625 8.0101997003571661 18.2875 8.0713870968246315 19.808333333333334 8.93646895230094
		 21.333333333333332 9.7774505101956901 22.858333333333334 10.634127749521033 24.379166666666666 11.477265245133369
		 25.904166666666665 11.290357439886472 27.429166666666667 11.111199226895558 28.954166666666666 10.427165408789905
		 30.475 9.762649954032657 32 8.8271648189588987;
createNode animCurveTA -n "run_female:Chest_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -1.3594726027668735 1.525 -0.50544407197507124
		 3.0458333333333334 0.3512102503142705 4.5708333333333337 1.1327956924894411 6.0958333333333332 1.9223390730657997
		 7.6208333333333336 2.3999561730802772 9.1416666666666675 2.8917556888158571 10.666666666666666 2.6871513348225906
		 12.191666666666666 2.4752449433496744 13.7125 1.3045293321070239 15.2375 0.1398342134974068
		 16.7625 -0.18388215481182485 18.2875 -0.52179187456234344 19.808333333333334 -1.6015592562453982
		 21.333333333333332 -2.7009798582791098 22.858333333333334 -3.2457797112101336 24.379166666666666 -3.7971844276542988
		 25.904166666666665 -3.6846731709353495 27.429166666666667 -3.5786688375153628 28.954166666666666 -2.6697398132954033
		 30.475 -1.7794657450946036 32 -1.5680450724832606;
createNode animCurveTA -n "run_female:Chest_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 4.6539860738276744 1.525 3.8424552130647358
		 3.0458333333333334 3.0330396774292021 4.5708333333333337 1.7907990627858745 6.0958333333333332 0.56716671112911887
		 7.6208333333333336 0.54793999985282793 9.1416666666666675 0.52235446001509478 10.666666666666666 0.25953004571685484
		 12.191666666666666 -0.0019758947018742113 13.7125 -0.53048282571636007 15.2375 -1.0464660301112982
		 16.7625 -1.440808472110336 18.2875 -1.845693896625517 19.808333333333334 -0.40517447345597551
		 21.333333333333332 1.0149400785705145 22.858333333333334 1.6311540138511458 24.379166666666666 2.2334642083147451
		 25.904166666666665 1.8442541272877242 27.429166666666667 1.462248431981751 28.954166666666666 1.95316261377495
		 30.475 2.4245173489791281 32 3.5592985185985748;
createNode animCurveTA -n "run_female:Chest_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -8.0110999521776556 1.525 -8.2739599204724072
		 3.0458333333333334 -8.5495817780560781 4.5708333333333337 -9.0415874098840376 6.0958333333333332 -9.5484866355307041
		 7.6208333333333336 -9.9518514643799119 9.1416666666666675 -10.365862016395418 10.666666666666666 -9.6670496183760068
		 12.191666666666666 -8.9681471929062706 13.7125 -8.4623347524966697 15.2375 -7.9498253027995593
		 16.7625 -8.003206803178605 18.2875 -8.0511089540103882 19.808333333333334 -8.928629717862524
		 21.333333333333332 -9.833096869859526 22.858333333333334 -10.735913556212324 24.379166666666666 -11.635581957049055
		 25.904166666666665 -11.421568816049096 27.429166666666667 -11.21683869809354 28.954166666666666 -10.520361901680852
		 30.475 -9.8318160311731191 32 -8.9087144127919959;
createNode animCurveTA -n "run_female:Scapula_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -2.1817433459952025e-006 1.525 -2.1817433459952025e-006
		 3.0458333333333334 -2.1817433459952025e-006 4.5708333333333337 -2.1817433459952025e-006
		 6.0958333333333332 -2.1817433459952025e-006 7.6208333333333336 -2.1817433459952025e-006
		 9.1416666666666675 -2.1817433459952025e-006 10.666666666666666 -2.1817433459952025e-006
		 12.191666666666666 -2.1817433459952025e-006 13.7125 -2.1817433459952025e-006 15.2375 -2.1817433459952025e-006
		 16.7625 -2.1817433459952025e-006 18.2875 -2.1817433459952025e-006 19.808333333333334 -2.1817433459952025e-006
		 21.333333333333332 -2.1817433459952025e-006 22.858333333333334 -2.1817433459952025e-006
		 24.379166666666666 -2.1817433459952025e-006 25.904166666666665 -2.1817433459952025e-006
		 27.429166666666667 -2.1817433459952025e-006 28.954166666666666 -2.1817433459952025e-006
		 30.475 -2.1817433459952025e-006 32 -2.1817433459952025e-006;
createNode animCurveTA -n "run_female:Scapula_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 2.4203839476090244e-006 1.525 2.4203839476090244e-006
		 3.0458333333333334 2.4203839476090244e-006 4.5708333333333337 2.4203839476090244e-006
		 6.0958333333333332 2.4203839476090244e-006 7.6208333333333336 2.4203839476090244e-006
		 9.1416666666666675 2.4203839476090244e-006 10.666666666666666 2.4203839476090244e-006
		 12.191666666666666 2.4203839476090244e-006 13.7125 2.4203839476090244e-006 15.2375 2.4203839476090244e-006
		 16.7625 2.4203839476090244e-006 18.2875 2.4203839476090244e-006 19.808333333333334 2.4203839476090244e-006
		 21.333333333333332 2.4203839476090244e-006 22.858333333333334 2.4203839476090244e-006
		 24.379166666666666 2.4203839476090244e-006 25.904166666666665 2.4203839476090244e-006
		 27.429166666666667 2.4203839476090244e-006 28.954166666666666 2.4203839476090244e-006
		 30.475 2.4203839476090244e-006 32 2.4203839476090244e-006;
createNode animCurveTA -n "run_female:Scapula_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -8.1415927139264375e-006 1.525 -8.1415927139264375e-006
		 3.0458333333333334 -8.1415927139264375e-006 4.5708333333333337 -8.1415927139264375e-006
		 6.0958333333333332 -8.1415927139264375e-006 7.6208333333333336 -8.1415927139264375e-006
		 9.1416666666666675 -8.1415927139264375e-006 10.666666666666666 -8.1415927139264375e-006
		 12.191666666666666 -8.1415927139264375e-006 13.7125 -8.1415927139264375e-006 15.2375 -8.1415927139264375e-006
		 16.7625 -8.1415927139264375e-006 18.2875 -8.1415927139264375e-006 19.808333333333334 -8.1415927139264375e-006
		 21.333333333333332 -8.1415927139264375e-006 22.858333333333334 -8.1415927139264375e-006
		 24.379166666666666 -8.1415927139264375e-006 25.904166666666665 -8.1415927139264375e-006
		 27.429166666666667 -8.1415927139264375e-006 28.954166666666666 -8.1415927139264375e-006
		 30.475 -8.1415927139264375e-006 32 -8.1415927139264375e-006;
createNode animCurveTA -n "run_female:Shoulder_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -1.4820698613796794 1.525 9.3671738359213421
		 3.0458333333333334 21.131872730130524 4.5708333333333337 25.877425104522715 6.0958333333333332 30.739787792586377
		 7.6208333333333336 32.00744873018008 9.1416666666666675 33.405243489048196 10.666666666666666 32.289551324760616
		 12.191666666666666 30.989760333820115 13.7125 24.937121910600112 15.2375 19.033481599104839
		 16.7625 6.6821178587376693 18.2875 -5.0150407415247837 19.808333333333334 -13.778204618290401
		 21.333333333333332 -21.174064185785731 22.858333333333334 -24.739924941128951 24.379166666666666 -27.98342997574197
		 25.904166666666665 -29.114340124037327 27.429166666666667 -30.193635310921874 28.954166666666666 -26.588321010129487
		 30.475 -22.792488106546116 32 -12.065397663096466;
createNode animCurveTA -n "run_female:Shoulder_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 1.5285470543659849 1.525 12.273266894638979
		 3.0458333333333334 22.783120938136392 4.5708333333333337 27.685755395957386 6.0958333333333332 32.56168942549094
		 7.6208333333333336 34.756504113067777 9.1416666666666675 37.029973071477293 10.666666666666666 35.798558646745711
		 12.191666666666666 34.552805830745605 13.7125 28.984988190048739 15.2375 23.370447272969532
		 16.7625 11.511179592323847 18.2875 -0.95792529749196142 19.808333333333334 -10.319149070876948
		 21.333333333333332 -20.033541589346235 22.858333333333334 -25.682353294815833 24.379166666666666 -31.371936000258774
		 25.904166666666665 -31.232861191340085 27.429166666666667 -31.054200003761967 28.954166666666666 -26.463504711590897
		 30.475 -21.991007915285845 32 -10.016342270271378;
createNode animCurveTA -n "run_female:Shoulder_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -77.979180693765798 1.525 -80.360654237955785
		 3.0458333333333334 -83.582252237895418 4.5708333333333337 -83.448858088536383 6.0958333333333332 -83.708404458799819
		 7.6208333333333336 -83.540584663734634 9.1416666666666675 -83.512690729881911 10.666666666666666 -85.361542170764082
		 12.191666666666666 -87.052093526449795 13.7125 -86.79856178297365 15.2375 -87.0687114366267
		 16.7625 -84.030988356807086 18.2875 -82.86473585096023 19.808333333333334 -77.252145063948646
		 21.333333333333332 -71.842045795042779 22.858333333333334 -68.791985731755616 24.379166666666666 -65.804957664200174
		 25.904166666666665 -68.817652354771852 27.429166666666667 -71.768768832925545 28.954166666666666 -73.976395520332218
		 30.475 -76.021331838597206 32 -76.589837340393927;
createNode animCurveTA -n "run_female:Elbow_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 0.38938783999361015 1.525 4.5892952189077434
		 3.0458333333333334 8.3204169454975361 4.5708333333333337 6.519144340069027 6.0958333333333332 2.8378969835453294
		 7.6208333333333336 4.6999036452298695 9.1416666666666675 5.748442611838632 10.666666666666666 8.1432614449962504
		 12.191666666666666 7.8487083054066877 13.7125 3.028480086414016 15.2375 -0.85807818319916518
		 16.7625 -1.1683678522373615 18.2875 -0.10123778430584207 19.808333333333334 -3.6826837043014393
		 21.333333333333332 -4.0810977440966791 22.858333333333334 -2.4610251053537491 24.379166666666666 -0.042458738819699735
		 25.904166666666665 -8.1700749001647246 27.429166666666667 -12.198229735483464 28.954166666666666 -7.8801748191988308
		 30.475 -3.8503055216698332 32 -2.0937083941987296;
createNode animCurveTA -n "run_female:Elbow_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 67.523031179407923 1.525 70.192528336136746
		 3.0458333333333334 72.949369146575862 4.5708333333333337 76.28064153014688 6.0958333333333332 79.512349039886999
		 7.6208333333333336 78.239824876042192 9.1416666666666675 76.938196393790889 10.666666666666666 71.662120464498386
		 12.191666666666666 66.321825407860274 13.7125 62.14210745856861 15.2375 57.932359410876536
		 16.7625 62.892221526154806 18.2875 67.816754189917361 19.808333333333334 74.117669369496809
		 21.333333333333332 80.427411738622951 22.858333333333334 81.437059789176317 24.379166666666666 82.407297329328429
		 25.904166666666665 79.564007839660519 27.429166666666667 76.599441050556564 28.954166666666666 73.910827210439237
		 30.475 71.319729010910038 32 69.371009092716648;
createNode animCurveTA -n "run_female:Elbow_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 11.102312331528958 1.525 12.189759734238329
		 3.0458333333333334 13.870814895462511 4.5708333333333337 16.608225895713559 6.0958333333333332 21.077000797751374
		 7.6208333333333336 16.894195119600962 9.1416666666666675 13.48272563437839 10.666666666666666 7.7828179793300878
		 12.191666666666666 4.7016041591594471 13.7125 9.5354228648373827 15.2375 13.178623504686849
		 16.7625 10.122555082568191 18.2875 5.586439449233513 19.808333333333334 3.3637795045569061
		 21.333333333333332 -1.1520716988264728 22.858333333333334 -4.5517426234569003 24.379166666666666 -8.6671252231040583
		 25.904166666666665 0.51292737954868584 27.429166666666667 5.5909025185772494 28.954166666666666 4.6549995489821505
		 30.475 4.0739365075915748 32 7.8621549871759422;
createNode animCurveTA -n "run_female:Wrist_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -13.338333068534551 1.525 -13.06492974398914
		 3.0458333333333334 -12.803502566987934 4.5708333333333337 -12.863527408159792 6.0958333333333332 -12.927467821566719
		 7.6208333333333336 -12.872781638591777 9.1416666666666675 -12.816855139533967 10.666666666666666 -12.156828897895759
		 12.191666666666666 -11.474451993022305 13.7125 -12.838035775096309 15.2375 -14.179742017174258
		 16.7625 -13.031535128301018 18.2875 -11.92987981923144 19.808333333333334 -12.602784835688931
		 21.333333333333332 -13.274062130897933 22.858333333333334 -13.305878321422991 24.379166666666666 -13.343013610220115
		 25.904166666666665 -13.733769622293108 27.429166666666667 -14.13890759367267 28.954166666666666 -13.371192914149752
		 30.475 -12.625185353379591 32 -12.970012645701818;
createNode animCurveTA -n "run_female:Wrist_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 26.408100646919806 1.525 27.658219760851203
		 3.0458333333333334 28.901225410746498 4.5708333333333337 27.716756219057597 6.0958333333333332 26.542305622835009
		 7.6208333333333336 25.370707520431406 9.1416666666666675 24.171089938718694 10.666666666666666 25.304677339728439
		 12.191666666666666 26.420022247011779 13.7125 26.826690459035976 15.2375 27.212853466242002
		 16.7625 25.415617953256223 18.2875 23.569100820140168 19.808333333333334 23.225568654145135
		 21.333333333333332 22.889806877552264 22.858333333333334 22.718618445233712 24.379166666666666 22.55943605272736
		 25.904166666666665 23.900422006167048 27.429166666666667 25.225720850510058 28.954166666666666 24.943021897961533
		 30.475 24.68151647549368 32 25.548254351735711;
createNode animCurveTA -n "run_female:Wrist_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -3.5190793223485923 1.525 -2.9470084583465916
		 3.0458333333333334 -2.3813477025481653 4.5708333333333337 -2.6852999122779733 6.0958333333333332 -2.9816853923356241
		 7.6208333333333336 -2.9145184429142632 9.1416666666666675 -2.8473850054933929 10.666666666666666 -3.9629218894069029
		 12.191666666666666 -5.1011685829164088 13.7125 -4.8915337408224664 15.2375 -4.6825112534616018
		 16.7625 -5.7135364770557544 18.2875 -6.6924819071574628 19.808333333333334 -7.1677897984165675
		 21.333333333333332 -7.6454817301923468 22.858333333333334 -7.6271224460268732 24.379166666666666 -7.6069125611920425
		 25.904166666666665 -7.1176204545896509 27.429166666666667 -6.613314353876258 28.954166666666666 -6.0400985789594559
		 30.475 -5.4744482956997702 32 -4.4863714701685087;
createNode animCurveTA -n "run_female:Neck_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 0.86318169041593917 1.525 0.49145822406066847
		 3.0458333333333334 0.11872710117254642 4.5708333333333337 -0.2549616187665118 6.0958333333333332 -0.62951586485532007
		 7.6208333333333336 -0.98850931927614794 9.1416666666666675 -1.3572739238708653 10.666666666666666 -1.6351696073092012
		 12.191666666666666 -1.911745439099082 13.7125 -1.7109834472688139 15.2375 -1.5118855311714103
		 16.7625 -1.3188595765712254 18.2875 -1.1208902322621466 19.808333333333334 -0.913127474804037
		 21.333333333333332 -0.70514293486077284 22.858333333333334 -0.50105224197334441 24.379166666666666 -0.29692174727905846
		 25.904166666666665 -0.09260088544133914 27.429166666666667 0.11057084889576771 28.954166666666666 0.31910870143919967
		 30.475 0.5215182370686805 32 0.69719906106816198;
createNode animCurveTA -n "run_female:Neck_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -0.85960434187411172 1.525 -0.62312794813457517
		 3.0458333333333334 -0.38660515449389965 4.5708333333333337 -0.1495733064722958 6.0958333333333332 0.087445938703866036
		 7.6208333333333336 0.32088155845594479 9.1416666666666675 0.55996083120071882 10.666666666666666 0.7365318151968141
		 12.191666666666666 0.91180018378748062 13.7125 0.78423401027066686 15.2375 0.65783665737775987
		 16.7625 0.5275078242458735 18.2875 0.3940699967029474 19.808333333333334 0.27230845591144431
		 21.333333333333332 0.15052234447326329 22.858333333333334 0.025343069054141718 24.379166666666666 -0.099957189383995448
		 25.904166666666665 -0.23957492620789264 27.429166666666667 -0.37906466746528045 28.954166666666666 -0.51498931833034134
		 30.475 -0.64754218202140601 32 -0.75924874339162873;
createNode animCurveTA -n "run_female:Neck_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 10.548467980945558 1.525 10.79730995171264
		 3.0458333333333334 11.045698734191175 4.5708333333333337 11.290138835007625 6.0958333333333332 11.534057673232137
		 7.6208333333333336 11.768816661941578 9.1416666666666675 12.008872844074361 10.666666666666666 12.244359241821906
		 12.191666666666666 12.479125681329688 13.7125 12.599785444619739 15.2375 12.720589928704506
		 16.7625 12.822068340358879 18.2875 12.925993045156625 19.808333333333334 13.035412636500128
		 21.333333333333332 13.144234814330531 22.858333333333334 13.152386169516227 24.379166666666666 13.156928456070489
		 25.904166666666665 12.694098683693223 27.429166666666667 12.234712566964518 28.954166666666666 11.777074756074029
		 30.475 11.330412584489574 32 10.932245418274723;
createNode animCurveTA -n "run_female:Head_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 1.4528842838689753 1.525 0.45262041282833598
		 3.0458333333333334 -0.54966877958545579 4.5708333333333337 -1.5536674879447983 6.0958333333333332 -2.5593800988187705
		 7.6208333333333336 -3.5199456248782641 9.1416666666666675 -4.5061557507776087 10.666666666666666 -5.2501815978601059
		 12.191666666666666 -5.9902799733624894 13.7125 -5.4521753673007565 15.2375 -4.918834536786445
		 16.7625 -4.4055138918730803 18.2875 -3.8792796913378678 19.808333333333334 -3.3193093538311622
		 21.333333333333332 -2.7589700131112664 22.858333333333334 -2.2116350069433759 24.379166666666666 -1.6642797098750526
		 25.904166666666665 -1.1202945307968202 27.429166666666667 -0.57843860230971722 28.954166666666666 -0.018123801937984664
		 30.475 0.52649245414118873 32 1.0014231271204939;
createNode animCurveTA -n "run_female:Head_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -1.229642537943552 1.525 -0.82218164995951826
		 3.0458333333333334 -0.41749071295640761 4.5708333333333337 -0.015179908115822023
		 6.0958333333333332 0.38418841974713536 7.6208333333333336 0.76959579521377519 9.1416666666666675 1.1615558536747301
		 10.666666666666666 1.4496446410712629 12.191666666666666 1.7334624837528063 13.7125 1.5177028991342796
		 15.2375 1.3045216228275887 16.7625 1.0916794212240881 18.2875 0.87422127578125997
		 19.808333333333334 0.66382956816023064 21.333333333333332 0.45405039268090169 22.858333333333334 0.24479077257556359
		 24.379166666666666 0.035438816406643002 25.904166666666665 -0.18502626978776446 27.429166666666667 -0.4081839792767411
		 28.954166666666666 -0.63386021233840617 30.475 -0.85674145375521404 32 -1.0497596367057724;
createNode animCurveTA -n "run_female:Head_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -14.45924107772438 1.525 -14.210037291865291
		 3.0458333333333334 -13.956363563056133 4.5708333333333337 -13.701812269414974 6.0958333333333332 -13.442859262484399
		 7.6208333333333336 -13.189074514360158 9.1416666666666675 -12.924860179819381 10.666666666666666 -12.668361376109189
		 12.191666666666666 -12.410193650680782 13.7125 -12.307093452800284 15.2375 -12.202250444249323
		 16.7625 -12.115010338165813 18.2875 -12.024246270101143 19.808333333333334 -11.927129258153325
		 21.333333333333332 -11.829118397434518 22.858333333333334 -11.830186410476299 24.379166666666666 -11.833519114509739
		 25.904166666666665 -12.302679303851418 27.429166666666667 -12.766981929421743 28.954166666666666 -13.228268231330061
		 30.475 -13.677080412559796 32 -14.075830881641384;
createNode animCurveTA -n "run_female:Scapula_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -2.1307251692906871e-005 1.525 -2.1307251692906871e-005
		 3.0458333333333334 -2.1307251692906871e-005 4.5708333333333337 -2.1307251692906871e-005
		 6.0958333333333332 -2.1307251692906871e-005 7.6208333333333336 -2.1307251692906871e-005
		 9.1416666666666675 -2.1307251692906871e-005 10.666666666666666 -2.1307251692906871e-005
		 12.191666666666666 -2.1307251692906871e-005 13.7125 -2.1307251692906871e-005 15.2375 -2.1307251692906871e-005
		 16.7625 -2.1307251692906871e-005 18.2875 -2.1307251692906871e-005 19.808333333333334 -2.1307251692906871e-005
		 21.333333333333332 -2.1307251692906871e-005 22.858333333333334 -2.1307251692906871e-005
		 24.379166666666666 -2.1307251692906871e-005 25.904166666666665 -2.1307251692906871e-005
		 27.429166666666667 -2.1307251692906871e-005 28.954166666666666 -2.1307251692906871e-005
		 30.475 -2.1307251692906871e-005 32 -2.1307251692906871e-005;
createNode animCurveTA -n "run_female:Scapula_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 1.0005552369177469e-005 1.525 1.0005552369177469e-005
		 3.0458333333333334 1.0005552369177469e-005 4.5708333333333337 1.0005552369177469e-005
		 6.0958333333333332 1.0005552369177469e-005 7.6208333333333336 1.0005552369177469e-005
		 9.1416666666666675 1.0005552369177469e-005 10.666666666666666 1.0005552369177469e-005
		 12.191666666666666 1.0005552369177469e-005 13.7125 1.0005552369177469e-005 15.2375 1.0005552369177469e-005
		 16.7625 1.0005552369177469e-005 18.2875 1.0005552369177469e-005 19.808333333333334 1.0005552369177469e-005
		 21.333333333333332 1.0005552369177469e-005 22.858333333333334 1.0005552369177469e-005
		 24.379166666666666 1.0005552369177469e-005 25.904166666666665 1.0005552369177469e-005
		 27.429166666666667 1.0005552369177469e-005 28.954166666666666 1.0005552369177469e-005
		 30.475 1.0005552369177469e-005 32 1.0005552369177469e-005;
createNode animCurveTA -n "run_female:Scapula_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -2.7472791986738114e-005 1.525 -2.7472791986738114e-005
		 3.0458333333333334 -2.7472791986738114e-005 4.5708333333333337 -2.7472791986738114e-005
		 6.0958333333333332 -2.7472791986738114e-005 7.6208333333333336 -2.7472791986738114e-005
		 9.1416666666666675 -2.7472791986738114e-005 10.666666666666666 -2.7472791986738114e-005
		 12.191666666666666 -2.7472791986738114e-005 13.7125 -2.7472791986738114e-005 15.2375 -2.7472791986738114e-005
		 16.7625 -2.7472791986738114e-005 18.2875 -2.7472791986738114e-005 19.808333333333334 -2.7472791986738114e-005
		 21.333333333333332 -2.7472791986738114e-005 22.858333333333334 -2.7472791986738114e-005
		 24.379166666666666 -2.7472791986738114e-005 25.904166666666665 -2.7472791986738114e-005
		 27.429166666666667 -2.7472791986738114e-005 28.954166666666666 -2.7472791986738114e-005
		 30.475 -2.7472791986738114e-005 32 -2.7472791986738114e-005;
createNode animCurveTA -n "run_female:Shoulder_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -2.6806685873397211 1.525 -14.518846696360907
		 3.0458333333333334 -25.584338076733907 4.5708333333333337 -30.856590253783352 6.0958333333333332 -36.113353655884922
		 7.6208333333333336 -37.789477681258759 9.1416666666666675 -39.589532355685137 10.666666666666666 -38.010614671790428
		 12.191666666666666 -36.248779335016856 13.7125 -27.059193038888665 15.2375 -18.812842134423363
		 16.7625 -6.5818102855797225 18.2875 5.5374231233129834 19.808333333333334 11.381603345862789
		 21.333333333333332 17.617785615934782 22.858333333333334 20.498718158033711 24.379166666666666 23.569405849826989
		 25.904166666666665 24.998914511458295 27.429166666666667 26.475607279345574 28.954166666666666 21.475733160219889
		 30.475 16.760869782861011 32 6.632806187456362;
createNode animCurveTA -n "run_female:Shoulder_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 1.7909387555415317 1.525 -10.740650181553889
		 3.0458333333333334 -23.6352231989292 4.5708333333333337 -29.657984751613931 6.0958333333333332 -35.704355528391694
		 7.6208333333333336 -36.855164202665939 9.1416666666666675 -37.955872597537834 10.666666666666666 -35.925518861685468
		 12.191666666666666 -33.837072953116412 13.7125 -25.151175917861067 15.2375 -16.223991642145091
		 16.7625 -1.9754576229077765 18.2875 12.743743721771834 19.808333333333334 18.738021625003114
		 21.333333333333332 24.583506704996523 22.858333333333334 28.286652807959211 24.379166666666666 31.895398805378527
		 25.904166666666665 32.95229907856185 27.429166666666667 33.997425689457927 28.954166666666666 28.637592537968178
		 30.475 23.413464423139132 32 12.479276317429585;
createNode animCurveTA -n "run_female:Shoulder_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -83.952037479029713 1.525 -79.783288671166773
		 3.0458333333333334 -76.89965130272958 4.5708333333333337 -75.562847916304037 6.0958333333333332 -74.49474496379797
		 7.6208333333333336 -76.86889687861229 9.1416666666666675 -79.382328442126763 10.666666666666666 -80.813518326419143
		 12.191666666666666 -82.096119460830579 13.7125 -79.378311041129464 15.2375 -78.21913502007898
		 16.7625 -76.008846533148258 18.2875 -76.299182413409852 19.808333333333334 -77.919538613804136
		 21.333333333333332 -80.086806596433973 22.858333333333334 -80.984342744092757 24.379166666666666 -82.220167044519712
		 25.904166666666665 -83.239216874415149 27.429166666666667 -84.312252380461743 28.954166666666666 -84.429441030798046
		 30.475 -84.974507605657337 32 -83.47424395797573;
createNode animCurveTA -n "run_female:Elbow_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -3.1521759335587252 1.525 -5.793911852160778
		 3.0458333333333334 -8.3086222853853045 4.5708333333333337 -10.728830838176057 6.0958333333333332 -13.040858735993814
		 7.6208333333333336 -10.756319404876846 9.1416666666666675 -8.3913506896521977 10.666666666666666 -9.2039291876303757
		 12.191666666666666 -10.430368774614879 13.7125 -7.7854292172017798 15.2375 -5.3045447169875874
		 16.7625 -7.4819981806276576 18.2875 -10.28555426111647 19.808333333333334 -11.589863578431075
		 21.333333333333332 -14.716585874453761 22.858333333333334 -19.041806738555941 24.379166666666666 -23.370829112478624
		 25.904166666666665 -19.133462880891578 27.429166666666667 -15.680250155484988 28.954166666666666 -10.951588729095439
		 30.475 -7.8403954891249992 32 -5.2639384963337985;
createNode animCurveTA -n "run_female:Elbow_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 57.378322816506682 1.525 57.266257349137177
		 3.0458333333333334 57.180131562203748 4.5708333333333337 58.472739408988602 6.0958333333333332 59.779936184932716
		 7.6208333333333336 60.120091496675755 9.1416666666666675 60.466423797495956 10.666666666666666 62.207035639311599
		 12.191666666666666 63.842112301948305 13.7125 63.026579365051376 15.2375 62.229480922753375
		 16.7625 63.840379146726526 18.2875 65.284210100288419 19.808333333333334 70.352792585820353
		 21.333333333333332 75.333293389331445 22.858333333333334 75.477798133758753 24.379166666666666 75.605757029834976
		 25.904166666666665 74.225508321115839 27.429166666666667 72.779691277109379 28.954166666666666 68.963797374500729
		 30.475 65.13158871972486 32 61.17433938961554;
createNode animCurveTA -n "run_female:Elbow_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 13.79730538676054 1.525 11.946210040282105
		 3.0458333333333334 10.189553259357313 4.5708333333333337 8.7892550735660482 6.0958333333333332 7.3540172582268992
		 7.6208333333333336 5.7405773488026322 9.1416666666666675 4.0786204468574576 10.666666666666666 7.3448728521946514
		 12.191666666666666 11.078508489358814 13.7125 9.9963224660435532 15.2375 9.0836388138332964
		 16.7625 14.122857200963333 18.2875 19.822769220821613 19.808333333333334 22.466513316094396
		 21.333333333333332 26.943065744761814 22.858333333333334 29.40959230094251 24.379166666666666 31.886328234869591
		 25.904166666666665 27.546737951761365 27.429166666666667 23.983208672878284 28.954166666666666 19.038563515135056
		 30.475 15.737732256455844 32 14.53661072661958;
createNode animCurveTA -n "run_female:Wrist_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -8.4939509598692364 1.525 -7.7139313750606773
		 3.0458333333333334 -7.154705808552503 4.5708333333333337 -7.6314571053847775 6.0958333333333332 -8.1359351647827296
		 7.6208333333333336 -8.182148796538117 9.1416666666666675 -9.4414368453044553 10.666666666666666 -10.519981761330216
		 12.191666666666666 -11.585555459820489 13.7125 -10.670342148791661 15.2375 -9.7430389564025859
		 16.7625 -10.883163246262766 18.2875 -12.042865101099931 19.808333333333334 -11.641279811555343
		 21.333333333333332 -11.25754803625331 22.858333333333334 -11.846810624939327 24.379166666666666 -12.432089486258986
		 25.904166666666665 -11.724338473394333 27.429166666666667 -11.021797198558252 28.954166666666666 -10.207679825393601
		 30.475 -9.4066528578068205 32 -8.8993133033335621;
createNode animCurveTA -n "run_female:Wrist_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 24.340708425079949 1.525 21.563711915923417
		 3.0458333333333334 18.73892758796142 4.5708333333333337 16.756239909477596 6.0958333333333332 14.828861822402869
		 7.6208333333333336 20.659385649998868 9.1416666666666675 26.452412348747757 10.666666666666666 25.345234481781233
		 12.191666666666666 24.239198733862938 13.7125 21.762274440725889 15.2375 19.3321123700226
		 16.7625 19.075294920735825 18.2875 18.850072448876887 19.808333333333334 18.604865130649173
		 21.333333333333332 18.337966334633524 22.858333333333334 17.948542525295021 24.379166666666666 17.588066810657036
		 25.904166666666665 17.722519262721164 27.429166666666667 17.821723805735278 28.954166666666666 19.05357937123167
		 30.475 20.258854033395902 32 22.327560048889801;
createNode animCurveTA -n "run_female:Wrist_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -4.4214799906396314 1.525 -8.3199258957650439
		 3.0458333333333334 -12.090212705248097 4.5708333333333337 -13.299800444284111 6.0958333333333332 -14.458611623413143
		 7.6208333333333336 -3.9326398419002033 9.1416666666666675 7.2088041888498751 10.666666666666666 6.937974767863853
		 12.191666666666666 6.6452268838188449 13.7125 7.8183935558307427 15.2375 8.9940520500389045
		 16.7625 6.9616988659761789 18.2875 4.9015257348605878 19.808333333333334 2.1107073304220996
		 21.333333333333332 -0.6694382961865013 22.858333333333334 -2.3977331834704052 24.379166666666666 -4.1355709812249453
		 25.904166666666665 -6.3099746146170386 27.429166666666667 -8.4839398683609293 28.954166666666666 -8.5182202246859795
		 30.475 -8.5659575270358594 32 -6.4788561100079649;
createNode animCurveTA -n "run_female:Hip_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -5.3768969060534557 1.525 -4.721613142123025
		 3.0458333333333334 -4.0942915412046208 4.5708333333333337 -3.2637026859762175 6.0958333333333332 -2.5468109838817705
		 7.6208333333333336 -1.9188468226459108 9.1416666666666675 -1.2644967363804194 10.666666666666666 -1.007434207565391
		 12.191666666666666 -0.68952813042904237 13.7125 -0.01967508445802026 15.2375 0.84308383755837146
		 16.7625 1.3060535219476812 18.2875 1.8849098229399264 19.808333333333334 0.67624829546148668
		 21.333333333333332 -0.59752800694693642 22.858333333333334 -0.58551791265946873 24.379166666666666 -0.57404792258353976
		 25.904166666666665 -0.48525031735095053 27.429166666666667 -0.38985457919235744 28.954166666666666 -1.5847572854220406
		 30.475 -2.7955051061007969 32 -4.1355283832151919;
createNode animCurveTA -n "run_female:Hip_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -11.183309974785089 1.525 -10.55077462028798
		 3.0458333333333334 -9.8944231037187738 4.5708333333333337 -7.475991972189524 6.0958333333333332 -4.9156334323248574
		 7.6208333333333336 -4.562794091636591 9.1416666666666675 -4.0935823172326904 10.666666666666666 -2.6934341235687462
		 12.191666666666666 -1.3670033163011948 13.7125 0.28241947566808234 15.2375 1.8164306743295382
		 16.7625 3.0873210903711135 18.2875 4.3735232432231577 19.808333333333334 2.162927985625728
		 21.333333333333332 -0.14091237567294329 22.858333333333334 0.4266850838074932 24.379166666666666 0.69360890165265887
		 25.904166666666665 0.98213503681818948 27.429166666666667 1.2814651629537288 28.954166666666666 -1.4107001484152024
		 30.475 -4.137794938291508 32 -7.7288320726013042;
createNode animCurveTA -n "run_female:Hip_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -39.34493169130176 1.525 -35.233093612747552
		 3.0458333333333334 -31.112416737790493 4.5708333333333337 -26.349814513690866 6.0958333333333332 -21.499562171604836
		 7.6208333333333336 -21.752710595873086 9.1416666666666675 -21.958562230452273 10.666666666666666 -22.133503450148954
		 12.191666666666666 -22.424023381558424 13.7125 -25.926144033758707 15.2375 -29.49800236532576
		 16.7625 -35.040191960102284 18.2875 -40.593198860134684 19.808333333333334 -40.339708028695021
		 21.333333333333332 -40.68610224787983 22.858333333333334 -38.996470531974595 24.379166666666666 -38.620646878394652
		 25.904166666666665 -39.193132431834094 27.429166666666667 -39.775060818504059 28.954166666666666 -40.232079396039417
		 30.475 -41.013768883717823 32 -40.214814269658753;
createNode animCurveTA -n "run_female:Knee_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -6.9600269285599801 1.525 -7.2867564073186033
		 3.0458333333333334 -7.5511018810697808 4.5708333333333337 -8.2909229565869271 6.0958333333333332 -8.678551697447908
		 7.6208333333333336 -7.209730228302937 9.1416666666666675 -5.7538409931168344 10.666666666666666 -5.8788115429854733
		 12.191666666666666 -5.7597202918460502 13.7125 -5.482345531642804 15.2375 -5.3112804979981032
		 16.7625 -5.5560626541620746 18.2875 -5.905034592252802 19.808333333333334 -5.818242723473757
		 21.333333333333332 -6.132278639258347 22.858333333333334 -5.3906075738346813 24.379166666666666 -4.9892100763853824
		 25.904166666666665 -5.0163576845358362 27.429166666666667 -5.0475432698859297 28.954166666666666 -5.7078466498501008
		 30.475 -6.3072714995719235 32 -6.6137409195793238;
createNode animCurveTA -n "run_female:Knee_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 1.2815333808477021 1.525 2.084404399387342
		 3.0458333333333334 3.0247727818202779 4.5708333333333337 4.1639169800170066 6.0958333333333332 5.3781509868515425
		 7.6208333333333336 6.0311075691473528 9.1416666666666675 6.6892765235727021 10.666666666666666 5.4107595617175983
		 12.191666666666666 4.4911163619595342 13.7125 4.543874531620272 15.2375 4.96810600966759
		 16.7625 4.8884633121347729 18.2875 4.8135693126082684 19.808333333333334 4.5918502995419361
		 21.333333333333332 4.3368808082091537 22.858333333333334 2.7704803022912246 24.379166666666666 1.2928386689556435
		 25.904166666666665 1.1681533090122387 27.429166666666667 1.0518455692672586 28.954166666666666 0.81366427287362419
		 30.475 0.82356338282143815 32 1.071876206644524;
createNode animCurveTA -n "run_female:Knee_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 58.785918593285921 1.525 55.845865284207754
		 3.0458333333333334 52.815842703742383 4.5708333333333337 45.719742201952691 6.0958333333333332 38.469417408538632
		 7.6208333333333336 38.906505723267173 9.1416666666666675 39.438196551209082 10.666666666666666 48.910527660214235
		 12.191666666666666 58.413108878824893 13.7125 71.544256752199544 15.2375 84.517374138264273
		 16.7625 87.482333169275691 18.2875 90.573497224171518 19.808333333333334 75.214757256050319
		 21.333333333333332 60.157487997648985 22.858333333333334 41.305845345096714 24.379166666666666 24.79568744930215
		 25.904166666666665 24.237206957864537 27.429166666666667 23.58586685045606 28.954166666666666 35.33756003728562
		 30.475 47.766243059053423 32 53.41566269306972;
createNode animCurveTA -n "run_female:Ankle_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 2.3179499733067312 1.525 1.1608684223987968
		 3.0458333333333334 -0.024038164313077863 4.5708333333333337 0.87624035623995933 6.0958333333333332 2.5798592382290999
		 7.6208333333333336 4.9434653384266554 9.1416666666666675 7.5565914846707498 10.666666666666666 11.142514791123647
		 12.191666666666666 14.522886588333732 13.7125 15.034522826748221 15.2375 15.465708729793516
		 16.7625 13.873476649165077 18.2875 12.475378865510946 19.808333333333334 14.062312341265393
		 21.333333333333332 15.630134864334163 22.858333333333334 9.7684346265619624 24.379166666666666 3.8229085764707698
		 25.904166666666665 4.8495107242568434 27.429166666666667 5.8158151849793018 28.954166666666666 4.6603098177751177
		 30.475 4.0134348450763335 32 3.1664370156617347;
createNode animCurveTA -n "run_female:Ankle_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 1.6346258799615898 1.525 1.119186492317473
		 3.0458333333333334 0.59694648294343589 4.5708333333333337 -3.8932847165223614 6.0958333333333332 -8.5016277124419251
		 7.6208333333333336 -8.7584092912867941 9.1416666666666675 -9.5845502789989041 10.666666666666666 -11.461730870225946
		 12.191666666666666 -13.258249823402704 13.7125 -12.177246694568463 15.2375 -10.915253379593787
		 16.7625 -9.1856955051990425 18.2875 -7.6370630043270857 19.808333333333334 -6.3003907045335872
		 21.333333333333332 -4.9982315278724192 22.858333333333334 -4.146121017857392 24.379166666666666 -2.5025303106665384
		 25.904166666666665 -4.2683214515181263 27.429166666666667 -6.0346743575376349 28.954166666666666 -1.7980719432588494
		 30.475 2.1770265875893644 32 1.9952506678027642;
createNode animCurveTA -n "run_female:Ankle_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -22.571748344634575 1.525 -21.239745474742985
		 3.0458333333333334 -19.811309546322608 4.5708333333333337 -9.1639679308569946 6.0958333333333332 1.4388032519169875
		 7.6208333333333336 11.636100923202939 9.1416666666666675 21.96237083557531 10.666666666666666 22.547573053902561
		 12.191666666666666 23.074786797977342 13.7125 17.173594237544986 15.2375 11.441823376377295
		 16.7625 5.0042000511011073 18.2875 -1.7075056636965882 19.808333333333334 -3.4844047761011545
		 21.333333333333332 -4.8564851774539299 22.858333333333334 -0.73214165713539403 24.379166666666666 2.2972310908708917
		 25.904166666666665 2.0750661713382614 27.429166666666667 1.8739693681760816 28.954166666666666 -6.2282406067079332
		 30.475 -14.716868839914918 32 -18.762593849658849;
createNode animCurveTA -n "run_female:Toes_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -9.50387325498472 1.525 -13.763198315243381
		 3.0458333333333334 -15.729932874461538 4.5708333333333337 -18.407729381488636 6.0958333333333332 -13.999389318756158
		 7.6208333333333336 -9.3593209504614538 9.1416666666666675 -5.8264475258438484 10.666666666666666 -5.8264637216990147
		 12.191666666666666 -5.8265986382460238 13.7125 -5.8297901418075062 15.2375 -5.8330217341281099
		 16.7625 -5.8322806059131409 18.2875 -5.8316757496802296 19.808333333333334 -5.8291248337027701
		 21.333333333333332 -5.8265911379046003 22.858333333333334 -5.8262516287789712 24.379166666666666 -5.8258508145290504
		 25.904166666666665 -5.8257314384893029 27.429166666666667 -5.8256099389157869 28.954166666666666 -5.8255788722692525
		 30.475 -5.8335315662917022 32 -7.6909643678561945;
createNode animCurveTA -n "run_female:Hip_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 3.7453464320189132 1.525 3.6865596673603513
		 3.0458333333333334 3.4106520620736598 4.5708333333333337 0.56873699846804893 6.0958333333333332 -2.2723799585146014
		 7.6208333333333336 -2.6423123484306044 9.1416666666666675 -3.0840030245483625 10.666666666666666 -2.5027401217112635
		 12.191666666666666 -1.8529548135832197 13.7125 -3.0104164413610808 15.2375 -4.0480919988261705
		 16.7625 -3.3046111810057992 18.2875 -2.5264974596938292 19.808333333333334 -0.30407032927965688
		 21.333333333333332 1.7561143874283456 22.858333333333334 3.4204772447683229 24.379166666666666 5.0847487041093169
		 25.904166666666665 4.4898922465341053 27.429166666666667 3.8798479329651947 28.954166666666666 3.8884344327898828
		 30.475 3.9931489021805966 32 3.7994888586813174;
createNode animCurveTA -n "run_female:Hip_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 6.9543079717172986 1.525 4.6711915913500004
		 3.0458333333333334 2.4180951011409766 4.5708333333333337 -1.4398328704555095 6.0958333333333332 -5.2705994643372227
		 7.6208333333333336 -5.4778760483961983 9.1416666666666675 -6.0436537535900108 10.666666666666666 -7.2688068310421343
		 12.191666666666666 -8.4415746166902785 13.7125 -9.8659986088174829 15.2375 -10.35446386926289
		 16.7625 -11.685543540898477 18.2875 -12.677547007003733 19.808333333333334 -9.814293779721206
		 21.333333333333332 -6.8437365633677691 22.858333333333334 -5.1594382245249779 24.379166666666666 -3.4746120029538714
		 25.904166666666665 -2.7134182240672104 27.429166666666667 -1.965390858292293 28.954166666666666 -0.23676410111163157
		 30.475 1.3203420040532623 32 4.1937508603190627;
createNode animCurveTA -n "run_female:Hip_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -33.722831143335348 1.525 -38.032558116391826
		 3.0458333333333334 -42.39406480200536 4.5708333333333337 -41.231507410508641 6.0958333333333332 -40.229705000848163
		 7.6208333333333336 -39.386052105479799 9.1416666666666675 -39.115528322332032 10.666666666666666 -36.702432865931044
		 12.191666666666666 -34.364549463776932 13.7125 -34.855649134230561 15.2375 -35.33169216015564
		 16.7625 -32.415466115654034 18.2875 -29.696070913380577 19.808333333333334 -25.406671763921373
		 21.333333333333332 -21.119087178721145 22.858333333333334 -21.406220544941096 24.379166666666666 -21.430068629482463
		 25.904166666666665 -22.03630641608812 27.429166666666667 -22.687194332610861 28.954166666666666 -23.032430938819211
		 30.475 -23.27878520628709 32 -28.628973914180143;
createNode animCurveTA -n "run_female:Knee_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -1.6630684907109339 1.525 -1.5518497499032398
		 3.0458333333333334 -1.4100336540862028 4.5708333333333337 -1.6336482831721637 6.0958333333333332 -1.9943641679930839
		 7.6208333333333336 -1.1802531957103328 9.1416666666666675 -0.60959916639452283 10.666666666666666 0.30510386316825744
		 12.191666666666666 1.222913209900137 13.7125 0.13103331910641206 15.2375 -0.94601662215085713
		 16.7625 -0.34502376956492559 18.2875 0.17294719522483129 19.808333333333334 1.3195921464540878
		 21.333333333333332 2.5419929207751477 22.858333333333334 3.7339192283135372 24.379166666666666 4.9142286540478777
		 25.904166666666665 3.5328071805637622 27.429166666666667 2.1031839349069545 28.954166666666666 0.96380628630279019
		 30.475 -0.14826213133061758 32 -0.84978439737577949;
createNode animCurveTA -n "run_female:Knee_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 5.0443668658596801 1.525 5.678617906863713
		 3.0458333333333334 6.2809125294033201 4.5708333333333337 6.5570768318708366 6.0958333333333332 6.653025402020238
		 7.6208333333333336 5.7293082225916629 9.1416666666666675 4.893238656019812 10.666666666666666 4.7599912533475033
		 12.191666666666666 4.6011101258486118 13.7125 4.1967257972358434 15.2375 3.5779056030610055
		 16.7625 3.9217190891707654 18.2875 4.1782879843755794 19.808333333333334 4.427701473428673
		 21.333333333333332 4.6717706399487096 22.858333333333334 5.0862868622191852 24.379166666666666 5.5045925160566505
		 25.904166666666665 6.2576591763824805 27.429166666666667 6.8653893648905493 28.954166666666666 7.0389605906658499
		 30.475 7.244514056683208 32 6.0132624920849844;
createNode animCurveTA -n "run_female:Knee_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 89.472447152108003 1.525 86.576813391765938
		 3.0458333333333334 83.67225741410752 4.5708333333333337 68.747055531997134 6.0958333333333332 54.016690942185413
		 7.6208333333333336 41.4452661995158 9.1416666666666675 29.509622058843682 10.666666666666666 28.454538230889561
		 12.191666666666666 27.485512353812698 13.7125 40.27276186854408 15.2375 52.659393591021207
		 16.7625 54.543532339992559 18.2875 56.62538708790089 19.808333333333334 52.011713309990363
		 21.333333333333332 47.409422188617405 22.858333333333334 47.236912016171587 24.379166666666666 47.017236908141818
		 25.904166666666665 52.730991920494418 27.429166666666667 58.400809433251823 28.954166666666666 67.110511635840211
		 30.475 75.472886801154615 32 82.62476740524265;
createNode animCurveTA -n "run_female:Ankle_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 8.1399392353694076 1.525 10.44331288595248
		 3.0458333333333334 12.794073452342349 4.5708333333333337 15.052823924296495 6.0958333333333332 17.296305977944147
		 7.6208333333333336 13.212142525286826 9.1416666666666675 8.8013781603020451 10.666666666666666 10.943862726248751
		 12.191666666666666 12.975217036128205 13.7125 4.6152452889291888 15.2375 -2.9079007023428858
		 16.7625 -1.0853998036574424 18.2875 0.13397326037217555 19.808333333333334 1.4686723213251001
		 21.333333333333332 3.0590370283039254 22.858333333333334 3.3734812828152894 24.379166666666666 2.7500343718944507
		 25.904166666666665 4.8706556975642652 27.429166666666667 7.1724412878097858 28.954166666666666 12.018936671338889
		 30.475 15.632149537644029 32 11.927959059838944;
createNode animCurveTA -n "run_female:Ankle_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -9.8821787386396451 1.525 -9.3965326495138051
		 3.0458333333333334 -8.8847041205641499 4.5708333333333337 -11.254994586406882 6.0958333333333332 -13.707782366479057
		 7.6208333333333336 -12.601167812403661 9.1416666666666675 -10.860212205346883 10.666666666666666 -13.18030014001249
		 12.191666666666666 -15.40171943591643 13.7125 -7.3603405366988692 15.2375 -6.822673432604982
		 16.7625 -4.5084172700879366 18.2875 -4.3433274433538562 19.808333333333334 -5.1581775681629027
		 21.333333333333332 -6.2480001974164292 22.858333333333334 -2.3818970020092398 24.379166666666666 1.658976843745595
		 25.904166666666665 0.01118006063436194 27.429166666666667 -1.8002047820257461 28.954166666666666 -6.250394537403996
		 30.475 -9.3205139584257992 32 -9.3235031183847976;
createNode animCurveTA -n "run_female:Ankle_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 1.029631805365306 1.525 -1.3049641052142393
		 3.0458333333333334 -3.5757016152017851 4.5708333333333337 -2.6566102181396989 6.0958333333333332 -1.5764013827087271
		 7.6208333333333336 4.867254410309136 9.1416666666666675 10.913332192091731 10.666666666666666 9.4754110537365168
		 12.191666666666666 7.9140619188376427 13.7125 -5.9779283222084372 15.2375 -18.505716101413064
		 16.7625 -20.633592236709802 18.2875 -21.735110827951541 19.808333333333334 -9.389882278415044
		 21.333333333333332 3.0168850879265339 22.858333333333334 16.709423148587433 24.379166666666666 30.193759608081383
		 25.904166666666665 32.726799656520235 27.429166666666667 35.261599895500972 28.954166666666666 25.987046180088544
		 30.475 16.696926538692146 32 8.683785244963893;
createNode animCurveTA -n "run_female:Toes_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 22 ".ktv[0:21]"  0 -4.5737300087189716 1.525 -4.4373687513489468
		 3.0458333333333334 -4.3279881534138926 4.5708333333333337 -4.0147694309114375 6.0958333333333332 -3.7309416443427965
		 7.6208333333333336 -3.4944194906383967 9.1416666666666675 -3.2465490856369921 10.666666666666666 -9.7555265353362337
		 12.191666666666666 -17.196509499944781 13.7125 -16.07406640289679 15.2375 -12.312122621364198
		 16.7625 -15.526565714669511 18.2875 -18.50564663835198 19.808333333333334 -25.359732973459352
		 21.333333333333332 -24.386905405333792 22.858333333333334 -10.866913524632379 24.379166666666666 -2.8988095194567451
		 25.904166666666665 -2.6777878494563594 27.429166666666667 -2.4306352896852856 28.954166666666666 -2.7094705688266045
		 30.475 -2.9724586203313668 32 -3.8450029934825394;
createNode animCurveTL -n "run_male:Root_M_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.075006409067308349 1 0.058440541528386916
		 2 0.047376664281618047 3 0.048691813762636919 4 0.051128123987152899 5 0.052939587988982309
		 6 0.058243109497764178 7 0.069857985867041797 8 0.079833393827743585 9 0.086284066813925087
		 10 0.09341675280557224 11 0.10154016833958482 12 0.11593024008398833 13 0.13553258635185458
		 14 0.15428741758561321 15 0.17225343793470321 16 0.18949459110991523 17 0.20034089365289057
		 18 0.20004564901095126 19 0.19740794622937541 20 0.19012919464928726 21 0.18198800521964553
		 22 0.17452445781732265 23 0.16992507691055656 24 0.16945921561960708 25 0.16645884967015476
		 26 0.15993411978190031 27 0.15554391559938413 28 0.15266174334699348 29 0.14086598501219977
		 30 0.12192334853157727 31 0.098855487116727897 32 0.075006409067308349;
createNode animCurveTL -n "run_male:Root_M_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.6635910146224457 1 5.6184263604714113
		 2 5.6200456295672732 3 5.6700367749580352 4 5.7663138299770917 5 5.8887828574598409
		 6 5.9997725688053407 7 6.0873373920963028 8 6.109745822668744 9 6.1070936870676986
		 10 6.0897501532833376 11 6.0299938881334798 12 5.9554366287046614 13 5.8656767615190226
		 14 5.7618904316947184 15 5.6519865997805363 16 5.5514423143425171 17 5.489155739551391
		 18 5.4901968721370977 19 5.5003645414456717 20 5.5620241424966181 21 5.6682297631227563
		 22 5.818331134359112 23 5.9352403863973047 24 5.9889979312488677 25 6.0248789727023269
		 26 6.0476702230565209 27 6.0408088514048668 28 5.9870653786819368 29 5.9162776616799038
		 30 5.8299288788665145 31 5.7429566108704337 32 5.6635910146224457;
createNode animCurveTL -n "run_male:Root_M_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.37287803040200829 1 0.33496966614823243
		 2 0.2980171976736794 3 0.28303712883447385 4 0.2640073120291469 5 0.2575469882119637
		 6 0.25274533730352367 7 0.24682605468606955 8 0.24241176274732815 9 0.23977459808200174
		 10 0.23951666278677466 11 0.2402850526158721 12 0.23536449812113741 13 0.2098585973538801
		 14 0.16869614802491911 15 0.11915281880694308 16 0.086934551515510036 17 0.071522306320712659
		 18 0.085153222185449226 19 0.11408164993147138 20 0.14858586105499499 21 0.18640067342282279
		 22 0.22674367603561299 23 0.25765946273970813 24 0.27281199700377962 25 0.29279481768953486
		 26 0.32033981535871942 27 0.34969941979347891 28 0.38039714107355688 29 0.40942067725005055
		 30 0.43227871753359615 31 0.41601603073546223 32 0.37287803040200829;
createNode animCurveTA -n "run_male:Root_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 4.5975594503648143 1 4.5875193566533987
		 2 4.1682974409433475 3 3.7167978122605603 4 3.0741520936799605 5 2.6604140967678402
		 6 2.3295157298055735 7 2.0516905793624574 8 2.0237312437522581 9 2.4103208947778128
		 10 2.751963612627196 11 3.015700456978212 12 3.1956941677184387 13 3.3070171444391732
		 14 3.4456505685816268 15 3.6082547952335569 16 3.7824670143853085 17 4.0705380293980369
		 18 4.6811002955454795 19 5.5015036256305594 20 6.5420347247140267 21 7.551826501311842
		 22 8.5154949071572865 23 8.8199282146781179 24 8.7842745712404504 25 8.5683028421902971
		 26 7.8748688447188036 27 7.1298478971661821 28 6.3443572425610002 29 5.4624878628819866
		 30 4.6666790624741896 31 4.6029274269562963 32 4.5975594503648143;
createNode animCurveTA -n "run_male:Root_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -1.0564711478831355 1 -1.8648853166557766
		 2 -2.2542822264789448 3 -1.1790482397027158 4 0.23279086584839639 5 0.87495631519083772
		 6 1.2632160082886787 7 1.4582791029286384 8 1.2831859127263148 9 -0.29698281651264952
		 10 -0.72234751884099835 11 -0.71741813713841107 12 -0.34948717659993933 13 1.0481679852571668
		 14 2.1420609006007161 15 3.1026871692472691 16 4.0380313602027469 17 4.6265752160795541
		 18 4.4214888915360193 19 3.7072579441077576 20 2.3231032288266023 21 0.77362172927289419
		 22 -0.85616859302415549 23 -1.6891359639838188 24 -1.8536540290803281 25 -1.8150033174355105
		 26 -1.4781106549740575 27 -1.1977431738758499 28 -0.96711304500856687 29 -0.52203619091359843
		 30 -0.021512912206571887 31 -0.28911376065822547 32 -1.0564711478831355;
createNode animCurveTA -n "run_male:Root_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.8529024971223844 1 5.07117953314137
		 2 3.9230882528258739 3 4.5732706426886729 4 5.5590250126568215 5 6.3253653260834515
		 6 7.0091383389046582 7 7.6256037850166143 8 7.9530141350555752 9 8.0328451405685062
		 10 8.0025083152485674 11 7.7876275082255253 12 7.5249041309024722 13 7.2158544346015097
		 14 6.8627791163292171 15 6.5650992665277528 16 6.5590290132951212 17 6.5924529620982373
		 18 6.8594315058586401 19 7.2656069393920788 20 7.5810543811791753 21 7.8803777949908129
		 22 8.1588499622513062 23 8.4647117993948733 24 8.8636649206464337 25 8.964453006786421
		 26 8.9329178162076115 27 8.8005332911609813 28 8.4696360537512092 29 7.8006528200023704
		 30 6.9057722531628754 31 6.3211545418295918 32 5.8529024971223844;
createNode animCurveTA -n "run_male:Spine1_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -16.843377094570748 1 -14.304427271200586
		 2 -9.8108414543052564 3 -7.727775739291828 4 -4.6088155825921264 5 -2.3221295758291554
		 6 -0.14259066872430814 7 2.0419819680644533 8 3.8272375777959757 9 5.1555247795746313
		 10 5.778027856835009 11 5.9211030285982993 12 5.7957299606493748 13 5.1332795777952187
		 14 4.160287609566768 15 2.8093014914069205 16 0.98654950848280232 17 -1.3322469621331072
		 18 -4.3419661835062398 19 -7.6479192145232426 20 -10.852851352383745 21 -14.175941346889774
		 22 -17.874182604756012 23 -20.943714124374448 24 -23.110993011702892 25 -24.263472018415371
		 26 -24.562997487720928 27 -24.498414042548987 28 -23.900984266099819 29 -22.536131848095192
		 30 -20.565579352097149 31 -18.724199286566868 32 -16.843377094570748;
createNode animCurveTA -n "run_male:Spine1_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.2429637250482477 1 7.0770432733938842
		 2 8.5106393688395734 3 7.4603278378588982 4 5.8614980003435617 5 4.6882513162974657
		 6 3.3356154289874369 7 1.3330939510856159 8 0.81477547924876348 9 1.545433260266627
		 10 1.4926088733943335 11 -0.11591154678999302 12 -2.2178888637130303 13 -4.705530211232924
		 14 -6.4988531452176872 15 -7.7448517357367015 16 -8.4580274714567381 17 -8.6824435670603144
		 18 -7.9123355936379252 19 -6.1573390725214985 20 -3.7588818306484417 21 -1.2902808150933431
		 22 1.1132563272372356 23 2.1965754623323455 24 2.3717078320284086 25 2.325332291655883
		 26 1.9984899378738414 27 1.9348906787415121 28 1.9797168698175653 29 2.0276212695270921
		 30 2.1212240431209097 31 3.1396713547575277 32 5.2429637250482477;
createNode animCurveTA -n "run_male:Spine1_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -4.4411499593134849 1 -3.4006709397912611
		 2 -1.6378067199598998 3 -1.7668749766893963 4 -1.8707822139055512 5 -1.668533529980893
		 6 -1.4544296130973557 7 -1.3383515605989753 8 -1.3977795453392061 9 -2.1015265128818901
		 10 -2.4376077869699477 11 -2.4920196607487193 12 -2.3764230709759349 13 -1.8500315047199363
		 14 -1.1068587739525979 15 -0.37509443193969511 16 -0.31120746303449065 17 -0.30449370308705603
		 18 -0.32672582829210239 19 -0.49991403926218597 20 -1.0586672268105417 21 -1.8840660341964488
		 22 -2.9320857276074794 23 -3.9340576745004721 24 -4.811190070953999 25 -5.4617683840552465
		 26 -5.8622698137911788 27 -6.1171968541775064 28 -6.2287556723946613 29 -6.1365170095530681
		 30 -5.7200411009904242 31 -5.1583377271546764 32 -4.4411499593134849;
createNode animCurveTA -n "run_male:Spine2_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 6.6518785910143761 1 5.5749334694120405
		 2 3.8150572021159017 3 3.0141945049164836 4 1.7841945700843405 5 0.80774000541656232
		 6 -0.11360154425434481 7 -0.99107033758482754 8 -1.6886803139432907 9 -2.2003630288888236
		 10 -2.291036219081104 11 -2.264608517398869 12 -2.1313098802662989 13 -1.7864800424098326
		 14 -1.3267156277407128 15 -0.72297404727698278 16 0.080294782983860585 17 1.0626075520169178
		 18 2.2473333264696551 19 3.5044295359693383 20 4.6812140596536524 21 5.8929534522916658
		 22 7.2546439178203972 23 8.3919436903295583 24 9.2161907997073502 25 9.6054937586698887
		 26 9.6975551737472134 27 9.6739361637208514 28 9.4633076436340531 29 9.0035621221769802
		 30 8.323685371975909 31 7.5329447043560798 32 6.6518785910143761;
createNode animCurveTA -n "run_male:Spine2_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.1470430644132934 1 -3.353441020159782
		 2 -3.5275106345823271 3 -3.3092138260662667 4 -2.8923397160357536 5 -2.4322420288317073
		 6 -1.8069609352272269 7 -0.90418696120466968 8 -0.24701084732724038 9 0.012464780085645508
		 10 0.46253132779427647 11 1.1369286201446118 12 1.8156878029888617 13 2.4684564730446974
		 14 2.8107585411296498 15 2.9059930606797377 16 2.7971716785808165 17 2.4564909877904251
		 18 1.9734455759284641 19 1.3214943639869872 20 0.44912820554440053 21 -0.45975340032321987
		 22 -1.3527422797996089 23 -2.0019471622337326 24 -2.321676625371345 25 -2.3943505374308902
		 26 -2.3977855940465269 27 -2.4297061912947115 28 -2.4904714075168268 29 -2.5642210095647728
		 30 -2.665554081789931 31 -2.882118713333119 32 -3.1470430644132934;
createNode animCurveTA -n "run_male:Spine2_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 7.501465870596963 1 7.115077228965724
		 2 6.5293398940676362 3 6.7040587084595638 4 6.8576103071495362 5 6.8647703220829177
		 6 6.8642746944109723 7 6.8459988501669233 8 6.8726337325760012 9 7.133976156345911
		 10 7.2036929676730006 11 7.1841899086059824 12 7.0862348964503976 13 6.8629846379096584
		 14 6.5872370164691851 15 6.3385205160113571 16 6.3627263878640345 17 6.4421866508296386
		 18 6.5121855682217831 19 6.618078570362413 20 6.7997551987661735 21 7.0208068622169346
		 22 7.2719452800596027 23 7.5318408923339781 24 7.7994388570702142 25 8.0194547317529814
		 26 8.1843778998317003 27 8.2770018580034872 28 8.2998290846072091 29 8.2510997595057436
		 30 8.0542064355617367 31 7.804088496975373 32 7.501465870596963;
createNode animCurveTA -n "run_male:Chest_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -7.0107700198992138 1 -5.9527745205481413
		 2 -4.1972325560210413 3 -3.3828775363486669 4 -2.119366129071711 5 -1.0942400645554948
		 6 -0.10323006564878387 7 0.87620190992082447 8 1.6422789960948037 9 2.1603823326850833
		 10 2.353748008367234 11 2.3926446484057822 12 2.3426614442509366 13 2.0702535145334013
		 14 1.6436722352196844 15 1.0417745637904472 16 0.2281114126260938 17 -0.78115507856110367
		 18 -2.0100454485416352 19 -3.3303784375631169 20 -4.5962655591654533 21 -5.9050080132450882
		 22 -7.3684133134923773 23 -8.5817239201235953 24 -9.4451652317169827 25 -9.847820382123583
		 26 -9.9427625903229764 27 -9.9217977241725226 28 -9.7245400155574391 29 -9.2793534015052419
		 30 -8.6173953120384166 31 -7.8574555316858898 32 -7.0107700198992138;
createNode animCurveTA -n "run_male:Chest_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.2317338893446492 1 2.6191209086228988
		 2 3.0626164137100567 3 2.9329108314842673 4 2.6564037903975759 5 2.3168417306090205
		 6 1.80747587335808 7 1.0146012247029257 8 0.44696664829415322 9 0.25420937370161623
		 10 -0.16306920426800986 11 -0.83932376607106229 12 -1.5407316598621934 13 -2.2366842137059035
		 14 -2.6516558262062162 15 -2.8197812099581698 16 -2.767371876601191 17 -2.559685020141989
		 18 -2.2134526087276196 19 -1.714185358993336 20 -0.99839125105394666 21 -0.26560450688731507
		 22 0.41294236209865548 23 0.86599638520091871 24 1.0121612785490164 25 1.0161804736475877
		 26 0.97361637282888092 27 0.97778348417915451 28 1.0672685342326524 29 1.2214429596496015
		 30 1.4490676500947639 31 1.8094819749268996 32 2.2317338893446492;
createNode animCurveTA -n "run_male:Chest_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -7.8209580324175638 1 -7.4137024253100359
		 2 -6.7591142551747527 3 -6.8674125989666059 4 -6.9566201110760275 5 -6.912764191725433
		 6 -6.8645350816839024 7 -6.8338884278797272 8 -6.86101236622493 9 -7.1306362324436812
		 10 -7.2103059987335874 11 -7.2129274959023144 12 -7.1628053273140102 13 -6.9431739412997224
		 14 -6.651966430590349 15 -6.3771636959389451 16 -6.3745939811001913 17 -6.4016281766932428
		 18 -6.4351160495475952 19 -6.5281611441738683 20 -6.7434556524093496 21 -7.0311143101461706
		 22 -7.3895035463825103 23 -7.7402806108479743 24 -8.0642758525271407 25 -8.3117568171953344
		 26 -8.473586097716769 27 -8.5683380524385715 28 -8.5981855147621982 29 -8.5510295911912042
		 30 -8.3577663832304747 31 -8.1166692547793726 32 -7.8209580324175638;
createNode animCurveTA -n "run_male:Scapula_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.1817433459952025e-006 1 -2.1817433459952025e-006
		 2 -2.1817433459952025e-006 3 -2.1817433459952025e-006 4 -2.1817433459952025e-006
		 5 -2.1817433459952025e-006 6 -2.1817433459952025e-006 7 -2.1817433459952025e-006
		 8 -2.1817433459952025e-006 9 -2.1817433459952025e-006 10 -2.1817433459952025e-006
		 11 -2.1817433459952025e-006 12 -2.1817433459952025e-006 13 -2.1817433459952025e-006
		 14 -2.1817433459952025e-006 15 -2.1817433459952025e-006 16 -2.1817433459952025e-006
		 17 -2.1817433459952025e-006 18 -2.1817433459952025e-006 19 -2.1817433459952025e-006
		 20 -2.1817433459952025e-006 21 -2.1817433459952025e-006 22 -2.1817433459952025e-006
		 23 -2.1817433459952025e-006 24 -2.1817433459952025e-006 25 -2.1817433459952025e-006
		 26 -2.1817433459952025e-006 27 -2.1817433459952025e-006 28 -2.1817433459952025e-006
		 29 -2.1817433459952025e-006 30 -2.1817433459952025e-006 31 -2.1817433459952025e-006
		 32 -2.1817433459952025e-006;
createNode animCurveTA -n "run_male:Scapula_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.4203839476090244e-006 1 2.4203839476090244e-006
		 2 2.4203839476090244e-006 3 2.4203839476090244e-006 4 2.4203839476090244e-006 5 2.4203839476090244e-006
		 6 2.4203839476090244e-006 7 2.4203839476090244e-006 8 2.4203839476090244e-006 9 2.4203839476090244e-006
		 10 2.4203839476090244e-006 11 2.4203839476090244e-006 12 2.4203839476090244e-006
		 13 2.4203839476090244e-006 14 2.4203839476090244e-006 15 2.4203839476090244e-006
		 16 2.4203839476090244e-006 17 2.4203839476090244e-006 18 2.4203839476090244e-006
		 19 2.4203839476090244e-006 20 2.4203839476090244e-006 21 2.4203839476090244e-006
		 22 2.4203839476090244e-006 23 2.4203839476090244e-006 24 2.4203839476090244e-006
		 25 2.4203839476090244e-006 26 2.4203839476090244e-006 27 2.4203839476090244e-006
		 28 2.4203839476090244e-006 29 2.4203839476090244e-006 30 2.4203839476090244e-006
		 31 2.4203839476090244e-006 32 2.4203839476090244e-006;
createNode animCurveTA -n "run_male:Scapula_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -8.1415927139264375e-006 1 -8.1415927139264375e-006
		 2 -8.1415927139264375e-006 3 -8.1415927139264375e-006 4 -8.1415927139264375e-006
		 5 -8.1415927139264375e-006 6 -8.1415927139264375e-006 7 -8.1415927139264375e-006
		 8 -8.1415927139264375e-006 9 -8.1415927139264375e-006 10 -8.1415927139264375e-006
		 11 -8.1415927139264375e-006 12 -8.1415927139264375e-006 13 -8.1415927139264375e-006
		 14 -8.1415927139264375e-006 15 -8.1415927139264375e-006 16 -8.1415927139264375e-006
		 17 -8.1415927139264375e-006 18 -8.1415927139264375e-006 19 -8.1415927139264375e-006
		 20 -8.1415927139264375e-006 21 -8.1415927139264375e-006 22 -8.1415927139264375e-006
		 23 -8.1415927139264375e-006 24 -8.1415927139264375e-006 25 -8.1415927139264375e-006
		 26 -8.1415927139264375e-006 27 -8.1415927139264375e-006 28 -8.1415927139264375e-006
		 29 -8.1415927139264375e-006 30 -8.1415927139264375e-006 31 -8.1415927139264375e-006
		 32 -8.1415927139264375e-006;
createNode animCurveTA -n "run_male:Shoulder_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -23.064936509511789 1 -20.108133480800845
		 2 -13.16654091903251 3 -9.491648914502484 4 -3.7597387770620174 5 1.0275573193204417
		 6 5.4287070416873187 7 9.3813219978576043 8 12.059820716515867 9 13.252989014926927
		 10 13.270653897379395 11 12.251201355137868 12 10.431182906757721 13 7.8331222252346535
		 14 4.6404943087232313 15 0.91155133933795773 16 -3.1564930075832653 17 -7.3782601643832972
		 18 -11.425138792689092 19 -15.100673830007201 20 -18.120624056543637 21 -20.492778127759298
		 22 -22.24333233196856 23 -23.012005156520704 24 -23.12467429930188 25 -23.317043036534539
		 26 -23.663097177636679 27 -23.950343435673371 28 -24.18254431382244 29 -24.492636605721241
		 30 -24.79429104884942 31 -24.444715246646538 32 -23.064936509511789;
createNode animCurveTA -n "run_male:Shoulder_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -29.477691231420483 1 -23.036835621272882
		 2 -11.124730099905991 3 -5.6912616986463727 4 2.4607932992672752 5 8.6304102497320105
		 6 13.996412858199207 7 18.427101801432837 8 21.711297567839949 9 23.864218394446088
		 10 24.20315384210836 11 23.756456663903261 12 22.24492896397787 13 19.7074578764744
		 14 16.234290620228176 15 11.920155277092912 16 7.0227846875979756 17 1.7411806003358232
		 18 -3.4619689680926244 19 -8.6913149570503929 20 -13.928148316122195 21 -19.189817423913869
		 22 -24.691086327401436 23 -29.37188134861719 24 -32.872250659874354 25 -35.634511410980537
		 26 -37.714209160942893 27 -38.657575743179507 28 -38.865145883041862 29 -38.473918100112421
		 30 -36.608860025045608 31 -33.602504931421961 32 -29.477691231420483;
createNode animCurveTA -n "run_male:Shoulder_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -53.013525588015419 1 -56.073605536407356
		 2 -59.994660637593356 3 -62.181148010996829 4 -65.2853969501286 5 -67.308248197249355
		 6 -68.774776357245273 7 -69.644298706064333 8 -69.700834280393408 9 -68.64032080784024
		 10 -67.874543562813955 11 -67.505463510411985 12 -67.599921849143229 13 -68.138298908347593
		 14 -68.669348394961247 15 -69.104886122974577 16 -69.087681150505048 17 -68.78251621095049
		 18 -67.841058003990156 19 -66.069395025332042 20 -63.485584662755905 21 -59.914390457161105
		 22 -54.894070543352917 23 -50.224330580580862 24 -46.373160136788805 25 -43.746344831767644
		 26 -42.432598778925268 27 -42.282204425545757 28 -42.403731413579742 29 -43.601958913011394
		 30 -46.924070362695119 31 -49.98014101037186 32 -53.013525588015419;
createNode animCurveTA -n "run_male:Elbow_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 120.22955561523816 1 126.03878027833895
		 2 132.97206441820177 3 139.87383424730405 4 152.08443573675135 5 165.97658265255521
		 6 177.25871621998206 7 182.87090985417797 8 186.78183120766553 9 189.61420708080041
		 10 191.10107882491641 11 191.29339240988577 12 198.94092949020813 13 218.80093859091951
		 14 149.3527996925051 15 0.5543615624940299 16 -2.9945752465067597 17 6.0876277500875204
		 18 23.57599230192557 19 50.235675444933641 20 98.686821663291511 21 125.37373603266664
		 22 127.36863706440386 23 127.29950737622242 24 124.70996940221657 25 122.91247482712988
		 26 122.4733253523156 27 121.47125663264704 28 119.95914291482384 29 118.9942252411237
		 30 118.52699715392288 31 118.65653685392788 32 120.22955561523816;
createNode animCurveTA -n "run_male:Elbow_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 74.920341346836707 1 77.369959068897913
		 2 80.37870999443318 3 81.620253872980712 4 83.150245513993895 5 83.627622870554916
		 6 83.684025494244281 7 83.451070270965005 8 83.368651724264055 9 83.553008428350964
		 10 84.042939525367615 11 84.847586570543939 12 86.460192860549654 13 88.494056186255932
		 14 88.410246539034446 15 87.747296137048821 16 87.424755832407612 17 87.299429794341506
		 18 88.216591767003749 19 89.126672094745174 20 87.198606795123425 21 83.76874858304987
		 22 79.43787087036101 23 75.442037771475313 24 72.201475645561217 25 70.107338395307025
		 26 69.272692979178217 27 68.860123666038177 28 68.750225053046961 29 69.218391697185623
		 30 70.961358465435723 31 72.834292770337811 32 74.920341346836707;
createNode animCurveTA -n "run_male:Elbow_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -139.1713056206749 1 -141.40934527067961
		 2 -142.92527952238092 3 -146.78560872226973 4 -154.49497321325416 5 -165.12648014211715
		 6 -173.56967568132038 7 -176.7141187603076 8 -179.06677577645362 9 -181.36622173533758
		 10 -183.14073879693439 11 -184.46885016061816 12 -195.83256469882727 13 -218.22620645716799
		 14 -150.72668388764825 15 -5.6441512041263016 16 -3.5781877174542278 17 -15.425909455161737
		 18 -34.472376723271239 19 -62.52294971622009 20 -111.38207165967677 21 -141.73368519207202
		 22 -146.52855694631631 23 -146.83701338943919 24 -146.19293159425661 25 -145.78613039032066
		 26 -145.7560564583159 27 -145.41196629614501 28 -144.51627252994251 29 -143.11525275899896
		 30 -141.37766219233393 31 -140.00743991243547 32 -139.1713056206749;
createNode animCurveTA -n "run_male:Wrist_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -4.0557581567108487 1 -4.5337843935848428
		 2 -5.018429918491667 3 -4.9264748803105931 4 -4.7643500962885694 5 -4.585743220156747
		 6 -4.423333318059834 7 -4.2857004001199561 8 -4.2653029687516888 9 -4.4391863240374958
		 10 -4.7208265834681944 11 -5.1016655060484473 12 -5.4474795823967757 13 -5.7503455944976993
		 14 -5.9069599821989023 15 -5.9462129749328057 16 -5.7275309537612813 17 -5.3065311481860817
		 18 -5.1462208177758217 19 -5.0554326379321779 20 -4.968643958113951 21 -4.8737694315507643
		 22 -4.7401250249978517 23 -4.634736647038066 24 -4.597870447956951 25 -4.4166423836599256
		 26 -4.0462307734846163 27 -3.9543294867584917 28 -3.9497870520226868 29 -3.9148494622769272
		 30 -3.8682468011532385 31 -3.8940384400405512 32 -4.0557581567108487;
createNode animCurveTA -n "run_male:Wrist_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 23.060863067808935 1 20.91721220501551
		 2 18.664455717235473 3 18.572094307107076 4 18.508703815184756 5 19.430596904177822
		 6 20.880790283217813 7 22.591200596991776 8 24.1683955765271 9 25.503261810682822
		 10 26.595612558762639 11 27.431079478462305 12 27.510462815216552 13 27.142405743064586
		 14 25.896120851387181 15 24.107279071962846 16 22.777624415532301 17 21.54270712047601
		 18 19.944430702759966 19 18.528823468706257 20 17.738615830543093 21 17.530785402004373
		 22 18.140715684824702 23 19.066311346615105 24 20.13802338324718 25 21.517656932748888
		 26 23.241670617506482 27 24.661772227225878 28 25.711243528715112 29 25.800988217108941
		 30 25.597787730732417 31 24.701109090729769 32 23.060863067808935;
createNode animCurveTA -n "run_male:Wrist_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.79673773769128808 1 0.5293394046066956
		 2 2.4402034497752942 3 1.7090917903105554 4 0.72763828098935934 5 0.15468898610851881
		 6 -0.023333242843628834 7 0.10708028479504887 8 0.75864679655976519 9 2.0774108928434112
		 10 3.6379058096645891 11 5.4032436840043232 12 6.8996916985919512 13 8.0730238436169213
		 14 8.4726819181231168 15 8.541720504002841 16 7.3599736872748638 17 4.9546470894068193
		 18 3.5995539227082709 19 2.561171074846524 20 1.7027126120601364 21 1.049038693994089
		 22 0.54532109710735199 23 0.42326911425793773 24 0.59698558395865864 25 0.47458081775230981
		 26 -0.57869047434978449 27 -0.69851319959288549 28 -0.29566721074725832 29 -0.35351665341816557
		 30 -0.67239627034717564 31 -0.77983515672398607 32 -0.79673773769128808;
createNode animCurveTA -n "run_male:Neck_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.45126381855106951 1 0.16353406917764612
		 2 0.033262707412215084 3 0.30544039518907201 4 0.53136401039843872 5 0.50761217067944742
		 6 0.35946426697897321 7 -0.057527997525070498 8 -0.25708166630862461 9 -0.26659512454163764
		 10 -0.36716692103705673 11 -0.57688174889381061 12 -0.59320361809729238 13 -0.45410373324561815
		 14 -0.10559975295589948 15 0.42565247131949674 16 1.1340263204301322 17 1.8783160715234608
		 18 2.3575997157261224 19 2.7554803637276861 20 3.2345295089999966 21 3.5728517098813022
		 22 3.6735802600340137 23 3.6585214073177599 24 3.350821135864956 25 2.9359219348590413
		 26 2.4406475002167332 27 2.1048439204377534 28 1.916496130565108 29 1.6503026187493324
		 30 1.3219468727620631 31 0.8944443039845974 32 0.45126381855106951;
createNode animCurveTA -n "run_male:Neck_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.84348903350891891 1 -1.1697458204251516
		 2 -2.051567872894692 3 -4.7543171925846561 4 -7.6854914466994542 5 -8.2640876557218679
		 6 -8.261404371841861 7 -7.3873854376125765 8 -7.0980005238063395 9 -7.5559190929900879
		 10 -7.1413413795630607 11 -4.528144021794847 12 -3.7033250151377315 13 -3.5942712701666784
		 14 -4.0594970719012533 15 -5.5353821225927238 16 -7.1424982173087379 17 -8.6989769042754652
		 18 -9.4302859325644679 19 -9.7995927111420063 20 -10.101568290886043 21 -10.133294016539438
		 22 -8.1674160802552578 23 -5.5834358785837539 24 -2.9121683798698426 25 -0.6457141640126558
		 26 1.1537472820410519 27 1.4065028019626491 28 1.1721940341552124 29 0.59153541849412494
		 30 -0.20871198216004472 31 -0.62192942774928706 32 -0.84348903350891891;
createNode animCurveTA -n "run_male:Neck_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 16.770800623394464 1 17.323166501400252
		 2 16.442249485832658 3 16.400377302315878 4 16.095691290202204 5 14.750231123952567
		 6 13.496318566630496 7 12.89436616021931 8 12.943487120956748 9 14.253870916985846
		 10 14.519667145474843 11 14.117913153380341 12 14.423547168901516 13 15.560258356702921
		 14 15.665652295955562 15 15.661817729170421 16 15.873591028986004 17 16.180177637860069
		 18 14.65222090089728 19 12.408336132938663 20 11.452949977095171 21 11.044906165597711
		 22 10.958387865309158 23 10.871546966847459 24 10.680737932428562 25 10.739347523632818
		 26 11.583155595722072 27 12.590576308915688 28 13.728085957375928 29 14.674805685864126
		 30 15.471428193063844 31 16.17342301681413 32 16.770800623394464;
createNode animCurveTA -n "run_male:Head_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.34900689958949566 1 -1.4210285862973935
		 2 -2.0029753781053308 3 -1.8595168285649397 4 -1.6178471820668201 5 -1.3274237248686487
		 6 -1.2495038246955195 7 -1.9979091768443185 8 -2.7085115919081892 9 -3.1759205659317309
		 10 -3.4536652108717454 11 -3.5385086060493505 12 -3.5341488269352412 13 -3.3733257031579136
		 14 -2.8238298952704635 15 -1.8637169962949851 16 -0.54148332933177612 17 1.037374691560355
		 18 2.6804516571084127 19 4.3743470809354124 20 6.156495287927779 21 7.6452823024140697
		 22 8.6985419445109269 23 8.9575926752939576 24 8.5419445860923027 25 7.752324727260139
		 26 6.5846807579401352 27 5.7281410374900856 28 5.1469670219452839 29 4.1731954801313575
		 30 2.8823856454345216 31 1.2848206495289241 32 -0.34900689958949566;
createNode animCurveTA -n "run_male:Head_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.8086804137224135 1 -3.8041899183086221
		 2 -2.8892902772465274 3 0.24887229310906397 4 4.3384486923641425 5 6.2899372691758835
		 6 6.9732512642099689 7 7.0750316365443373 8 7.0792281144116869 9 6.9502778896029396
		 10 6.0966796242581145 11 3.5750292267579895 12 1.8444019532114311 13 0.76053537114866276
		 14 -0.13407910748567586 15 -0.67977465515276225 16 -0.6949435624608854 17 -0.69124557610312487
		 18 -0.44263714766633167 19 0.32857634913702433 20 2.1015531839206458 21 3.0252136908634699
		 22 2.9287103725332857 23 2.357045747432331 24 0.70300666216684071 25 -0.81327368244436327
		 26 -2.0476838032546789 27 -2.1576805423090146 28 -1.797215359066989 29 -1.6740003749299881
		 30 -1.6547776782403165 31 -2.4435984176560082 32 -3.8086804137224135;
createNode animCurveTA -n "run_male:Head_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -17.791519732227346 1 -18.22997753914197
		 2 -18.507522447748826 3 -19.351795060038572 4 -20.427269346652611 5 -20.878994808422789
		 6 -20.981437728585078 7 -20.879539517143634 8 -20.781810407313419 9 -20.726535104379984
		 10 -20.546348818375993 11 -20.23720932740455 12 -20.392802212949853 13 -21.007083363317374
		 14 -20.790851454369005 15 -20.209631189401964 16 -20.176937972681905 17 -20.170571254926116
		 18 -19.687835981426861 19 -19.219719668077804 20 -19.638039977352324 21 -20.257006431729295
		 22 -20.945410459927633 23 -21.078818739357981 24 -19.812428469652335 25 -18.71804196054638
		 26 -18.002938872355173 27 -17.989773389622961 28 -18.356783236521373 29 -18.434957133891203
		 30 -18.442635979788843 31 -18.204186671541045 32 -17.791519732227346;
createNode animCurveTA -n "run_male:Scapula_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.1307251692906871e-005 1 -2.1307251692906871e-005
		 2 -2.1307251692906871e-005 3 -2.1307251692906871e-005 4 -2.1307251692906871e-005
		 5 -2.1307251692906871e-005 6 -2.1307251692906871e-005 7 -2.1307251692906871e-005
		 8 -2.1307251692906871e-005 9 -2.1307251692906871e-005 10 -2.1307251692906871e-005
		 11 -2.1307251692906871e-005 12 -2.1307251692906871e-005 13 -2.1307251692906871e-005
		 14 -2.1307251692906871e-005 15 -2.1307251692906871e-005 16 -2.1307251692906871e-005
		 17 -2.1307251692906871e-005 18 -2.1307251692906871e-005 19 -2.1307251692906871e-005
		 20 -2.1307251692906871e-005 21 -2.1307251692906871e-005 22 -2.1307251692906871e-005
		 23 -2.1307251692906871e-005 24 -2.1307251692906871e-005 25 -2.1307251692906871e-005
		 26 -2.1307251692906871e-005 27 -2.1307251692906871e-005 28 -2.1307251692906871e-005
		 29 -2.1307251692906871e-005 30 -2.1307251692906871e-005 31 -2.1307251692906871e-005
		 32 -2.1307251692906871e-005;
createNode animCurveTA -n "run_male:Scapula_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.0005552369177469e-005 1 1.0005552369177469e-005
		 2 1.0005552369177469e-005 3 1.0005552369177469e-005 4 1.0005552369177469e-005 5 1.0005552369177469e-005
		 6 1.0005552369177469e-005 7 1.0005552369177469e-005 8 1.0005552369177469e-005 9 1.0005552369177469e-005
		 10 1.0005552369177469e-005 11 1.0005552369177469e-005 12 1.0005552369177469e-005
		 13 1.0005552369177469e-005 14 1.0005552369177469e-005 15 1.0005552369177469e-005
		 16 1.0005552369177469e-005 17 1.0005552369177469e-005 18 1.0005552369177469e-005
		 19 1.0005552369177469e-005 20 1.0005552369177469e-005 21 1.0005552369177469e-005
		 22 1.0005552369177469e-005 23 1.0005552369177469e-005 24 1.0005552369177469e-005
		 25 1.0005552369177469e-005 26 1.0005552369177469e-005 27 1.0005552369177469e-005
		 28 1.0005552369177469e-005 29 1.0005552369177469e-005 30 1.0005552369177469e-005
		 31 1.0005552369177469e-005 32 1.0005552369177469e-005;
createNode animCurveTA -n "run_male:Scapula_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.7472791986738114e-005 1 -2.7472791986738114e-005
		 2 -2.7472791986738114e-005 3 -2.7472791986738114e-005 4 -2.7472791986738114e-005
		 5 -2.7472791986738114e-005 6 -2.7472791986738114e-005 7 -2.7472791986738114e-005
		 8 -2.7472791986738114e-005 9 -2.7472791986738114e-005 10 -2.7472791986738114e-005
		 11 -2.7472791986738114e-005 12 -2.7472791986738114e-005 13 -2.7472791986738114e-005
		 14 -2.7472791986738114e-005 15 -2.7472791986738114e-005 16 -2.7472791986738114e-005
		 17 -2.7472791986738114e-005 18 -2.7472791986738114e-005 19 -2.7472791986738114e-005
		 20 -2.7472791986738114e-005 21 -2.7472791986738114e-005 22 -2.7472791986738114e-005
		 23 -2.7472791986738114e-005 24 -2.7472791986738114e-005 25 -2.7472791986738114e-005
		 26 -2.7472791986738114e-005 27 -2.7472791986738114e-005 28 -2.7472791986738114e-005
		 29 -2.7472791986738114e-005 30 -2.7472791986738114e-005 31 -2.7472791986738114e-005
		 32 -2.7472791986738114e-005;
createNode animCurveTA -n "run_male:Shoulder_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -12.023334294963693 1 -15.778006914113563
		 2 -22.011115196809051 3 -24.158953641731657 4 -27.351741909585773 5 -29.889425893572362
		 6 -31.489779239966101 7 -31.934354949398639 8 -31.937718986049127 9 -31.635962819734768
		 10 -31.104219988594288 11 -30.347287359218601 12 -29.032511808899759 13 -27.314614216271998
		 14 -26.329835336999277 15 -25.798533144776531 16 -25.437168840992378 17 -24.779026219333282
		 18 -22.661595650061571 19 -19.965116866587906 20 -17.252498914596458 21 -14.563543838296377
		 22 -11.988815512781754 23 -9.6853690146895328 24 -7.6897458641444825 25 -6.1983422251913689
		 26 -5.2472049027293703 27 -4.6954892185206756 28 -4.5288048557559062 29 -4.972071863314043
		 30 -6.7906279932107152 31 -9.1436997451453355 32 -12.023334294963693;
createNode animCurveTA -n "run_male:Shoulder_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -10.916344483776223 1 -11.270640567556736
		 2 -12.806547259955689 3 -14.975965583213162 4 -18.540151686995781 5 -21.795217515394988
		 6 -25.200198992141075 7 -28.799136175125451 8 -32.042122014680047 9 -34.83019433209904
		 10 -36.908221811576844 11 -38.256163045295899 12 -39.074956640569823 13 -39.375815848765932
		 14 -38.103516423080535 15 -34.013577525226992 16 -29.784581487785662 17 -25.171505075428325
		 18 -20.65533302277683 19 -16.414984093391531 20 -12.670736465855644 21 -9.7768092003644167
		 22 -7.8853022342091057 23 -7.4103787057768056 24 -7.545840820412721 25 -8.1884546756807008
		 26 -9.460060486444382 27 -10.8273573602557 28 -12.192237435909371 29 -12.479423315361316
		 30 -12.514879467631978 31 -11.929541822030778 32 -10.916344483776223;
createNode animCurveTA -n "run_male:Shoulder_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -60.645020086903259 1 -63.263830521093112
		 2 -67.318698597306607 3 -67.783648802693904 4 -68.157360128597006 5 -67.195324697108106
		 6 -65.172357587906248 7 -62.109871902173118 8 -58.891029529408797 9 -55.68718443441319
		 10 -52.82063949890621 11 -50.333777440874215 12 -48.973112932736719 13 -48.636370811860672
		 14 -49.44327847943557 15 -52.182790358646002 16 -55.458610966267138 17 -59.13662060550763
		 18 -62.644949778102763 19 -65.443563414108823 20 -66.700081053492681 21 -66.94156850524223
		 22 -66.499121633496884 23 -65.243230663621972 24 -63.045867336432934 25 -60.580478769374096
		 26 -57.905914383130913 27 -55.763037634546869 28 -54.241233257931547 29 -54.407511577401657
		 30 -55.792770815746586 31 -57.979370325822543 32 -60.645020086903259;
createNode animCurveTA -n "run_male:Elbow_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 74.270845665396379 1 82.049770617628766
		 2 79.254055612031991 3 80.436953647310318 4 81.9432964016341 5 82.574430705411061
		 6 82.724425790412283 7 82.668031955266613 8 81.927659751748905 9 77.371290936907641
		 10 74.049621518745695 11 72.336761186749968 12 69.312585459386483 13 65.698903586441759
		 14 66.000645331419051 15 67.99081300043234 16 70.74263621332048 17 72.991166729016541
		 18 73.107716179930279 19 73.120503557853539 20 72.683011389699288 21 71.177677964558683
		 22 68.328281052881195 23 64.843949568514574 24 60.808432271869265 25 57.104485843418814
		 26 53.8417510603213 27 51.650603097524289 28 50.554686277214827 29 51.745711140160275
		 30 57.125679488630944 31 65.039564557255247 32 74.270845665396379;
createNode animCurveTA -n "run_male:Wrist_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -17.172047903300896 1 -12.464185824957205
		 2 -3.7636981552397364 3 5.3712962628802119 4 17.022768312203038 5 21.247245069942672
		 6 23.972115847456589 7 26.448373552119683 8 27.959521508223613 9 28.418369121796179
		 10 27.433704159453487 11 21.355506113323976 12 14.744158021696965 13 7.8752666582939046
		 14 4.2928096254626809 15 3.2612890764159865 16 4.2613710215156564 17 5.7329195391290062
		 18 5.7385124771344413 19 5.7274097975435465 20 5.6964976309195139 21 5.446471507612106
		 22 2.7199450941458885 23 -0.39143649385814916 24 -2.7995232206374401 25 -6.5101477964939125
		 26 -11.825940199418191 27 -16.208260409891345 28 -19.583097622656314 29 -21.332638354513204
		 30 -21.689395143292437 31 -20.529044454918221 32 -17.172047903300896;
createNode animCurveTA -n "run_male:Wrist_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 10.324893942004572 1 4.1808348908173265
		 2 3.4854427462685531 3 0.45796284773716028 4 -2.8977025217024139 5 -3.6066797924382006
		 6 -3.6244726866961461 7 -2.4835698845699978 8 0.24624430866995892 9 5.0752512521769635
		 10 5.904607485633516 11 4.0742177413377743 12 1.9488006058928642 13 -0.79648929655696055
		 14 -6.5510834956826685 15 -14.313271817693812 16 -23.114611615312132 17 -29.359226288871504
		 18 -25.756226309134298 19 -19.052701473041804 20 -12.794810834979687 21 -6.418925535319028
		 22 -0.080720427014632209 23 5.4823801958084273 24 10.000527734066113 25 13.771757415815951
		 26 16.902434790342493 27 17.221553166553647 28 16.216924390748471 29 14.634806280935363
		 30 12.640449999137976 31 11.647911751815535 32 10.324893942004572;
createNode animCurveTA -n "run_male:Wrist_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 16.456415964749361 1 16.681578736592783
		 2 14.137662304415864 3 -0.25489782067400635 4 -14.885355151352329 5 -17.142924305365455
		 6 -17.10330685650678 7 -12.521753352800665 8 -7.3304639258888615 9 -2.5093510270933534
		 10 0.73494875626684475 11 2.2920959795292521 12 3.4493302209866585 13 4.2807160064216969
		 14 5.6651632643119463 15 7.4123877848337258 16 9.6899808947325621 17 11.384663845940048
		 18 9.9753874719451634 19 8.5629505809621644 20 9.4225240491015541 21 10.126904374975441
		 22 10.173480441820542 23 10.246045040241764 24 10.358872947283201 25 10.906035157979401
		 26 12.13614046280528 27 14.600638121625336 28 17.983923185914602 29 17.699740591243831
		 30 16.01934771686285 31 16.079211057569363 32 16.456415964749361;
createNode animCurveTA -n "run_male:Hip_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.5840818835211148 1 -3.043143088927406
		 2 -3.0024573156171459 3 -2.5322840295273661 4 -2.02887058007363 5 -1.9579324982734578
		 6 -1.8995199751991232 7 -1.7672571361455187 8 -1.6679963122583708 9 -1.6177715201362783
		 10 -1.654939496898211 11 -1.8608018907321 12 -1.8180655041714746 13 -1.4388744597850029
		 14 -0.89905883528072361 15 -0.21866373338187373 16 0.49415752550410097 17 1.1815576500361429
		 18 1.7661102083967746 19 2.0479670363833735 20 1.8925932503499776 21 1.2809994390874302
		 22 -0.05237275289816843 23 -1.1852826146003144 24 -1.8755724217061771 25 -1.9530907383162139
		 26 -1.6046499717635636 27 -1.5486072264435173 28 -1.6552304798778223 29 -1.783539370041918
		 30 -1.9521772397274046 31 -2.2307331473791643 32 -2.5840818835211148;
createNode animCurveTA -n "run_male:Hip_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.80434013694072759 1 -1.6858174879405885
		 2 -4.0018524175277923 3 -3.1699313618739882 4 -1.9945220098884129 5 -1.1299834964606734
		 6 -0.82654327340444056 7 -0.83824616621128001 8 -1.0688090794759419 9 -2.4863961135306507
		 10 -2.7971839100235121 11 -2.1418858988886869 12 -0.54938562041446737 13 1.8496092771096981
		 14 4.1937449423054085 15 6.500389343813473 16 8.5627918017193849 17 10.207177989534328
		 18 10.962084482729646 19 11.113866968595353 20 10.098249756854877 21 8.475658571274483
		 22 6.6289465878252578 23 5.3014845624646165 24 4.81851795764321 25 4.7739011633544619
		 26 4.8330947643673197 27 4.7514549695681154 28 4.3995511863188712 29 4.3516168260198036
		 30 4.3510378687736306 31 3.3488833685347772 32 0.80434013694072759;
createNode animCurveTA -n "run_male:Hip_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -30.452404986436584 1 -26.471056462765251
		 2 -18.099625763478759 3 -15.111308786396116 4 -11.016794516824877 5 -8.8083331396561615
		 6 -6.9990505011788935 7 -5.3145764983612622 8 -4.1304976151439456 9 -3.5000083607684154
		 10 -3.5015314696285595 11 -4.3375391547431867 12 -6.0425581373533364 13 -8.6525628224804283
		 14 -12.555016732726237 15 -17.469198725757646 16 -22.718153815864596 17 -28.115033871487181
		 18 -33.282850039191352 19 -37.661269232786239 20 -40.822306144153956 21 -41.911931918330282
		 22 -41.889874249463311 23 -41.750910718951687 24 -41.149807110172489 25 -40.080044102856078
		 26 -38.534807926604287 27 -37.081948788579226 28 -35.723666246805593 29 -34.363602711285196
		 30 -33.008002849927308 31 -31.878514692019266 32 -30.452404986436584;
createNode animCurveTA -n "run_male:Knee_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -7.2668932817994358 1 -6.556918035953788
		 2 -5.965755523179058 3 -6.0344826499708706 4 -6.2717829759845261 5 -6.8515652687929354
		 6 -7.1111540536356914 7 -6.9667050666049049 8 -6.5499543996206517 9 -5.8410346038426439
		 10 -4.9466654323690102 11 -3.8677692789533227 12 -2.1284764376270786 13 0.14392890176656639
		 14 2.1710017316998735 15 3.9547378462820744 16 5.1461807911209165 17 5.9349056474604946
		 18 6.5932316349495492 19 6.8766937940244182 20 6.7524866702274755 21 5.9097349607523277
		 22 2.5107138758698784 23 -1.478575471264109 24 -5.4836371777627022 25 -8.2017973583090082
		 26 -9.3822797761564356 27 -9.8299910755305167 28 -9.9352980485949676 29 -9.8595120234423135
		 30 -9.4206047353154041 31 -8.4508994382550124 32 -7.2668932817994358;
createNode animCurveTA -n "run_male:Knee_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -9.0254102272214585 1 -9.4101410293091696
		 2 -8.4854317774316375 3 -6.6417810571060105 4 -4.1862063846961757 5 -2.9907352063237114
		 6 -2.1917518474439994 7 -1.6550807626798982 8 -1.6348421972409382 9 -2.7338960731296753
		 10 -4.7598493339642891 11 -7.6627602678089994 12 -9.7229655301658209 13 -11.015434522647352
		 14 -11.591358345767425 15 -11.713409112684088 16 -11.883241071651039 17 -12.180292649551792
		 18 -12.986286218926493 19 -14.058982489854076 20 -15.300283554973481 21 -16.564868291557044
		 22 -17.977326989443025 23 -18.390583178557051 24 -17.36281526844364 25 -14.847499227862517
		 26 -10.704090624592851 27 -8.2845185086467854 28 -7.5804423790137765 29 -8.1691077337832567
		 30 -9.7266570669439325 31 -9.5309976447375391 32 -9.0254102272214585;
createNode animCurveTA -n "run_male:Knee_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 45.969444436448505 1 48.345085685024273
		 2 48.373202090092569 3 46.587321417841686 4 43.868058774307364 5 41.301388858551384
		 6 40.317694062654105 7 40.612347518736499 8 42.139892737487529 9 45.820849243129281
		 10 50.692527924100574 11 56.668388218143491 12 63.14998727736716 13 70.111902037164455
		 14 77.39833383152002 15 84.611001991137044 16 91.006887516226101 17 94.998233622436672
		 18 95.271345191178057 19 95.291939706551702 20 91.768003604126889 21 84.462085114726705
		 22 73.867916869255296 23 62.984607224271507 24 52.79014024096783 25 43.402537270554149
		 26 34.797968132334674 27 30.196457691091904 28 29.146115506100884 29 30.744649371038783
		 30 36.316273015500379 31 41.365652332231953 32 45.969444436448505;
createNode animCurveTA -n "run_male:Ankle_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 22.419555769894124 1 25.729144961737934
		 2 28.203656027328432 3 22.754886045096917 4 16.113824791464914 5 14.492526682289798
		 6 13.882657018737463 7 13.451105479306463 8 13.112125564205545 9 12.740098369300709
		 10 13.034349517726188 11 14.896884635991555 12 15.696880768828745 13 15.835597640612624
		 14 15.827182221210132 15 15.694305470584194 16 14.918429625385746 17 13.647540794669013
		 18 12.63717166792522 19 12.126011532303378 20 13.014410105513786 21 15.802766110105013
		 22 21.07107313512342 23 26.672652357785289 24 32.139528898924532 25 36.322890815751727
		 26 39.070759781056054 27 38.331466335072164 28 32.965669756309289 29 28.075249498412564
		 30 23.831767108231865 31 22.612017454874419 32 22.419555769894124;
createNode animCurveTA -n "run_male:Ankle_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 6.1112467475947216 1 11.363607002563574
		 2 13.787363919384998 3 10.524830508898196 4 4.0498836864469219 5 -4.8521081013204341
		 6 -11.779029724876249 7 -14.082707071363851 8 -15.461037438461457 9 -16.506990567201683
		 10 -17.205930178989082 11 -17.580465370498054 12 -17.604760293697318 13 -17.565673334943082
		 14 -18.265768731975147 15 -19.734685958109992 16 -19.669604555056491 17 -19.403997224570368
		 18 -19.292795491958561 19 -18.950169586984526 20 -15.56645147590603 21 -10.973225578259566
		 22 -6.8934014679069593 23 -2.7229635762440636 24 2.0901450857326869 25 1.9942780851721804
		 26 -5.5648702593786252 27 -6.9013354729694134 28 -5.0032181425967428 29 -1.5595552387302698
		 30 2.8503451816554635 31 4.7970594684417964 32 6.1112467475947216;
createNode animCurveTA -n "run_male:Ankle_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -20.487914806629945 1 -23.354503467266667
		 2 -25.008826372733271 3 -23.378702394956207 4 -18.874768339400688 5 -10.632396510939557
		 6 -3.2614031847678655 7 1.1242332635096979 8 3.8643207045471755 9 5.0415405513302005
		 10 5.0944939018611235 11 4.748220953500331 12 4.9991174763350692 13 6.3249818302003282
		 14 7.7201089745134741 15 9.2591299376455574 16 11.066378622271683 17 12.348541457416747
		 18 10.539401249418205 19 7.6037546028069407 20 5.3194693674906315 21 4.3870932259616842
		 22 4.4373463251881038 23 5.0897015220860098 24 9.5918653550648596 25 10.63626467807665
		 26 7.7184069516587845 27 5.2237446302213328 28 3.0241081921394461 29 -1.692592962531007
		 30 -8.2415497336724393 31 -14.696692510095268 32 -20.487914806629945;
createNode animCurveTA -n "run_male:Toes_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -6.0007792567426899 1 -6.5235153436274471
		 2 -8.9448214344582535 3 -14.162712913705468 4 -23.127413219459111 5 -34.324067637460971
		 6 -38.100233242958986 7 -23.142741016105067 8 -11.064396747460842 9 -6.5188565660244757
		 10 -5.9431693323765353 11 -5.9872940292636425 12 -5.9948067530751956 13 -5.9947749340351448
		 14 -5.9948035807450468 15 -5.9948696363647933 16 -5.9948686814664924 17 -5.9948637644030622
		 18 -5.9948444874815179 19 -5.9948253729630716 20 -5.9956544382347605 21 -6.0010838519891214
		 22 -6.1564842334993344 23 -7.233185982231225 24 -11.205009181339809 25 -12.064419470350236
		 26 -10.02478675567467 27 -9.7254737413167884 28 -10.255740327271173 29 -9.3690420232748188
		 30 -6.7389689455866773 31 -6.0937430736400557 32 -6.0007792567426899;
createNode animCurveTA -n "run_male:Hip_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.9743901308430167 1 2.0117584149508958
		 2 2.3359873865717558 3 2.1287478130550674 4 1.4643230803101803 5 0.20561908704202891
		 6 -1.1869807521950428 7 -2.7214344336318126 8 -3.2799856252679822 9 -3.2991515931071826
		 10 -3.5301020836763217 11 -4.2492110042880746 12 -4.9651932612551581 13 -5.6954940715915017
		 14 -6.4346368009633705 15 -7.1930671829026576 16 -8.1514288240924806 17 -8.8695498433614937
		 18 -8.8977641227236344 19 -8.9247240096847449 20 -9.2958199106324013 21 -9.4552364181570674
		 22 -7.2027523415471082 23 -5.2155034598476488 24 -4.6003642994950447 25 -4.0160963963921477
		 26 -3.3505348405495776 27 -2.3927383853014854 28 -1.1910090434417744 29 -0.60489299687730425
		 30 -0.36574559826111375 31 0.78355268387158428 32 1.9743901308430167;
createNode animCurveTA -n "run_male:Hip_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 7.6707873429049984 1 8.3808298029104993
		 2 7.7883556337607791 3 5.949604909108233 4 3.5005155693459269 5 2.3877069054845261
		 6 1.4094519056643524 7 0.28550616919321953 8 -0.72833817621499075 9 -1.5689301380419451
		 10 -2.6433110399023185 11 -3.9770830061640701 12 -5.4385690024922413 13 -7.0166598508750031
		 14 -8.6695679299739563 15 -10.271029862870552 16 -11.356720088739261 17 -12.063962582718629
		 18 -12.4628995950424 19 -12.565479834017593 20 -11.288139662220612 21 -8.7619033364353616
		 22 -4.9793638257301049 23 -2.2962072780862171 24 -1.7148835019159259 25 -1.1375462415897775
		 26 -0.33700044862642109 27 0.97003141649701075 28 2.6782847923648108 29 3.2051070521378451
		 30 3.2914987700229479 31 4.9723427445059807 32 7.6707873429049984;
createNode animCurveTA -n "run_male:Hip_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -4.559158278739516 1 -10.828576709862064
		 2 -21.12592266580549 3 -25.395179139552734 4 -30.840064266752847 5 -33.147903580409356
		 6 -33.667614528636477 7 -32.887424913240871 8 -31.679005095810062 9 -30.120659655736112
		 10 -28.717439420937115 11 -27.516873243608273 12 -26.998977159079875 13 -26.922134331037309
		 14 -26.323335445103652 15 -25.27895589992205 16 -23.845630481173195 17 -21.572648618394837
		 18 -17.214877269328387 19 -12.309560514376889 20 -8.2635307192547387 21 -4.3145726324396536
		 22 -0.065939318040894285 23 3.4517475841012315 24 5.9711218948927254 25 7.3804781151059817
		 26 7.757465754866038 27 7.6150451022929868 28 6.6947464234945127 29 5.4499367302280932
		 30 3.632102175517288 31 0.12068823614107893 32 -4.559158278739516;
createNode animCurveTA -n "run_male:Knee_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 4.943163678203172 1 4.943163678203172
		 2 4.7347368111293635 3 4.339754293514023 4 3.5038288148022527 5 2.438498740264357
		 6 1.0262060824852279 7 -0.93422592588209796 8 -2.3039775393677049 9 -2.7815615018190112
		 10 -3.2003424955115789 11 -3.6083019162775338 12 -3.8772451986095819 13 -4.0382830515627246
		 14 -4.3253298114725292 15 -4.668577340406376 16 -4.8527749129976883 17 -5.1063885391347554
		 18 -5.8306985759543535 19 -6.7740578741489301 20 -8.0643062468279538 21 -8.6116469154011579
		 22 -6.8929842393527787 23 -5.3416058400950339 24 -4.8185852510683462 25 -4.0951543657348672
		 26 -3.0577751027102367 27 -1.4887320992658102 28 0.53752762723026759 29 1.8179316171582134
		 30 2.6098112917771092 31 3.9461389118014165 32 5.0899612191471961;
createNode animCurveTA -n "run_male:Knee_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.3061775411372611 1 -3.3085633770479488
		 2 -3.0522587482945416 3 -2.6207585244732545 4 -2.2642223019687293 5 -2.3594834691057938
		 6 -2.3415201994525274 7 -0.81137940096173689 8 1.5805980330213993 9 4.7573207474558021
		 10 6.7462815446946989 11 7.4053759903835825 12 7.0108330133678765 13 5.3368907249484527
		 14 4.2826031329843364 15 3.3977082680631243 16 1.5534874733322994 17 0.024872133450066395
		 18 0.65741461931941358 19 1.7341074752211829 20 2.3979929636173432 21 3.373862990816475
		 22 5.1549818391386726 23 6.6205070236355636 24 7.493941060062606 25 7.3358317484502287
		 26 4.8901066817845322 27 2.2091093564457025 28 -0.59303438705955014 29 -2.4595277689046
		 30 -3.4132678165384331 31 -3.4350592225173537 32 -3.3810389520573119;
createNode animCurveTA -n "run_male:Knee_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 77.419042775271436 1 77.712499746311977
		 2 85.578428921626966 3 84.092789210159339 4 79.775850320892374 5 72.316134619381415
		 6 63.30378710863522 7 52.921761521728627 8 43.991954353553908 9 37.125804276573675
		 10 32.794165985147103 11 31.048685142982613 12 31.773058806274978 13 35.527058678350706
		 14 39.741589449894775 15 44.396146968884672 16 48.925591201021867 17 51.860246018439071
		 18 50.641236551346388 19 48.038129830496942 20 45.260480363892249 21 41.222225480250145
		 22 34.70676817287849 23 29.748844253990907 24 27.579675142185753 25 27.574952791523945
		 26 30.34135184372985 27 34.587810654653119 28 40.244338900023983 29 46.675357497957897
		 30 53.897828863907186 31 62.035824136372206 32 70.294768136248649;
createNode animCurveTA -n "run_male:Ankle_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 12.611385575234822 1 11.613497229779213
		 2 11.459512532461154 3 10.961513600150875 4 10.305145593903847 5 10.039002697597322
		 6 9.7817520249298973 7 9.5807755384391768 8 8.3088840500241012 9 4.6316788288708377
		 10 3.7320718579232937 11 3.8148267816052943 12 4.4782966731342109 13 6.6454290089309271
		 14 9.4237672086913058 15 12.745589452287561 16 16.615722410350653 17 19.369702759607748
		 18 19.289425346236523 19 18.583421066413162 20 16.968454806938976 21 14.471075909277889
		 22 10.106985229556624 23 8.6744877933710498 24 10.993306520625161 25 13.410998742187596
		 26 15.64757837941626 27 15.997784083298649 28 15.890941929991033 29 16.283879919436625
		 30 17.303162123411994 31 15.843248172911006 32 12.611385575234822;
createNode animCurveTA -n "run_male:Ankle_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -34.374646767467929 1 -31.588971056450614
		 2 -26.209064246385982 3 -26.015824925812989 4 -25.891424387810943 5 -28.268752430271938
		 6 -31.497409040727185 7 -35.024896872339838 8 -35.559307483696685 9 -30.398403174720872
		 10 -23.743711181159487 11 -15.937420158627203 12 -9.6552484578036388 13 -4.745369589688762
		 14 -0.888237203125817 15 1.9355506014146591 16 3.9679758039122444 17 4.9060449966951447
		 18 4.0782718469210923 19 0.43120155731897075 20 -7.5351372448782197 21 -16.513826882433062
		 22 -24.934921738048363 23 -32.606535945821328 24 -40.009962193153775 25 -41.625314379737198
		 26 -40.630197663243202 27 -39.24098442056394 28 -37.534683061509398 29 -36.536442893936375
		 30 -36.009350543497419 31 -35.356791367263696 32 -34.374646767467929;
createNode animCurveTA -n "run_male:Ankle_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 8.9662048411217121 1 7.6387529338872868
		 2 4.8076507205081871 3 4.8866484298987709 4 4.9337423354979624 5 3.7352540076085043
		 6 2.2795087380266903 7 1.4297271077866849 8 -0.61491552933735838 9 -4.3627891380072157
		 10 -7.3715701934313174 11 -9.503243853763216 12 -12.244750666354701 13 -15.55067178293856
		 14 -19.690356515064877 15 -24.079175761611744 16 -26.801186515812518 17 -28.425085015848282
		 18 -29.22136093532556 19 -29.355762501049977 20 -27.979357262382436 21 -22.379648040219173
		 22 -9.98816749943113 23 0.17067887128970888 24 5.0310609035832776 25 8.7396718037773109
		 26 11.714906856605889 27 13.063700709679527 28 13.360585053463826 29 12.829984057021676
		 30 11.088365357010385 31 9.9402100564437834 32 8.9662048411217121;
createNode animCurveTA -n "run_male:Toes_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.9946923283555336 1 -5.9946646648089299
		 2 -5.9946088922898291 3 -6.0002123303263843 4 -6.0647770614646186 5 -7.9888164195275042
		 6 -11.432732522435346 7 -16.85839627669408 8 -18.061551716731358 9 -13.42846962089782
		 10 -9.6981184484281791 11 -7.2913873016021018 12 -6.2223143859704333 13 -5.9989247211237737
		 14 -6.0278953962637134 15 -6.4450125525716082 16 -8.7771695893414208 17 -12.542621535761052
		 18 -14.862865387086091 19 -17.182286093790257 20 -20.148885798005267 21 -23.988389132569985
		 22 -30.267603324433882 23 -32.022457928962901 24 -25.150279390517191 25 -16.816967281940531
		 26 -7.5712948653174097 27 -5.9511852570770927 28 -5.9896623778479885 29 -5.9946918241494833
		 30 -5.9947003946592652 31 -5.9946974772662038 32 -5.9946923283555336;
createNode animCurveTL -n "walk_angry:Root_M_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.25819968792406151 1 -0.26204687929124298
		 2 -0.26882483860908829 3 -0.27051744769988501 4 -0.27119577391349853 5 -0.27119145068450201
		 6 -0.26657990700924539 7 -0.255485359481184 8 -0.23629118666150128 9 -0.2059755173108351
		 10 -0.1711105771841242 11 -0.1326171416081654 12 -0.091529213805221415 13 -0.062737305437895505
		 14 -0.046574416926391166 15 -0.043128066264924929 16 -0.048082843757339767 17 -0.056629200305222387
		 18 -0.065259556653357365 19 -0.070684907370480762 20 -0.074272540524736058 21 -0.075688413253776704
		 22 -0.071908656367536544 23 -0.071373240756253814 24 -0.074343209760524248 25 -0.09005521486384227
		 26 -0.11558028206770593 27 -0.14685164469027334 28 -0.17986921857534582 29 -0.21013377393633043
		 30 -0.23494577649281045 31 -0.25208926040276147 32 -0.25819968792406151;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTL -n "walk_angry:Root_M_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.921304829785865 1 5.99102466321599 2 6.072768597269727
		 3 6.1199341473044919 4 6.1338512586563994 5 6.1268623749546096 6 6.0748227985737149
		 7 5.9961690057083974 8 5.9084252788573011 9 5.831289414350997 10 5.7686055181004328
		 11 5.7371609937508481 12 5.7329384948251061 13 5.7667650866256093 14 5.8517793238991267
		 15 5.9623341230517664 16 6.065411209789521 17 6.1498399665414718 18 6.2054819918749411
		 19 6.2208057785450768 20 6.2011029125143962 21 6.1129442540513326 22 6.001527408264991
		 23 5.8914109388558522 24 5.7925238570063868 25 5.713371190029009 26 5.6630075256910715
		 27 5.6494130092252171 28 5.6632547829752307 29 5.7086634829092713 30 5.7740114562603564
		 31 5.8502123656723306 32 5.921304829785865;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTL -n "walk_angry:Root_M_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.16224233538346572 1 0.15811391709317937
		 2 0.17825202850558167 3 0.15534488300023608 4 0.13267511369936788 5 0.12294241367797712
		 6 0.12413706453726771 7 0.1353568757429372 8 0.15924288581434004 9 0.18572593358547518
		 10 0.19324731894948199 11 0.1913322452200695 12 0.15631412908070191 13 0.10837645336924875
		 14 0.058473660921097362 15 0.01557378010722682 16 -0.014839580952287726 17 -0.038101426965306835
		 18 -0.055702454253224967 19 -0.066729171072983984 20 -0.064569306766147486 21 -0.041897825487589302
		 22 0.000103362014046815 23 0.046286210801784439 24 0.094653530744678846 25 0.14514213358150715
		 26 0.193605678566933 27 0.23557968220523015 28 0.26613036219627817 29 0.26508620391248422
		 30 0.2424613587291726 31 0.19435152960891083 32 0.16224233538346572;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_angry:Root_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.7197530959348264 1 1.0278386984921541
		 2 0.19614458936778711 3 0.18714740387164397 4 0.27293506699848286 5 0.70099164378548984
		 6 1.3139252354750566 7 2.0665850311161238 8 2.8879950473369393 9 3.695338155238868
		 10 4.3145103497992778 11 4.7098797523726192 12 4.8479596156062135 13 4.7889715831257762
		 14 4.7469130270526882 15 4.7794633678835172 16 4.9759604495768226 17 5.3987533591726695
		 18 5.9858827621351924 19 6.547998726840782 20 7.1081808424435415 21 7.4570919587950533
		 22 7.4053292908927828 23 7.0740682710226199 24 6.4500672732919586 25 5.6694289647310239
		 26 4.9930617156090342 27 4.4129072111991814 28 3.9159735034949055 29 3.4416033607569303
		 30 2.9344648666045741 31 2.3576649765388313 32 1.7197530959348264;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_angry:Root_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -4.1833022654325704 1 -4.1024765676531851
		 2 -3.3272728906432598 3 -2.7310548699402819 4 -2.1724684521312767 5 -1.9567141698464459
		 6 -1.9635282956176296 7 -1.9981649531969483 8 -2.0182491204544983 9 -1.7779555907408342
		 10 -1.4187705155972472 11 -0.90164689470375659 12 -0.18690872333911812 13 0.50407443651518891
		 14 1.0109851417007114 15 1.2151370005414639 16 1.0054232378211201 17 0.54915438991032262
		 18 0.03038761824993445 19 -0.11792917960197918 20 0.20773415781277038 21 1.4602492884587239
		 22 2.676480655939991 23 3.4592846484069839 24 3.6783145528305332 25 3.2144903128145992
		 26 2.2764783408611509 27 1.0616679043096708 28 -0.23515665958445586 29 -1.4589006879975017
		 30 -2.6420084845383065 31 -3.7385847492330782 32 -4.1833022654325704;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_angry:Root_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 3.2755519394132184 1 2.9586945774972242
		 2 2.4993110728817567 3 2.2814480954687619 4 1.97377556023534 5 1.6654177639006094
		 6 1.3950088662279649 7 1.1912516040420684 8 1.0428174654267253 9 0.92499318498061545
		 10 0.85412281423800251 11 0.84208444846586883 12 0.92316778384633846 13 1.0082988162810769
		 14 1.1170304266387947 15 1.2619641699139574 16 1.4844719649909892 17 1.7228915534506923
		 18 1.9073284166053301 19 1.9290128845229559 20 1.9005564267799351 21 1.8378939789975977
		 22 1.8673133720435617 23 1.9738581976240237 24 2.1583465525162833 25 2.4159944645006095
		 26 2.7950841818746013 27 3.2248807562201027 28 3.6310822040190533 29 3.7956229101907466
		 30 3.7810639876786123 31 3.5404269971334501 32 3.2755519394132184;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_angry:Spine1_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -9.6175987499797273 1 -5.5186885292322101
		 2 -0.058493627860920855 3 2.4368292018371891 4 5.079081035389212 5 6.9771165164679108
		 6 8.4062789853006077 7 9.3341009628487281 8 9.6271117029027575 9 9.237333753711777
		 10 8.4933575506514227 11 7.3117775941603513 12 5.6055169319078502 13 3.5595783161242069
		 14 1.1237177831498029 15 -1.6883907358333459 16 -4.4995511494448763 17 -7.4418336852168041
		 18 -10.459164742973403 19 -13.096251289587411 20 -15.912598998875355 21 -18.68061845315486
		 22 -20.545082606218681 23 -21.843307623056834 24 -22.421519628064516 25 -22.488381387165489
		 26 -22.199206810879339 27 -21.31942678457774 28 -20.112886002150876 29 -18.439095852189411
		 30 -16.156675576357703 31 -13.187090940670672 32 -9.6175987499797273;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Spine1_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 10.999540683939898 1 9.5158788867844564
		 2 6.7270680771313245 3 4.3881332170672982 4 1.8950541606065565 5 0.10310066111212567
		 6 -1.1538095605151353 7 -2.1051785045367666 8 -2.8807783428467371 9 -3.6415929825119306
		 10 -4.3427793236316585 11 -5.0468184445396007 12 -5.8101919592454667 13 -6.2484694405958399
		 14 -6.2622697189909324 15 -5.4293730278398913 16 -3.9654161599961975 17 -2.039831824704041
		 18 0.095005214373291971 19 1.8197604928221438 20 2.7580538476815541 21 2.9195875340855704
		 22 2.6546497858767784 23 2.7196985635837225 24 3.3918026122405274 25 4.7160422733099576
		 26 6.2716228722617613 27 7.8477161997919671 28 9.2379916879412676 29 10.305914544457336
		 30 11.083241400550719 31 11.538768970962476 32 10.999540683939898;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Spine1_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.8522336016272529 1 4.1549522983964602
		 2 5.7018997303815011 3 6.102805529970265 4 6.4580761879883495 5 6.5782892652159735
		 6 6.495480850611564 7 6.2638286472367604 8 5.958143625822931 9 5.6923960072925217
		 10 5.4408387280602399 11 5.3283835477993486 12 5.3236750207262205 13 5.5496619485996987
		 14 5.8845365405934817 15 6.057104432219119 16 5.8722506552611149 17 5.464453155488866
		 18 4.9545495578721059 19 4.5683729843656478 20 4.0337144466537884 21 3.3511801494757965
		 22 2.6627494648188299 23 1.920740837814277 24 1.1432562786654408 25 0.35545104175773878
		 26 -0.35593204719615895 27 -0.85580051447347516 28 -1.0106752360332327 29 -0.67864484801401237
		 30 0.24801356906072561 31 1.5496195630094609 32 2.8522336016272529;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Spine2_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 3.7604997234821056 1 2.2124993331407428
		 2 0.14890657200435245 3 -0.82797061872751188 4 -1.8643164469115447 5 -2.6088180907518495
		 6 -3.1599218778308451 7 -3.530486417494739 8 -3.6571566015725985 9 -3.5495205654854525
		 10 -3.2990446911496596 11 -2.8689731335792703 12 -2.2219711658214929 13 -1.426251941371625
		 14 -0.44813329769552501 15 0.7139678558129029 16 1.8951396722020515 17 3.1164435419140513
		 18 4.3386436424309567 19 5.3710444471825127 20 6.4099141438778195 21 7.3985254911864784
		 22 8.0946631871391048 23 8.6053765047413293 24 8.9137874513994237 25 8.9876651875113147
		 26 8.8641187801474413 27 8.4674172232129372 28 7.8985841720831624 29 7.165762500231267
		 30 6.2430209973818487 31 5.1151988191954656 32 3.7604997234821056;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Spine2_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.9569254871819037 1 -3.0025550868379516
		 2 -1.7528280465244912 3 -0.84605184758198271 4 0.12100845353799239 5 0.83028468099097397
		 6 1.3819558857470096 7 1.8310356852807401 8 2.2287518620923699 9 2.6458276923332442
		 10 3.0359317596211675 11 3.3797817404539399 12 3.6534121065569964 13 3.6422910878799915
		 14 3.4142766368127884 15 2.7757985528784053 16 1.9156298096294035 17 0.90536453886828117
		 18 -0.1580986863944048 19 -1.0343029585276238 20 -1.8225427513011248 21 -2.4863921839940542
		 22 -2.8755905679781546 23 -3.2329373077102526 24 -3.6245515116379861 25 -4.1186710495007706
		 26 -4.62532267938444 27 -5.076759138030444 28 -5.4009150852206043 29 -5.4025617564567741
		 30 -5.2737427800249606 31 -4.7507387310708191 32 -3.9569254871819037;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Spine2_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 4.7389954941056791 1 4.4579342974102074
		 2 4.0367627209546795 3 3.8908289360475257 4 3.724996728308875 5 3.6065794897924515
		 6 3.5648653173893456 7 3.584342115971062 8 3.6476896681153446 9 3.7075219655335157
		 10 3.7749451173303687 11 3.8405875242838228 12 3.8940696541252175 13 3.8790451225830767
		 14 3.8714200867206392 15 3.9279088376196984 16 4.0679312175007833 17 4.2189787640588641
		 18 4.3368346445314039 19 4.3588408759221711 20 4.3933952351630143 21 4.4675311630921879
		 22 4.5987425375321687 23 4.7679991081430826 24 4.9585654477782883 25 5.1486575019594349
		 26 5.3311789022425078 27 5.4715509388673818 28 5.5348359691829074 29 5.4649811638193126
		 30 5.266492899520018 31 4.9891515754627056 32 4.7389954941056791;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Chest_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -4.0828568829926963 1 -2.4428928698862213
		 2 -0.272036489831251 3 0.76797920289872956 4 1.8682571118689153 5 2.6561279820286359
		 6 3.2403647509218376 7 3.6441426225514211 8 3.7897525910838543 9 3.7152300768666255
		 10 3.4959328115424642 11 3.0932339913057736 12 2.4684002627563313 13 1.6744541609729653
		 14 0.67783149918242169 15 -0.52278097507165922 16 -1.7558298327640511 17 -3.042285308683955
		 18 -4.33817174922783 19 -5.4341284810489787 20 -6.5324474538525514 21 -7.5736563322381789
		 22 -8.304963850978929 23 -8.8512084284479453 24 -9.2066363089546641 25 -9.3465983441884308
		 26 -9.2642309455462684 27 -8.9357128342922199 28 -8.4071500689458389 29 -7.6766891980391376
		 30 -6.7198391468109664 31 -5.5237450306030693 32 -4.0828568829926963;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Chest_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 3.6233655754258982 1 2.8175769632466783
		 2 1.7379848265450082 3 0.89932437063878878 4 0.0004306236126390688 5 -0.66363266962819423
		 6 -1.1808216034318872 7 -1.6036902236091486 8 -1.9864988812842013 9 -2.4054235754213407
		 10 -2.8069926420567324 11 -3.177751616773389 12 -3.4984664385560205 13 -3.5050215508784461
		 14 -3.3990475532104703 15 -2.8184731400882725 16 -2.0446066357811779 17 -1.1311165612751903
		 18 -0.17058005985706221 19 0.61950957041798671 20 1.3153930235717377 21 1.883098756554531
		 22 2.1902220711801381 23 2.4719620970045133 24 2.7985731096439008 25 3.2447208121930777
		 26 3.7298484993587278 27 4.1863386983349393 28 4.5453025542873506 29 4.6734072853937167
		 30 4.6441970146534581 31 4.2682375412167799 32 3.6233655754258982;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Chest_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -4.9998123616057191 1 -4.5798914302516689
		 2 -4.0431668624370412 3 -3.8836148071414418 4 -3.7197574886824296 5 -3.6448490017484998
		 6 -3.6459926158854907 7 -3.6853657134173607 8 -3.7847291930560569 9 -3.8677629567333023
		 10 -3.9480139554309877 11 -4.008893804365278 12 -4.033703866846067 13 -3.9790575641014501
		 14 -3.9125200167183092 15 -3.901973448011022 16 -3.998086159992178 17 -4.1652007909833069
		 18 -4.3363625537144417 19 -4.4372314406625799 20 -4.5713193854537684 21 -4.7524750113459691
		 22 -4.9609790790171342 23 -5.2025016473033192 24 -5.4665533454928497 25 -5.7390141884293051
		 26 -5.9908675892479151 27 -6.1727886503636826 28 -6.2358268764959712 29 -6.1262839806672353
		 30 -5.8246951367975335 31 -5.4067716322511306 32 -4.9998123616057191;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Scapula_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.1817433459952025e-006 1 -2.1817433459952025e-006
		 2 -2.1817433459952025e-006 3 -2.1817433459952025e-006 4 -2.1817433459952025e-006
		 5 -2.1817433459952025e-006 6 -2.1817433459952025e-006 7 -2.1817433459952025e-006
		 8 -2.1817433459952025e-006 9 -2.1817433459952025e-006 10 -2.1817433459952025e-006
		 11 -2.1817433459952025e-006 12 -2.1817433459952025e-006 13 -2.1817433459952025e-006
		 14 -2.1817433459952025e-006 15 -2.1817433459952025e-006 16 -2.1817433459952025e-006
		 17 -2.1817433459952025e-006 18 -2.1817433459952025e-006 19 -2.1817433459952025e-006
		 20 -2.1817433459952025e-006 21 -2.1817433459952025e-006 22 -2.1817433459952025e-006
		 23 -2.1817433459952025e-006 24 -2.1817433459952025e-006 25 -2.1817433459952025e-006
		 26 -2.1817433459952025e-006 27 -2.1817433459952025e-006 28 -2.1817433459952025e-006
		 29 -2.1817433459952025e-006 30 -2.1817433459952025e-006 31 -2.1817433459952025e-006
		 32 -2.1817433459952025e-006;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Scapula_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.4203839476090244e-006 1 2.4203839476090244e-006
		 2 2.4203839476090244e-006 3 2.4203839476090244e-006 4 2.4203839476090244e-006 5 2.4203839476090244e-006
		 6 2.4203839476090244e-006 7 2.4203839476090244e-006 8 2.4203839476090244e-006 9 2.4203839476090244e-006
		 10 2.4203839476090244e-006 11 2.4203839476090244e-006 12 2.4203839476090244e-006
		 13 2.4203839476090244e-006 14 2.4203839476090244e-006 15 2.4203839476090244e-006
		 16 2.4203839476090244e-006 17 2.4203839476090244e-006 18 2.4203839476090244e-006
		 19 2.4203839476090244e-006 20 2.4203839476090244e-006 21 2.4203839476090244e-006
		 22 2.4203839476090244e-006 23 2.4203839476090244e-006 24 2.4203839476090244e-006
		 25 2.4203839476090244e-006 26 2.4203839476090244e-006 27 2.4203839476090244e-006
		 28 2.4203839476090244e-006 29 2.4203839476090244e-006 30 2.4203839476090244e-006
		 31 2.4203839476090244e-006 32 2.4203839476090244e-006;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Scapula_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -8.1415927139264375e-006 1 -8.1415927139264375e-006
		 2 -8.1415927139264375e-006 3 -8.1415927139264375e-006 4 -8.1415927139264375e-006
		 5 -8.1415927139264375e-006 6 -8.1415927139264375e-006 7 -8.1415927139264375e-006
		 8 -8.1415927139264375e-006 9 -8.1415927139264375e-006 10 -8.1415927139264375e-006
		 11 -8.1415927139264375e-006 12 -8.1415927139264375e-006 13 -8.1415927139264375e-006
		 14 -8.1415927139264375e-006 15 -8.1415927139264375e-006 16 -8.1415927139264375e-006
		 17 -8.1415927139264375e-006 18 -8.1415927139264375e-006 19 -8.1415927139264375e-006
		 20 -8.1415927139264375e-006 21 -8.1415927139264375e-006 22 -8.1415927139264375e-006
		 23 -8.1415927139264375e-006 24 -8.1415927139264375e-006 25 -8.1415927139264375e-006
		 26 -8.1415927139264375e-006 27 -8.1415927139264375e-006 28 -8.1415927139264375e-006
		 29 -8.1415927139264375e-006 30 -8.1415927139264375e-006 31 -8.1415927139264375e-006
		 32 -8.1415927139264375e-006;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Shoulder_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 7.8057097082386608 1 11.716158327918254
		 2 15.881882948223414 3 16.971594758695275 4 17.812742240033 5 17.988969194264111
		 6 17.620575490849387 7 16.942135659906786 8 16.216730132606205 9 15.778034192150324
		 10 15.755507612986653 11 15.849247166105814 12 16.140099976725093 13 16.109493759794667
		 14 15.573160709823551 15 13.480576838590288 16 10.071784990749304 17 5.6852628304869182
		 18 0.76670129317613311 19 -3.4512762062417548 20 -7.7072452253077675 21 -11.700355392011645
		 22 -14.348516383758385 23 -16.277883225175781 24 -17.042541333121999 25 -16.909282253713137
		 26 -15.722919791219859 27 -13.115510139253271 28 -9.7660265430821376 29 -5.7756414150794084
		 30 -1.2870889767818505 31 3.5025328900530828 32 7.8057097082386608;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Shoulder_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 19.718591398575388 1 24.395993223170549
		 2 30.307360130858029 3 33.220325996289603 4 36.375206245686265 5 38.655715722849429
		 6 40.280635883407605 7 40.527669363559397 8 40.501475049425892 9 39.566279737390126
		 10 38.578503217929388 11 37.381125688051796 12 35.799207884212422 13 34.099143511768268
		 14 31.890933593488533 15 28.921842935187335 16 25.153333771704979 17 20.645219378757101
		 18 15.602652463243546 19 10.918027759070243 20 5.5101434098339226 21 -0.14198203342733276
		 22 -4.3344066040400691 23 -7.4384606883735422 24 -8.9234037700227233 25 -9.0998645420260775
		 26 -7.9743963905966151 27 -4.6442590306018445 28 -0.20506091938863272 29 4.7395682046451384
		 30 9.9089590923558415 31 15.038934166473867 32 19.718591398575388;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Shoulder_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -71.003130264991597 1 -70.647598495292584
		 2 -67.335673718921754 3 -63.952516097423 4 -59.585408518304256 5 -55.469022159210546
		 6 -51.606510416345706 7 -48.48403352422087 8 -47.152768166598641 9 -47.750434010342374
		 10 -49.867291712373316 11 -53.712602825273642 12 -59.467879303776293 13 -65.309728616518171
		 14 -70.433425760032293 15 -74.152664584680053 16 -75.583875471775642 17 -75.326301276419827
		 18 -73.093074602427279 19 -70.226512575350071 20 -66.46224250306237 21 -62.38501695411027
		 22 -59.409236962873045 23 -57.242512639820035 24 -56.24422239524251 25 -56.13535790693998
		 26 -56.802023311236866 27 -58.742820236702492 28 -61.287754510717967 29 -64.177108717203737
		 30 -67.125703629212538 31 -69.798595073204382 32 -71.003130264991597;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Elbow_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.1219736953170072 1 8.3520019756775525
		 2 13.78709293682857 3 16.193841180497863 4 18.862279208518181 5 20.846515202523399
		 6 22.257294348839864 7 22.387433279666936 8 21.933926761058313 9 18.995809937514327
		 10 14.838343102552358 11 9.4069819681587461 12 2.6474900304972442 13 -2.7006872480770268
		 14 -6.9276650331191263 15 -10.187414113822268 16 -13.002381939131729 17 -15.609006185564933
		 18 -18.091695497680579 19 -20.18605607730586 20 -22.548648973542694 21 -25.096235954559237
		 22 -27.58577266664393 23 -27.892845143657496 24 -27.62818662034346 25 -22.826291833369975
		 26 -16.785117376225656 27 -10.981613529363697 28 -6.7984379812306281 29 -3.3769341743902035
		 30 -0.36053364958101297 31 2.5067451965415501 32 5.1219736953170072;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Elbow_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 20.498271797321618 1 26.842560952319477
		 2 36.684075731243112 3 41.78176986665089 4 46.942614573480434 5 50.371539352049432
		 6 52.74355024627863 7 54.512178512694206 8 55.630741167598885 9 55.926136837919252
		 10 55.576600053847422 11 53.587578769055838 12 49.677886613650664 13 44.05044740715406
		 14 37.749878011516486 15 31.768283974032233 16 28.659945034764565 17 28.581478380661782
		 18 31.324923283758991 19 35.368609991205957 20 40.842269119705676 21 46.701471887032895
		 22 50.768845149355776 23 51.666135815862582 24 51.61369737273403 25 48.16200250821587
		 26 42.273357725076728 27 34.918748574763619 28 27.059076432613271 29 20.873512677248687
		 30 17.811238814912368 31 17.367830904936699 32 20.498271797321618;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Elbow_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -15.66192273407397 1 -18.002212137025072
		 2 -21.351597572046177 3 -21.559046618622961 4 -21.409384730396727 5 -20.429410718116031
		 6 -19.145962574628111 7 -17.462440628135372 8 -14.983039597024709 9 -11.082836034945919
		 10 -6.3089648252324748 11 -0.50108394410257306 12 6.4691487725657195 13 11.621990961955982
		 14 15.082060243958376 15 16.949423990732313 16 18.307256498263346 17 19.423768407783719
		 18 20.418408590995238 19 21.052643106266903 20 21.636448135201935 21 22.213124625377553
		 22 22.799280330850586 23 22.525352519466971 24 19.75033960134877 25 13.520982357068823
		 26 6.4449903596582621 27 -0.063856581616225691 28 -4.6409448550255652 29 -8.160910875505369
		 30 -10.996448573521882 31 -13.439321121713647 32 -15.66192273407397;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Wrist_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -4.2788587835746617 1 -4.7768313242476692
		 2 -5.0825179144893973 3 -5.0019442493827597 4 -4.8235024454708144 5 -4.5858781394204735
		 6 -4.3445862042859904 7 -4.1441471295706833 8 -4.000058219984524 9 -3.9287894389089475
		 10 -3.8883266896047468 11 -3.8642061161861916 12 -3.8427003579356178 13 -3.8212436650862491
		 14 -3.8142079629032666 15 -3.8187686892431825 16 -3.8389153604955926 17 -3.8882197994080192
		 18 -3.9631849579001699 19 -4.0429877177906226 20 -4.0891475088885114 21 -4.0967702419612131
		 22 -4.0206364505532601 23 -3.932834455050958 24 -3.8601479146482114 25 -3.8301454098773595
		 26 -3.7500246034221703 27 -3.6281869439830863 28 -3.475748281801406 29 -3.3993926401598755
		 30 -3.4180070654444008 31 -3.7324468012588388 32 -4.2788587835746617;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Wrist_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 19.359020389458799 1 17.49047392163633
		 2 14.171184670591321 3 14.523294514291814 4 14.525528138689477 5 13.970928244932034
		 6 13.083074169907205 7 11.932571703080075 8 10.691734662583766 9 9.5978394293288076
		 10 8.7218796753479566 11 8.0969105064983786 12 7.7590611293041398 13 8.1309623282284864
		 14 8.8479916439061768 15 9.449726049766122 16 8.9201527247233088 17 7.3481326739182711
		 18 5.0448395505278736 19 2.9137423919698571 20 1.0187052087605966 21 -0.032078653284302178
		 22 0.29162936228042557 23 1.5847773023393239 24 3.6128987096072382 25 5.9419657166034145
		 26 8.89174393170223 27 12.336181845135675 28 16.125301065986946 29 18.867209652189743
		 30 20.024126060010786 31 20.167745753691786 32 19.359020389458799;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Wrist_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 4.3200724900417464 1 7.427203103662376
		 2 10.632957021493063 3 9.9360799490673148 4 8.6832190720402931 5 7.1425208608451207
		 6 5.5125010335255791 7 4.0055957671136992 8 2.7308267928543293 9 1.8249754780506895
		 10 1.0350316448297663 11 0.15274078917033576 12 -1.0198589302900885 13 -2.0177007699139993
		 14 -2.7921659241002037 15 -3.3388479194011835 16 -4.0629644050795362 17 -4.8759410579879399
		 18 -5.6756438409634047 19 -6.1410521245377057 20 -6.1894301371482037 21 -5.8872985282534449
		 22 -5.0732328167911955 23 -3.717521911185973 24 -2.0897886488403117 25 -0.50383614275629995
		 26 -0.32994805820696921 27 -0.3631713392659594 28 -0.72684746413977619 29 -0.70477823107178983
		 30 -0.23742651912207752 31 1.4378788925131729 32 4.3200724900417464;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Neck_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.7532912812379069 1 0.86631524470767063
		 2 -0.38835726306817314 3 -0.96237325580756794 4 -1.6065443824221994 5 -2.1146744894756941
		 6 -2.5303386626874698 7 -2.8483074414731679 8 -2.9917583672732517 9 -3.0009093372537134
		 10 -2.9315201733789062 11 -2.6857112470103868 12 -2.3040908695145363 13 -1.8674597677475355
		 14 -1.3716551760058102 15 -0.81861005160218225 16 -0.22140966462081391 17 0.43686752976745735
		 18 1.1409890219376377 19 1.7869560228588546 20 2.4952804414102512 21 3.2058393888690788
		 22 3.7072417807533062 23 4.077497892156341 24 4.3159604457020819 25 4.4136290546410999
		 26 4.3473580225675592 27 4.1292195444179951 28 3.8257181758878094 29 3.4790927242399574
		 30 3.0423194182222728 31 2.4827889083500767 32 1.7532912812379069;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Neck_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.7907936220806668 1 -3.2696701751049697
		 2 0.073623647288858299 3 1.6164116239250401 4 3.3953665929437205 5 4.8855003914685335
		 6 6.2541649904252576 7 7.3951639779869751 8 8.3321874078157396 9 9.1203084751501997
		 10 9.8037526906036341 11 10.095280745485393 12 10.109392281342117 13 9.5816334005625929
		 14 7.9776639328001284 15 5.5658182176796593 16 2.9068463153159581 17 0.11628652750585108
		 18 -2.6737805216258965 19 -5.1850481503452306 20 -7.9052782632313869 21 -10.604520073688544
		 22 -12.443085923527645 23 -13.780116126030247 24 -14.627454100258984 25 -14.961233227975313
		 26 -14.704928352892516 27 -13.866610078025264 28 -12.696569322741052 29 -11.382202394753937
		 30 -9.8364096896537756 31 -8.0051499004805553 32 -5.7907936220806668;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Neck_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 25.400886182848897 1 26.232948448041039
		 2 27.066953455308774 3 26.846174888898439 4 26.302314305775411 5 25.466659495709745
		 6 24.344647363981547 7 23.01014536723077 8 21.543921866391681 9 20.036430089309281
		 10 18.794913470302376 11 17.857555356788453 12 17.267272757847945 13 17.435195116215972
		 14 18.41643784737445 15 20.245016145126826 16 22.284748836793476 17 24.23777954626852
		 18 25.903299955646521 19 27.075670474364468 20 27.961875242949922 21 28.399815259206704
		 22 28.191145367574936 23 27.594440072599987 24 26.728810005515875 25 25.768511820564672
		 26 24.889095327469803 27 24.138491944357522 28 23.571782854460061 29 23.567631528969809
		 30 23.779836818928565 31 24.535976184508215 32 25.400886182848897;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Head_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.54482820492722661 1 -0.5165566204058728
		 2 -1.9848843568911814 3 -2.5901244498800668 4 -3.2833731523048915 5 -3.8512271858886398
		 6 -4.3408565852326628 7 -4.7831956178618542 8 -4.9966209150906993 9 -4.9409460482626217
		 10 -4.6288237431329673 11 -3.9454849400767773 12 -2.9079302737669979 13 -1.8351453844913754
		 14 -0.87335845440652848 15 -0.13474197982015679 16 0.3407383681973995 17 0.6530222997696844
		 18 0.81459142575930266 19 0.82534029803391062 20 0.80623920788884373 21 0.76591558956182881
		 22 0.93810445709464352 23 1.2681956052391099 24 1.690553591251774 25 2.1345746624988835
		 26 2.4630613313150871 27 2.6556705769523195 28 2.6965257051442499 29 2.5636683708089762
		 30 2.1293718038002032 31 1.4391623717300499 32 0.54482820492722661;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Head_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.7369556504464403 1 -3.6122828929036377
		 2 -3.4046978987181999 3 -2.9508373578069249 4 -2.441232106221082 5 -2.0536999452021267
		 6 -1.7925793011499895 7 -1.6476983967135543 8 -1.6229561387448463 9 -1.9109260968964092
		 10 -2.3508202805169311 11 -2.9089782465678495 12 -3.5512536502132139 13 -3.9598601558489168
		 14 -4.0290048847992743 15 -3.7622396478625943 16 -3.3990205058176408 17 -3.009971549085376
		 18 -2.6165990841377336 19 -2.1451399864946596 20 -1.5533867399359416 21 -0.96893727082414838
		 22 -0.73127544162308511 23 -0.76713410210212729 24 -1.0298081792104039 25 -1.4924958530074508
		 26 -2.0931261064355282 27 -2.7279989918421306 28 -3.2924431248181225 29 -3.6456559503809136
		 30 -3.778572938648042 31 -3.7962735357226567 32 -3.7369556504464403;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Head_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -1.8494951658605214 1 -2.8953218406788497
		 2 -4.3844366009723634 3 -4.6423713878334993 4 -4.6753229021799338 5 -4.3345263954604567
		 6 -3.621990970853064 7 -2.6457375795672498 8 -1.4735165069275158 9 -0.17614677672432011
		 10 1.0045656396761176 11 2.0657041529662656 12 2.9998547717172284 13 3.3242198863509533
		 14 3.2444662189496434 15 2.3931485835222825 16 1.3461039879779262 17 0.20814801075190792
		 18 -0.9067595248471304 19 -1.8437421093828898 20 -2.780461254052077 21 -3.6179921201780938
		 22 -4.0448533518840861 23 -4.0632951871260667 24 -3.8435982073115245 25 -3.3127506031328231
		 26 -2.598860671211451 27 -1.8165136264318733 28 -1.0825839797836847 29 -0.68009024581908084
		 30 -0.63887103623677177 31 -1.056720729399901 32 -1.8494951658605214;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Scapula_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.1307251692906871e-005 1 -2.1307251692906871e-005
		 2 -2.1307251692906871e-005 3 -2.1307251692906871e-005 4 -2.1307251692906871e-005
		 5 -2.1307251692906871e-005 6 -2.1307251692906871e-005 7 -2.1307251692906871e-005
		 8 -2.1307251692906871e-005 9 -2.1307251692906871e-005 10 -2.1307251692906871e-005
		 11 -2.1307251692906871e-005 12 -2.1307251692906871e-005 13 -2.1307251692906871e-005
		 14 -2.1307251692906871e-005 15 -2.1307251692906871e-005 16 -2.1307251692906871e-005
		 17 -2.1307251692906871e-005 18 -2.1307251692906871e-005 19 -2.1307251692906871e-005
		 20 -2.1307251692906871e-005 21 -2.1307251692906871e-005 22 -2.1307251692906871e-005
		 23 -2.1307251692906871e-005 24 -2.1307251692906871e-005 25 -2.1307251692906871e-005
		 26 -2.1307251692906871e-005 27 -2.1307251692906871e-005 28 -2.1307251692906871e-005
		 29 -2.1307251692906871e-005 30 -2.1307251692906871e-005 31 -2.1307251692906871e-005
		 32 -2.1307251692906871e-005;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Scapula_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.0005552369177469e-005 1 1.0005552369177469e-005
		 2 1.0005552369177469e-005 3 1.0005552369177469e-005 4 1.0005552369177469e-005 5 1.0005552369177469e-005
		 6 1.0005552369177469e-005 7 1.0005552369177469e-005 8 1.0005552369177469e-005 9 1.0005552369177469e-005
		 10 1.0005552369177469e-005 11 1.0005552369177469e-005 12 1.0005552369177469e-005
		 13 1.0005552369177469e-005 14 1.0005552369177469e-005 15 1.0005552369177469e-005
		 16 1.0005552369177469e-005 17 1.0005552369177469e-005 18 1.0005552369177469e-005
		 19 1.0005552369177469e-005 20 1.0005552369177469e-005 21 1.0005552369177469e-005
		 22 1.0005552369177469e-005 23 1.0005552369177469e-005 24 1.0005552369177469e-005
		 25 1.0005552369177469e-005 26 1.0005552369177469e-005 27 1.0005552369177469e-005
		 28 1.0005552369177469e-005 29 1.0005552369177469e-005 30 1.0005552369177469e-005
		 31 1.0005552369177469e-005 32 1.0005552369177469e-005;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Scapula_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.7472791986738114e-005 1 -2.7472791986738114e-005
		 2 -2.7472791986738114e-005 3 -2.7472791986738114e-005 4 -2.7472791986738114e-005
		 5 -2.7472791986738114e-005 6 -2.7472791986738114e-005 7 -2.7472791986738114e-005
		 8 -2.7472791986738114e-005 9 -2.7472791986738114e-005 10 -2.7472791986738114e-005
		 11 -2.7472791986738114e-005 12 -2.7472791986738114e-005 13 -2.7472791986738114e-005
		 14 -2.7472791986738114e-005 15 -2.7472791986738114e-005 16 -2.7472791986738114e-005
		 17 -2.7472791986738114e-005 18 -2.7472791986738114e-005 19 -2.7472791986738114e-005
		 20 -2.7472791986738114e-005 21 -2.7472791986738114e-005 22 -2.7472791986738114e-005
		 23 -2.7472791986738114e-005 24 -2.7472791986738114e-005 25 -2.7472791986738114e-005
		 26 -2.7472791986738114e-005 27 -2.7472791986738114e-005 28 -2.7472791986738114e-005
		 29 -2.7472791986738114e-005 30 -2.7472791986738114e-005 31 -2.7472791986738114e-005
		 32 -2.7472791986738114e-005;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Shoulder_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.3793155801206227 1 0.44514654884071275
		 2 -6.4986499031491061 3 -10.098408008483494 4 -14.44619627792436 5 -18.138556209410108
		 6 -21.05356779715601 7 -22.924843210916162 8 -23.495415885458755 9 -22.671546183650143
		 10 -20.727224857631178 11 -18.035904061676426 12 -14.971326634442439 13 -12.079636533946454
		 14 -8.830172588632049 15 -4.9433600295122551 16 -0.80399871780403065 17 3.3135707445606872
		 18 7.1197171005971756 19 9.898403794784274 20 12.227930458594988 21 13.766835266764112
		 22 14.02136786792739 23 13.827060340855544 24 13.545948043334837 25 13.856349853544286
		 26 14.758810121414408 27 15.501543401521163 28 15.605015493790365 29 14.79515532102905
		 30 12.593574382889841 31 9.4547922306692218 32 5.3793155801206227;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Shoulder_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 13.340854700483616 1 9.4725088585031934
		 2 5.6646385045657537 3 3.2104416443012593 4 0.22410656355510217 5 -2.7547508284061313
		 6 -6.6616080864577176 7 -11.151041678842716 8 -15.426755771378865 9 -18.335344784755115
		 10 -19.749675487453775 11 -19.790888053288825 12 -17.121158110425096 13 -13.186209231831349
		 14 -8.3890151317272927 15 -3.1093430554497421 16 2.3144959186309317 17 8.206825052338365
		 18 14.492404699755086 19 20.267992510212295 20 26.512225301509247 21 32.645063174657814
		 22 36.756248006339852 23 39.385809363568001 24 40.238563748332602 25 39.993270669153304
		 26 38.622706932889237 27 35.900326114446848 28 32.073626664832126 29 27.567039361789817
		 30 22.7004890252595 31 17.773613382404399 32 13.340854700483616;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Shoulder_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -71.329858386298483 1 -70.081565915290014
		 2 -66.426913439241247 3 -65.236256365561346 4 -63.365083052340303 5 -61.23120354417464
		 6 -58.946368548513483 7 -56.851277122347867 8 -55.162995693099326 9 -54.185235621393304
		 10 -52.98063675487635 11 -52.506741762256361 12 -53.903662675634095 13 -55.921785397443266
		 14 -58.164859698568812 15 -60.309285733251144 16 -62.258626568433471 17 -63.722829387806811
		 18 -64.433501661285803 19 -64.231148891383086 20 -62.880770036605689 21 -60.400242027891501
		 22 -57.129054996629321 23 -53.93879807705477 24 -52.348838724462517 25 -52.437030798855417
		 26 -54.236647234202124 27 -58.232839674984014 28 -62.503885437362413 29 -66.281384441418382
		 30 -69.388302834087099 31 -71.422343251858493 32 -71.329858386298483;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Elbow_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -10.525050434597331 1 -16.355973151112174
		 2 -27.735396494572708 3 -32.154706732902291 4 -38.143299601215297 5 -43.592982257701877
		 6 -47.366128904877613 7 -47.487174557075946 8 -43.840075632601 9 -34.684667842758493
		 10 -24.18329233489855 11 -14.779684107147725 12 -8.8502128127494135 13 -5.8139864145043969
		 14 -3.4189719472422433 15 -0.28030429839395643 16 2.727530813240699 17 4.7565948917766834
		 18 5.4279672488748067 19 4.6847684564196239 20 2.5738126169364075 21 -0.63016187382552025
		 22 -4.4848037280812916 23 -7.8576348141182519 24 -9.8074222746840913 25 -10.096662306858917
		 26 -9.4293844777275417 27 -7.9479075911280459 28 -6.6401198493130424 29 -6.0508088882036182
		 30 -6.0724301153645595 31 -7.4567172034906442 32 -10.525050434597331;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Elbow_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 42.08114570671458 1 43.366645889170663
		 2 44.999900609996004 3 43.191835490809254 4 42.59379387160466 5 42.614849995391744
		 6 45.630287556467707 7 50.267861770234106 8 54.64345284162345 9 56.43352372424981
		 10 55.462760785640555 11 50.895790600152182 12 42.918119744121917 13 35.972400061979975
		 14 30.843479818974714 15 28.124954203845284 16 27.055512780653629 17 27.300757981092932
		 18 29.49948523431279 19 32.936053192393175 20 38.078006707637854 21 43.925046041621407
		 22 47.902483269704717 23 50.332623728881309 24 51.044134997520182 25 50.714859397801447
		 26 49.334833505667447 27 47.378048851824964 28 45.328835152405247 29 43.541443202843006
		 30 42.187939221746092 31 41.460649558605652 32 42.08114570671458;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Elbow_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 11.86682242307127 1 12.943336374874303
		 2 17.266930502860337 3 18.063315013978489 4 19.750748816561345 5 21.825911664670357
		 6 23.638499481874558 7 23.514974395886632 8 20.185074212632429 9 12.237021166440398
		 10 3.767850873503197 11 -2.8051951279897458 12 -5.1329147595825892 13 -5.3516650689917258
		 14 -5.8415702797385585 15 -8.1773596102608401 16 -10.769315281356825 17 -13.307250527248716
		 18 -15.362723547543954 19 -15.983569725541503 20 -15.042028222454633 21 -10.523721515248864
		 22 -4.1123744321548967 23 2.2664780259745272 24 7.6391971941654253 25 10.912044398707135
		 26 12.392433363252662 27 12.550439675784437 28 12.34600845654839 29 12.059751422273163
		 30 11.841059134705105 31 11.787876921788136 32 11.86682242307127;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Wrist_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -42.539228101075871 1 -40.388216303818943
		 2 -30.957346403416217 3 -26.3465445613936 4 -20.611471989182878 5 -16.333953410097319
		 6 -15.353810563632511 7 -16.432144510568264 8 -20.182909543707648 9 -24.84735242074748
		 10 -30.482265818687075 11 -36.020446654167621 12 -40.385813917138982 13 -42.447972292261611
		 14 -43.759925382307365 15 -45.223212513699046 16 -46.19092236476056 17 -46.055512885675142
		 18 -43.683206537042686 19 -39.806151410873817 20 -34.284947358268624 21 -28.067805560547988
		 22 -23.394554238554576 23 -20.063803383184162 24 -18.814860886307081 25 -19.209236827895626
		 26 -21.493564022370791 27 -25.532012889522246 28 -30.459430862349134 29 -35.244096232563379
		 30 -39.528161389718221 31 -42.619472173032158 32 -42.539228101075871;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Wrist_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 9.3773690862230286 1 7.522861783948473
		 2 4.9811553668724828 3 4.5172710006702879 4 4.312970097199214 5 4.2721807839839974
		 6 4.070536433730819 7 3.9460198521695635 8 3.9467505842653798 9 4.8865877122109973
		 10 6.3863203267796509 11 8.5482921344814251 12 11.4604444067679 13 13.184262519100514
		 14 13.485812424315469 15 12.776336553891563 16 11.988199411830486 17 11.220607350641593
		 18 10.536136042281706 19 9.8640310045130501 20 9.2312048284114692 21 8.8571101488235424
		 22 9.0436794006284487 23 9.540456924750135 24 10.158468228751017 25 10.616531084154342
		 26 10.841729003065288 27 10.944919126317734 28 11.037439923545094 29 11.078727486791076
		 30 11.062986780623627 31 10.639069805203292 32 9.3773690862230286;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Wrist_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -1.1755829160778386 1 0.57531775002244312
		 2 4.6485816706527787 3 7.1552619741526122 4 10.279043999521393 5 12.969635292858335
		 6 14.924302291123794 7 15.833868400015971 8 15.890156340678319 9 14.867657232308915
		 10 13.464912055044316 11 12.131018165078469 12 11.309336690229042 13 11.409986954807833
		 14 11.833515642108388 15 12.484584568206158 16 13.042627649392113 17 13.581756185345915
		 18 14.015116488250207 19 14.078406107759696 20 13.671595828462952 21 11.91063354710149
		 22 9.7478961030383271 23 7.5600853318622319 24 5.4710226550872294 25 3.5642744505324035
		 26 1.9164331850539682 27 0.53855012126369517 28 -0.55617925817432423 29 -1.2663595172419375
		 30 -1.5851693788800254 31 -1.6373083271816575 32 -1.1755829160778386;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Hip_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.2771533386446805 1 2.2691382410800309
		 2 2.5695423736132206 3 2.9272767003682398 4 3.3606145375004601 5 3.7375169861648443
		 6 4.0656899764951957 7 4.2973685895070641 8 4.3967153099362895 9 4.4053965453685553
		 10 4.4120987226998505 11 4.4521696779471815 12 4.7864107655748898 13 5.4788732655246415
		 14 6.3147106608716586 15 7.0845119311801792 16 7.2796652202635475 17 7.206946916505462
		 18 6.7728305151088026 19 6.3402435253326122 20 5.9442095883911366 21 5.7254142292926025
		 22 5.7871048441644648 23 5.8734319936943598 24 5.9181754918335736 25 5.7227110512579946
		 26 5.3510232785431828 27 4.8562324362811449 28 4.2895577034753725 29 3.6767531330327112
		 30 3.0816238149535669 31 2.5656732791882693 32 2.2771533386446805;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Hip_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -8.0908562844982885 1 -8.8181418604698329
		 2 -8.7383820985572189 3 -8.1049478767946539 4 -7.4323944677519806 5 -6.9438379386278024
		 6 -6.595093961184392 7 -6.1835308620808442 8 -5.429248050131128 9 -3.9376961660694922
		 10 -1.8240128086821163 11 0.84956804838603817 12 4.0046360733096735 13 6.4540170187348735
		 14 7.5238693720935146 15 7.650807473152379 16 6.8249299423582661 17 5.4450193293709637
		 18 4.0860112590653559 19 3.0686008761833343 20 2.9390723148226416 21 3.2861552258890177
		 22 4.1533595218657418 23 4.6792826930524427 24 4.7790211452404527 25 4.0869845043559714
		 26 3.005194085910416 27 1.5984590706947577 28 -0.080826146638142693 29 -2.1243989761252267
		 30 -4.3682688787639625 31 -6.6181154320957516 32 -8.0908562844982885;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Hip_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -22.985689911347141 1 -17.825059255581227
		 2 -10.322213980907712 3 -6.236030683383218 4 -1.7656722674594718 5 1.6353491883393541
		 6 4.3551316802227982 7 6.4986763972455686 8 7.4106670028576866 9 7.2051230312192702
		 10 6.0435722817016266 11 3.1942146710430759 12 -1.4745455387747302 13 -7.1748889449128352
		 14 -13.433266816114555 15 -19.785042987487866 16 -25.167896106559073 17 -29.594773771130441
		 18 -32.957260371025853 19 -34.927557489060753 20 -36.074391615431971 21 -36.660323964469683
		 22 -36.936586679806823 23 -37.493034341784615 24 -38.480954109628065 25 -40.174762034847809
		 26 -40.309253171926741 27 -40.059528572796729 28 -37.912126603308984 29 -35.039688115723884
		 30 -31.474315272501926 31 -27.341158146494365 32 -22.985689911347141;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Knee_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 7.8904328535660646 1 6.9239565978506494
		 2 6.0488211527736038 3 6.2172515058165141 4 6.6123568807408022 5 7.1259341966229135
		 6 7.5682598378328114 7 7.7902320553999198 8 7.9089191859772559 9 8.1234180713823676
		 10 8.5852737435630573 11 9.261720449571774 12 10.115303613972396 13 10.921626801766488
		 14 11.759298075918521 15 12.64986211973979 16 13.420606729701527 17 13.953423381436243
		 18 14.167852477963772 19 13.893245740683874 20 12.953471555784926 21 11.670094859816402
		 22 10.883525092817706 23 10.483606588626111 24 10.312719944683712 25 10.114558043323724
		 26 10.083124566743859 27 10.081868632429156 28 10.085516150163874 29 9.9436025027005552
		 30 9.5139079502811548 31 8.8525490961307352 32 7.8904328535660646;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Knee_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.1992941143134805 1 6.3787846640592401
		 2 7.5677840040796438 3 8.0338565276112828 4 8.4375828255717309 5 8.6185811796441261
		 6 8.6805369546123874 7 8.6366944495621603 8 8.2249512505758009 9 7.2826905963144872
		 10 5.9774381525943232 11 4.6038876198727268 12 3.4734745690133075 13 3.40985530472441
		 14 3.3831609692500697 15 3.2850959853658401 16 2.4547793911312303 17 1.1270428069623661
		 18 -0.26782725272333729 19 -1.14814839543143 20 -1.2469971158048796 21 -1.0544999281263172
		 22 -0.72134971797049086 23 -0.35835591737186445 24 0.041028876021937145 25 0.53028334204701499
		 26 0.67085487922203457 27 0.77069517440614066 28 1.0739406921999808 29 1.8408750332053034
		 30 2.8644160159351593 31 4.0074440301135503 32 5.1992941143134805;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Knee_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 36.227437654807744 1 33.524585762132197
		 2 29.424135593255464 3 26.629080985779815 4 24.300846378348393 5 23.642803034346926
		 6 24.531944911403023 7 26.737289523804044 8 30.16834303551941 9 34.758378992094656
		 10 39.712663576289522 11 45.383167541152936 12 52.108809546925457 13 58.078009785832677
		 14 62.481483278145426 15 64.588624522754543 16 63.824058874612781 17 60.662871072629933
		 18 55.304406093147371 19 49.252729858672467 20 42.03017411188673 21 34.737223605940891
		 22 30.000472885868724 23 28.471999487458735 24 28.486861696668754 25 32.387529310384899
		 26 36.346890424616888 27 39.586493238039935 28 41.387827302227954 29 41.381112197533881
		 30 40.626293749432094 31 38.416905157725381 32 36.227437654807744;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Ankle_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.6548324600504554 1 1.8481583013098828
		 2 0.38082907011363093 3 -0.21209010108706516 4 -0.6751320635853103 5 -0.83848130322441616
		 6 -0.95768098871565965 7 -0.91696409222748521 8 -0.66731025920179265 9 -0.21973870299546122
		 10 0.043423005388278244 11 0.24446077551776746 12 0.51176863060481725 13 0.91270611134917845
		 14 1.2580653526678134 15 1.4282845484869662 16 1.4564235929674807 17 1.5375366924359881
		 18 1.8390341698019672 19 2.3973406529699774 20 3.0270249728397416 21 3.434307391888574
		 22 3.4215017548394933 23 3.3522222573994518 24 3.1777134966473835 25 2.8417651169470792
		 26 2.6081609667617314 27 2.5377290481633246 28 2.5910697899722188 29 2.7610829943296133
		 30 2.9093157527130367 31 2.949661661407653 32 2.6548324600504554;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Ankle_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.4440473277462043 1 -5.9401694984924065
		 2 -8.9814784698700638 3 -10.960039821632726 4 -12.680942300412077 5 -13.463353455432497
		 6 -13.747507163395133 7 -13.421524237242581 8 -12.114174420892089 9 -10.185257124261708
		 10 -8.6634916303166101 11 -7.3407650478395547 12 -5.9885801076101712 13 -4.3660360408927286
		 14 -2.2446215685945452 15 0.40728268541596579 16 2.6192552765931638 17 3.4539151263597598
		 18 3.5323956248200776 19 2.7661911376624526 20 0.75196778997945202 21 -1.9526519348801372
		 22 -4.2190601310695355 23 -5.5292884150210693 24 -5.7931409210141238 25 -4.2977614168000002
		 26 -2.3485096171608433 27 -0.67796610891552933 28 0.014987861980892225 29 0.40206563364361014
		 30 0.2895614180343441 31 -1.3110423318236211 32 -3.4440473277462043;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Ankle_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -9.9386515774379518 1 -9.9177830736543289
		 2 -9.6217203000143545 3 -7.5888024466501767 4 -5.4232043373282339 5 -3.855175939929238
		 6 -2.825206013775313 7 -1.2921661449887469 8 1.6931508307125522 9 7.5394451652186332
		 10 13.676126011223708 11 19.330075928317466 12 23.735923801082428 13 25.302709877212536
		 14 24.96408459069001 15 21.022218722681554 16 15.369736589263727 17 9.6342556822882344
		 18 4.8328442648451624 19 2.0387275720095097 20 -0.65477515292516997 21 -3.3026294493229988
		 22 -5.0216696880028042 23 -5.9518413283408611 24 -6.4010257161804631 25 -6.8356503137069238
		 26 -7.1316862112022301 27 -7.4552708397831271 28 -7.9732322223532144 29 -8.7498284848858567
		 30 -9.4234990609011895 31 -9.7735698731984311 32 -9.9386515774379518;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Toes_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -9.7267241008038656 1 -10.770683993322654
		 2 -12.536832988359521 3 -15.763513250862125 4 -19.989788369422982 5 -24.370482823297948
		 6 -29.520111240678681 7 -36.068583529209214 8 -43.811485574445243 9 -52.600153772953284
		 10 -57.623829382008424 11 -58.136557218464155 12 -48.530840052958681 13 -33.775359178534174
		 14 -21.109667490915147 15 -14.920632005254269 16 -8.0696708611340746 17 -6.0606986273333074
		 18 -5.9938190600070866 19 -5.994608803061416 20 -5.9948251245039916 21 -5.9947786356165196
		 22 -5.9948228686925686 23 -5.9948200263096387 24 -5.9947868201203827 25 -5.9947502654168732
		 26 -5.9949648707984666 27 -6.0079036229372411 28 -6.3088088190656091 29 -7.275524606051829
		 30 -8.2907840449342238 31 -8.9954861540584012 32 -9.7267241008038656;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Hip_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 4.4772190703973198 1 4.5577977682963313
		 2 4.2511586177272234 3 2.9187663201097998 4 1.4528204461636225 5 0.34818976549743869
		 6 -0.43876986948102858 7 -1.1350797720391508 8 -1.7841225225143964 9 -2.418450091150234
		 10 -2.989843100132207 11 -3.4987576164857237 12 -3.9395111740579027 13 -4.008438112401679
		 14 -4.0273938746722759 15 -4.0622682737373079 16 -4.3254850384195569 17 -4.4223943309917502
		 18 -4.3894391717793333 19 -3.8629796336581537 20 -2.7448696339331935 21 -1.2555540379614158
		 22 0.25711469965310602 23 1.6761444378188797 24 2.7828007915262067 25 3.2810936391751633
		 26 3.108208594263639 27 2.7211283393795691 28 2.4733211580374288 29 2.6754943234287114
		 30 3.2386911003852985 31 3.9838393712654714 32 4.4772190703973198;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Hip_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 12.037384461319233 1 10.965558914860676
		 2 8.8161255404149905 3 7.3216426395978882 4 5.852679783368246 5 4.8835767483208246
		 6 4.0824146171086397 7 3.2360680184246746 8 2.2639686035929318 9 1.0747666945173373
		 10 -0.1388527939132404 11 -1.3707541272710291 12 -2.611219108356055 13 -3.4897010929813184
		 14 -3.8348376435139637 15 -3.8738540649811113 16 -3.4754520458093672 17 -2.7395835533518818
		 18 -1.975277350095431 19 -1.6263713355224787 20 -1.7820082485402002 21 -2.4684746683900527
		 22 -3.0564074909810586 23 -2.9924249984420537 24 -2.2763187701430256 25 -0.98086972868193556
		 26 0.68635973363420644 27 2.8942453563068664 28 5.8048113777888419 29 8.5917368828473961
		 30 10.905412852003163 31 12.330043469267897 32 12.037384461319233;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Hip_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -12.527792328690941 1 -19.383857654310642
		 2 -27.628832917132378 3 -30.165648007058039 4 -32.424254840478284 5 -33.642560873304554
		 6 -34.627712794042246 7 -35.578799572561643 8 -36.383322062204002 9 -36.836556228888121
		 10 -36.827661076709113 11 -36.345555896511868 12 -34.608735532110479 13 -31.811318185033688
		 14 -27.823932317905232 15 -22.688188074989945 16 -17.342618098398802 17 -12.062344610912373
		 18 -7.1713517090857559 19 -3.4025216559930476 20 -0.26955481682555782 21 2.2588152018923973
		 22 3.9375535727741422 23 5.7203138196884549 24 7.5615530079247684 25 9.2914690954725803
		 26 9.9524538744991471 27 9.9060286984624408 28 8.1877462689859026 29 4.9832796044116883
		 30 0.24794922285212914 31 -5.900161962503689 32 -12.527792328690941;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Knee_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 4.1315733059660378 1 3.9685754540939602
		 2 3.9027373489103212 3 3.0638533531122265 4 1.8866815483626038 5 0.70485522641013565
		 6 -0.35652161234746671 7 -1.2274470716464672 8 -1.8813618528070009 9 -2.2910432859670573
		 10 -2.56626683025556 11 -2.6472700056687857 12 -2.5883311290345303 13 -2.3304552546452078
		 14 -2.2118186859834021 15 -2.3095521808404729 16 -2.7159920168981802 17 -3.0331564110116482
		 18 -3.1169016008396158 19 -2.6751927537620883 20 -1.707235065729136 21 -0.44844067379728486
		 22 0.71947159666345173 23 1.8093742399674597 24 2.6502501705655686 25 2.9916645142603961
		 26 2.8568338295038451 27 2.7273781730681677 28 3.0603583128916956 29 3.6407483293339098
		 30 4.1277934336078701 31 4.2931874140514195 32 4.1315733059660378;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Knee_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.45885630493223245 1 0.058959146908893714
		 2 -0.88479541629046965 3 -1.4099346515327644 4 -1.4965343998414442 5 -0.98821593746554859
		 6 0.079059676854552938 7 1.1804311000090921 8 2.1052855864194204 9 2.6157830368908441
		 10 2.855483612750088 11 2.860125548997976 12 2.4818042833957401 13 2.0405424734658562
		 14 1.7153488431186019 15 1.6303918813716367 16 1.634533461948618 17 1.7027733501155955
		 18 2.054275661943485 19 2.7294906954414491 20 3.5408955472074317 21 4.4011134672579821
		 22 5.2192779894288055 23 5.9422329681841735 24 6.5513834376269182 25 7.0611762366261903
		 26 6.971485805455103 27 5.9738449477408047 28 3.8202100083020709 29 2.08195148779925
		 30 0.98703665987150091 31 0.66482345875091342 32 0.45885630493223245;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Knee_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 62.891201561465046 1 66.644835711581891
		 2 68.44023648493885 3 65.323883212139279 4 60.599226779997601 5 55.497373165094892
		 6 50.550986393055425 7 46.683639653450534 8 44.392200764402894 9 43.902117194350353
		 10 44.266375831194836 11 44.634387533592673 12 44.528296755497621 13 43.267361212875443
		 14 39.809296269496684 15 34.544564608688141 16 28.758136884412362 17 23.259600809658171
		 18 18.724323801665602 19 16.124598383576458 20 16.300777720334739 21 18.853283064193885
		 22 22.690735536033795 23 25.886405239230022 24 28.313627476801734 25 30.086593427571781
		 26 32.045811997838143 27 34.75338414528462 28 38.763227929541792 29 44.136799152586413
		 30 50.489510667173015 31 57.353521584011716 32 62.891201561465046;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Ankle_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 8.2880685883486294 1 12.648920437806522
		 2 15.361241620324407 3 16.229614983700284 4 16.21234972977464 5 14.884633620421571
		 6 12.925154600330437 7 11.308881232476223 8 10.227249780263952 9 9.7892502966320549
		 10 9.7949750477109809 11 10.142953604628271 12 11.217219883655252 13 12.058123105764803
		 14 12.682515054448208 15 13.102003092464004 16 13.812073902222673 17 14.003943903993676
		 18 13.446759971535467 19 11.710928984339137 20 8.6754365953708934 21 4.7620801817955627
		 22 1.0988225667147635 23 -2.6011646143594782 24 -6.0583849967661934 25 -9.0162493568570845
		 26 -9.2293323548963748 27 -9.0467081303621839 28 -7.0153062116845399 29 -4.6373758207761
		 30 -1.3866590931058196 31 2.9551773114207021 32 8.2880685883486294;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Ankle_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -21.745214794499539 1 -20.124811779120446
		 2 -15.369444460916201 3 -14.152977910883147 4 -12.744776170347413 5 -11.609422731512598
		 6 -10.761151941495251 7 -10.111564068201583 8 -9.5212442621018667 9 -8.7925392047746804
		 10 -7.9219148532855526 11 -6.8015132138670582 12 -5.3356925387834622 13 -4.2997870214122562
		 14 -4.03799561989082 15 -4.2206609971171609 16 -4.5322058959031191 17 -4.940707203037725
		 18 -5.4498802955954471 19 -6.1554141106287226 20 -7.011899573610286 21 -7.9447983671603444
		 22 -8.7577842254787388 23 -9.7355846889422626 24 -11.115140836864022 25 -13.240722757481242
		 26 -15.697070465940973 27 -17.836218742099739 28 -19.023726643413504 29 -19.851829429394968
		 30 -20.76862859048952 31 -21.878613105700943 32 -21.745214794499539;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Ankle_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.6155139388871342 1 6.0426727475112063
		 2 4.9181354826427777 3 -0.23600311297608786 4 -6.1364280335138615 5 -10.685724708411733
		 6 -13.569077482739063 7 -15.02117660389597 8 -15.463634419981101 9 -15.574046639789271
		 10 -15.717820037078329 11 -15.771464604018655 12 -15.523996022733098 13 -15.193186349531254
		 14 -14.622846418922226 15 -13.711315100321499 16 -12.347400642223786 17 -10.809703031208659
		 18 -9.3548151856842292 19 -8.5462651677533099 20 -8.8260201650524834 21 -10.625028881688369
		 22 -13.185210491620449 23 -15.377108107679565 24 -16.336859397444801 25 -16.231695342409495
		 26 -15.035797878403912 27 -12.304216916959019 28 -8.8869122224982053 29 -4.906322478433542
		 30 -0.76661446394697652 31 3.1083332994072905 32 5.6155139388871342;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "walk_angry:Toes_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.9925853322146931 1 -5.9948643577527889
		 2 -5.9949141496496123 3 -5.9948614057332259 4 -5.9948551633898646 5 -5.9948759071272697
		 6 -5.994869556230082 7 -5.9948714716041174 8 -5.994874304146717 9 -5.9948413259834412
		 10 -5.9948531080565699 11 -5.9948662774487911 12 -5.994846468670695 13 -5.9948364481734178
		 14 -5.9948309387683114 15 -5.9948678764136893 16 -5.9957625731456279 17 -6.0261846830245176
		 18 -6.4608389917658577 19 -7.4838192692496079 20 -10.356428047903359 21 -14.293684851907685
		 22 -16.630878552928277 23 -17.893185526854822 24 -18.478344863933348 25 -18.973875953775305
		 26 -19.357266192572798 27 -19.296825865850046 28 -16.271929700667442 29 -10.914573491095695
		 30 -6.7578287400233208 31 -5.9896230646608917 32 -5.9925853322146931;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "walk_cool:Root_M_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.24192757444945356 1 -0.27036900016794885
		 2 -0.29035819417379288 3 -0.30475782570456528 4 -0.31801596015628181 5 -0.32323806405398736
		 6 -0.32533992082405849 7 -0.31397908980012273 8 -0.28648027736376191 9 -0.24810569177602129
		 10 -0.186741645155034 11 -0.12602436765749347 12 -0.05295053528412888 13 0.020613959663945712
		 14 0.071160150903264288 15 0.12047219645580068 16 0.15664505706279841 17 0.19077877273982474
		 18 0.21464684464037867 19 0.2307301414711011 20 0.23800821052417062 21 0.23250142549473066
		 22 0.22560899404610232 23 0.21192730059338735 24 0.19733244521690477 25 0.16095240621973866
		 26 0.1239720073239385 27 0.057629952827756209 28 -0.01816992271522682 29 -0.089359425677751458
		 30 -0.15846503344538829 31 -0.214426364063422 32 -0.24192757444945356;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTL -n "walk_cool:Root_M_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.8672252680103476 1 5.8976920207007684
		 2 5.9933543251669121 3 6.0079385764340802 4 6.0224995039452835 5 6.015213626584746
		 6 6.0022942286721861 7 5.9774927455767592 8 5.9417399464867318 9 5.922455813899278
		 10 5.9196293444975687 11 5.9167276397268127 12 5.9411790335407106 13 5.9440613160101776
		 14 5.9224920415270068 15 5.887764628601027 16 5.8796720935918811 17 5.8762619778721747
		 18 5.8902206209144126 19 5.9314788972694732 20 5.961639193966402 21 5.9790155135424854
		 22 5.9875050163251657 23 5.9453120612907844 24 5.9024691626920127 25 5.8738902170786602
		 26 5.8405730818656325 27 5.8426944375801453 28 5.8438994406261724 29 5.8434336916961138
		 30 5.8396362783586078 31 5.8350420210497846 32 5.8672252680103476;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTL -n "walk_cool:Root_M_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.22727247889607877 1 0.20538199822340136
		 2 0.14836714128879536 3 0.099256882523317713 4 0.04381765335018261 5 -0.00063397294475826121
		 6 -0.046367535651801094 7 -0.065622385460063978 8 -0.071534860393501529 9 -0.067998149289936693
		 10 -0.030739923458476471 11 0.0020551366803101866 12 0.046142115914425019 13 0.080624643934429877
		 14 0.068663258593896437 15 0.055247502847245639 16 0.044978554264183034 17 0.035848367378245816
		 18 0.027425089595423082 19 0.016149265302897124 20 -0.0045263195541147255 21 -0.036386554937976351
		 22 -0.062206362534411377 23 -0.058604669069435865 24 -0.053632934440798086 25 -0.0024996762727755861
		 26 0.052233926966753191 27 0.12189778572134576 28 0.19792258444522659 29 0.2405030095376709
		 30 0.25203860271736411 31 0.25409552077210218 32 0.22727247889607877;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Root_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 3.79206999393721 1 3.2154142419209388
		 2 1.2668475506843651 3 1.5529674139836829 4 1.9057454250528605 5 1.9285386278522039
		 6 1.9346709598519605 7 1.7057065488190304 8 1.133181020134554 9 0.63854373402027076
		 10 0.15660750715789915 11 -0.27425603735411758 12 -0.368190674119869 13 -0.52763419193862005
		 14 -0.81040354208038468 15 -1.1423291589784565 16 -1.1986663747931214 17 -1.2146477018583803
		 18 -0.92410090685910262 19 -0.13062938313528497 20 0.53591649163795174 21 1.170803476112299
		 22 1.7708184573441952 23 2.4082180962719106 24 2.9889199160411923 25 3.6140488249275364
		 26 4.291252161314703 27 4.5375740002217411 28 4.6902124276082242 29 4.6965598229213299
		 30 4.5780291951177468 31 4.355828378388038 32 3.79206999393721;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Root_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.9261178737361622 1 -5.6147376264679005
		 2 -3.8573423597706982 3 -3.8053004042210743 4 -3.8024904467304355 5 -4.1932309674394181
		 6 -4.7904448309588474 7 -5.3370638880863774 8 -5.9209377452851255 9 -6.0690730203062841
		 10 -5.4609434133068131 11 -4.8698145366570165 12 -3.967180888779942 13 -2.8408669410434642
		 14 -1.7710182517622417 15 -0.50152627141114647 16 -0.13619263587825109 17 0.035982556304580991
		 18 -0.28370521725914682 19 -1.2921686966450134 20 -2.0799021230544037 21 -2.6833434079828322
		 22 -3.0669278116105807 23 -2.5623356659893033 24 -1.9998963689864853 25 -2.0294728881088684
		 26 -2.0653749082062158 27 -2.6570614579617575 28 -3.6257489501071318 29 -4.5508016559631486
		 30 -5.6224989651827828 31 -6.2152064349119627 32 -5.9261178737361622;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Root_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.053425661266154209 1 0.013451599532809548
		 2 0.49442658194389982 3 0.18649157438554492 4 -0.16796834986152262 5 -0.12591960096631477
		 6 -0.059075014128665886 7 0.22066793602205534 8 0.66352847017601913 9 1.0351732222260612
		 10 1.3156132418898447 11 1.513952709196531 12 1.209398972911605 13 0.92482367350809658
		 14 0.55419490221263001 15 0.11760387374599046 16 0.0800492628935391 17 0.080064546347190374
		 18 0.18150383016355523 19 0.44560575937408853 20 0.69736943336257673 21 1.0101911115956144
		 22 1.2812417898909803 23 1.4344861653195751 24 1.5964852535803116 25 1.582006463224888
		 26 1.5677023362560347 27 1.3353585185324361 28 0.96866994769407322 29 0.64501661581355663
		 30 0.32551420220249172 31 0.091519601760150837 32 0.053425661266154209;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Spine1_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -10.833374654708406 1 -8.5592195419408359
		 2 -2.8662119770509031 3 -0.68838897575883828 4 1.5287125480970349 5 3.2615439505318142
		 6 4.9027503346692889 7 6.3127864040196879 8 7.6332483864131628 9 8.6950242257317765
		 10 9.2553962845928979 11 9.6966270159390824 12 9.0023853194385772 13 8.4233040272804658
		 14 7.1584684572527681 15 5.9669796054342505 16 4.0070096978707586 17 1.8855691390918217
		 18 -0.6722626677728607 19 -3.604963189231019 20 -6.2763477705990818 21 -8.5540077381520607
		 22 -10.686708165042056 23 -12.215629873640189 24 -13.662269264273178 25 -14.365467924239256
		 26 -15.098212253584578 27 -15.311581801163026 28 -15.448774776970467 29 -15.195881349881526
		 30 -14.339344378229919 31 -13.158745382771206 32 -10.833374654708406;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Spine1_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 9.4684134675533276 1 9.1104229135769135
		 2 6.1086108150725353 3 5.4501634272956592 4 4.7994041860230467 5 4.1718904626040736
		 6 3.6014989944521707 7 2.8323573149125378 8 1.9439455969723103 9 0.81234754588998537
		 10 -0.7661446435950261 11 -2.2503342441719734 12 -3.4531113325137448 13 -4.9319037439859814
		 14 -5.4456909009309538 15 -6.1189736776217378 16 -5.5774694488245968 17 -4.6922785352907797
		 18 -3.2581198833099441 19 -1.3558985037868172 20 0.38646215059652084 21 1.9708823228764052
		 22 3.1903438960281001 23 3.3187407239370001 24 3.345382064753017 25 3.777345296980902
		 26 4.2177009850901186 27 5.2374114019623716 28 6.5121785949573567 29 7.7081696640999029
		 30 9.0061007364511347 31 9.7253496737941152 32 9.4684134675533276;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Spine1_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -7.4647343287893415 1 -6.9127699121414432
		 2 -6.0363770638087271 3 -5.5131698492085475 4 -4.9436761106677354 5 -4.9294167584335433
		 6 -4.9586019613762478 7 -5.2660173767180289 8 -5.8934887187818195 9 -6.4457568160097463
		 10 -6.9594032119614813 11 -7.3461275505797374 12 -7.2054131657376663 13 -7.0679831445880819
		 14 -6.6340112563745501 15 -6.1704993685455083 16 -5.9776750517508725 17 -5.8812782930638452
		 18 -5.919897170070314 19 -6.1327607089583562 20 -6.4329833919972144 21 -6.8407066216193337
		 22 -7.2957599183061079 23 -7.9717817128576787 24 -8.6200260236250585 25 -8.916268922043967
		 26 -9.2423531686395393 27 -9.1968462615710997 28 -9.0869818854465585 29 -8.8484753527810582
		 30 -8.4832595974969234 31 -8.0596018088085231 32 -7.4647343287893415;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Spine2_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 3.8532500792986397 1 2.9194798147975929
		 2 0.67881422376567457 3 -0.089941328790616906 4 -0.8839001445551844 5 -1.5287869379121872
		 6 -2.146663290621611 7 -2.7065483806609043 8 -3.2519303725518518 9 -3.6681887074809465
		 10 -3.8454218187195743 11 -3.9789436207219055 12 -3.6210960319352967 13 -3.2915486674766177
		 14 -2.7567442695282325 15 -2.2361724211728999 16 -1.4854066303054823 17 -0.69076249037670123
		 18 0.26757340468620133 19 1.3697000824278367 20 2.3778956815796017 21 3.234471229671819
		 22 4.0495938216299061 23 4.6989343527308538 24 5.3240245575050169 25 5.6450261099354773
		 26 5.9995574205601017 27 6.029106581824526 28 6.0214314059020406 29 5.8508987676320015
		 30 5.3762888884950053 31 4.8057912636356885 32 3.8532500792986397;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Spine2_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -4.0970986815357682 1 -3.6682117880281022
		 2 -2.0172089719124444 3 -1.6427729972528344 4 -1.25733228616007 5 -0.97455232888574606
		 6 -0.72462127842391655 7 -0.37490665736905987 8 0.031165443098392115 9 0.53917536494100016
		 10 1.2334972063874443 11 1.8707151761654615 12 2.3034426026562076 13 2.7774733889550371
		 14 2.7188697681146192 15 2.6775635746927664 16 2.2485029868622708 17 1.6740500275396373
		 18 0.95755132104460805 19 0.098842696443713643 20 -0.68526944469004869 21 -1.3600704687771006
		 22 -1.9611544849698739 23 -2.1040452759934278 24 -2.240700832424384 25 -2.4711176322142934
		 26 -2.6927503254938103 27 -3.1503971825248773 28 -3.702685160488842 29 -4.1115317208327378
		 30 -4.4279393067920321 31 -4.5489793746253389 32 -4.0970986815357682;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Spine2_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 8.2575929024928172 1 8.1592150596140947
		 2 8.1112891378612098 3 7.9211535244215412 4 7.6962332347013112 5 7.7091329342583368
		 6 7.7353047141744389 7 7.8883302906200559 8 8.1619706610724805 9 8.3814333220178909
		 10 8.5463548417360453 11 8.6654791116362393 12 8.5357731391646183 13 8.4191507546908735
		 14 8.2426582242945496 15 8.0378837094778302 16 8.0402067881544461 17 8.057595985608426
		 18 8.1241559526166593 19 8.22769575582047 20 8.3278912809038133 21 8.4514514988781571
		 22 8.5743865810563307 23 8.8274433593078658 24 9.0709182371098471 25 9.1492698320580264
		 26 9.2264975686800685 27 9.1192874569767088 28 8.9269022518903007 29 8.7353336987230286
		 30 8.5261049967763913 31 8.3533990507133371 32 8.2575929024928172;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Chest_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -4.4095808575374491 1 -3.4155912593441169
		 2 -0.95712078947296286 3 -0.13735054769228472 4 0.70740939062484232 5 1.3846924405620964
		 6 2.0298715218999352 7 2.6297819233055368 8 3.2234085907595698 9 3.7076070999799668
		 10 3.9906565944482111 11 4.2059491962421536 12 3.924456454420004 13 3.6645209017539759
		 14 3.1209028341344665 15 2.5940303881376789 16 1.7846327843099625 17 0.91899341370394916
		 18 -0.12971548241494871 19 -1.3414391965127004 20 -2.4521374782995857 21 -3.399596390316888
		 22 -4.297723939018474 23 -4.9673977147678698 24 -5.6120795136648258 25 -5.9680041902394061
		 26 -6.3344925539882064 27 -6.4681563377342002 28 -6.5351325529280269 29 -6.4117207144244928
		 30 -5.984926891012579 31 -5.4261425472967932 32 -4.4095808575374491;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Chest_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 3.4911025854566717 1 3.2115110307657364
		 2 1.9010487561769569 3 1.6394395606450742 4 1.3640870424448897 5 1.1705445298148489
		 6 1.0059225091325883 7 0.74272641151923369 8 0.43084596174666273 9 0.0017967747876023097
		 10 -0.64544576904202344 11 -1.2466655827134772 12 -1.7358796934957408 13 -2.2605277275464859
		 14 -2.2923492575401294 15 -2.3255923761023394 16 -2.0231623587262373 17 -1.5603330493573175
		 18 -0.98599906264630277 19 -0.29374608754968645 20 0.33307880184215377 21 0.87385767975018169
		 22 1.3158965825678814 23 1.3515519186922309 24 1.3670703186247044 25 1.5302295729036322
		 26 1.6851770166262929 27 2.1369970309354813 28 2.6987085764194729 29 3.1582081035618339
		 30 3.5732519303380879 31 3.7666488050473883 32 3.4911025854566717;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Chest_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -8.5301704192765264 1 -8.3478425522452486
		 2 -8.1391202466912134 3 -7.9219085809851144 4 -7.6766229885603359 5 -7.6826298709503753
		 6 -7.7054966954615827 7 -7.8611451607894063 8 -8.1507920243002214 9 -8.3984983599751075
		 10 -8.6124294958756487 11 -8.7713454045950296 12 -8.6680040140785959 13 -8.5708792472365083
		 14 -8.3707544327317773 15 -8.1472515849770275 16 -8.0990323362958083 17 -8.0844019685938946
		 18 -8.1172879398584694 19 -8.2235330643699491 20 -8.3487463373219928 21 -8.5158692912365854
		 22 -8.6931767521877426 23 -8.9723977744020544 24 -9.2419786734778562 25 -9.3509359222312884
		 26 -9.4676503279401025 27 -9.4022469655294572 28 -9.2777809602537218 29 -9.1204773713982465
		 30 -8.9203218094800327 31 -8.7241718309441385 32 -8.5301704192765264;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Scapula_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.1817433459952025e-006 1 -2.1817433459952025e-006
		 2 -2.1817433459952025e-006 3 -2.1817433459952025e-006 4 -2.1817433459952025e-006
		 5 -2.1817433459952025e-006 6 -2.1817433459952025e-006 7 -2.1817433459952025e-006
		 8 -2.1817433459952025e-006 9 -2.1817433459952025e-006 10 -2.1817433459952025e-006
		 11 -2.1817433459952025e-006 12 -2.1817433459952025e-006 13 -2.1817433459952025e-006
		 14 -2.1817433459952025e-006 15 -2.1817433459952025e-006 16 -2.1817433459952025e-006
		 17 -2.1817433459952025e-006 18 -2.1817433459952025e-006 19 -2.1817433459952025e-006
		 20 -2.1817433459952025e-006 21 -2.1817433459952025e-006 22 -2.1817433459952025e-006
		 23 -2.1817433459952025e-006 24 -2.1817433459952025e-006 25 -2.1817433459952025e-006
		 26 -2.1817433459952025e-006 27 -2.1817433459952025e-006 28 -2.1817433459952025e-006
		 29 -2.1817433459952025e-006 30 -2.1817433459952025e-006 31 -2.1817433459952025e-006
		 32 -2.1817433459952025e-006;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Scapula_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.4203839476090244e-006 1 2.4203839476090244e-006
		 2 2.4203839476090244e-006 3 2.4203839476090244e-006 4 2.4203839476090244e-006 5 2.4203839476090244e-006
		 6 2.4203839476090244e-006 7 2.4203839476090244e-006 8 2.4203839476090244e-006 9 2.4203839476090244e-006
		 10 2.4203839476090244e-006 11 2.4203839476090244e-006 12 2.4203839476090244e-006
		 13 2.4203839476090244e-006 14 2.4203839476090244e-006 15 2.4203839476090244e-006
		 16 2.4203839476090244e-006 17 2.4203839476090244e-006 18 2.4203839476090244e-006
		 19 2.4203839476090244e-006 20 2.4203839476090244e-006 21 2.4203839476090244e-006
		 22 2.4203839476090244e-006 23 2.4203839476090244e-006 24 2.4203839476090244e-006
		 25 2.4203839476090244e-006 26 2.4203839476090244e-006 27 2.4203839476090244e-006
		 28 2.4203839476090244e-006 29 2.4203839476090244e-006 30 2.4203839476090244e-006
		 31 2.4203839476090244e-006 32 2.4203839476090244e-006;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Scapula_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -8.1415927139264375e-006 1 -8.1415927139264375e-006
		 2 -8.1415927139264375e-006 3 -8.1415927139264375e-006 4 -8.1415927139264375e-006
		 5 -8.1415927139264375e-006 6 -8.1415927139264375e-006 7 -8.1415927139264375e-006
		 8 -8.1415927139264375e-006 9 -8.1415927139264375e-006 10 -8.1415927139264375e-006
		 11 -8.1415927139264375e-006 12 -8.1415927139264375e-006 13 -8.1415927139264375e-006
		 14 -8.1415927139264375e-006 15 -8.1415927139264375e-006 16 -8.1415927139264375e-006
		 17 -8.1415927139264375e-006 18 -8.1415927139264375e-006 19 -8.1415927139264375e-006
		 20 -8.1415927139264375e-006 21 -8.1415927139264375e-006 22 -8.1415927139264375e-006
		 23 -8.1415927139264375e-006 24 -8.1415927139264375e-006 25 -8.1415927139264375e-006
		 26 -8.1415927139264375e-006 27 -8.1415927139264375e-006 28 -8.1415927139264375e-006
		 29 -8.1415927139264375e-006 30 -8.1415927139264375e-006 31 -8.1415927139264375e-006
		 32 -8.1415927139264375e-006;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Shoulder_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -13.435700510048383 1 -10.42875889726413
		 2 -4.6206250422048587 3 -2.3048224841702298 4 0.036982120515899213 5 2.2388146924913999
		 6 4.4743592322545069 7 5.974212762946161 8 7.1348933681599087 9 7.6558435849196504
		 10 7.4570620803616414 11 7.1337397320166218 12 5.8930493976396638 13 4.6632185685209624
		 14 3.2673970028633685 15 1.8634273150341432 16 0.38192292154803414 17 -1.1007431109913528
		 18 -2.7896247331107191 19 -4.6165032314913796 20 -6.7252590082409496 21 -9.3897385039874628
		 22 -11.858196222747329 23 -14.065275272135581 24 -16.17086091878917 25 -17.952667531861721
		 26 -19.845548114392997 27 -20.687132591961493 28 -21.241231105621214 29 -20.750896898654776
		 30 -18.768472277117379 31 -16.62473624091125 32 -13.435700510048383;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Shoulder_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -4.4198391533604298 1 -0.77260223778884496
		 2 6.3139728371337274 3 9.0143631933756172 4 11.822903474513684 5 14.20583384834476
		 6 16.6164466314492 7 17.970972783506255 8 18.710202910141142 9 18.874728206725688
		 10 17.716850029547736 11 16.637338270858507 12 15.033411666539317 13 13.398461507742889
		 14 11.974400985962502 15 10.57441099928759 16 9.0041637205401983 17 7.4230160708454811
		 18 5.5954782346463645 19 3.6046160531949636 20 1.3951157115145891 21 -1.2856648945267353
		 22 -3.7864718210478103 23 -6.2643922218417698 24 -8.6134974900840788 25 -10.590132471044274
		 26 -12.700327737099244 27 -13.533859430579419 28 -13.99896218689215 29 -13.329899093108383
		 30 -10.851862232841365 31 -8.2169608069294142 32 -4.4198391533604298;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Shoulder_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -72.472003427171813 1 -72.483449788552875
		 2 -72.296979049038939 3 -71.419466987563254 4 -70.622333485336895 5 -69.925012220476106
		 6 -69.195040419768574 7 -69.122861979360465 8 -69.268525120726451 9 -69.647855932284756
		 10 -70.571912901165632 11 -71.327972315732808 12 -71.496146661119553 13 -71.729903074679513
		 14 -72.072920070299304 15 -72.438058057648021 16 -72.760078453955515 17 -73.100712042422842
		 18 -73.50198749536699 19 -73.980002674509436 20 -74.438822838050385 21 -74.805018726829275
		 22 -75.218138419178331 23 -75.376962103192781 24 -75.645806719980499 25 -75.362675682960855
		 26 -75.157901307024957 27 -74.387426846160508 28 -73.360970130567779 29 -72.830047713593231
		 30 -72.745974225053232 31 -72.621531745156076 32 -72.472003427171813;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Elbow_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -7.7164719711504404 1 -6.495472482147159
		 2 -4.4877915051234218 3 -2.9837970234706259 4 -1.4881087646238247 5 0.50497162224235448
		 6 2.6483446808155038 7 4.4450733769595061 8 6.0785498006244705 9 7.567476723606589
		 10 8.7593201376427725 11 9.6630831195717697 12 9.5379648034061013 13 9.4094423643174725
		 14 7.8361462580442005 15 6.1844306970419742 16 4.5581393017601206 17 2.9243563290853301
		 18 1.326194463472417 19 -0.22921270074950265 20 -1.9152743800354219 21 -3.8252904556733371
		 22 -5.4801411029043363 23 -6.2682524137043041 24 -6.9769478553551814 25 -7.6756652499918605
		 26 -8.3920901960138714 27 -9.1702067615842431 28 -10.106593232818481 29 -10.230325094109766
		 30 -9.7780488215595298 31 -9.0726717115788169 32 -7.7164719711504404;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Elbow_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 10.202651792899312 1 12.324126492956486
		 2 16.414065838247396 3 16.402211809199535 4 16.40448213909815 5 16.529936232143431
		 6 16.696318055312624 7 17.166079096456638 8 17.842511314094409 9 18.592858877975953
		 10 19.496055656921541 11 20.376098319226706 12 21.185976144081874 13 22.035489381997916
		 14 22.216741473295748 15 22.392701189328047 16 22.539282704427066 17 22.691475304171473
		 18 22.372532644754205 19 21.46198181799976 20 20.078647817160906 21 17.548932150727751
		 22 15.242532300340395 23 12.841730400476251 24 10.559154802898407 25 8.2647579763730672
		 26 5.8472259208688904 27 4.3488907566023434 28 2.9639883361979753 29 3.3674249984343199
		 30 5.8852726117575562 31 8.0582231873919739 32 10.202651792899312;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Elbow_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.79402501961313277 1 -1.266851382261031
		 2 -1.3687069523833097 3 -0.87477194710746331 4 -0.39903016430027088 5 0.45758480062666634
		 6 1.4186850885988307 7 2.1582409574161416 8 2.7901519855807235 9 3.2915006788535561
		 10 3.5207813588302166 11 3.6819089333356185 12 3.3286957462245725 13 2.9813117297103231
		 14 2.8356604564808316 15 2.6785036821991333 16 2.7813121418992672 17 2.9509795040641111
		 18 3.2652661707525477 19 3.684717126213525 20 3.9807737818650852 21 4.1134877278770894
		 22 4.2002856164149422 23 4.208785559063422 24 4.1948299286109751 25 4.0817039866202443
		 26 3.9881449371263455 27 3.3667987114859255 28 2.5814083941012056 29 1.6711380695862585
		 30 0.55798884908185964 31 -0.35386829496925354 32 -0.79402501961313277;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Wrist_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.27508162067850223 1 0.47982564709426556
		 2 1.2468413369651388 3 1.976256241727949 4 2.7238889347293687 5 3.3884044888784182
		 6 4.0534575815998917 7 4.5685427848527471 8 4.9672116949565819 9 5.5621819269811219
		 10 6.4730210987241934 11 7.2918974775394618 12 7.6870770905598196 13 8.1404232870537356
		 14 7.0692112697780054 15 5.9774376243759928 16 4.4630040252457368 17 2.8210209389039931
		 18 1.3772904766675909 19 0.041331371972805245 20 -1.0752740842550594 21 -1.7169826789546727
		 22 -2.3567831517156259 23 -2.7733609358232312 24 -3.1847536003637154 25 -3.2405625968052458
		 26 -3.2894850720121895 27 -2.9938880841088493 28 -2.4909152958164946 29 -2.0437289004122103
		 30 -1.6214474837317325 31 -1.087103513465965 32 -0.27508162067850223;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Wrist_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 3.6198126515472051 1 3.3426077323804448
		 2 3.7017383689713825 3 4.0374429273001287 4 4.3654393301046559 5 4.9104877364899311
		 6 5.5096610813848352 7 5.9956121524776558 8 6.3727310185342505 9 7.0636902269099471
		 10 8.2813978826873775 11 9.3655615839307096 12 10.124009295848275 13 10.937619412781373
		 14 10.174323696104826 15 9.4465103359898954 16 7.841759581585741 17 5.9155181176570117
		 18 4.5417154032005085 19 3.5441343486138077 20 2.7789169203774629 21 2.5953253832320349
		 22 2.3693932994201932 23 2.2245788494970133 24 2.0844981393746442 25 2.432252746953631
		 26 2.8201835715140229 27 3.3342811007086715 28 3.9844407095013956 29 4.1579181321416199
		 30 4.1266927027916189 31 4.0275520569311523 32 3.6198126515472051;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Wrist_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -1.7202056138786976 1 -0.49338824063702319
		 2 0.10018554078209826 3 0.1948923687552539 4 0.29542712902335905 5 0.08885976640024297
		 6 -0.20358243776847221 7 -0.69728217696230776 8 -1.335042572167666 9 -2.0430178769824177
		 10 -2.9024970581097627 11 -3.7428044788522774 12 -4.4382250440391813 13 -5.1966251142093922
		 14 -5.184682608370764 15 -5.1994014617715765 16 -4.8973872355486296 17 -4.4451213691789384
		 18 -4.2887733500167862 19 -4.2763975273380606 20 -4.3234691345645899 21 -4.6240119522761329
		 22 -4.8879412028434954 23 -5.2633140556421463 24 -5.6407415278086219 25 -5.5500747109627007
		 26 -5.4725978762123679 27 -4.9013122973592527 28 -4.0803809155827224 29 -3.6534608579379593
		 30 -3.5774527159418237 31 -3.1765605052052437 32 -1.7202056138786976;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Neck_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.3260564100951744 1 1.0194054969766797
		 2 0.44996202215288289 3 0.12963230065950432 4 -0.20553501863645926 5 -0.40790770259856318
		 6 -0.58350663416745585 7 -0.74549052174258124 8 -0.90427288422755603 9 -1.0204045318394392
		 10 -1.0560208327219054 11 -1.0786924386036547 12 -0.87646539639601029 13 -0.68808755141917588
		 14 -0.34221884596746016 15 0.0033420809672498439 16 0.39285748370238799 17 0.79652424995670867
		 18 1.1867881421694277 19 1.5726066758731412 20 1.9210239039252339 21 2.192793370372994
		 22 2.4394612996676392 23 2.5078258415082866 24 2.57716868274388 25 2.4934026532830127
		 26 2.3954347174110757 27 2.3158568532322215 28 2.2524735202480812 29 2.1047984937897581
		 30 1.8841396599650726 31 1.6429338303648338 32 1.3260564100951744;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Neck_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -1.3472630600951234 1 -1.3891241491676327
		 2 -1.5179666184182081 3 -1.6035082629190311 4 -1.7007366340533618 5 -1.541577221232572
		 6 -1.3269902422276381 7 -0.90340589026933515 8 -0.31492924269385569 9 0.19800026935946038
		 10 0.60876494445092832 11 0.99963138381155558 12 1.212295469273589 13 1.4496920464678942
		 14 1.2795260007046154 15 1.1155111842389984 16 0.77746711815042358 17 0.37690284058800516
		 18 0.094533496406875001 19 -0.10077992665266383 20 -0.30151414666004278 21 -0.48540589582904498
		 22 -0.67070067162811386 23 -0.91168253252023113 24 -1.1435386836543744 25 -1.2659294199208175
		 26 -1.4016075007864952 27 -1.4161808523059021 28 -1.4171518265567444 29 -1.396940985580218
		 30 -1.3279423922589597 31 -1.3010655293781166 32 -1.3472630600951234;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Neck_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 19.906495369514616 1 19.968777613339473
		 2 20.001239484166906 3 20.166424908780709 4 20.333696555219742 5 20.501881448136135
		 6 20.690945562018275 7 20.746078199548055 8 20.756292133841242 9 20.714174353468607
		 10 20.454912098581445 11 20.214687458193318 12 19.870471616097912 13 19.51762660097106
		 14 19.36585330527404 15 19.196744956369642 16 19.194396225236513 17 19.207507896434425
		 18 19.298374006581181 19 19.479519015491256 20 19.678038903322872 21 19.943394926588486
		 22 20.18611776078404 23 20.398816997843113 24 20.612114240381182 25 20.525651980395853
		 26 20.43182989652647 27 20.260819035336361 28 20.054240945891067 29 19.925451200648716
		 30 19.858274970975327 31 19.827229341780328 32 19.906495369514616;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Head_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.2586969672569217 1 1.3287664263414702
		 2 -0.43031900049027233 3 -1.4328079380825673 4 -2.494409901396589 5 -2.9800311971206415
		 6 -3.361964375363641 7 -3.5572490915109953 8 -3.6263543097923523 9 -3.6349563590119502
		 10 -3.4713877925350798 11 -3.2464996078968977 12 -2.5430016830645084 13 -1.8434666189070241
		 14 -0.94046102750099669 15 -0.03544801658588214 16 0.89069582810739201 17 1.8190638195019118
		 18 2.7846005536985907 19 3.7934084063346938 20 4.6886294562540911 21 5.3756560196916938
		 22 5.9589464421095695 23 6.0169888567502747 24 6.0596046860649659 25 5.7418366409200683
		 26 5.3677682021028383 27 5.1164524362232777 28 4.9323815193103773 29 4.5181681637084932
		 30 3.912150277979213 31 3.2222478974016417 32 2.2586969672569217;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Head_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -1.9324387786286019 1 -1.83426527107335
		 2 -1.7005364996607026 3 -1.6377198773763169 4 -1.5898889487870191 5 -1.344996918536093
		 6 -1.0791636329996983 7 -0.62291814239790366 8 -0.016567223935731588 9 0.50398196248050697
		 10 0.90113671906937221 11 1.2673524601972186 12 1.3814664917786448 13 1.5152852074766407
		 14 1.2105692642489925 15 0.90241323281568109 16 0.41672783024329219 17 -0.13253094366042545
		 18 -0.56523407223095057 19 -0.91336336523029138 20 -1.2464476277160128 21 -1.5253986280877954
		 22 -1.7932700379398467 23 -2.0344383735985523 24 -2.2678769339970453 25 -2.3469961043769514
		 26 -2.4283352212418996 27 -2.4210837950094071 28 -2.4017529333752563 29 -2.3184865899560299
		 30 -2.1631063981688565 31 -2.0310951706344684 32 -1.9324387786286019;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Head_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -15.763763789088975 1 -15.716302367429771
		 2 -15.703629834474073 3 -15.548570942774319 4 -15.390826510251813 5 -15.222140055148499
		 6 -15.034131446858231 7 -14.963174487428779 8 -14.943727548240796 9 -14.979350213859677
		 10 -15.232332414869296 11 -15.469930369574801 12 -15.820264940465897 13 -16.179857063744009
		 14 -16.339170497757543 15 -16.51238909924189 16 -16.512993527646479 17 -16.494833924596271
		 18 -16.386938583820697 19 -16.193022371661112 20 -15.976703713586321 21 -15.693944878733584
		 22 -15.433271509299265 23 -15.210988246221426 24 -14.98830777687791 25 -15.078553208077892
		 26 -15.177025818178169 27 -15.352866479689393 28 -15.563563942736105 29 -15.70202533749382
		 30 -15.784648659650069 31 -15.825572473948288 32 -15.763763789088975;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Scapula_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.1307251692906871e-005 1 -2.1307251692906871e-005
		 2 -2.1307251692906871e-005 3 -2.1307251692906871e-005 4 -2.1307251692906871e-005
		 5 -2.1307251692906871e-005 6 -2.1307251692906871e-005 7 -2.1307251692906871e-005
		 8 -2.1307251692906871e-005 9 -2.1307251692906871e-005 10 -2.1307251692906871e-005
		 11 -2.1307251692906871e-005 12 -2.1307251692906871e-005 13 -2.1307251692906871e-005
		 14 -2.1307251692906871e-005 15 -2.1307251692906871e-005 16 -2.1307251692906871e-005
		 17 -2.1307251692906871e-005 18 -2.1307251692906871e-005 19 -2.1307251692906871e-005
		 20 -2.1307251692906871e-005 21 -2.1307251692906871e-005 22 -2.1307251692906871e-005
		 23 -2.1307251692906871e-005 24 -2.1307251692906871e-005 25 -2.1307251692906871e-005
		 26 -2.1307251692906871e-005 27 -2.1307251692906871e-005 28 -2.1307251692906871e-005
		 29 -2.1307251692906871e-005 30 -2.1307251692906871e-005 31 -2.1307251692906871e-005
		 32 -2.1307251692906871e-005;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Scapula_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.0005552369177469e-005 1 1.0005552369177469e-005
		 2 1.0005552369177469e-005 3 1.0005552369177469e-005 4 1.0005552369177469e-005 5 1.0005552369177469e-005
		 6 1.0005552369177469e-005 7 1.0005552369177469e-005 8 1.0005552369177469e-005 9 1.0005552369177469e-005
		 10 1.0005552369177469e-005 11 1.0005552369177469e-005 12 1.0005552369177469e-005
		 13 1.0005552369177469e-005 14 1.0005552369177469e-005 15 1.0005552369177469e-005
		 16 1.0005552369177469e-005 17 1.0005552369177469e-005 18 1.0005552369177469e-005
		 19 1.0005552369177469e-005 20 1.0005552369177469e-005 21 1.0005552369177469e-005
		 22 1.0005552369177469e-005 23 1.0005552369177469e-005 24 1.0005552369177469e-005
		 25 1.0005552369177469e-005 26 1.0005552369177469e-005 27 1.0005552369177469e-005
		 28 1.0005552369177469e-005 29 1.0005552369177469e-005 30 1.0005552369177469e-005
		 31 1.0005552369177469e-005 32 1.0005552369177469e-005;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Scapula_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.7472791986738114e-005 1 -2.7472791986738114e-005
		 2 -2.7472791986738114e-005 3 -2.7472791986738114e-005 4 -2.7472791986738114e-005
		 5 -2.7472791986738114e-005 6 -2.7472791986738114e-005 7 -2.7472791986738114e-005
		 8 -2.7472791986738114e-005 9 -2.7472791986738114e-005 10 -2.7472791986738114e-005
		 11 -2.7472791986738114e-005 12 -2.7472791986738114e-005 13 -2.7472791986738114e-005
		 14 -2.7472791986738114e-005 15 -2.7472791986738114e-005 16 -2.7472791986738114e-005
		 17 -2.7472791986738114e-005 18 -2.7472791986738114e-005 19 -2.7472791986738114e-005
		 20 -2.7472791986738114e-005 21 -2.7472791986738114e-005 22 -2.7472791986738114e-005
		 23 -2.7472791986738114e-005 24 -2.7472791986738114e-005 25 -2.7472791986738114e-005
		 26 -2.7472791986738114e-005 27 -2.7472791986738114e-005 28 -2.7472791986738114e-005
		 29 -2.7472791986738114e-005 30 -2.7472791986738114e-005 31 -2.7472791986738114e-005
		 32 -2.7472791986738114e-005;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Shoulder_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.8291493713402929 1 -8.3113391658165163
		 2 -12.614597242726921 3 -13.847825240937217 4 -15.161201995722401 5 -16.036039548747837
		 6 -16.861382395604316 7 -17.27114334936503 8 -17.369505213124707 9 -17.548054979522114
		 10 -17.827125427297812 11 -18.091741418840972 12 -18.311541888828849 13 -18.535789536619763
		 14 -18.117790698450413 15 -17.671991901840759 16 -16.121214847269822 17 -14.230608173839361
		 18 -11.753993272298374 19 -8.8042321855841941 20 -6.0397388319149918 21 -3.5628918330846475
		 22 -1.2399570241418145 23 0.738955110643715 24 2.6077861394388075 25 3.3882008241956774
		 26 4.2312401373024331 27 3.745460281210391 28 2.8860166822595241 29 1.3180900261098392
		 30 -1.0023905844944567 31 -3.3267259210874371 32 -5.8291493713402929;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Shoulder_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 8.9233136644829383 1 6.3105695694140191
		 2 1.2259446408596197 3 -0.63508551338901964 4 -2.604482508136253 5 -4.3259177361923733
		 6 -6.0629768663726136 7 -7.470630379736277 8 -8.6911565418754773 9 -9.7546041210005026
		 10 -10.493779707405407 11 -11.047493535347769 12 -10.387220485912854 13 -9.7890149071526888
		 14 -8.0710288910781571 15 -6.3792284278609861 16 -3.4675114516798944 17 -0.18248255717167203
		 18 3.296906078559235 19 6.9837563723135299 20 10.257652981248594 21 12.7588051632037
		 22 15.209810726996082 23 17.222565779869395 24 19.187195847877447 25 19.856974867867443
		 26 20.563176523819294 27 19.804764089569517 28 18.507656580348137 29 16.62081560405743
		 30 14.082227790569886 31 11.576756376259882 32 8.9233136644829383;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Shoulder_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -76.532509065756059 1 -77.054499200805054
		 2 -77.140323766572166 3 -76.468094663004578 4 -75.876576334862392 5 -75.048810096192796
		 6 -74.212592146876418 7 -73.401379315962984 8 -72.553428053899992 9 -71.86802787220951
		 10 -71.46273431490529 11 -71.192245584638286 12 -72.263564545377193 13 -73.260772367108245
		 14 -74.131386282102099 15 -75.133111298461458 16 -75.50618280610945 17 -76.001345172592153
		 18 -76.108736044598913 19 -76.104086029816699 20 -76.080714042002427 21 -75.322381257701011
		 22 -74.698032407495276 23 -73.894190757078633 24 -73.097619284996284 25 -72.875853295958464
		 26 -72.666530180578206 27 -73.041293354497483 28 -73.706759253404883 29 -74.424078506541818
		 30 -75.258799288529787 31 -75.996143375739891 32 -76.532509065756059;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Elbow_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -14.793575900823939 1 -15.94582669075597
		 2 -16.223051267870527 3 -15.389474260963896 4 -14.65069510573529 5 -13.286557935920261
		 6 -11.855793480158839 7 -10.041331191437379 8 -7.8270726310073178 9 -6.2111126407360704
		 10 -5.6035520684052695 11 -5.1449385010047939 12 -6.5672550563943197 13 -7.8873813236130319
		 14 -9.756844539379026 15 -11.575109713414879 16 -13.207049775147306 17 -14.901773391184262
		 18 -15.222241915334306 19 -15.033934289631222 20 -14.52627797786554 21 -13.048672917761458
		 22 -11.85561282347201 23 -10.650849683444868 24 -9.5634516992150953 25 -9.1512646784865357
		 26 -8.7516128216098377 27 -9.0716619555596818 28 -9.587839302981747 29 -10.603536694642825
		 30 -12.169320741942148 31 -13.582964802760474 32 -14.793575900823939;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Elbow_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 13.480912452545997 1 12.253617776447754
		 2 9.7200715516704825 3 8.7420046566183505 4 7.7793091917633825 5 6.5262432559809458
		 6 5.2279115265136076 7 3.8618606544697669 8 2.4086541230239593 9 1.1000124049149707
		 10 -0.0042781992327476067 11 -0.81515875254423575 12 -0.32884434256020495 13 0.13658373817808558
		 14 1.1875382193523447 15 2.2845374936825054 16 3.2435043366161485 17 4.1486152738005257
		 18 5.2587979932267892 19 6.5098792028796417 20 7.8803960402450812 21 9.4953720332506499
		 22 11.043539192291425 23 12.82689361929299 24 14.524228462292271 25 15.608334187830454
		 26 16.78677169447031 27 16.996002929045211 28 17.054609817984517 29 16.741319030541653
		 30 15.733868319346106 31 14.748074970407215 32 13.480912452545997;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Elbow_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 7.6706901143176012 1 6.4779579343913181
		 2 4.98766346581069 3 4.2795879733573194 4 3.5247380150970709 5 3.0367489028516887
		 6 2.5810398496870941 7 2.3215737668180099 8 2.2084226106075229 9 1.9820079636042613
		 10 1.5816052936942622 11 1.308425985132291 12 1.5873002231658926 13 1.8345151551212486
		 14 1.7089231306656165 15 1.5450109057571562 16 1.4046724058201696 17 1.2460131069154332
		 18 1.4150853363015292 19 1.939840718709539 20 2.6254225977682717 21 3.8103270927446373
		 22 4.9107073088998821 23 6.0256648266768256 24 7.146667469157884 25 7.9846009945869989
		 26 8.8889366024386973 27 9.477519691808002 28 10.038055946702485 29 10.054282036901544
		 30 9.6166971807027579 31 8.9686487259297145 32 7.6706901143176012;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Wrist_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 8.5483977749838154 1 8.3612163775704325
		 2 8.5550090027482817 3 8.3409286173056394 4 8.1108506729292849 5 8.0387575149744528
		 6 7.995614128964772 7 7.9061080506771511 8 7.8112333010647053 9 7.7355230404720601
		 10 7.6532525970689829 11 7.6468214405722863 12 8.7494382786918177 13 9.7667920291330752
		 14 11.17397078681177 15 12.630787375870819 16 13.894213443060963 17 15.203202110580044
		 18 16.120125888214293 19 16.756367641650129 20 16.966549386807895 21 16.226743465413605
		 22 15.579157320266736 23 14.500869324837479 24 13.477407747077939 25 12.401870900967726
		 26 11.266740575836678 27 10.551218079589868 28 9.9583291751838807 29 9.4685353520221405
		 30 9.0952264822662361 31 8.7638830249525164 32 8.5483977749838154;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Wrist_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 10.045387084220389 1 9.886314548087368
		 2 9.2199778441553697 3 9.1682219292062186 4 9.1173912746981784 5 9.267247687086039
		 6 9.5090157900018202 7 9.1708057360363071 8 8.2416518818724818 9 7.1893235317717847
		 10 5.6835943299616432 11 4.6140077391210852 12 4.8097476552866993 13 5.0122712449739382
		 14 6.3871415627322037 15 7.8088864035454026 16 8.8546466931126169 17 9.8179174798507987
		 18 10.127777870025724 19 10.188797640770387 20 10.200162858363704 21 9.9577777642663481
		 22 9.7598783679916323 23 9.7395297914720196 24 9.7115474267343274 25 9.7831184311616894
		 26 9.8966352068991341 27 9.7350587051696245 28 9.4074816521714233 29 9.4726030590407362
		 30 9.9864381204782759 31 10.214899742164489 32 10.045387084220389;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Wrist_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.4939612640949001 1 -1.3116296076461977
		 2 -5.3685210715097211 3 -6.6432157872082556 4 -8.0974926647096996 5 -6.1039778427301004
		 6 -3.0248542312494426 7 -0.74879136610572905 8 1.3049296825954442 9 2.5170641331338466
		 10 2.6345723515487527 11 2.9477932898556523 12 4.0079538363411862 13 5.0650460735859042
		 14 4.3530240870467951 15 3.7461042371768456 16 0.86184783970551326 17 -3.2152818970181576
		 18 -3.5533336699750313 19 -1.7711511426736262 20 0.10397604031966495 21 2.6460802546589819
		 22 4.7954162393327211 23 5.3423617922921895 24 5.8895989918383513 25 5.2560191828218983
		 26 4.5083867531015072 27 4.0244273382232327 28 3.692466381848301 29 2.7789715116114393
		 30 1.311052267129948 31 0.13260347138346462 32 -0.4939612640949001;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Hip_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -1.0060905860045406 1 -0.72684369693402551
		 2 0.19177138065428964 3 0.70849371414183604 4 1.2920119309113611 5 1.6576792091626067
		 6 1.9109960695913979 7 2.0750812673693453 8 2.229436189675579 9 2.2864615615182249
		 10 2.1680223040913944 11 2.0087829964574948 12 1.5845981098191828 13 1.263198221945989
		 14 1.3071712076575726 15 1.5502438036296562 16 2.0856742995414357 17 2.7682960265683985
		 18 3.1146512349514937 19 3.1521527854866234 20 3.0094941176297989 21 2.0999805419861315
		 22 1.4259881206169152 23 1.0989849680364012 24 0.80846905814246495 25 0.62811142128286768
		 26 0.46354103482626602 27 0.076745171791274436 28 -0.36121020589999148 29 -0.74101863776702281
		 30 -1.0866635985507576 31 -1.225638799281014 32 -1.0060905860045406;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Hip_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -9.2377284496812067 1 -9.7906622329596384
		 2 -8.4266856709036819 3 -8.3785081408479876 4 -8.4191100414816447 5 -8.4984681440470222
		 6 -8.5112947574033768 7 -8.489611073566925 8 -8.4189332190596602 9 -7.9814624411955597
		 10 -6.6572725141372597 11 -5.2382308974090552 12 -3.0433165905087889 13 -0.69006689009123601
		 14 1.3012208870292241 15 3.4493368722602726 16 3.9815928858358154 17 4.1697967347908502
		 18 3.8530134938249785 19 2.8332569225813056 20 2.0642153514265926 21 1.5929953498542953
		 22 1.2761945749491497 23 1.2462449192454457 24 1.2186677238980654 25 0.78718677910155388
		 26 0.37681366462438814 27 -0.94454526617039303 28 -2.5730327457704649 29 -4.4826127719569397
		 30 -6.7984116512781476 31 -8.6394017902979527 32 -9.2377284496812067;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Hip_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -19.53166586999226 1 -16.151286473573574
		 2 -8.5019018909872699 3 -4.3672951875893142 4 0.69620215674298724 5 6.351216699075664
		 6 11.483354334831363 7 13.965486702423169 8 15.79863648927622 9 16.687032683852486
		 10 15.307237508638202 11 14.077504141927909 12 9.9521775839572282 13 6.599200622337289
		 14 0.53189426141477703 15 -5.5859083771603171 16 -11.70174497060056 17 -18.013667503029041
		 18 -22.629289849015471 19 -26.263734826603269 20 -28.110335073106221 21 -27.980421672892813
		 22 -27.947219310047572 23 -28.536483330536697 24 -29.204292023650453 25 -29.554667465057729
		 26 -29.936771728760494 27 -28.884488852312703 28 -27.22043863997531 29 -25.889965566782532
		 30 -24.518779893002915 31 -22.546931189196883 32 -19.53166586999226;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Knee_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -1.5117418284239801 1 -1.3202873237791191
		 2 -0.57116787348829323 3 0.25371618753239156 4 1.17674599116418 5 1.1638471804366828
		 6 0.82681944499936588 7 0.79544487164020505 8 0.86232257931684886 9 0.98092166765856914
		 10 1.4273024667236718 11 1.5105132487933073 12 1.1143198608109268 13 0.65909446089327484
		 14 0.70952547728449222 15 0.69186167684327882 16 1.2415314428303648 17 2.0636674191090201
		 18 3.0924460191729501 19 4.3799147315459104 20 4.7285242035730457 21 3.1730897790401191
		 22 1.6001427760133593 23 0.26205503927944157 24 -0.8721909135747371 25 -1.2229461038134617
		 26 -1.5481561066178222 27 -1.7541088291606963 28 -1.9512156675751209 29 -1.9638609598652483
		 30 -1.804683921866461 31 -1.6559785410894152 32 -1.5117418284239801;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Knee_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 4.2256316345060831 1 4.7845488721571581
		 2 4.9283530347384508 3 4.4044893842413817 4 3.8418199717968653 5 2.4700841845171984
		 6 0.8066112131194767 7 0.48568895598451411 8 0.45192007407806606 9 0.6710430030559813
		 10 2.2312926322350171 11 3.2015520243501463 12 3.2435207216432143 13 3.0670921296249971
		 14 2.8585092673172237 15 2.8570160981180988 16 3.0073649976060439 17 3.3425928492176635
		 18 2.9599467761703315 19 1.5891168051602138 20 0.18870195606712903 21 -1.4339607901953293
		 22 -2.5474899218638609 23 -1.4611261664499826 24 -0.073337346046937119 25 1.0429384991403747
		 26 2.3182774895662788 27 2.4935081915025732 28 2.528054341188279 29 2.7576998639407289
		 30 3.1024192942919004 31 3.5194333550128891 32 4.2256316345060831;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Knee_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 29.98176618544608 1 28.419504076642504
		 2 20.95897154348156 3 17.702696046333728 4 12.534351842778708 5 5.8011501613405656
		 6 -0.57199327248057019 7 -0.94177076828323325 8 -0.55064324128065001 9 0.51694675493462194
		 10 7.5592715237615309 11 12.940970525734201 12 22.309309821825703 13 29.380829575670653
		 14 38.487903564191093 15 47.930987260867418 16 54.027989799339075 17 59.989662063081873
		 18 60.389674144670515 19 57.639761836790193 20 52.498664449429093 21 41.845822788482664
		 22 32.644654552416412 23 26.397553114786671 24 20.412518204525139 25 20.440953996135363
		 26 20.496939006841504 27 21.441201481029363 28 23.074978363523321 29 25.694161488837011
		 30 29.096403911262648 31 30.595366273008892 32 29.98176618544608;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Ankle_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 24.146662953552898 1 23.554775032332937
		 2 20.638274576888627 3 19.910287234018355 4 19.181334536125 5 18.45400136517139 6 17.710114211259643
		 7 16.746079248733253 8 15.602189133580696 9 14.720775986456072 10 14.290089822959521
		 11 14.0797276328059 12 16.151287042185938 13 18.268745423388925 14 19.355240279091817
		 15 20.431754986391752 16 19.963453921790698 17 19.18970352274798 18 19.239409145774705
		 19 19.8153757814984 20 20.925001961793114 21 23.001863337087006 22 24.251433748141096
		 23 22.881932424318432 24 21.439834069186844 25 21.614486822656115 26 21.75388636720163
		 27 22.332971260859416 28 23.110335588421133 29 23.75931652077978 30 24.420206086670355
		 31 24.754630606456544 32 24.146662953552898;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Ankle_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.36796718354005792 1 -0.11353112746611435
		 2 -0.034719501045095927 3 0.38216679126066788 4 0.77114941658558123 5 1.4940416511768375
		 6 1.70210645687656 7 1.1029649545657483 8 -0.29250247100810189 9 -2.4950396863365993
		 10 -6.5361359233492564 11 -10.608553244771825 12 -13.337662052171764 13 -15.573439207515159
		 14 -15.116349088032354 15 -14.846204984185613 16 -12.038968932450201 17 -7.997551180979606
		 18 -6.0791680748732784 19 -5.5091837128045684 20 -5.8083406799347594 21 -10.056446005722638
		 22 -12.543418684429227 23 -7.987161520870913 24 -3.7004764626524622 25 -1.9968127385957484
		 26 -0.20397084890645817 27 -0.68935300437964386 28 -2.1714501176193814 29 -2.3143189898450074
		 30 -1.3286452722065298 31 -0.58727024760788582 32 -0.36796718354005792;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Ankle_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -11.028322819684551 1 -12.780172250406833
		 2 -13.266862366238287 3 -13.883742499029688 4 -13.511881891665082 5 -12.476402128670632
		 6 -10.216458450762605 7 -10.171630041615442 8 -10.341017453003454 9 -9.6782634266977059
		 10 -8.9863520117656126 11 -5.0665311244710391 12 2.406432763414537 13 13.895443381100682
		 14 20.256759281438654 15 27.380140978471822 16 25.9658069533256 17 23.055038251821426
		 18 18.135846803612473 19 11.390369944351782 20 5.6239442328158473 21 1.2729412631191463
		 22 -2.717608546263008 23 -3.8242952452948491 24 -5.1998295915152966 25 -3.8769978161662171
		 26 -2.3356278937278203 27 -0.97544167984557328 28 0.54663691250747115 29 -0.53459962359281221
		 30 -5.3032249221916148 31 -8.8943173624860847 32 -11.028322819684551;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Toes_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.9946770714858628 1 -5.9944425771918306
		 2 -5.9945253891835097 3 -5.9944032256893554 4 -5.9970841062303899 5 -6.7809847487790282
		 6 -7.923049613988022 7 -10.035414434291326 8 -12.559887727920589 9 -16.940270794744478
		 10 -24.745599186560334 11 -33.516939478816333 12 -46.993058999330913 13 -60.088264738422019
		 14 -59.289353489536502 15 -58.215494132061487 16 -50.960162993182507 17 -41.55259656663533
		 18 -35.246638351751635 19 -30.826897828846683 20 -25.801918919007612 21 -19.190934727062377
		 22 -9.211682289472968 23 -7.6016963856769815 24 -5.8316754522464915 25 -5.8246141708483412
		 26 -5.8249994003961501 27 -5.825018531061235 28 -5.8250688804482014 29 -5.9022972769771087
		 30 -5.9953619036531185 31 -5.994455451776517 32 -5.9946770714858628;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Hip_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.0542969122095345 1 5.8033948870272321
		 2 6.6860631658038283 3 5.8837421938645047 4 4.9745626468320401 5 4.0040273174332697
		 6 2.9735381518112178 7 2.3592029085537543 8 2.0535529337873828 9 1.4006957727562104
		 10 0.23755636851643849 11 -0.8751136141151965 12 -2.0758957271956935 13 -3.3101317548005564
		 14 -3.506455080954948 15 -3.5909252796415729 16 -2.9712322849574355 17 -1.8904879279720816
		 18 -0.71291434859732028 19 0.53658292309449673 20 1.4041972867611254 21 1.5306523403078851
		 22 1.5578319428882033 23 1.9605093130203139 24 2.3759098262614868 25 2.6588847890101079
		 26 2.8926305822467282 27 2.8945132823799962 28 2.889037657085463 29 3.0321004143893493
		 30 3.5497205326589403 31 4.2300376447012917 32 5.0542969122095345;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Hip_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 13.672580454323743 1 12.602077844824034
		 2 8.5247315355305915 3 7.4459271366093285 4 6.3225163185966391 5 5.8477354335853891
		 6 5.501864757536957 7 5.2362718794419862 8 5.1877136358421376 9 4.9235644070979072
		 10 3.507409181140285 11 2.1849123148369323 12 0.15191878417987123 13 -2.2495528427823439
		 14 -4.5576812652161545 15 -7.0302648785125212 16 -8.3581852102126675 17 -9.3945763986991793
		 18 -8.892236574995616 19 -6.6344403833639296 20 -4.4062341410713408 21 -2.0749786656313822
		 22 -0.39443751159156887 23 -0.62145398877729041 24 -0.95515649903437405 25 0.52982651320771268
		 26 2.1550514711749282 27 5.0282325999739736 28 8.3485447973859639 29 11.031535470132942
		 30 13.443678209416214 31 14.673422476468589 32 13.672580454323743;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Hip_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.4667884908628244 1 -9.217256057043695
		 2 -16.14914418652166 3 -17.838252481114523 4 -19.571967625931414 5 -21.167260323727355
		 6 -22.771231641112742 7 -25.15220103056145 8 -28.042991808800352 9 -29.083405055226155
		 10 -28.602337459213167 11 -27.919915366431031 12 -25.44508698564735 13 -23.11462116211262
		 14 -21.329732678266193 15 -19.271440273090445 16 -16.64540527739625 17 -13.586159724812751
		 18 -9.93114520390575 19 -5.5943893644593965 20 -0.91403869443372676 21 4.2411247430956402
		 22 10.64766496172445 23 15.773339808162183 24 19.381131846893364 25 20.606779125558663
		 26 23.527315938409338 27 21.869323407848235 28 19.902341131586208 29 15.856199422987045
		 30 8.9141896748068596 31 2.4592399392172881 32 -3.4667884908628244;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Knee_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 4.5393970152027086 1 4.1472350463314429
		 2 5.2885246806118706 3 5.1668890784775385 4 4.8919537424967272 5 4.1644006060325873
		 6 3.2468517092388054 7 2.4938216318848969 8 1.8778773357942113 9 1.1357794465367912
		 10 0.20548660140105823 11 -0.70769994463604291 12 -1.6314912014553322 13 -2.6790710277668661
		 14 -2.9275053911323821 15 -3.1536811485698415 16 -2.7512441835340309 17 -1.9950236564011237
		 18 -0.85133620221324302 19 0.66696236763893868 20 1.9282114573471618 21 2.5316235699516478
		 22 2.9374042300045304 23 3.3718833708989311 24 3.8206119683130231 25 4.2822305870383017
		 26 4.8626431688340537 27 5.2141834423493743 28 5.6217387466494051 29 5.7037756758369991
		 30 5.4054016671632663 31 4.9835516755969884 32 4.5393970152027086;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Knee_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 3.1651295873737713 1 3.7871392319198338
		 2 3.0064425754136819 3 2.0079291459331361 4 0.84170932991357439 5 0.26824835040880696
		 6 -0.13250865182764074 7 0.25051532265453047 8 1.3871439705373507 9 2.3602061900970859
		 10 3.2831708085998836 11 4.2278647846432724 12 5.2260733336990368 13 6.3606324360615512
		 14 7.6628075444024422 15 8.8521691035589782 16 9.9212936953377913 17 10.956280708195525
		 18 10.599668556797843 19 8.6998148960067638 20 6.4685961485040755 21 3.7049099325827131
		 22 1.6461621988994495 23 2.3057517299415538 24 3.2080039259122022 25 2.9727208246276264
		 26 2.5569273213509742 27 2.0527922301963586 28 1.3747180493012168 29 1.3194121426923224
		 30 1.81096571985809 31 2.3719097890959597 32 3.1651295873737713;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Knee_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 52.194992612502766 1 57.931671259116456
		 2 56.278002597460599 3 49.818726104380119 4 43.282430412414087 5 36.089276661414843
		 6 28.364391886707889 7 25.552298965847296 8 24.381572152593748 9 23.267729133635235
		 10 23.140609750102946 11 23.102351795221772 12 24.994754961662988 13 27.14170768088195
		 14 29.884304908896052 15 32.303439169977565 16 32.446295031114929 17 31.938442584949616
		 18 29.671814200973465 19 25.641264753724641 20 20.633431464255928 21 14.148947363139833
		 22 4.9863096812958618 23 -0.10901096116865407 24 -2.6108485447827374 25 0.31184945370357436
		 26 0.070811075600453841 27 6.4134968093961042 28 14.023676254237103 29 22.716919688834256
		 30 35.149462483654851 31 45.637269706625204 32 52.194992612502766;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Ankle_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 12.499860900167285 1 14.223431957339514
		 2 15.417321988611404 3 15.77517684480109 4 16.326729860157883 5 16.337510187247794
		 6 16.295719938208062 7 15.542864190576237 8 13.701503708961205 9 12.944379964987945
		 10 13.020728013795894 11 13.217570890847149 12 14.600310129743034 13 15.984540328570654
		 14 16.789573750350932 15 17.725002404079959 16 17.647684490806622 17 17.403195649861864
		 18 16.432239820042234 19 14.838899200980611 20 13.666983446198158 21 13.277089176815611
		 22 12.86426331600725 23 12.159420693219877 24 11.454062687039919 25 10.092980359470877
		 26 8.8016484525557832 27 8.0612530094196835 28 7.6427168244572101 29 7.964764040156239
		 30 9.2287756085678065 31 10.589463730756281 32 12.499860900167285;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Ankle_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -12.968484492205912 1 -12.196703113855472
		 2 -9.4950585579068143 3 -9.0680727798239253 4 -8.7002788316259227 5 -5.1924340478483213
		 6 0.39893025632871554 7 1.570125692191817 8 0.79461578443659509 9 -0.26828796548280387
		 10 -0.76416676236447578 11 -1.6036183223508966 12 -2.0647238028485635 13 -2.324983420231729
		 14 -2.4108759872439531 15 -2.405750392179804 16 -2.3369035841374646 17 -2.2571633994291207
		 18 -1.7746201031313245 19 -0.91966970615394206 20 -0.06583335585805046 21 0.87548278279987957
		 22 1.4363008812515796 23 -0.29863473489142744 24 -2.2397522748104852 25 -4.7678348076581001
		 26 -7.2347880586697393 27 -9.8592753377075493 28 -12.115171561466362 29 -13.085236852027982
		 30 -13.430732014543814 31 -13.656433019314505 32 -12.968484492205912;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Ankle_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 16.465004481518889 1 13.270501126744373
		 2 2.0316576798622537 3 -2.5493326243102774 4 -7.7554116506872033 5 -7.8707439294028072
		 6 -7.6668117957904265 7 -6.3662572446709298 8 -4.2340671637215177 9 -2.3494970257155892
		 10 -0.15129972748994444 11 1.3847088643071213 12 -1.0757634828089226 13 -4.6678109178636848
		 14 -8.7357003001247673 15 -12.592520224462247 16 -15.571218121378712 17 -18.047989971021018
		 18 -19.708273416710604 19 -20.380095597545502 20 -20.423275700031393 21 -19.554136977722472
		 22 -16.923878021503846 23 -15.038722235395873 24 -13.261502109070301 25 -12.214850743148405
		 26 -8.350891201473841 27 -4.1519744571892208 28 3.4438665477912638 29 10.997648511237024
		 30 17.044755878520146 31 19.942118556532385 32 16.465004481518889;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Toes_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -34.051560552852898 1 -21.966237360091945
		 2 -22.255050035193776 3 -22.834122131895114 4 -17.910557737353031 5 -12.575619584471644
		 6 -6.9734849186015273 7 -5.809430252976667 8 -5.8281647093369076 9 -5.8284406661121615
		 10 -5.8290408105464984 11 -5.8296364388883504 12 -5.8330050389935408 13 -5.9953919128150792
		 14 -5.9945757277794645 15 -5.9947198555686203 16 -5.9944722705395774 17 -5.9945541956422277
		 18 -5.9945264154659377 19 -5.9944427946283074 20 -5.9945639943684661 21 -5.9945913055933415
		 22 -6.0682295888146731 23 -8.7826610592776557 24 -11.785523755826176 25 -17.39510298244916
		 26 -24.183432229972112 27 -35.287209496695382 28 -50.604731437572575 29 -54.920787643915418
		 30 -54.217414961783454 31 -50.407884085542811 32 -34.051560552852898;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTL -n "walk_cute:Root_M_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.14032915251021508 1 -0.13658258457302197
		 2 -0.12300126872122055 3 -0.097740053358850762 4 -0.071778901327794631 5 -0.051747143192340035
		 6 -0.029600019607687041 7 -0.0059823396743501709 8 0.01508645597160542 9 0.035785562032082066
		 10 0.080303636180944993 11 0.1246529772080229 12 0.17210613172767822 13 0.19487620277806611
		 14 0.20455322397803999 15 0.21039393855991276 16 0.2034065537929389 17 0.18807684391647342
		 18 0.16975979351519235 19 0.14077580678467594 20 0.11549844495239062 21 0.096914351469176235
		 22 0.075712232737734864 23 0.053559233840793488 24 0.034568595589476885 25 0.0033645141445892215
		 26 -0.029881314181125357 27 -0.061610670444176931 28 -0.093013367394964006 29 -0.12093209093901894
		 30 -0.12888052794907531 31 -0.13912503630666415 32 -0.14032915251021508;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTL -n "walk_cute:Root_M_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 6.0099433946562817 1 6.0852725144879223
		 2 6.1436295614569367 3 6.1644143300846457 4 6.1902319601539846 5 6.1453401607759526
		 6 6.0922061928786606 7 6.0361045309855212 8 5.973734144229824 9 5.9095568957784117
		 10 5.7860313882288494 11 5.7899850617437547 12 5.7853209389096119 13 5.797859081730218
		 14 5.8250031837382688 15 5.8719099260054994 16 5.9922126230495154 17 6.1057155217017707
		 18 6.1961071387490314 19 6.294829846520491 20 6.3191094776871974 21 6.3127687130880403
		 22 6.2994668064540926 23 6.2305129404306356 24 6.1583084207206591 25 6.0932221494769365
		 26 6.0246802503345744 27 5.9765923689242948 28 5.9558000794169033 29 5.9214449463096379
		 30 5.9417855177875785 31 5.9570863407996333 32 6.0099433946562817;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTL -n "walk_cute:Root_M_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.16155504240509139 1 0.16116756006886623
		 2 0.16309981840829368 3 0.16746747523898928 4 0.16661740866964375 5 0.16190308779374804
		 6 0.15189800337953002 7 0.1411843904742596 8 0.12998248980304863 9 0.12221081260517509
		 10 0.13667223838657513 11 0.14427566815596973 12 0.15190925225716115 13 0.1619201233897703
		 14 0.16911798708694281 15 0.16956749151863046 16 0.16694415700757781 17 0.16624483240897445
		 18 0.16504929805725449 19 0.16044605895321626 20 0.15611470962087018 21 0.1508799609670026
		 22 0.14426403696767981 23 0.14738725180158282 24 0.15409795572561319 25 0.16253355197668873
		 26 0.17436930144180621 27 0.17840388867638363 28 0.17495949294634805 29 0.17443513560342952
		 30 0.16912752225640326 31 0.16436142982424867 32 0.16155504240509139;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Root_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.7112991552144721 1 1.5044152982780381
		 2 0.90315999305006489 3 -0.99147262648700618 4 -2.7130148789547697 5 -5.3827615439872423
		 6 -8.2197520549793861 7 -10.157523528619814 8 -11.495344416389788 9 -12.385056805199845
		 10 -10.439577638374475 11 -9.851313377583427 12 -9.1258784732806255 13 -9.0832621444988941
		 14 -9.2782827829827674 15 -9.2689076516155779 16 -7.9861409246281561 17 -6.8661891875582457
		 18 -6.1596918513383478 19 -5.7304362247326921 20 -3.6043653123935124 21 0.23720277072173779
		 22 3.3672210306562178 23 4.0208488726332847 24 5.0032961783184726 25 4.1724156633035596
		 26 2.6913289353236576 27 1.6987302076006678 28 1.2387969263342988 29 0.78082177707551981
		 30 1.2383491790982675 31 1.7573955315983505 32 1.7112991552144721;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Root_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -10.938626069103821 1 -8.3288329358365392
		 2 -6.2818404049244485 3 -4.9938925201586901 4 -3.5530224697155584 5 -3.222971377403669
		 6 -3.0631103312422803 7 -2.1008772804526834 8 -0.54949089775544457 9 0.96465420735907326
		 10 3.3361028342313683 11 6.2221230935570331 12 9.3935916122059009 13 10.936614310014509
		 14 11.634726980422275 15 11.915908422360665 16 9.8482694636450567 17 8.1124586429126744
		 18 5.4192726572298966 19 2.4433950631201085 20 0.724391889113562 21 0.14834777272720429
		 22 -0.61284087456367931 23 -1.477690019725173 24 -2.2129967629570486 25 -3.4256024445480033
		 26 -4.6985509101084864 27 -6.4402507831326403 28 -8.9763887257233179 29 -11.33597492016081
		 30 -11.669889378422985 31 -12.084707589109984 32 -10.938626069103821;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Root_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -8.792594996987054 1 -8.6498134443718975
		 2 -8.3680063713221582 3 -7.6975686198141142 4 -7.1165113171128409 5 -6.5663573387889658
		 6 -5.9480908306632028 7 -6.2029094971742849 8 -7.4493719551612498 9 -8.2238282432520418
		 10 -7.9195858880766972 11 -8.5616953896895609 12 -9.2921710241537099 13 -9.1919143416939892
		 14 -8.6573490207731556 15 -8.3949874754219298 16 -8.4705782816751487 17 -8.590100917291668
		 18 -8.5859612885016521 19 -8.6044297488992356 20 -8.6254806687663681 21 -8.6531188093095235
		 22 -8.6994114181390287 23 -8.4566465882280522 24 -8.2447839445644817 25 -8.046811337625968
		 26 -7.794617842572281 27 -7.7265220386182953 28 -7.9012859741684895 29 -8.0424307742723222
		 30 -8.398264183734625 31 -8.8181121293633211 32 -8.792594996987054;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Spine1_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -6.7691683044610933 1 -3.0117485577716181
		 2 1.4390560218297153 3 7.6141809448344242 4 13.581522029561054 5 19.278410076333586
		 6 25.265846551702126 7 28.675378875703103 8 30.14886522038373 9 31.234129435889404
		 10 29.036123035998134 11 26.897457144184216 12 24.812049350963896 13 21.732703783713898
		 14 18.146781809665811 15 14.602303817809382 16 10.649260613816251 17 6.9220584565967709
		 18 2.7057385168140562 19 -1.3170401856524412 20 -7.2137642554767138 21 -15.06876907261694
		 22 -21.657077459732267 23 -22.747899691392405 24 -24.47391260886344 25 -23.654378955768038
		 26 -22.189258453618837 27 -20.684925583058 28 -18.944648188940395 29 -17.084055982653986
		 30 -13.752047341226447 31 -10.445342633565696 32 -6.7691683044610933;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Spine1_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 14.819573248898662 1 11.798220034220597
		 2 9.0038547843481211 3 6.109837358441264 4 3.2801224807704066 5 1.3803642584041944
		 6 -0.35146295693180746 7 -2.4762310547245794 8 -4.9491306489578655 9 -7.1725060258373459
		 10 -8.2424165268080234 11 -11.570032103863346 12 -15.222797809904744 13 -16.947581210920099
		 14 -17.673419732416246 15 -17.87256306505255 16 -14.468678443070461 17 -11.611800813744106
		 18 -6.8746052936912987 19 -1.8117093579260333 20 2.1360066056302069 21 5.1672689725694863
		 22 7.9398613739051829 23 8.7014797629273346 24 9.5594627724172394 25 9.9419696284986721
		 26 10.1273054695766 27 11.056303022654257 28 13.359696636096375 29 15.416111510936352
		 30 15.795634763099573 31 16.185548872664889 32 14.819573248898662;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Spine1_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 19.270434987820032 1 19.637169740148998
		 2 19.714153936679079 3 19.144713398470742 4 18.264860189474856 5 18.380995115614233
		 6 18.332020269195827 7 18.673404828893791 8 19.772741084111921 9 20.277112711241088
		 10 17.436967599097596 11 17.231755166070577 12 17.188921008080584 13 17.070835766349571
		 14 16.908908559244498 15 16.904446457717267 16 17.392614557045984 17 17.569946172667319
		 18 17.46058962361435 19 16.830823189177515 20 16.637084309668801 21 16.589112220994085
		 22 16.196697675259692 23 16.257779374710044 24 16.267320506893533 25 15.718158213843051
		 26 14.738853520932413 27 14.527510932138066 28 15.251428225582167 29 15.989215645342023
		 30 17.199950320700264 31 18.509845679833152 32 19.270434987820032;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Spine2_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 3.9626041560468459 1 2.439778765629844
		 2 0.57215975446090261 3 -2.1428763016238914 4 -4.7394068111242378 5 -7.3530168498316719
		 6 -10.110412795639858 7 -11.732051724470535 8 -12.525258350554742 9 -13.106529332133736
		 10 -11.878876617445282 11 -10.964327097993763 12 -10.093445246651228 13 -8.8217284693680966
		 14 -7.3492387134969386 15 -5.8678180045770958 16 -4.1314109451867536 17 -2.482683790763756
		 18 -0.64884863999429299 19 1.0593101304501675 20 3.6890484281561249 21 7.2817781606884351
		 22 10.281234305465885 23 10.775590928539582 24 11.535701842357081 25 11.081604311205856
		 26 10.277367131696185 27 9.5296176650210889 28 8.7646736729608676 29 7.9402835383631594
		 30 6.6703266080152526 31 5.4242803714608003 32 3.9626041560468459;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Spine2_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -9.0244493797613217 1 -7.5205940786940708
		 2 -6.1601451414862121 3 -4.7901959556415381 4 -3.3935577184995855 5 -2.6073217358532519
		 6 -1.8793103108494473 7 -1.1057285775433632 8 -0.3198190445565034 9 0.48942745449177782
		 10 1.6616218613260798 11 3.1947179126826866 12 4.8570872842576422 13 5.7597900403838898
		 14 6.2657841909725498 15 6.4373071972934728 16 4.9265350715500853 17 3.6499843168751975
		 18 1.5555849988730734 19 -0.71414217118714463 20 -2.5049720711321601 21 -3.8878686451504278
		 22 -5.1678670581309456 23 -5.6157008870344116 24 -6.1344893115761163 25 -6.4742949180762404
		 26 -6.7136582906567153 27 -7.2733015980596756 28 -8.3238817124404711 29 -9.3063852248998966
		 30 -9.4823338297565485 31 -9.7019452381980695 32 -9.0244493797613217;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Spine2_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -1.4763694591976264 1 -1.2710499368777695
		 2 -1.0138350288622646 3 -0.51185512276861889 4 -0.094290278692620702 5 -0.1003282274769028
		 6 -0.12609818545195095 7 -0.54660386859644217 8 -1.623703225879765 9 -2.2710498281632638
		 10 -1.5652535796583591 11 -2.2173454773620502 12 -2.9646836818391975 13 -2.9945359356793984
		 14 -2.7869424242193062 15 -2.521582396420178 16 -2.0645732969979242 17 -1.6842387094376898
		 18 -1.17145255943066 19 -0.64044287657006804 20 -0.6046248756932624 21 -0.97113254826019557
		 22 -1.3328677473467652 23 -1.5013533583862742 24 -1.7184490996959503 25 -1.4466778986409181
		 26 -0.92712120576079327 27 -0.79512931794445907 28 -1.0707503910278626 29 -1.2939388784327213
		 30 -1.425118534615984 31 -1.5747219282947238 32 -1.4763694591976264;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Chest_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.7794439739999603 1 -2.29345744263231
		 2 -0.465220238923165 3 2.1933819140787376 4 4.7543279970707406 5 7.3643484394366201
		 6 10.119602809787972 7 11.74290578736421 8 12.525895372131277 9 13.082815977214056
		 10 11.835939701836676 11 10.852855160751817 12 9.8726342784267676 13 8.5572459472069546
		 14 7.0821627097057869 15 5.619015775936151 16 3.9670077680436506 17 2.380009309525454
		 18 0.61645822886101287 19 -1.0544643063657473 20 -3.6638515579582651 21 -7.2344176280551151
		 22 -10.199484445267199 23 -10.680198059068484 24 -11.417460326187443 25 -10.989722413014373
		 26 -10.238729139297943 27 -9.5069184582078385 28 -8.7018129763560097 29 -7.8348975148060385
		 30 -6.5250623982045068 31 -5.2306140993218175 32 -3.7794439739999603;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Chest_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 9.105618588500267 1 7.5651198259390391
		 2 6.1709516605138939 3 4.7675449550014797 4 3.3738451821037421 5 2.5731873272577901
		 6 1.8400486907989728 7 0.96052627883546482 8 -0.034891577238466441 9 -1.0023103690235209
		 10 -1.9477357591248901 11 -3.5559963108816217 12 -5.2887287776364618 13 -6.1512617984838824
		 14 -6.5561919382061848 15 -6.6701923413260396 16 -5.0597397908828121 17 -3.7177403206702997
		 18 -1.5687993909101152 19 0.72330423911148378 20 2.5416675493919607 21 3.9793994113160505
		 22 5.3221357010642611 23 5.7965064528322152 24 6.355985533033695 25 6.6296697940332097
		 26 6.7744421084765998 27 7.3007368832039301 28 8.3890155299794014 29 9.3955810195597298
		 30 9.5826348805725257 31 9.802094998512894 32 9.105618588500267;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Chest_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.85712019415260454 1 0.95286745565929554
		 2 0.96723167725923542 3 0.69325738887506672 4 0.3786074385137092 5 0.43156573058583603
		 6 0.45420656555481792 7 0.76037026749135528 8 1.6384476987480285 9 2.1264650715559656
		 10 1.1904580751821725 11 1.5741756248377339 12 2.0686908902516516 13 2.096248097152134
		 14 1.9765568170704253 15 1.8647881464405736 16 1.711622459291595 17 1.5297352881003103
		 18 1.1523346672392685 19 0.60420102406889742 20 0.46333469779793685 21 0.46801300154994807
		 22 0.39977893674030868 23 0.42912180465602168 24 0.45048612689659323 25 0.18683846722945335
		 26 -0.28765850586224029 27 -0.41682090548387396 28 -0.20706425976633638 29 0.0013652431819983558
		 30 0.32341746927924481 31 0.66858575007107912 32 0.85712019415260454;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Scapula_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.1817433459952025e-006 1 -2.1817433459952025e-006
		 2 -2.1817433459952025e-006 3 -2.1817433459952025e-006 4 -2.1817433459952025e-006
		 5 -2.1817433459952025e-006 6 -2.1817433459952025e-006 7 -2.1817433459952025e-006
		 8 -2.1817433459952025e-006 9 -2.1817433459952025e-006 10 -2.1817433459952025e-006
		 11 -2.1817433459952025e-006 12 -2.1817433459952025e-006 13 -2.1817433459952025e-006
		 14 -2.1817433459952025e-006 15 -2.1817433459952025e-006 16 -2.1817433459952025e-006
		 17 -2.1817433459952025e-006 18 -2.1817433459952025e-006 19 -2.1817433459952025e-006
		 20 -2.1817433459952025e-006 21 -2.1817433459952025e-006 22 -2.1817433459952025e-006
		 23 -2.1817433459952025e-006 24 -2.1817433459952025e-006 25 -2.1817433459952025e-006
		 26 -2.1817433459952025e-006 27 -2.1817433459952025e-006 28 -2.1817433459952025e-006
		 29 -2.1817433459952025e-006 30 -2.1817433459952025e-006 31 -2.1817433459952025e-006
		 32 -2.1817433459952025e-006;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Scapula_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.4203839476090244e-006 1 2.4203839476090244e-006
		 2 2.4203839476090244e-006 3 2.4203839476090244e-006 4 2.4203839476090244e-006 5 2.4203839476090244e-006
		 6 2.4203839476090244e-006 7 2.4203839476090244e-006 8 2.4203839476090244e-006 9 2.4203839476090244e-006
		 10 2.4203839476090244e-006 11 2.4203839476090244e-006 12 2.4203839476090244e-006
		 13 2.4203839476090244e-006 14 2.4203839476090244e-006 15 2.4203839476090244e-006
		 16 2.4203839476090244e-006 17 2.4203839476090244e-006 18 2.4203839476090244e-006
		 19 2.4203839476090244e-006 20 2.4203839476090244e-006 21 2.4203839476090244e-006
		 22 2.4203839476090244e-006 23 2.4203839476090244e-006 24 2.4203839476090244e-006
		 25 2.4203839476090244e-006 26 2.4203839476090244e-006 27 2.4203839476090244e-006
		 28 2.4203839476090244e-006 29 2.4203839476090244e-006 30 2.4203839476090244e-006
		 31 2.4203839476090244e-006 32 2.4203839476090244e-006;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Scapula_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -8.1415927139264375e-006 1 -8.1415927139264375e-006
		 2 -8.1415927139264375e-006 3 -8.1415927139264375e-006 4 -8.1415927139264375e-006
		 5 -8.1415927139264375e-006 6 -8.1415927139264375e-006 7 -8.1415927139264375e-006
		 8 -8.1415927139264375e-006 9 -8.1415927139264375e-006 10 -8.1415927139264375e-006
		 11 -8.1415927139264375e-006 12 -8.1415927139264375e-006 13 -8.1415927139264375e-006
		 14 -8.1415927139264375e-006 15 -8.1415927139264375e-006 16 -8.1415927139264375e-006
		 17 -8.1415927139264375e-006 18 -8.1415927139264375e-006 19 -8.1415927139264375e-006
		 20 -8.1415927139264375e-006 21 -8.1415927139264375e-006 22 -8.1415927139264375e-006
		 23 -8.1415927139264375e-006 24 -8.1415927139264375e-006 25 -8.1415927139264375e-006
		 26 -8.1415927139264375e-006 27 -8.1415927139264375e-006 28 -8.1415927139264375e-006
		 29 -8.1415927139264375e-006 30 -8.1415927139264375e-006 31 -8.1415927139264375e-006
		 32 -8.1415927139264375e-006;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Shoulder_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -7.1327059662895413 1 -2.652299453015647
		 2 1.7871995274523509 3 6.5569021617379617 4 11.09819563863754 5 17.241225555970697
		 6 23.037069766872126 7 27.432085014736092 8 30.986870979826232 9 33.186736693777114
		 10 32.858067321194078 11 29.31483271889028 12 25.687520387209197 13 21.900005237812511
		 14 18.250474386747044 15 14.216081195454979 16 8.2974952947222462 17 2.3156142592423143
		 18 -1.7371293428219983 19 -6.0530110925050042 20 -7.108326624038221 21 -6.6860195976867205
		 22 -6.3991618022551622 23 -8.4679735452031437 24 -10.000064266072323 25 -11.791085453676443
		 26 -13.978429418836834 27 -14.709558517339326 28 -14.051924457530218 29 -13.309989924081114
		 30 -11.848434331791069 31 -10.589084237408027 32 -7.1327059662895413;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Shoulder_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -17.220586886150066 1 -11.527038965463824
		 2 -6.1092747184473577 3 -1.1337894297133715 4 4.033686534817571 5 10.796117768737419
		 6 17.887766050892655 7 23.851936531703856 8 29.326421061861183 9 32.985221811001914
		 10 31.999578410711468 11 26.362683148748989 12 20.868575814326086 13 14.546248547108343
		 14 8.228252525910067 15 2.6329343428557226 16 -3.1885976897445407 17 -8.7021405789901465
		 18 -13.599690382993721 19 -18.767465562849281 20 -22.678322361980456 21 -25.431934866369264
		 22 -28.435161455884099 23 -30.941430559512966 24 -33.478853487197199 25 -34.873354380038407
		 26 -36.14345289708281 27 -36.086457563403684 28 -33.182287120085796 29 -30.562705262414315
		 30 -26.213034160305646 31 -22.28204112635078 32 -17.220586886150066;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Shoulder_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -84.888510863920473 1 -85.790133101539169
		 2 -86.375690328677805 3 -84.030146621657195 4 -82.580951715027524 5 -79.307457875556224
		 6 -75.81249562841181 7 -72.747891505698618 8 -69.694780460220471 9 -67.570992417978658
		 10 -68.205216167806938 11 -70.215180458310613 12 -72.645177631169915 13 -75.775008794630679
		 14 -79.934461150621203 15 -83.848987401750776 16 -85.412265308654256 17 -87.776532722329662
		 18 -85.500219854450108 19 -83.199534976152407 20 -79.233617007464701 21 -73.272562449716631
		 22 -68.252213277055034 23 -67.11619053209769 24 -65.115125219131613 25 -65.832358997577714
		 26 -66.980422385557375 27 -68.931278172984193 28 -72.327403321512236 29 -75.6665856435107
		 30 -79.378043749015617 31 -83.770987304144995 32 -84.888510863920473;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Elbow_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 37.778853144524149 1 36.679167304792301
		 2 36.140057378263663 3 36.214143095598885 4 36.345515989306215 5 37.603499853853421
		 6 38.935758566481319 7 40.156832521779414 8 41.4519409067765 9 42.294882726760967
		 10 42.570400308609337 11 40.572983691443504 12 38.228372133144219 13 37.104182199565891
		 14 36.890402159926388 15 36.505680358304872 16 34.826696197617416 17 33.173045949204429
		 18 33.761955664906729 19 34.321360148671936 20 36.426717550946329 21 40.083822368514944
		 22 42.433896593382279 23 42.44014796163593 24 42.39386229132252 25 41.898584801950804
		 26 41.07257440450168 27 40.942676504666885 28 41.92175800481558 29 42.660852481475523
		 30 40.957708834399455 31 39.109915638540393 32 37.778853144524149;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Elbow_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 13.396057966894896 1 15.561533990742378
		 2 17.558120820677274 3 19.241398453623123 4 21.009263481703627 5 19.920830693672734
		 6 18.541334054371884 7 17.206876399955028 8 15.777334216397419 9 14.948774222997681
		 10 16.677855353506111 11 18.967770476444255 12 21.324097333158669 13 22.534921885854846
		 14 22.72321071873958 15 22.694408940206685 16 22.237252854180266 17 21.914148687531824
		 18 20.263382367317959 19 18.533683088367855 20 16.276031057844314 21 13.440851948992831
		 22 10.866151439180355 23 9.3858276856320089 24 7.339480909731142 25 6.855630469443077
		 26 6.5584854291757519 27 6.5235204964745215 28 7.0975190241106327 29 7.6768497893304115
		 30 9.5333198817956681 31 11.352048615859752 32 13.396057966894896;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Elbow_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 7.679237334120816 1 6.1567238301580298
		 2 4.9170379879160695 3 4.6137766511822962 4 4.1850322997991709 5 5.803559202202333
		 6 7.6099629925650163 7 8.8304195985911544 8 9.670057823082189 9 10.444937440569953
		 10 10.42560012755305 11 12.021791267675757 12 13.678052541818573 13 16.987558918157852
		 14 21.632344167158863 15 24.199474969887461 16 24.148863803247419 17 24.045705709627555
		 18 23.465458020454065 19 22.897815422212645 20 21.686469745115097 21 19.916475012889808
		 22 18.066296696246443 23 15.154262801023469 24 12.473701478325573 25 11.087971837096058
		 26 9.9474403230242388 27 9.3247027832581129 28 9.2444430762727539 29 9.0921632744883834
		 30 8.8656981605437633 31 8.6397803224566623 32 7.679237334120816;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Wrist_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -29.543939792081851 1 -26.083324988503666
		 2 -24.357741374440533 3 -24.918193096827103 4 -25.336282277056231 5 -28.471281675134648
		 6 -32.261501028272328 7 -35.121704679595794 8 -37.331725971920932 9 -39.400509114747507
		 10 -39.730280958356595 11 -42.880570202441554 12 -45.872273734209188 13 -51.357147852718626
		 14 -59.1692823407734 15 -63.626066348994485 16 -63.611034055921586 17 -63.451283936773599
		 18 -63.512836966789017 19 -63.625277614383293 20 -63.272663730760968 21 -62.18864699635126
		 22 -60.691216643980049 23 -54.435203605526858 24 -48.880794493186208 25 -44.70407524067371
		 26 -40.808742882510401 27 -37.844606506619236 28 -36.272850929365738 29 -34.528636751960804
		 30 -33.141100392957114 31 -31.982199998701837 32 -29.543939792081851;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Wrist_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -12.58083604716858 1 -13.187632419588892
		 2 -12.663654305142538 3 -4.5198636749388701 4 2.4377669360212422 5 7.966730860745546
		 6 13.641076632070547 7 16.380062981240965 8 16.942290371842784 9 17.780114080972318
		 10 19.563192939917887 11 22.923679202174696 12 26.278990921899855 13 30.625621040440056
		 14 35.825144089766972 15 38.516647324475223 16 37.558869556937125 17 36.687118883578151
		 18 35.130143669466172 19 33.585212354817941 20 31.378910387086556 21 28.598167451159021
		 22 25.527473355309773 23 20.370589873158952 24 14.990106066395802 25 10.756247444741369
		 26 6.754599783704613 27 2.8948370736149123 28 -0.69299060868577855 29 -4.4941113082896953
		 30 -7.639592611439709 31 -11.072739731632543 32 -12.58083604716858;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Wrist_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 14.330267794547421 1 14.949499407192818
		 2 15.250184349655143 3 15.093954342193404 4 15.00735588654446 5 16.478860608981371
		 6 18.563649295565313 7 21.415404356007265 8 24.896848927891472 9 27.986356840752958
		 10 31.962677149705666 11 31.31382921101909 12 30.850125029470981 13 30.980655490618755
		 14 32.17772075254571 15 33.187208705564636 16 32.678017599234551 17 32.214462348380671
		 18 31.604982146018273 19 31.04675568426897 20 29.977783325625516 21 28.511883160451319
		 22 27.007321843223149 23 24.45133245940977 24 22.769099571808248 25 21.727392263428371
		 26 21.173158788794332 27 20.452780392787837 28 19.268065173930225 29 18.192020792247295
		 30 16.375428220009699 31 14.357557891964195 32 14.330267794547421;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Neck_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.7636177072938706 1 0.79580090587717434
		 2 -0.17426316990899332 3 -1.144332218909621 4 -2.1143913151684015 5 -2.6835768093698906
		 6 -3.2915078816302548 7 -3.5466710809638937 8 -3.5992504894292194 9 -3.6390382436285815
		 10 -3.3450015900409298 11 -3.4829751251607468 12 -3.631114763986286 13 -3.3133551637026155
		 14 -2.5242850374878909 15 -1.8528858184758938 16 -1.2409312117899829 17 -0.65906285846928214
		 18 0.14619192282114971 19 0.94965880439254058 20 1.8835838054412342 21 2.9928346094525673
		 22 3.8613507731780228 23 3.9426294189391555 24 4.0639613054602854 25 4.114414865347662
		 26 4.1514093610130764 27 4.1651415645965795 28 4.150319192963142 29 4.1216039889452167
		 30 3.377873538206142 31 2.6431731073871165 32 1.7636177072938706;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Neck_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.7966715004123084 1 1.2838816589874165
		 2 0.75715982461678843 3 0.22837040345043824 4 -0.28843183132604167 5 -1.3938347743702584
		 6 -2.5438204071204056 7 -3.6830594792316762 8 -4.912098397490789 9 -5.7278846436860853
		 10 -5.7308350894005402 11 -4.6096859572505204 12 -3.47532182314478 13 -2.2413499138904629
		 14 -0.93229349844571274 15 0.12933153458927119 16 0.61971734469301443 17 1.141180270890819
		 18 1.5976437924485427 19 2.0446004632837456 20 2.4921091082307116 21 2.9282796548926648
		 22 3.4183635302713786 23 4.2150652629259495 24 5.1072924760626757 25 5.0643096219170083
		 26 4.930524041372772 27 4.6303900504191153 28 4.0577044500379245 29 3.4940190494586481
		 30 2.9156985838790654 31 2.3290262596386166 32 1.7966715004123084;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Neck_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 3.929769383343249 1 3.7038386128795096
		 2 3.5910873972080268 3 3.9099510250614249 4 4.1846619417937791 5 3.5968592185473494
		 6 2.7901595424767054 7 2.7184846713164057 8 3.0321988681857435 9 3.3094142610735258
		 10 4.1246386508935018 11 3.6079742632657994 12 3.0899450771564223 13 2.5176652087173146
		 14 1.869593779280182 15 1.5883893808588556 16 2.4123046915692523 17 3.1057259958230863
		 18 4.2381083364232044 19 5.4810542640466267 20 6.2751350406096815 21 6.6938412666306633
		 22 7.0336071092037598 23 6.8006329295511474 24 6.5661640283595233 25 6.8726910308164797
		 26 7.4513941293558936 27 7.568826001796749 28 7.1202148595331565 29 6.6845814722474985
		 30 5.5953546510695196 31 4.4362135121851995 32 3.929769383343249;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Head_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 4.6361415285214376 1 1.6336511576679129
		 2 -1.373167921257973 3 -4.3702773439290734 4 -7.3727395040533326 5 -9.284937014507129
		 6 -11.237959745757966 7 -12.303773715664917 8 -12.672282526164151 9 -12.972096903264376
		 10 -12.179701346073779 11 -12.311079703538438 12 -12.44921130702833 13 -11.326129673196581
		 14 -8.6990057808040397 15 -6.52079404549964 16 -4.6086181414427712 17 -2.7635140480508591
		 18 -0.22826331120166971 19 2.3305606619829686 20 5.2758773397074066 21 8.7108205630544884
		 22 11.533748925273338 23 11.916077216085858 24 12.464417363714402 25 12.662082448513113
		 26 12.781240696069595 27 12.785525323926038 28 12.540386511547826 29 12.248579475922908
		 30 9.8020456657209856 31 7.4052365804941367 32 4.6361415285214376;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Head_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -1.001768820850325 1 -1.4151119096849865
		 2 -1.8601667031594009 3 -2.3712172722970681 4 -2.8816786548970175 5 -3.8336619288088505
		 6 -4.7836053403503191 7 -5.8544054509546264 8 -7.124265018773257 9 -7.9623802804606383
		 10 -8.1520589796815184 11 -6.9463353722456853 12 -5.7224060429172328 13 -4.4310149758928024
		 14 -3.0827452280500238 15 -2.0484357067818988 16 -1.7477369485470386 17 -1.3797464562476534
		 18 -1.1315192292692171 19 -0.87564999938045263 20 -0.54931433370750171 21 -0.18200817603486116
		 22 0.25286381483891812 23 1.0618654142861998 24 1.9610718937811491 25 1.9006159469227302
		 26 1.7356886583118796 27 1.4282757805074098 28 0.87898423605009868 29 0.34192240368206528
		 30 -0.13127423165384583 31 -0.57867208616210664 32 -1.001768820850325;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Head_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -10.903578291802615 1 -10.978951741114612
		 2 -10.980998196353651 3 -10.503937976629517 4 -10.109018728555212 5 -10.764225738236782
		 6 -11.691421762064094 7 -11.877915808876836 8 -11.824164694607495 9 -11.735009605208411
		 10 -10.947266494161292 11 -11.218801142010266 12 -11.475893576822601 13 -11.877477060491222
		 14 -12.422571435619641 15 -12.666127965193779 16 -11.910414448714167 17 -11.282042922843843
		 18 -10.28709673114234 19 -9.1926399508849119 20 -8.583998504692099 21 -8.4048083359241961
		 22 -8.2441984731148956 23 -8.4763275288008266 24 -8.718899457747586 25 -8.4262946675885928
		 26 -7.8710670013347803 27 -7.7628197265645147 28 -8.2194240537724372 29 -8.6548233018932681
		 30 -9.5817290459162763 31 -10.644444818170518 32 -10.903578291802615;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Scapula_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.1307251692906871e-005 1 -2.1307251692906871e-005
		 2 -2.1307251692906871e-005 3 -2.1307251692906871e-005 4 -2.1307251692906871e-005
		 5 -2.1307251692906871e-005 6 -2.1307251692906871e-005 7 -2.1307251692906871e-005
		 8 -2.1307251692906871e-005 9 -2.1307251692906871e-005 10 -2.1307251692906871e-005
		 11 -2.1307251692906871e-005 12 -2.1307251692906871e-005 13 -2.1307251692906871e-005
		 14 -2.1307251692906871e-005 15 -2.1307251692906871e-005 16 -2.1307251692906871e-005
		 17 -2.1307251692906871e-005 18 -2.1307251692906871e-005 19 -2.1307251692906871e-005
		 20 -2.1307251692906871e-005 21 -2.1307251692906871e-005 22 -2.1307251692906871e-005
		 23 -2.1307251692906871e-005 24 -2.1307251692906871e-005 25 -2.1307251692906871e-005
		 26 -2.1307251692906871e-005 27 -2.1307251692906871e-005 28 -2.1307251692906871e-005
		 29 -2.1307251692906871e-005 30 -2.1307251692906871e-005 31 -2.1307251692906871e-005
		 32 -2.1307251692906871e-005;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Scapula_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.0005552369177469e-005 1 1.0005552369177469e-005
		 2 1.0005552369177469e-005 3 1.0005552369177469e-005 4 1.0005552369177469e-005 5 1.0005552369177469e-005
		 6 1.0005552369177469e-005 7 1.0005552369177469e-005 8 1.0005552369177469e-005 9 1.0005552369177469e-005
		 10 1.0005552369177469e-005 11 1.0005552369177469e-005 12 1.0005552369177469e-005
		 13 1.0005552369177469e-005 14 1.0005552369177469e-005 15 1.0005552369177469e-005
		 16 1.0005552369177469e-005 17 1.0005552369177469e-005 18 1.0005552369177469e-005
		 19 1.0005552369177469e-005 20 1.0005552369177469e-005 21 1.0005552369177469e-005
		 22 1.0005552369177469e-005 23 1.0005552369177469e-005 24 1.0005552369177469e-005
		 25 1.0005552369177469e-005 26 1.0005552369177469e-005 27 1.0005552369177469e-005
		 28 1.0005552369177469e-005 29 1.0005552369177469e-005 30 1.0005552369177469e-005
		 31 1.0005552369177469e-005 32 1.0005552369177469e-005;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Scapula_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.7472791986738114e-005 1 -2.7472791986738114e-005
		 2 -2.7472791986738114e-005 3 -2.7472791986738114e-005 4 -2.7472791986738114e-005
		 5 -2.7472791986738114e-005 6 -2.7472791986738114e-005 7 -2.7472791986738114e-005
		 8 -2.7472791986738114e-005 9 -2.7472791986738114e-005 10 -2.7472791986738114e-005
		 11 -2.7472791986738114e-005 12 -2.7472791986738114e-005 13 -2.7472791986738114e-005
		 14 -2.7472791986738114e-005 15 -2.7472791986738114e-005 16 -2.7472791986738114e-005
		 17 -2.7472791986738114e-005 18 -2.7472791986738114e-005 19 -2.7472791986738114e-005
		 20 -2.7472791986738114e-005 21 -2.7472791986738114e-005 22 -2.7472791986738114e-005
		 23 -2.7472791986738114e-005 24 -2.7472791986738114e-005 25 -2.7472791986738114e-005
		 26 -2.7472791986738114e-005 27 -2.7472791986738114e-005 28 -2.7472791986738114e-005
		 29 -2.7472791986738114e-005 30 -2.7472791986738114e-005 31 -2.7472791986738114e-005
		 32 -2.7472791986738114e-005;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Shoulder_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.2109861566022637 1 -4.7119250927426624
		 2 -11.254813510829724 3 -15.912978076549429 4 -20.992753384042032 5 -22.861975705855532
		 6 -24.554746769329263 7 -25.901398974159193 8 -27.013867846568424 9 -27.801560739553768
		 10 -26.3514922735678 11 -24.458075475028053 12 -22.786246938416902 13 -19.793930495767782
		 14 -16.200510564802521 15 -12.472162041076352 16 -7.5009879552049936 17 -2.7728908024345005
		 18 1.015786460837653 19 4.418540017451277 20 9.2610169534013984 21 15.313594104877886
		 22 20.711252783213823 23 25.206031178710248 24 30.361998175227061 25 30.399894702530066
		 26 30.047663405405931 27 28.490546583131021 28 23.99667411710405 29 19.631683818973045
		 30 14.195528943908368 31 8.4201696539337565 32 2.2109861566022637;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Shoulder_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -6.5960797821226329 1 -12.61806065424177
		 2 -18.166747235182548 3 -22.82734612346233 4 -27.556723461153592 5 -31.101420058065628
		 6 -34.667424679980307 7 -38.183796421283276 8 -41.879833475482023 9 -44.437687212009877
		 10 -45.456042932416345 11 -43.403804704712655 12 -41.546834536641143 13 -37.623892646423208
		 14 -32.660421803649434 15 -27.795075882756201 16 -22.168382103908566 17 -16.738676310310804
		 18 -11.870226488727305 19 -7.1438506255192618 20 -1.5610840097061125 21 4.9300928819869121
		 22 11.22638421452297 23 16.057745287218669 24 21.751773423518014 25 21.901915765968742
		 26 21.635961721888446 27 20.078825130730891 28 14.802671665491864 29 9.9523080398592132
		 30 4.5165760457300719 31 -0.80392344010226346 32 -6.5960797821226329;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Shoulder_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -87.356364486952117 1 -90.336123298593151
		 2 -92.111779213987703 3 -92.122635507561384 4 -92.663491834740412 5 -90.792771152523542
		 6 -88.697245609507618 7 -87.205233118005481 8 -86.086342824302648 9 -85.408368469947249
		 10 -83.990688926697018 11 -83.616314159172873 12 -83.316224513510647 13 -83.648068711257025
		 14 -84.704563660188498 15 -85.623718064470054 16 -85.988726720455432 17 -86.834191628636475
		 18 -86.331715982841629 19 -86.070214612413949 20 -84.796346864855934 21 -81.647787144914474
		 22 -79.540692676662459 23 -78.616836649564945 24 -77.629973210425874 25 -77.615837935975819
		 26 -77.672241809508819 27 -78.011007358690364 28 -79.227998252305696 29 -80.517391864391683
		 30 -82.748954315854988 31 -85.059589382238272 32 -87.356364486952117;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Elbow_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 34.784393392400084 1 34.50560144229928
		 2 34.393259410765744 3 35.786347521865814 4 36.841855788343729 5 39.637610602919047
		 6 42.26594665082537 7 46.545174431339731 8 52.299891699258566 9 57.234231015202269
		 10 62.648383344405879 11 61.447422219138019 12 60.262595741803338 13 58.18296665934843
		 14 55.464351744142853 15 52.833211967392302 16 50.500051401756373 17 47.909562608072164
		 18 42.584709954640658 19 35.628622370797565 20 34.301879085328956 21 36.035647103470751
		 22 37.6873928503109 23 40.809747943961135 24 44.14664226064604 25 44.229481286867241
		 26 44.065757183042081 27 43.435930666862355 28 41.942567911176234 29 40.460851686183801
		 30 38.123508958467347 31 35.316120765739548 32 34.784393392400084;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Elbow_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 26.425251567164409 1 23.312035473493758
		 2 20.411059739497336 3 17.442888562995677 4 14.433489703387922 5 12.287858387948125
		 6 10.209032881925674 7 8.1695902018554882 8 6.0355234350139915 9 4.6559140517426894
		 10 2.3878617206579147 11 6.1815352148485507 12 9.947421293901284 13 14.551014834855019
		 14 19.513528808887262 15 24.158892613449058 16 28.774111433301041 17 33.155445091220209
		 18 35.840411931429514 19 38.335708967713963 20 38.114318150014128 21 35.331862165070568
		 22 32.859577279463892 23 29.825406824555003 24 26.684396314137469 25 25.259862669385054
		 26 24.151834856078249 27 24.04556490348789 28 25.90736587566251 29 27.446922079940148
		 30 27.631328788468707 31 27.837140612283218 32 26.425251567164409;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Elbow_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 19.389706181898763 1 17.021162425596781
		 2 15.030978082384092 3 13.589208879781184 4 12.222423702625949 5 11.646481003881432
		 6 11.160604383690973 7 10.6466800064747 8 10.141211111018665 9 9.7722406906736516
		 10 9.2107835394493751 11 9.6183251633766709 12 10.041822435358428 13 11.161040861104954
		 14 12.845490841745496 15 14.91694575177322 16 17.649610657748767 17 20.787878622334102
		 18 24.614421026054575 19 29.678112388233494 20 30.770112514080683 21 29.74578483010573
		 22 28.810592806556883 23 27.364526272831451 24 25.946491366655575 25 25.140061917754917
		 26 24.450705758434875 27 24.054647472656502 28 23.992230029125764 29 23.791389403801865
		 30 22.577695877524491 31 21.405444028860686 32 19.389706181898763;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Wrist_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -29.541655633929725 1 -28.366116561365832
		 2 -27.715824795760575 3 -27.764834359373591 4 -27.861444904551103 5 -27.812313403866717
		 6 -27.775549593163984 7 -27.224247072344337 8 -25.811420396318894 9 -24.313653907961566
		 10 -20.238682227984317 11 -19.917862622724652 12 -19.49109396881547 13 -20.421633952710767
		 14 -22.224323357419021 15 -23.055583909395775 16 -23.507353804323255 17 -23.686580863674553
		 18 -25.216814428034123 19 -26.906768216817458 20 -28.394992087631557 21 -29.764697469389279
		 22 -31.260346173486454 23 -33.415902949463366 24 -35.544059753537404 25 -36.66732399412323
		 26 -37.556131762508379 27 -37.623866097265356 28 -36.214610262901857 29 -34.878132851420823
		 30 -32.891606548339865 31 -30.885992660304041 32 -29.541655633929725;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Wrist_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 19.432752953743975 1 19.411538845333009
		 2 19.709966863502 3 22.65291325580117 4 25.184346412925926 5 26.257672782504308 6 27.115598122450589
		 7 28.703494486113687 8 30.880788583185538 9 32.659683127344742 10 36.879547212764088
		 11 32.125453437730059 12 27.220434528351355 13 22.812690621008933 14 18.498356938502898
		 15 14.457610396092969 16 11.47648667064049 17 8.3647745808526057 18 7.01749468990654
		 19 5.556595185668848 20 5.4815806765510393 21 6.5922433854014066 22 7.8252062483273797
		 23 10.573096343852287 24 13.355300579527366 25 15.592217357306259 26 17.813155174462381
		 27 19.436491691589353 28 20.114931631814276 29 20.80778841860354 30 20.337277048319624
		 31 19.554588846950896 32 19.432752953743975;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Wrist_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 23.091751932445504 1 21.365782293450064
		 2 20.479635570500442 3 21.681541443498748 4 22.724636251563695 5 22.988671017982512
		 6 23.22441811517032 7 22.922446291226297 8 21.86121592118738 9 20.551882333435412
		 10 15.546853538419873 11 16.108275993420264 12 16.496714203578911 13 21.38035283971109
		 14 30.641689908959663 15 37.461280534405418 16 41.298759714874038 17 45.169861863113297
		 18 48.428052340044097 19 52.048089251414112 20 52.716477949575896 21 51.806773532020188
		 22 50.888105345326316 23 48.962859183002536 24 47.266562370343919 25 44.902537117668857
		 26 42.319426580430779 27 39.993859305494617 28 37.98620064115422 29 35.646484978300016
		 30 30.801389643868827 31 25.745146270000298 32 23.091751932445504;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Hip_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.51926604232162954 1 0.607027619896368
		 2 0.54964261864110375 3 -0.043421039453189529 4 -0.62484071727337709 5 -1.2084926090582606
		 6 -1.8039603789667207 7 -2.2729555360247238 8 -2.711222403303307 9 -3.1848373518938491
		 10 -3.655291881894382 11 -3.6813594910573477 12 -3.6883198925341034 13 -3.2742380269127662
		 14 -2.3538345844603996 15 -1.6850063715243342 16 -1.2771103250138252 17 -1.0237153288343344
		 18 -1.3520682919234785 19 -1.9810332316860455 20 -1.8782579726429673 21 -0.93275967058761133
		 22 -0.37708373024363301 23 -0.39028572062873984 24 -0.39014922204025398 25 -0.46806754728996453
		 26 -0.57768086822915743 27 -0.59299678171925863 28 -0.44311190344935963 29 -0.16565369901228119
		 30 0.065621471603045906 31 0.30988147629588292 32 0.51926604232162954;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Hip_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -16.194838640826692 1 -13.829890159597944
		 2 -11.679625220814533 3 -9.8337382260151927 4 -7.7659962860737384 5 -6.6595813650651996
		 6 -5.8445796756569868 7 -4.028016005697828 8 -1.2144232605131535 9 1.4358272771838918
		 10 2.8990180961164942 11 6.8319583485203124 12 11.700416613241499 13 12.399958006448015
		 14 12.15534687616166 15 11.236383046651984 16 7.4607958611313441 17 4.2714592758573406
		 18 0.59682992762134757 19 -3.6254234436463753 20 -4.5062622562216523 21 -3.8299072615862584
		 22 -3.5382594277902912 23 -3.9922488546791186 24 -4.1972095852196762 25 -5.5889574457570834
		 26 -7.2771679110454146 27 -9.5210256361564607 28 -12.765408948020394 29 -15.826325731924179
		 30 -16.427851780857271 31 -17.132143001347938 32 -16.194838640826692;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Hip_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.3291253173043489 1 2.6817025689625344
		 2 6.5667941472004037 3 8.2791929407106366 4 10.270377976083656 5 10.221531545452446
		 6 9.6909076070582341 7 9.8026747206133837 8 10.940629159230802 9 12.175883852979798
		 10 13.326608983101346 11 12.097460175132507 12 11.371808495219453 13 7.1237136622230892
		 14 0.25502538305830164 15 -5.3762331338191265 16 -8.7764578809075608 17 -12.437794094414338
		 18 -14.775652837134796 19 -17.486468431239217 20 -17.567624814047484 21 -15.322790967524863
		 22 -14.073682601317209 23 -15.824987291969355 24 -18.045240965430228 25 -17.397781017352919
		 26 -16.27163404197033 27 -13.978342671970514 28 -9.9570787923702788 29 -6.7319870593526501
		 30 -5.9737426089654431 31 -5.5156567447791938 32 -2.3291253173043489;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Knee_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.22619867521748621 1 -1.3718631942328743
		 2 -2.8291769558670765 3 -4.5912683321571315 4 -6.2794934538731075 5 -7.7739935301181458
		 6 -9.2928359112771464 7 -10.294146493451493 8 -10.966189421710411 9 -11.66327670603822
		 10 -12.730745234388266 11 -11.778454595755136 12 -10.767171381579146 13 -10.591595182757187
		 14 -10.655573663524885 15 -10.703055907912514 16 -9.5944556947352098 17 -8.5236758210296113
		 18 -7.9836894734587149 19 -7.6726334272699344 20 -6.2384300439845255 21 -3.8014643436102848
		 22 -2.047168888504018 23 -1.8102855985966546 24 -1.4480070315708358 25 -1.1403130066947622
		 26 -0.87846762670981438 27 -0.59983917791908659 28 -0.28434612706032825 29 0.012692030934148247
		 30 0.44697310923979683 31 0.96772997007563677 32 0.22619867521748621;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Knee_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.97589551210349135 1 1.005518180867262
		 2 1.0585987350143868 3 1.1522314831912093 4 1.236336376280265 5 1.3947522274227457
		 6 1.5867147836076114 7 1.7552564846679208 8 1.8800697684172569 9 2.0421939141012655
		 10 2.7662630530476009 11 2.7441364696208614 12 2.6789824682341119 13 2.8677413584554809
		 14 3.2941285011395025 15 3.5377712821250635 16 3.5790255427136426 17 3.6338175623860383
		 18 3.3559267104250652 19 2.9551861248053375 20 2.4060924422787879 21 1.7149749102251655
		 22 1.1719709686577309 23 1.1045324250832895 24 1.0320780182543667 25 0.97045509140773156
		 26 0.90858742411928206 27 0.86791704495953181 28 0.86130410037624283 29 0.85893923262367844
		 30 0.89402503826502877 31 0.94131689263966078 32 0.97589551210349135;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Knee_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 8.4584933363567814 1 3.5009188233968396
		 2 1.1891896626232423 3 1.4858369502229498 4 1.53371877711947 5 4.565643131223923
		 6 8.5769406880325434 7 13.13794913197262 8 17.461378604909545 9 21.085876050994486
		 10 27.866293554443001 11 33.48309102529128 12 38.355874335971123 13 46.287374442311844
		 14 56.867831859967431 15 62.532178948039181 16 61.509293725673388 17 60.647513158585596
		 18 52.719284470287782 19 44.053154440163368 20 31.683358841376883 21 15.340268848874288
		 22 2.0238346366369884 23 -0.15818039332112685 24 -2.5379053006093546 25 -2.6551078643304775
		 26 -2.6275846808260974 27 -2.6453975329892825 28 -2.674666915744182 29 -1.0947678089342725
		 30 3.8463931737584516 31 9.7799735259736007 32 8.4584933363567814;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Ankle_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 9.0149218100934512 1 9.9895023730771477
		 2 10.827970158235685 3 11.433007709488535 4 12.04582122156472 5 11.665972785470114
		 6 11.220872291060035 7 10.858933588799713 8 10.205512772365413 9 9.6027640040031379
		 10 13.190294348918233 11 11.228963395697361 12 9.4235794343000165 13 9.3499582978801019
		 14 9.7720121187939917 15 10.222546900755995 16 10.876690612883881 17 11.566800576602381
		 18 11.528256094301691 19 11.439554338596897 20 11.58034748543515 21 12.13301402590478
		 22 12.507409223165983 23 12.548127711312757 24 12.68651377867298 25 12.002412718206788
		 26 10.863296135395631 27 9.7958589905827704 28 8.7755467249794012 29 8.0437781976266489
		 30 8.1457656659608464 31 8.3075821570758244 32 9.0149218100934512;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Ankle_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 3.7713070214923943 1 3.3899956608319193
		 2 2.8666622476362473 3 1.9439189126267378 4 1.0933033134988477 5 0.36879122868599923
		 6 -0.1590169764179567 7 -0.32464078366153254 8 -0.95024248369621833 9 -2.6797230856260339
		 10 -1.8527942499797092 11 -5.5844591388966407 12 -9.8316449138168931 13 -10.215066123341376
		 14 -9.5956073910299136 15 -8.7986085896867916 16 -7.2390035264802854 17 -5.7896043991299253
		 18 -4.3149371258617801 19 -2.6356792556974922 20 -2.0754561059013885 21 -2.0619780337598819
		 22 -2.1547321125715517 23 -2.8678443453561555 24 -3.6407625933320102 25 -3.2748481919523411
		 26 -2.6592556509688912 27 -1.4820019690402757 28 0.52914959766871172 29 2.2504875808625502
		 30 3.1863481108472391 31 3.8792529359438981 32 3.7713070214923943;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Ankle_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.3261656070351084 1 2.3186651677526995
		 2 1.8928155846794459 3 -0.76189619682216081 4 -2.8973486011888179 5 -7.3617832805720429
		 6 -12.207096417645767 7 -16.833283470752406 8 -21.54415653240126 9 -25.013069441709924
		 10 -26.59737896097058 11 -22.228730671517837 12 -16.918738461688008 13 -14.038978341673488
		 14 -12.437130283063487 15 -11.44408895775017 16 -11.807630586569728 17 -12.148989940600675
		 18 -11.121561663268775 19 -10.187757877763948 20 -5.8433633104102389 21 1.8171447016672198
		 22 8.9098106426856276 23 16.717378590067653 24 24.494925494913822 25 27.270304227395318
		 26 28.919075556884817 27 28.469721407584892 28 22.092009586114067 29 15.833410089623134
		 30 10.038208137492575 31 3.2605398488374542 32 2.3261656070351084;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Toes_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -8.3908206300854076 1 -8.4581890863881277
		 2 -8.6036384395932082 3 -8.9618112620436836 4 -9.3056116519122778 5 -8.9182107829767361
		 6 -8.4093999666525203 7 -8.2284935755905977 8 -8.2058143488404074 9 -8.6485332812882429
		 10 -21.406097235867293 11 -26.122527154912206 12 -33.803606191729997 13 -25.957730299878655
		 14 -7.6726423559911368 15 -1.3830578591926703 16 -2.1020466616760487 17 -2.8628684676202014
		 18 -4.6865092158950512 19 -6.7051840761638068 20 -8.218147977852599 21 -9.247818721622405
		 22 -10.597068799957681 23 -13.356616345010693 24 -16.419071711663396 25 -16.356126442525184
		 26 -16.048058037902301 27 -14.975163678486934 28 -12.500767267765868 29 -10.20919468536942
		 30 -9.4246257262203912 31 -8.4841933790168351 32 -8.3908206300854076;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Hip_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.15387056569488317 1 0.66551556327668238
		 2 1.2080169960636407 3 2.3162050442036382 4 3.4669238984842043 5 3.1721180515413221
		 6 2.740416895579814 7 2.8361364212439271 8 3.4121527962378178 9 4.0047408495127339
		 10 5.785025865937115 11 5.6161633653390899 12 5.6237442940877669 13 5.8661884910357243
		 14 6.2121310995423169 15 6.3983928943473503 16 6.4224953695602771 17 6.3570826875274555
		 18 5.7876312895515047 19 5.0831516622839645 20 3.7344335985842889 21 1.7674784408141277
		 22 -0.060216175137185621 23 -1.2692467262186973 24 -2.7071711128353981 25 -2.7083268914054717
		 26 -2.6287822269331471 27 -2.4303816099244964 28 -1.7804192146275688 29 -1.0816377692871149
		 30 -0.68614010742135723 31 -0.40773269036410748 32 0.15387056569488317;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Hip_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 8.6369488638276959 1 4.7449905804057595
		 2 2.1119281877787497 3 1.7056087504939859 4 1.1348001052135832 5 1.3311030665243939
		 6 1.6745077550825878 7 1.1866977325191135 8 -0.39003707762019807 9 -1.8566332711085642
		 10 -4.5535041157513776 11 -8.0823282023162175 12 -11.990003958696853 13 -13.768697153994207
		 14 -14.510002946334964 15 -14.892726311001411 16 -12.752210881617509 17 -10.787187536544595
		 18 -7.6929292746288134 19 -4.2088956915358589 20 -2.0401078837535187 21 -0.97346379896871749
		 22 0.33191631640949287 23 0.97925963566165219 24 1.5939234128802202 25 2.8869809060017473
		 26 4.2613180200152776 27 6.2210351146918281 28 9.2554870108474017 29 12.014190707084907
		 30 11.577973866090788 31 11.190137363019526 32 8.6369488638276959;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Hip_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -7.6577732045311926 1 -13.919517346273652
		 2 -19.268250070908625 3 -21.867966591065464 4 -24.87504406380577 5 -25.495915054790654
		 6 -26.064745594934106 7 -26.443311010695801 8 -26.796480838137025 9 -27.198409317991757
		 10 -28.310551111069525 11 -24.260195876309307 12 -19.942754205822244 13 -17.56894781117218
		 14 -16.268114469095902 15 -13.7084793495358 16 -8.3840057373338741 17 -3.3759111873591579
		 18 0.092852279681960345 19 3.2446965219525441 20 6.3740715708983577 21 9.3974505399126453
		 22 12.152034294314362 23 14.50768371927377 24 16.815331879923637 25 18.370104057138541
		 26 20.196911912999884 27 20.323174851332613 28 16.836569587170352 29 13.260901394550579
		 30 6.0715320596853202 31 -1.2692912649378705 32 -7.6577732045311926;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Knee_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -1.4934239635469626 1 -0.99498761801191671
		 2 -0.025395941264358658 3 1.9728507826791863 4 3.8230980802945704 5 3.7620279649619963
		 6 3.6540670335147429 7 3.9575561386474538 8 4.8942150813093779 9 5.7800709902375784
		 10 7.9448417445280413 11 8.375462039271623 12 8.7634576349438529 13 9.096709855129621
		 14 9.336558929141189 15 9.3401901699504304 16 8.5736922378218861 17 7.9851270551509028
		 18 7.0889190666565884 19 6.2958543285195443 20 4.9457982207608016 21 3.0326370636285862
		 22 1.320549039540567 23 0.18778492332053381 24 -1.1337527163147683 25 -0.98208748165052018
		 26 -0.62417976172573986 27 -0.16923393754211763 28 0.42708549625769515 29 0.77671234747648621
		 30 -0.20963992499107539 31 -1.5283175961187403 32 -1.4934239635469626;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Knee_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 4.3756887636239545 1 4.4859681398896836
		 2 4.4783167819314356 3 3.7580682579820781 4 3.0805287834976047 5 3.2503438621328251
		 6 3.4167993423248197 7 3.5519285891803767 8 3.6357847977183129 9 3.660842713711391
		 10 3.8172819053709883 11 3.0559825602769037 12 2.277581373783407 13 1.613516586828958
		 14 1.428484755393113 15 1.4059111353118843 16 1.1291698486614772 17 0.8791154235048243
		 18 0.89755952391539229 19 0.92537201737796937 20 0.95686010149597422 21 0.99287323746437606
		 22 1.0438306901359014 23 1.1655604177854779 24 1.2982897872351993 25 1.3607809534481963
		 26 1.3811485755622248 27 1.5566942861098629 28 2.2750504402059 29 2.8758714177171458
		 30 3.5545849278102057 31 4.1324934426084923 32 4.3756887636239545;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Knee_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 64.062545860645983 1 62.225149860770003
		 2 57.722625160678312 3 44.683568565549095 4 32.643600516917658 5 21.152722185944171
		 6 7.9089011516324517 7 4.8697045520871578 8 5.1576845615511608 9 6.9710476660347087
		 10 15.477325617287818 11 17.231109421775194 12 18.935865322295214 13 22.077645815985679
		 14 23.487501534169393 15 23.039206523128172 16 17.750290020543105 17 13.139605514785243
		 18 11.821695364983308 19 10.987544964248784 20 10.0021941945759 21 9.0215149744274434
		 22 8.5151055371499105 23 9.6402780761095332 24 10.853988825869884 25 14.047930098282192
		 26 16.653098505736249 27 21.44450857558396 28 30.720979135238345 29 40.640281360272979
		 30 51.111748548526712 31 63.469728671419354 32 64.062545860645983;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Ankle_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 18.765080356060409 1 18.913434858809381
		 2 18.645539395280881 3 15.856294510794108 4 13.113975914391133 5 14.684605758126775
		 6 16.594069842017586 7 17.617868998654096 8 18.073258399894499 9 18.393840385785015
		 10 16.600704523402282 11 16.475997823859206 12 16.477880561016558 13 16.446064064212667
		 14 16.429285500130931 15 16.37719969084478 16 15.48149159996267 17 14.672972151617181
		 18 14.741938715334157 19 14.908329773262389 20 14.726593609139471 21 13.930610019912983
		 22 13.4572585128747 23 14.209676622678304 24 14.946471488750642 25 14.681034589750995
		 26 14.019107082832805 27 14.137869950752648 28 16.204233239026607 29 18.036191947341809
		 30 18.250161641190434 31 18.519378644210889 32 18.765080356060409;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Ankle_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -7.5612001923367842 1 -5.9162113705204868
		 2 -4.6439626264451075 3 -3.9431883104198278 4 -2.6972106240185103 5 -2.7995719832646699
		 6 -3.0763434423179339 7 -2.8318065710673181 8 -1.7370965158147038 9 -1.0152355202747707
		 10 -1.8578658792262361 11 -0.50734524724998686 12 0.87721974048056128 13 1.7617450136468944
		 14 1.9007647163313728 15 1.5513537485136717 16 0.82314130286981957 17 0.18418723164543763
		 18 -0.97919614045567316 19 -2.4455752614362862 20 -2.7743348332965163 21 -2.607432230933461
		 22 -2.4668277015599398 23 -2.0296172189578305 24 -1.5110652316164921 25 -2.2060825564503084
		 26 -3.5073503078484034 27 -5.0606352817106774 28 -7.0821213001139407 29 -9.021981664738572
		 30 -8.7839360516562479 31 -8.624177339264536 32 -7.5612001923367842;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Ankle_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -4.4653083141215975 1 -2.0792059784725399
		 2 1.4663112559489113 3 8.5364469900661959 4 15.31318053657521 5 18.105068130110769
		 6 20.964663033925142 7 20.717197403919776 8 17.690068725170089 9 14.92250939910714
		 10 13.209680920869312 11 8.904540988837768 12 4.4697745261743522 13 0.21217563603370507
		 14 -3.3228822263583866 15 -4.5610865919971486 16 -3.2052725680353449 17 -2.0327315410089741
		 18 -0.837594805060907 19 0.55108168729194318 20 0.60872366523069854 21 -0.4316948499187398
		 22 -1.7501969026082789 23 -4.8924448065565844 24 -8.329043194366152 25 -9.8141140942409759
		 26 -9.6549069315631542 27 -6.8401482801321976 28 -1.7896254527978774 29 1.6857641351117167
		 30 -1.5233759590085461 31 -5.2135830754224726 32 -4.4653083141215975;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Toes_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -12.379742939696726 1 -12.396204777763737
		 2 -12.415027164318325 3 -12.441196628046908 4 -12.467273717318408 5 -12.198922319784284
		 6 -11.874647521497012 7 -11.646941436235389 8 -11.479143962857908 9 -11.326915831931178
		 10 -11.477621318456112 11 -10.976504092032597 12 -10.501563029106304 13 -9.7030535318423841
		 14 -8.6453482918266502 15 -8.1362866704395227 16 -8.8410360676557485 17 -9.3862226010300436
		 18 -11.566146263187774 19 -14.064499099343854 20 -15.650182490726753 21 -16.432866094762304
		 22 -17.367927948469791 23 -18.473566942075546 24 -19.324942986791484 25 -23.050148394303633
		 26 -28.132265934546421 27 -35.401812164299137 28 -40.251421289901806 29 -27.621259109165493
		 30 -14.163264621793932 31 -12.39546066415962 32 -12.379742939696726;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTL -n "walk_female:Root_M_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.09995186379875233 1 0.1003338586900266
		 2 0.1037233979147805 3 0.10929663701338342 4 0.11875548805422118 5 0.12790643654189879
		 6 0.13678175892481115 7 0.14467871271480956 8 0.14999536140087072 9 0.15258878345043675
		 10 0.14844549695290321 11 0.14356436489661606 12 0.13584943559352858 13 0.1283951334374179
		 14 0.11583229803442809 15 0.10365870777739943 16 0.063315470245287289 17 0.077361774285237064
		 18 0.090123112761402807 19 0.12737878672382802 20 0.16758007421186924 21 0.18436725142652344
		 22 0.19882757703789122 23 0.19124108465874437 24 0.17883432559933954 25 0.16495946436487693
		 26 0.15098080579790266 27 0.13875775319512276 28 0.12685154296982698 29 0.11607842638124856
		 30 0.10635870808787259 31 0.10156924236327444 32 0.09995186379875233;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTL -n "walk_female:Root_M_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.9196470301401396 1 5.9341278136788551
		 2 5.9432553058908635 3 5.9491577231615498 4 5.9499488729976857 5 5.9427280158675408
		 6 5.9270010611550799 7 5.9099367480500895 8 5.8888731596818884 9 5.8721108498281165
		 10 5.8681877209155582 11 5.8625074296717941 12 5.8667197530935677 13 5.8656636689614681
		 14 5.8619374643749316 15 5.8581655898676184 16 5.9026916923300226 17 5.9208365786115031
		 18 5.9392533919841508 19 5.9509933147219396 20 5.9603138421174755 21 5.9559160901257027
		 22 5.9474210743638105 23 5.9245478735700372 24 5.8987465230429583 25 5.888335671527817
		 26 5.8747849079170082 27 5.881858897808204 28 5.8794289918785356 29 5.8814605811935223
		 30 5.888527550338579 31 5.9007119223755025 32 5.9196470301401396;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTL -n "walk_female:Root_M_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.1110068778028192 1 0.10472760898110042
		 2 0.091410903779234817 3 0.074012753796705522 4 0.055238352615986891 5 0.040049565187642695
		 6 0.035642377477733106 7 0.034395431567978606 8 0.04535743037182291 9 0.057433729871642671
		 10 0.079153105709113006 11 0.098192504528434824 12 0.11336969105591857 13 0.12502330492672661
		 14 0.12729163198110391 15 0.12920246689990739 16 0.11457792324902537 17 0.10693299307841148
		 18 0.09873214189460125 19 0.088537169024182502 20 0.080755526158158134 21 0.071705422226887847
		 22 0.064342475654751846 23 0.065763820861850564 24 0.067741198832882515 25 0.083122670019359718
		 26 0.10265068338493805 27 0.11555133402294718 28 0.1157271257472826 29 0.11380369208268032
		 30 0.11285364703588413 31 0.11242944501317767 32 0.1110068778028192;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Root_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 15.514579910243814 1 13.053321219319997
		 2 9.748797224926065 3 6.3886425655887189 4 2.924393248960373 5 -0.24692956987075679
		 6 -2.8328477435864254 7 -5.1982443313919893 8 -6.9852146140954821 9 -8.4856843188266016
		 10 -9.2823884438586219 11 -9.8325698061943996 12 -9.4839783463079144 13 -9.1213846047764342
		 14 -8.0190002277652113 15 -6.9197300035677527 16 -3.3000888904149264 17 -0.96879562584335999
		 18 1.3583861353095332 19 4.3659345747016705 20 7.566261789349042 21 10.486594590343644
		 22 13.174326974474793 23 15.433139902653256 24 17.474756403341758 25 18.450727120539707
		 26 19.273613547147495 27 19.452817197236367 28 19.509053134884738 29 19.220294950162501
		 30 18.641922151122358 31 17.339922349645729 32 15.514579910243814;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Root_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.2080364838118163 1 -2.8602761368414549
		 2 -2.4121473906287529 3 -2.0853333176184319 4 -1.9150830300852857 5 -1.8008111933806803
		 6 -1.7701230264464742 7 -1.6073111281267158 8 -0.93448835929045615 9 -0.14287394255008057
		 10 1.5054333059146967 11 3.0621465307450086 12 4.5977415713068526 13 6.1270128210609105
		 14 6.7421550618691697 15 7.397402017989263 16 6.5174290127006751 17 5.8675039407741023
		 18 5.2223634012629789 19 4.5262822948517725 20 3.8136592162467564 21 3.4603789965639598
		 22 3.2036349201147161 23 2.721285651011272 24 2.252272813139558 25 1.2756734157934213
		 26 0.060637690958845143 27 -1.0212359852995896 28 -2.2385975314306843 29 -3.0047279490465413
		 30 -3.4794880485730979 31 -3.4944669295671624 32 -3.2080364838118163;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Root_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.7985494617358126 1 -5.769975752612071
		 2 -5.5863552041255069 3 -5.3052581204654823 4 -4.8201947506869463 5 -4.3388588759187003
		 6 -3.7831355017277022 7 -3.3198397328433531 8 -3.0453556901918555 9 -2.8804650120376141
		 10 -2.9013076413252437 11 -3.0090297168690063 12 -3.6105822360517021 13 -4.1767160181230141
		 14 -4.8437098669350593 15 -5.4853638671868037 16 -6.347101429259558 17 -6.2796663529291772
		 18 -6.2425270936126278 19 -5.6242337703620668 20 -4.9701059452706069 21 -4.2213120917870297
		 22 -3.5089832230347557 23 -3.0831040263734679 24 -2.7416032372650756 25 -2.8400168526003631
		 26 -3.0525117496421079 27 -3.5417114339434237 28 -4.183917012481186 29 -4.8113266050541537
		 30 -5.4301166038288509 31 -5.7102561945833257 32 -5.7985494617358126;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Spine1_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -14.828935448153688 1 -12.187620940097363
		 2 -9.2308131071926951 3 -6.4651151672531544 4 -4.0289809423068075 5 -1.8660764790658282
		 6 -0.32998430219926678 7 1.094664594010516 8 2.145689429960171 9 3.0540448766892192
		 10 3.6380249145068646 11 4.0706842172157574 12 3.7655818512215626 13 3.4741241825035227
		 14 2.5240536883106914 15 1.5706319741054531 16 -0.93324128398452677 17 -3.3517833820639269
		 18 -5.7519206768034126 19 -8.3802764470469597 20 -11.149358791241914 21 -13.723166673175907
		 22 -16.090009253957298 23 -18.165850512610852 24 -20.070903239008608 25 -21.014065464265837
		 26 -21.877291680827891 27 -21.85988064996415 28 -21.701752999387978 29 -20.814166358087842
		 30 -19.364682326163713 31 -17.343505257945736 32 -14.828935448153688;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Spine1_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.6504500319337305 1 5.2156542798179562
		 2 4.6486412660827101 3 4.1777791059586127 4 3.8530695780237258 5 3.6342111650255413
		 6 3.5587455140859228 7 3.3527171648807328 8 2.5889037151931462 9 1.6791046608633047
		 10 -0.29530767203426384 11 -2.1579200415395943 12 -4.0466196461564801 13 -5.9199325777326166
		 14 -6.8575392728274158 15 -7.8006462314337055 16 -7.1052236369155768 17 -6.0096128212780373
		 18 -4.8835571229904113 19 -3.5867436829317412 20 -2.2564605992963829 21 -1.7230071361157293
		 22 -1.3795030237314123 23 -0.97624790942122963 24 -0.67082423025369442 25 0.40424718764453349
		 26 1.7880023215148566 27 3.0904854328545395 28 4.5677082187864189 29 5.4623108952411643
		 30 5.9600859665530272 31 5.9737814817714687 32 5.6504500319337305;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Spine1_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.75196413814897822 1 1.662754319080481
		 2 2.292633491406407 3 2.5491285543102657 4 2.4371776648626198 5 2.1594851541892122
		 6 1.5500694414538223 7 0.91512215619096027 8 0.069525874224750969 9 -0.75137141192262658
		 10 -1.7365518182942425 11 -2.5540130303015292 12 -2.6916127594832866 13 -2.8285865519134035
		 14 -2.0220159258427288 15 -1.2626728770493196 16 0.62804198423274948 17 1.6773365322188056
		 18 2.7120053113425544 19 2.9072664105922641 20 3.0363554788599281 21 2.6479759061031132
		 22 2.2352856847274452 23 1.4028724632259557 24 0.52515194469934567 25 -0.38129215950539241
		 26 -1.3728235617575311 27 -1.9702292950832982 28 -2.4533225857493925 29 -2.2294984854605171
		 30 -1.5227047741597839 31 -0.52721844548051133 32 0.75196413814897822;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Spine2_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 7.8797924027586896 1 6.5877735338072654
		 2 5.0734505343923688 3 3.6193179795872665 4 2.2808853545993282 5 1.0778415759615461
		 6 0.18281187966040235 7 -0.63290839737210847 8 -1.2110368088207681 9 -1.6830773923896281
		 10 -1.8753423666848583 11 -1.9881097781302097 12 -1.6728982446363945 13 -1.3737880133198839
		 14 -0.84916235830189424 15 -0.32839098445052095 16 0.89699489738834759 17 2.0118504613286334
		 18 3.133347125856853 19 4.4452579796404681 20 5.832726815852177 21 7.1598606953620392
		 22 8.3865254017803004 23 9.4557905513886897 24 10.434156544292328 25 10.884610800497208
		 26 11.248746808010409 27 11.207620059283245 28 11.078698986019601 29 10.607753603106829
		 30 9.9721684099362111 31 9.0443705666925336 32 7.8797924027586896;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Spine2_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -4.3851614123614846 1 -4.0415535204394812
		 2 -3.6380037789777622 3 -3.2983667267867052 4 -3.0548115590508012 5 -2.847239948302271
		 6 -2.7505846042277033 7 -2.5628504544074477 8 -2.1678997883840037 9 -1.6950001595004274
		 10 -0.74796027468102 11 0.12372912928204333 12 0.93242094546323462 13 1.7064095002497337
		 14 1.9964589412650693 15 2.3007872580327318 16 1.790610105663522 17 1.203611587538072
		 18 0.62418862782567952 19 -0.05193043461885577 20 -0.77869570014686029 21 -1.1315223563718988
		 22 -1.4209745095998785 23 -1.7804568401831464 24 -2.1049290723037655 25 -2.7450889189236611
		 26 -3.508723761088457 27 -4.1196575624300147 28 -4.7157004448950337 29 -4.8875999332235462
		 30 -4.8865517535688969 31 -4.7267888448621642 32 -4.3851614123614846;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Spine2_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.2254070334463334 1 5.0233045356761652
		 2 4.9638065962774993 3 4.9808542985354576 4 5.1981991371716063 5 5.4412721060687126
		 6 5.7954784550121774 7 6.1466009073957446 8 6.5507120236016325 9 6.9261187145661323
		 10 7.3354549611819824 11 7.629841766265347 12 7.6331008509471054 13 7.6324690185718911
		 14 7.2343404624922965 15 6.8694857308106485 16 6.0088451039493815 17 5.5741214395992511
		 18 5.115475024030661 19 5.0217131025074009 20 4.9120813105982961 21 5.0615521689176228
		 22 5.2131029398459683 23 5.4991684333546775 24 5.7988819657950685 25 6.0172122168982005
		 26 6.2357991285145413 27 6.2980032156309145 28 6.3212178220031428 29 6.1920817075651753
		 30 5.9035419410948089 31 5.5941517031183006 32 5.2254070334463334;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Chest_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -8.2627026923417581 1 -6.9282246134439172
		 2 -5.3770221561496889 3 -3.8974833423898168 4 -2.5512839732069219 5 -1.3444242061064764
		 6 -0.46014835662620623 7 0.35554562586090188 8 0.95644610598443913 9 1.467630633298683
		 10 1.7680831319699115 11 1.9739955881936853 12 1.7821414743428612 13 1.5882938884875986
		 14 1.0943328405117188 15 0.60175068989012248 16 -0.70503404758909771 17 -1.8859851164506694
		 18 -3.0654726353962229 19 -4.4328149492593516 20 -5.8778694496563375 21 -7.2319122138292817
		 22 -8.4811575793547611 23 -9.5835939973522883 24 -10.594310267338892 25 -11.115820814203955
		 26 -11.583196093526494 27 -11.598522526769516 28 -11.529531213884846 29 -11.108147987723427
		 30 -10.445644313502905 31 -9.4807735006543172 32 -8.2627026923417581;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Chest_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 3.607645397771019 1 3.4235479434483538
		 2 3.1708094026988904 3 2.9650094895316252 4 2.8327861560079008 5 2.7317629298005421
		 6 2.7120111226019885 7 2.628829092671793 8 2.2914886940492298 9 1.8848365034555781
		 10 0.9809822252044218 11 0.1409708014192087 12 -0.70151380948350928 13 -1.5085343121189598
		 14 -1.873653000274532 15 -2.2423144484041631 16 -1.8744937394281462 17 -1.3925897488065726
		 18 -0.89986539539454924 19 -0.33720306002857087 20 0.2739477721634172 21 0.4879317009572825
		 22 0.64077834679050827 23 0.84569648158130739 24 1.0104143365556233 25 1.5460534537649016
		 26 2.2079464960481556 27 2.7912864850017214 28 3.3541578176440519 29 3.6538885122816818
		 30 3.778955160806317 31 3.7528032869163939 32 3.607645397771019;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Chest_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.7906884706346879 1 -5.4606515508544939
		 2 -5.2630691309907229 3 -5.2007541272890334 4 -5.3223936912815413 5 -5.4997878544303092
		 6 -5.8105865519762681 7 -6.1246038910727414 8 -6.5085275744547655 9 -6.8771586292136098
		 10 -7.3066904973288613 11 -7.6350233046866638 12 -7.6577166328314927 13 -7.6734097171829063
		 14 -7.2670102753810415 15 -6.8879879622376761 16 -5.9832930635842727 17 -5.530085801495189
		 18 -5.0698223634931434 19 -5.01128934425099 20 -4.9719625646952812 21 -5.1618307541123256
		 22 -5.3647345429539364 23 -5.7174277498397084 24 -6.0846951075196003 25 -6.4291403216104266
		 26 -6.7982826905933766 27 -6.9897390516434541 28 -7.1205479160616099 29 -6.9994044565134814
		 30 -6.6769006622259273 31 -6.2788776218911426 32 -5.7906884706346879;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Scapula_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.1817433459952025e-006 1 -2.1817433459952025e-006
		 2 -2.1817433459952025e-006 3 -2.1817433459952025e-006 4 -2.1817433459952025e-006
		 5 -2.1817433459952025e-006 6 -2.1817433459952025e-006 7 -2.1817433459952025e-006
		 8 -2.1817433459952025e-006 9 -2.1817433459952025e-006 10 -2.1817433459952025e-006
		 11 -2.1817433459952025e-006 12 -2.1817433459952025e-006 13 -2.1817433459952025e-006
		 14 -2.1817433459952025e-006 15 -2.1817433459952025e-006 16 -2.1817433459952025e-006
		 17 -2.1817433459952025e-006 18 -2.1817433459952025e-006 19 -2.1817433459952025e-006
		 20 -2.1817433459952025e-006 21 -2.1817433459952025e-006 22 -2.1817433459952025e-006
		 23 -2.1817433459952025e-006 24 -2.1817433459952025e-006 25 -2.1817433459952025e-006
		 26 -2.1817433459952025e-006 27 -2.1817433459952025e-006 28 -2.1817433459952025e-006
		 29 -2.1817433459952025e-006 30 -2.1817433459952025e-006 31 -2.1817433459952025e-006
		 32 -2.1817433459952025e-006;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Scapula_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.4203839476090244e-006 1 2.4203839476090244e-006
		 2 2.4203839476090244e-006 3 2.4203839476090244e-006 4 2.4203839476090244e-006 5 2.4203839476090244e-006
		 6 2.4203839476090244e-006 7 2.4203839476090244e-006 8 2.4203839476090244e-006 9 2.4203839476090244e-006
		 10 2.4203839476090244e-006 11 2.4203839476090244e-006 12 2.4203839476090244e-006
		 13 2.4203839476090244e-006 14 2.4203839476090244e-006 15 2.4203839476090244e-006
		 16 2.4203839476090244e-006 17 2.4203839476090244e-006 18 2.4203839476090244e-006
		 19 2.4203839476090244e-006 20 2.4203839476090244e-006 21 2.4203839476090244e-006
		 22 2.4203839476090244e-006 23 2.4203839476090244e-006 24 2.4203839476090244e-006
		 25 2.4203839476090244e-006 26 2.4203839476090244e-006 27 2.4203839476090244e-006
		 28 2.4203839476090244e-006 29 2.4203839476090244e-006 30 2.4203839476090244e-006
		 31 2.4203839476090244e-006 32 2.4203839476090244e-006;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Scapula_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -8.1415927139264375e-006 1 -8.1415927139264375e-006
		 2 -8.1415927139264375e-006 3 -8.1415927139264375e-006 4 -8.1415927139264375e-006
		 5 -8.1415927139264375e-006 6 -8.1415927139264375e-006 7 -8.1415927139264375e-006
		 8 -8.1415927139264375e-006 9 -8.1415927139264375e-006 10 -8.1415927139264375e-006
		 11 -8.1415927139264375e-006 12 -8.1415927139264375e-006 13 -8.1415927139264375e-006
		 14 -8.1415927139264375e-006 15 -8.1415927139264375e-006 16 -8.1415927139264375e-006
		 17 -8.1415927139264375e-006 18 -8.1415927139264375e-006 19 -8.1415927139264375e-006
		 20 -8.1415927139264375e-006 21 -8.1415927139264375e-006 22 -8.1415927139264375e-006
		 23 -8.1415927139264375e-006 24 -8.1415927139264375e-006 25 -8.1415927139264375e-006
		 26 -8.1415927139264375e-006 27 -8.1415927139264375e-006 28 -8.1415927139264375e-006
		 29 -8.1415927139264375e-006 30 -8.1415927139264375e-006 31 -8.1415927139264375e-006
		 32 -8.1415927139264375e-006;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Shoulder_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -14.357957980018632 1 -11.241501042776299
		 2 -7.9853332308521816 3 -4.7245974906884616 4 -1.5828890887913591 5 1.3475516691201492
		 6 3.7759167668856621 7 5.8807083742906174 8 7.095275943921509 9 7.8334655453307498
		 10 7.0470853986743807 11 6.0955202185247286 12 4.1748325565363844 13 2.292183608882874
		 14 0.17219805825781814 15 -1.9225497152705326 16 -6.4226707424529561 17 -8.0502200655441101
		 18 -9.6702701083872711 19 -11.592398615504839 20 -13.638328961708481 21 -15.151979857562917
		 22 -16.523231652864755 23 -17.535562938711177 24 -18.330245330844487 25 -19.517826594441697
		 26 -20.898066317432463 27 -21.805535563478458 28 -22.602547998274702 29 -21.901614413591574
		 30 -20.082910623028059 31 -17.54684229907566 32 -14.357957980018632;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Shoulder_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -13.944127456143644 1 -10.643084770393042
		 2 -7.2072849179387592 3 -3.7950093633004207 4 -0.55784704666529361 5 2.4444118395076226
		 6 4.9405880874270673 7 7.0629322903328822 8 8.2539309059909325 9 8.9590348861461742
		 10 8.1417539347446315 11 7.2202409637506166 12 5.5532781372242672 13 3.9228259079988308
		 14 2.0960909660465412 15 0.26085153903213337 16 -4.0741131200449487 17 -5.8160993144712192
		 18 -7.5751354823005688 19 -9.5065723653456811 20 -11.568880371119965 21 -13.014359281336242
		 22 -14.288591576419572 23 -15.586801359428467 24 -16.755041152379409 25 -18.344863325675885
		 26 -20.160372392773258 27 -21.364990590469358 28 -22.432316424126505 29 -21.793879509106176
		 30 -19.955928858561609 31 -17.310027759002431 32 -13.944127456143644;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Shoulder_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -79.685007923339171 1 -79.843196057584066
		 2 -80.138493593759065 3 -80.520549470318031 4 -80.947142992391917 5 -81.437359272340089
		 6 -81.873267276684714 7 -82.39675721555372 8 -82.984482767530167 9 -83.579176794655055
		 10 -84.345354298377003 11 -84.975148193519843 12 -85.096395887144268 13 -85.226682486744949
		 14 -84.750394619932493 15 -84.326335864717365 16 -83.651162237546757 17 -83.231241314027258
		 18 -82.850330519937884 19 -82.588662244108377 20 -82.377007203117543 21 -82.196435455884753
		 22 -82.095645264950562 23 -81.626471580377967 24 -81.11272045985811 25 -80.778427771605777
		 26 -80.521107716327862 27 -80.314972540840941 28 -80.144338797406277 29 -79.940073275539376
		 30 -79.753408770733216 31 -79.66203896379055 32 -79.685007923339171;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Elbow_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 6.1638658060013922 1 7.3441878263741556
		 2 8.5693757802191808 3 9.7863371819153091 4 10.946101228072303 5 11.934528086700343
		 6 12.573996844317172 7 13.101670137625581 8 13.299980877401614 9 13.434693523831722
		 10 13.033977626984385 11 12.550622186018417 12 11.427924270919002 13 10.327861174627582
		 14 9.0838897932315952 15 7.8539214753420232 16 5.2352224951793724 17 5.0715421837251817
		 18 4.9174787163844647 19 4.1345331663529841 20 3.3088406964068318 21 2.339094213098929
		 22 1.3404381335098674 23 1.5291727633913932 24 1.9105753087826596 25 2.2702301853435292
		 26 2.654475245481394 27 2.8986324013779523 28 3.0133959808407265 29 3.4555551056056366
		 30 4.0576853264494712 31 4.9711242654336001 32 6.1638658060013922;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Elbow_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.1933481787553579 1 3.7001566222896365
		 2 6.0333709290160771 3 8.4869914636534372 4 11.185893149333452 5 13.622793310431076
		 6 15.550998688999721 7 17.277173020745597 8 18.312476197689779 9 18.666710703962615
		 10 18.129771269840319 11 17.611010723443457 12 16.798854355055543 13 16.031253394473449
		 14 15.532499010330129 15 15.023907744551053 16 18.192370488803085 17 16.876900717822927
		 18 15.564146556396748 19 13.844503293476437 20 12.063086706740133 21 9.4059888393142259
		 22 6.8986309656510336 23 3.6784532891176744 24 0.36143123006090155 25 -0.95394083462264567
		 26 -1.8488394397144947 27 -1.7013276863576077 28 -0.73494831262671811 29 0.13510924715209527
		 30 0.69881663555870233 31 1.402618752896728 32 2.1933481787553579;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Elbow_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 3.3728057187328768 1 3.6107646116713878
		 2 4.5167135916946251 3 5.2191437035911807 4 5.7715060886116021 5 6.216194620465207
		 6 6.4574522613318797 7 6.6535141610980073 8 6.6907945855696349 9 6.6982512366608962
		 10 6.7083195992608067 11 6.7164390088456107 12 6.6213459228004456 13 6.5507323916370179
		 14 6.5966725888834272 15 6.6449540328252308 16 7.9254153505639202 17 7.4805266726741797
		 18 7.0100848700443139 19 7.0402427616009318 20 7.0483062433833732 21 7.0964098748052304
		 22 7.0761658793965774 23 6.3619022997765606 24 5.2925056472004046 25 5.1381413125645787
		 26 5.1176482442734068 27 4.9577849214684466 28 4.8372615015819624 29 4.4128766306094853
		 30 3.7377290847196036 31 3.449106138207338 32 3.3728057187328768;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Wrist_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -26.288736213967301 1 -25.906042989774487
		 2 -25.410033591803675 3 -24.858027116154759 4 -24.228534414729292 5 -23.713940310756715
		 6 -23.409542799929046 7 -23.144891556577676 8 -23.021330803007167 9 -22.883339942132288
		 10 -22.666418350114341 11 -22.517734031383746 12 -22.596122724613256 13 -22.675045500451958
		 14 -22.792516320014226 15 -22.918823133946066 16 -23.554055867477569 17 -23.550227659754938
		 18 -23.552468256183897 19 -24.082844175765114 20 -24.66157404886934 21 -25.862064816446804
		 22 -27.056936390918221 23 -27.733161469256352 24 -28.287200060417721 25 -28.231910345760681
		 26 -28.06845224473977 27 -27.738335267202732 28 -27.349208549485297 29 -27.055262128946254
		 30 -26.838823661612242 31 -26.581097906747853 32 -26.288736213967301;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Wrist_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.59476363133358001 1 -0.2241697050362382
		 2 0.3676352082168598 3 1.0235080136488484 4 1.810839773527501 5 2.46381514154037
		 6 2.8810187958507973 7 3.0981420415685865 8 2.788636251598533 9 2.3769235538946507
		 10 1.3990651869186064 11 0.58116290325000075 12 0.41360405171333259 13 0.20373840616709346
		 14 -0.022638838455699268 15 -0.24202423371973586 16 -1.2976349103000209 17 -1.166353009900096
		 18 -1.0471820062580433 19 -0.14293916416684729 20 0.83960344268225362 21 1.9306310654873329
		 22 3.0394062481391639 23 3.2529636160501014 24 3.2486585922392495 25 2.8026312985593589
		 26 2.1282546840752832 27 1.3450362352757326 28 0.51813167542884386 29 -0.1385263726993253
		 30 -0.72403142557365652 31 -0.78738776722740511 32 -0.59476363133358001;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Wrist_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 6.7058762948698956 1 6.0854909266034332
		 2 5.2826983505056955 3 5.0499720760399809 4 5.5211049181107974 5 5.9818652275351401
		 6 6.5545963339861011 7 7.0800941094743974 8 7.5764580403810244 9 7.8634854864195116
		 10 7.4596006536081374 11 6.8742337022340285 12 4.9595116846156087 13 3.1383875292252941
		 14 1.3935227881081473 15 -0.30414687551281988 16 -0.39315552350140071 17 1.2895894409946931
		 18 3.0203530881960896 19 3.364920298575178 20 3.7180549410772006 21 3.5230632645196218
		 22 3.3028269284301253 23 4.4136296853291164 24 5.9654080814699579 25 7.1666510909365027
		 26 8.479556044397329 27 8.5737637501786086 28 8.4296829921063487 29 8.1276067793465163
		 30 7.7426482167224826 31 7.2649684133202515 32 6.7058762948698956;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Neck_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.62880331581388937 1 0.72768483124209193
		 2 0.95912960821785631 3 1.2073021463934488 4 1.5010676706604409 5 1.7738612254293429
		 6 2.0133539183384368 7 2.2253436930643016 8 2.3739635561848451 9 2.4783754052167133
		 10 2.4839069112367391 11 2.4785280440486384 12 2.4101494247990685 13 2.3465970398380782
		 14 2.2576089372761992 15 2.1692669201730972 16 1.8303331037053621 17 1.7618884541080069
		 18 1.6928984902551769 19 1.6103063558014177 20 1.5244089427525602 21 1.406382232667639
		 22 1.2945056794049772 23 1.1832304599307151 24 1.0755553189851592 25 1.0351334374855825
		 26 1.0170008441322991 27 0.95100726498114918 28 0.87317662521165784 29 0.76849033925758625
		 30 0.63541710937961282 31 0.61041181991159943 32 0.62880331581388937;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Neck_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.3565667054692581 1 -3.3583884899614751
		 2 -3.5125868865262353 3 -3.7009393107986956 4 -3.9627813429236123 5 -4.2100256472806814
		 6 -4.4452326059848666 7 -4.6245510510689032 8 -4.6619902878006751 9 -4.6815043557379656
		 10 -4.6030972385412685 11 -4.5362167048670727 12 -4.507739663804621 13 -4.4734309847833895
		 14 -4.3980011971550903 15 -4.3234773836245477 16 -4.1106640916808992 17 -3.9899424404928236
		 18 -3.8664732553879682 19 -3.8297202280172624 20 -3.7997846979342453 21 -3.6512264510752037
		 22 -3.5017022527594017 23 -3.3812075970281206 24 -3.2644062611744609 25 -3.3714485265761427
		 26 -3.5607652273287758 27 -3.707168236838561 28 -3.8543016289540071 29 -3.8079033412173375
		 30 -3.630209647584941 31 -3.4892324838517501 32 -3.3565667054692581;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Neck_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 23.941804922835146 1 23.897165279439978
		 2 23.844533296434605 3 23.75097022788897 4 23.596247406359581 5 23.46506664082052
		 6 23.368341641592618 7 23.290463558041715 8 23.267890032426511 9 23.253351780226282
		 10 23.260822621507742 11 23.257591104269284 12 23.038369512611169 13 22.825767074711504
		 14 22.4019689505153 15 21.99168606120714 16 21.355136444834503 17 21.556517709723707
		 18 21.760878402803773 19 21.888324344063381 20 22.020039344389215 21 22.121475512973593
		 22 22.198046195337696 23 22.476873571308783 24 22.782479404368082 25 23.108598090485778
		 26 23.46213797373332 27 23.690154387588681 28 23.87022149061173 29 23.961165956987255
		 30 23.989255948427619 31 23.980397934010167 32 23.941804922835146;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Head_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.40766542486295038 1 -0.071513630006834084
		 2 0.48933713184393335 3 1.0999800220150548 4 1.8008376247165629 5 2.4476560381690229
		 6 3.0001848164335403 7 3.509499352243858 8 3.9198159611867851 9 4.2407834529770696
		 10 4.2981579702391812 11 4.3265068766030854 12 4.1798031570860754 13 4.0479165342104348
		 14 3.9009230063233522 15 3.7520488220429522 16 2.9897753152530395 17 2.8429123441431536
		 18 2.6966640664765809 19 2.4606273899759619 20 2.2094546870699143 21 1.951131876891097
		 22 1.7153910782385857 23 1.434435835309285 24 1.1627164071838398 25 0.91672764136891927
		 26 0.67847021003818642 27 0.34341860696941989 28 -0.023385035535033929 29 -0.31072375889463266
		 30 -0.56403688019082265 31 -0.56034757296030424 32 -0.40766542486295038;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Head_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.5668207621718748 1 5.5378625553527883
		 2 5.3135706864841081 3 5.0523567763163912 4 4.703403820738874 5 4.3749951682466746
		 6 4.0698581547095625 7 3.8267588147180613 8 3.7401636444861963 9 3.6882267831179893
		 10 3.7583204428414283 11 3.8229381128520803 12 3.8569346994834386 13 3.8958077375808111
		 14 3.9675730895761152 15 4.0398645035161911 16 4.3175581699574854 17 4.4674458918468387
		 18 4.6198186240360535 19 4.6918261898241278 20 4.7585668036547277 21 4.944635672962038
		 22 5.127707183124306 23 5.2939856191696615 24 5.4613657825461619 25 5.3837249682271793
		 26 5.2318071404036655 27 5.1265873273549136 28 5.0268081063524779 29 5.0984732671392878
		 30 5.3104045735145791 31 5.4541836877005601 32 5.5668207621718748;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Head_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -12.337456694164516 1 -12.391194473067552
		 2 -12.454048878609207 3 -12.555890392176668 4 -12.715953047859678 5 -12.849080696524142
		 6 -12.944046434582098 7 -13.020451875101292 8 -13.046158992910375 9 -13.062783920375855
		 10 -13.060379940347538 11 -13.067035274104244 12 -13.286009294961502 13 -13.498415316233011
		 14 -13.923358403165185 15 -14.334634043047672 16 -14.969120961736312 17 -14.772002352508899
		 18 -14.571693685096891 19 -14.441322450987146 20 -14.305691403252839 21 -14.205693584819132
		 22 -14.130636088227106 23 -13.850464649814464 24 -13.543093068929707 25 -13.206126739823317
		 26 -12.839534723475804 27 -12.598275777777827 28 -12.404734506843965 29 -12.307970328182742
		 30 -12.278565624851534 31 -12.290337280936715 32 -12.337456694164516;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Scapula_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.1307251692906871e-005 1 -2.1307251692906871e-005
		 2 -2.1307251692906871e-005 3 -2.1307251692906871e-005 4 -2.1307251692906871e-005
		 5 -2.1307251692906871e-005 6 -2.1307251692906871e-005 7 -2.1307251692906871e-005
		 8 -2.1307251692906871e-005 9 -2.1307251692906871e-005 10 -2.1307251692906871e-005
		 11 -2.1307251692906871e-005 12 -2.1307251692906871e-005 13 -2.1307251692906871e-005
		 14 -2.1307251692906871e-005 15 -2.1307251692906871e-005 16 -2.1307251692906871e-005
		 17 -2.1307251692906871e-005 18 -2.1307251692906871e-005 19 -2.1307251692906871e-005
		 20 -2.1307251692906871e-005 21 -2.1307251692906871e-005 22 -2.1307251692906871e-005
		 23 -2.1307251692906871e-005 24 -2.1307251692906871e-005 25 -2.1307251692906871e-005
		 26 -2.1307251692906871e-005 27 -2.1307251692906871e-005 28 -2.1307251692906871e-005
		 29 -2.1307251692906871e-005 30 -2.1307251692906871e-005 31 -2.1307251692906871e-005
		 32 -2.1307251692906871e-005;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Scapula_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.0005552369177469e-005 1 1.0005552369177469e-005
		 2 1.0005552369177469e-005 3 1.0005552369177469e-005 4 1.0005552369177469e-005 5 1.0005552369177469e-005
		 6 1.0005552369177469e-005 7 1.0005552369177469e-005 8 1.0005552369177469e-005 9 1.0005552369177469e-005
		 10 1.0005552369177469e-005 11 1.0005552369177469e-005 12 1.0005552369177469e-005
		 13 1.0005552369177469e-005 14 1.0005552369177469e-005 15 1.0005552369177469e-005
		 16 1.0005552369177469e-005 17 1.0005552369177469e-005 18 1.0005552369177469e-005
		 19 1.0005552369177469e-005 20 1.0005552369177469e-005 21 1.0005552369177469e-005
		 22 1.0005552369177469e-005 23 1.0005552369177469e-005 24 1.0005552369177469e-005
		 25 1.0005552369177469e-005 26 1.0005552369177469e-005 27 1.0005552369177469e-005
		 28 1.0005552369177469e-005 29 1.0005552369177469e-005 30 1.0005552369177469e-005
		 31 1.0005552369177469e-005 32 1.0005552369177469e-005;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Scapula_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.7472791986738114e-005 1 -2.7472791986738114e-005
		 2 -2.7472791986738114e-005 3 -2.7472791986738114e-005 4 -2.7472791986738114e-005
		 5 -2.7472791986738114e-005 6 -2.7472791986738114e-005 7 -2.7472791986738114e-005
		 8 -2.7472791986738114e-005 9 -2.7472791986738114e-005 10 -2.7472791986738114e-005
		 11 -2.7472791986738114e-005 12 -2.7472791986738114e-005 13 -2.7472791986738114e-005
		 14 -2.7472791986738114e-005 15 -2.7472791986738114e-005 16 -2.7472791986738114e-005
		 17 -2.7472791986738114e-005 18 -2.7472791986738114e-005 19 -2.7472791986738114e-005
		 20 -2.7472791986738114e-005 21 -2.7472791986738114e-005 22 -2.7472791986738114e-005
		 23 -2.7472791986738114e-005 24 -2.7472791986738114e-005 25 -2.7472791986738114e-005
		 26 -2.7472791986738114e-005 27 -2.7472791986738114e-005 28 -2.7472791986738114e-005
		 29 -2.7472791986738114e-005 30 -2.7472791986738114e-005 31 -2.7472791986738114e-005
		 32 -2.7472791986738114e-005;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Shoulder_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 3.1334023510007185 1 0.65582896777956146
		 2 -2.2515609873014615 3 -5.2764106894837859 4 -8.4438772876491708 5 -11.467122945849413
		 6 -14.261153994294192 7 -16.878299418904081 8 -19.103673409800038 9 -21.018726610658817
		 10 -22.193900283456721 11 -22.999283308281267 12 -22.498101898505045 13 -21.90442068566027
		 14 -19.247593026001578 15 -16.735834265411299 16 -8.4897535225610063 17 -5.3022000954835224
		 18 -2.0896073626502014 19 0.38971425559125134 20 3.020335056308737 21 4.9289635668666492
		 22 6.6333142177750064 23 8.4392588061696117 24 10.226854362853965 25 10.912693328729761
		 26 11.376528797414688 27 10.991059361405734 28 10.257522927606857 29 8.9029005185811272
		 30 7.237849875455086 31 5.2986970661298596 32 3.1334023510007185;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Shoulder_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.9959945684074616 1 0.90099023675148915
		 2 -1.7506265435626651 3 -4.6223814766181262 4 -7.7706339768765647 5 -10.824809374889581
		 6 -13.660078605579033 7 -16.312992549507662 8 -18.645342033664491 9 -20.651676698710542
		 10 -22.044257937459975 11 -23.013101353999438 12 -22.708341026454725 13 -22.327308228673374
		 14 -19.856813170316752 15 -17.472370926158 16 -9.0362474371535146 17 -5.7981451917858635
		 18 -2.5135114530453979 19 -0.051549185843060431 20 2.5178583556123528 21 4.3256359824030746
		 22 5.9066884751814221 23 7.5386860141163803 24 9.1904778563107019 25 9.5063754735111505
		 26 9.6177691676742789 27 9.1400537709073753 28 8.3220417075639546 29 7.2623579698184839
		 30 6.0977749398784562 31 4.6575344653368091 32 2.9959945684074616;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Shoulder_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -88.23061583339728 1 -87.535347150775394
		 2 -86.712086937736075 3 -85.975029734799563 4 -85.303481024614143 5 -84.980553909615438
		 6 -84.990588817424737 7 -85.08904995473867 8 -85.196841927962666 9 -85.302055247104661
		 10 -85.197634437082414 11 -85.084258551745691 12 -84.802356171039804 13 -84.496663929697718
		 14 -83.744852026107296 15 -83.100640969053188 16 -81.738494631687658 17 -81.687387915527296
		 18 -81.725903502745751 19 -82.178977999517542 20 -82.757350809987415 21 -83.327843860110505
		 22 -83.882565023816085 23 -84.577527415777496 24 -85.246755316670189 25 -86.253417461719977
		 26 -87.407494688863139 27 -88.312083328382627 28 -89.207020617800637 29 -89.35710214251975
		 30 -89.26629092661878 31 -88.845511870904048 32 -88.23061583339728;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Elbow_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 19.545503609790192 1 17.725818780990362
		 2 16.216497457186389 3 14.777536991989935 4 13.669350386869437 5 12.915500291027838
		 6 12.564525723268771 7 12.352499060785872 8 12.624718865610312 9 12.973510348146279
		 10 13.846176753851365 11 14.664159083221394 12 15.573811840601026 13 16.456460907374495
		 14 17.101881106153098 15 17.501821226534023 16 18.440104800207415 17 19.403793945576272
		 18 20.353845637860296 19 21.367931469159789 20 22.447317171436488 21 23.317286936264658
		 22 24.09824130630254 23 24.938313205144734 24 25.740608155059689 25 26.305915558013076
		 26 27.034036855592372 27 27.006623893074831 28 26.823959942313884 29 25.650867832543863
		 30 23.710458881357969 31 21.721747106635299 32 19.545503609790192;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Elbow_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 16.322554510878607 1 18.04842793298856
		 2 19.590603000962361 3 21.164355703012721 4 21.853395578483138 5 21.438553888962041
		 6 19.06803632698103 7 16.927075217988364 8 14.234767926505704 9 11.592161910464522
		 10 8.2202040216710444 11 5.048729596620694 12 1.8396521085810804 13 -1.2093141993891707
		 14 -2.0710891089339043 15 -1.1821247999557054 16 2.4295661784710556 17 3.2244689715319939
		 18 4.0069739439611798 19 5.7600165003669614 20 7.6345329138888092 21 9.5982403976571167
		 22 11.541772283044587 23 12.166846111479385 24 12.47271190515259 25 12.097941420417904
		 26 10.575319669901647 27 10.20732248157198 28 10.133414154450158 29 10.893327020949314
		 30 12.557613876340884 31 14.331524712477467 32 16.322554510878607;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Elbow_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 7.5185974083127647 1 7.9550749995972545
		 2 8.2618224378797063 3 8.6347100879718841 4 8.9539704522561809 5 9.2311902962881902
		 6 9.6748770404065283 7 10.046266169693562 8 10.248354979300675 9 10.400048556323027
		 10 10.342519669345066 11 10.32938239344643 12 10.160332308251368 13 10.054809194153879
		 14 9.6928129841259008 15 9.371537850612933 16 7.9342464103501351 17 7.4879221730571581
		 18 7.0510153323802944 19 6.8308842745923934 20 6.5773016305211414 21 6.4201050154171373
		 22 6.2306428921747434 23 6.1940225693889408 24 6.1868757100863832 25 6.3644778791761318
		 26 6.6672177316930457 27 6.7037027274098051 28 6.6962834398594993 29 6.6902612955478231
		 30 6.6947928449695864 31 6.9363353909813901 32 7.5185974083127647;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Wrist_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -7.9172095276469641 1 -8.5901999440352963
		 2 -8.8626915573206677 3 -9.1003119454122849 4 -9.1233445613860216 5 -9.1256676660376712
		 6 -9.201994474999438 7 -9.2129062993206059 8 -8.9843219342437965 9 -8.6711163335034556
		 10 -7.8537329063149084 11 -7.1081637445236945 12 -6.4120257470256838 13 -5.8124911046619232
		 14 -5.865667747050904 15 -6.0684557119062257 16 -6.9563946428265728 17 -7.2597581971170779
		 18 -7.5834386203813136 19 -7.3161753754929322 20 -7.0214474464297236 21 -6.55527620112922
		 22 -6.0982227029143354 23 -5.8990897222008609 24 -5.7960318474660237 25 -5.6127658845841149
		 26 -5.3362715965966476 27 -5.1185645193582427 28 -4.9147174869559054 29 -5.2148802990550021
		 30 -5.9444888453726286 31 -6.8270943917714568 32 -7.9172095276469641;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Wrist_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -10.638299093299514 1 -10.994284535420221
		 2 -11.262384489230186 3 -11.68917644752668 4 -11.950757745143848 5 -11.672190722542314
		 6 -10.666612936936623 7 -9.707819087992247 8 -8.46452635770234 9 -7.1004807249896205
		 10 -4.7571819134114914 11 -2.607107922208193 12 -0.8091097561247641 13 0.7835364158214152
		 14 0.7045872639306956 15 -0.24587029073369018 16 -2.1790399990311333 17 -1.9818693974653911
		 18 -1.7791644416310102 19 -2.755835729540796 20 -3.8432667636222857 21 -5.4921684378822766
		 22 -7.1025124419001573 23 -8.4514505259293351 24 -9.7560455138857431 25 -10.057653266234709
		 26 -9.8966705988914754 27 -9.6703891568097529 28 -9.4571283215816422 29 -9.5435799519700026
		 30 -9.8315911693264795 31 -10.19476491557718 32 -10.638299093299514;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Wrist_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.2992207054760696 1 -3.1610579844567899
		 2 -3.0408672048921077 3 -3.1133892637829921 4 -3.6043703634558271 5 -4.2103222802206677
		 6 -5.211975738532832 7 -6.1189334027266122 8 -6.9968615982465794 9 -7.53226925875492
		 10 -7.1116968064380366 11 -6.6732336207682383 12 -5.9540193360015081 13 -5.328499601512827
		 14 -5.1789573833584308 15 -4.9820808072229319 16 -2.7165963819945662 17 -2.4670412337914569
		 18 -2.2113651127114751 19 -2.6029779545226086 20 -3.028021798785498 21 -3.4730723204759824
		 22 -3.8367510742484074 23 -4.4475118792778208 24 -5.1479008929853842 25 -5.041342442602863
		 26 -4.7841554840167655 27 -4.4922190436076912 28 -4.1886421826889872 29 -3.913442662398928
		 30 -3.6694257593433797 31 -3.471072545338977 32 -3.2992207054760696;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Hip_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.57438982710932618 1 0.60246723686093051
		 2 0.60439445595170516 3 0.59050772127846696 4 0.5067787164286337 5 0.44697839834342568
		 6 0.42444341425248699 7 0.40111585748209405 8 0.39809904862415135 9 0.27424613049223601
		 10 -0.1891202924300992 11 -0.66887519697722664 12 -0.91393923007090083 13 -1.04757609619146
		 14 -0.87795647388580444 15 -0.65238972554077213 16 0.062305470597533545 17 0.17342502065482199
		 18 0.21067715761890532 19 0.54655651594032095 20 0.87572522305340628 21 1.3491154537427104
		 22 1.8377032384693792 23 2.0139772881266294 24 2.0704453830575344 25 1.7903631541299607
		 26 1.2952386859743417 27 0.95132211026725166 28 0.67477146691714851 29 0.52218226104633791
		 30 0.5112885968495352 31 0.51937335196763557 32 0.57438982710932618;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Hip_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -11.185251034482393 1 -11.346855153148432
		 2 -11.254192719542178 3 -11.020646681470547 4 -10.623699341615682 5 -10.121942453934277
		 6 -9.4575266190563596 7 -8.5750961094773235 8 -7.2856434320701151 9 -5.8736615324936876
		 10 -3.7134992998208887 11 -1.5858584426221809 12 0.27145227228703184 13 1.9188367451398054
		 14 2.5914527115108501 15 3.3300523264474751 16 1.8345581513047533 17 0.7289718988018925
		 18 -0.27108637632610533 19 -0.5661983103445235 20 -0.66064022920947851 21 -0.1570862967363427
		 22 0.48488677044007222 23 0.24567718649702683 24 -0.16251278944546274 25 -1.5751812259073505
		 26 -3.3908314653807539 27 -5.1295025945836343 28 -6.9674740715778816 29 -8.5080616104055053
		 30 -9.8047819819222859 31 -10.652831365217828 32 -11.185251034482393;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Hip_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -11.007653667869343 1 -8.4331141071429574
		 2 -6.170961562936621 3 -3.8744117087376191 4 -1.7817146526927239 5 0.40043164896785405
		 6 2.7895088984336978 7 5.5884306353402611 8 9.1795362684745037 9 11.553970755168576
		 10 11.626086405942026 11 10.584689689065977 12 7.7238090803357569 13 5.3154300037720139
		 14 1.2365942075592948 15 -2.8113096934340178 16 -13.705796433061801 17 -17.264098999064213
		 18 -20.957714195372549 19 -22.011034843287671 20 -23.055310042708978 21 -22.006552100370456
		 22 -22.580007936285998 23 -23.500832004279609 24 -23.839345344836104 25 -24.258058959329251
		 26 -24.380266017773636 27 -23.17488225620237 28 -21.427176000447702 29 -19.202321334664145
		 30 -16.466924642847058 31 -13.818612107878053 32 -11.007653667869343;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Knee_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.5892757548084964 1 1.9296853033238555
		 2 1.1377860039933916 3 0.29673566895958758 4 -0.61324869033676777 5 -1.4183342467894036
		 6 -2.0486925239877252 7 -2.656586635225525 8 -3.1547489629515355 9 -3.638370253947711
		 10 -4.5409577018105045 11 -5.5837198400803736 12 -6.1813179540049994 13 -6.6816910592575081
		 14 -6.5701903380600664 15 -6.4091488274864901 16 -5.4604568523089663 17 -4.9425245444264192
		 18 -4.4781300651975728 19 -2.8133467786927979 20 -1.189812575761976 21 0.68582688966043637
		 22 2.237107572798041 23 3.1403802405749515 24 3.8504549826056382 25 3.7715728981628232
		 26 3.4828089106440774 27 3.4436229965937022 28 3.5080564816153346 29 3.5056498758426717
		 30 3.4584949816632133 31 3.1526386624506455 32 2.5892757548084964;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Knee_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.1306655511588232 1 0.28387064416331359
		 2 0.90694864085044191 3 1.43380684656533 4 1.8526769181220659 5 2.1166236193361083
		 6 2.1398407997297588 7 2.2543762911052143 8 2.6783936108163897 9 3.1331340476062439
		 10 3.8931513752475144 11 4.4953727892912934 12 4.645231950909154 13 4.6980093954662125
		 14 4.365388974713154 15 4.0969112413967235 16 4.8753341338337002 17 5.3379771844138748
		 18 5.7942291262764787 19 5.7578619478286734 20 5.5636397372959303 21 4.5448946619586543
		 22 3.6409732411446289 23 2.8174254099709688 24 2.0842868884764392 25 1.7646927723182899
		 26 1.5740164819559503 27 1.1104167815680299 28 0.56018903866386738 29 0.0764814668269609
		 30 -0.40636338899935093 31 -0.41179545867935774 32 -0.1306655511588232;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Knee_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 25.003002533502286 1 24.237135560020544
		 2 23.865097224714351 3 23.239745421419489 4 22.514477150970567 5 21.731242182394251
		 6 20.603321875331488 7 18.867431237916225 8 16.506401993209021 9 15.412957436603044
		 10 20.367732743289725 11 26.02619519143034 12 34.451304496964745 13 42.217669500327503
		 14 49.437258873452009 15 56.612394593168709 16 63.540426708650109 17 61.325250085450158
		 18 59.226848088165966 19 51.274484103469845 20 42.631910373945423 21 31.954568357168856
		 22 24.536306864382489 23 20.480025109061707 24 16.257535709984477 25 18.237549631805138
		 26 21.788478809845444 27 23.516174543055833 28 25.115732689225794 29 26.107361646457569
		 30 26.28023926491548 31 26.029918843473574 32 25.003002533502286;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Ankle_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.9714500571524809 1 4.2207701327159874
		 2 1.694367900857396 3 -0.63550619137333908 4 -2.7000062124105426 5 -4.6338688778783776
		 6 -6.2116486692438766 7 -7.7282473356309938 8 -8.9129296384445968 9 -10.105307899062147
		 10 -12.000415896909859 11 -13.49306202166515 12 -11.736792518422956 13 -9.3758514937299715
		 14 -6.4401301838099183 15 -3.5057196301180817 16 4.3990522992736603 17 7.3996375338829123
		 18 10.606880995316422 19 12.851662066161335 20 15.032684928006828 21 13.551040378349196
		 22 12.061104156505207 23 10.885781654259796 24 9.7668438139903486 25 9.175790071412969
		 26 8.6645607492532246 27 8.5899670883384278 28 8.6320656192509198 29 8.418377077607861
		 30 8.0022721104158148 31 7.1437745594235373 32 5.9714500571524809;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Ankle_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 8.0780944196306379 1 8.1259545614168402
		 2 7.9109821086278114 3 7.594188736413976 4 7.1138539123147631 5 6.6020375307820141
		 6 6.154187176644653 7 5.1896546600051598 8 3.3001095655419523 9 1.0301591358979996
		 10 -4.921927181059333 11 -12.115868169384802 12 -18.769969615163955 13 -22.472921587497552
		 14 -21.546082374334066 15 -20.620925493192264 16 -12.488865294567406 17 -9.0452080690531105
		 18 -5.6081325611599917 19 2.8211755772780078 20 12.375261219908809 21 8.9273276262466403
		 22 4.1839547203098926 23 4.6955275000442827 24 5.9708729213606588 25 5.7585088333313728
		 26 5.4162570301531181 27 5.5936677741078809 28 6.0325189038126723 29 6.621158431286867
		 30 7.3603955767897133 31 7.8177700825016476 32 8.0780944196306379;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Ankle_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -10.402400505627583 1 -11.81566064294743
		 2 -13.625498204354132 3 -15.405280911396884 4 -17.054962327950644 5 -18.814142749330646
		 6 -20.305947731635253 7 -21.691593806213632 8 -22.47823987596335 9 -22.898165043694657
		 10 -21.151989493012081 11 -17.935918621025589 12 -11.858138229567293 13 -8.402948236901512
		 14 -9.3019645805151043 15 -10.045821297085238 16 -12.656934003597595 17 -14.478218652898548
		 18 -16.152290399477213 19 -14.979290303101127 20 -12.992141984790084 21 -12.992231948411023
		 22 -12.514334779278789 23 -10.718832560438006 24 -9.8172615292668706 25 -7.6795005318988574
		 26 -5.9699918393975073 27 -5.563565611191998 28 -5.8624634369105619 29 -6.7709998167518943
		 30 -8.0600894026279164 31 -9.2865793353570822 32 -10.402400505627583;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Toes_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.8028209259932892 1 -3.8311301400111115
		 2 -3.8382298424601191 3 -3.7919983803726787 4 -3.7918720872199194 5 -3.7767874151329042
		 6 -3.6937651168914751 7 -3.7110672994855585 8 -4.132794221092654 9 -4.9967887276690988
		 10 -9.4134009292175573 11 -13.002485042938327 12 -15.101107899032115 13 -12.694427908209448
		 14 -7.5172188836308473 15 -1.287767465706023 16 -1.560704630948927 17 -2.1339853523521288
		 18 -2.7049160433665662 19 -3.5188635376493127 20 -4.3994561951617523 21 -4.9025024877298788
		 22 -5.3495480706298171 23 -5.5468449590463429 24 -5.6757749691035748 25 -5.3324961689919252
		 26 -4.7517954200894188 27 -4.4180160488052334 28 -4.1731588490071347 29 -4.0008078430231278
		 30 -3.8869461751757721 31 -3.8224801527914836 32 -3.8028209259932892;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Hip_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.8331913146383365 1 -2.5458479719192062
		 2 -1.8293598110213891 3 -0.90164858976167794 4 0.48413646139680921 5 1.6071806976744296
		 6 2.4737991661737002 7 2.9808188884736291 8 2.9947104437736183 9 2.9505597804011892
		 10 2.8995507018963265 11 2.9742684878573473 12 2.8580444692920697 13 2.747087334982107
		 14 2.5731686371688065 15 2.4203774842465053 16 1.5223256475717999 17 1.4981814814697034
		 18 1.4800516404565862 19 1.3703149429324848 20 1.2651122732674187 21 0.84160955972111096
		 22 0.38955355920821544 23 -0.026230895546796938 24 -0.46067268981943599 25 -0.75223619470020253
		 26 -1.3654439714333451 27 -1.9407640877322823 28 -2.5789970872219272 29 -2.8967675600864631
		 30 -2.9719481296307189 31 -2.9247509045226674 32 -2.8331913146383365;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Hip_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.24436802021476978 1 -1.5101871209535063
		 2 -2.8787202858507537 3 -3.7259852931296749 4 -3.9424286910683111 5 -4.0357895271835291
		 6 -4.0086091354233053 7 -4.0624783913478293 8 -4.3763044065539392 9 -4.8997048307670763
		 10 -6.7842442625443713 11 -8.1037920853376164 12 -9.2593312900703779 13 -10.476544256362208
		 14 -10.951347285762395 15 -11.511384635687012 16 -10.840348292403213 17 -10.615561892833886
		 18 -10.287615040713169 19 -9.8957894137683038 20 -9.4340268500321951 21 -8.7398090423944907
		 22 -8.0445222633569688 23 -6.9300801412751216 24 -5.6934058361424462 25 -4.4221372754905142
		 26 -2.858454851001794 27 -1.5074186352844958 28 1.0511329977349164 29 1.7480142383679258
		 30 1.7406879588069608 31 1.1148750808522343 32 -0.24436802021476978;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Hip_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -20.962370947485969 1 -24.775455071620332
		 2 -26.932401625771877 3 -27.869871682890654 4 -27.395793325308567 5 -26.172792527143795
		 6 -22.012810836444359 7 -19.564279568917588 8 -19.55160384229622 9 -20.871222960794277
		 10 -22.050428197440699 11 -22.079764325745312 12 -21.086791584820215 13 -20.064299048765534
		 14 -18.759915468000067 15 -17.358136626947442 16 -12.270789608668222 17 -9.6093695413356333
		 18 -6.9894317200794465 19 -4.3610543956707364 20 -1.8200036838865172 21 1.2367427312321986
		 22 3.8174274553910421 23 7.5994197173048477 24 11.862870644313908 25 11.661229575028287
		 26 9.6932768816713963 27 5.7355881609246095 28 1.6171454300516672 29 -3.7226512213351386
		 30 -9.6832842058780724 31 -15.256466388454264 32 -20.962370947485969;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Knee_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.6976123301895569 1 -5.1683480839980946
		 2 -3.9214269980641232 3 -2.1174816675358676 4 0.49289360289877704 5 2.7102955403841307
		 6 4.4280718174981253 7 5.3065311380629856 8 5.3115197133400649 9 5.2709616142602762
		 10 5.5325176808689527 11 5.8212303423120053 12 5.8558658440090348 13 5.9060273198381665
		 14 5.7473478950902663 15 5.6292347934818947 16 4.1701048858559009 17 3.7288900817301318
		 18 3.3060588388930392 19 2.8118056723503382 20 2.3411241352769996 21 1.6948541593067592
		 22 1.0936635946802364 23 0.50039461857271239 24 0.024834612826574846 25 -0.47354085023511661
		 26 -1.6099151285382447 27 -2.9141216787568114 28 -4.2047747144476286 29 -5.142964242351848
		 30 -5.7328080697282733 31 -5.7995954616342873 32 -5.6976123301895569;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Knee_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 7.5313433096126268 1 7.8355365269258233
		 2 8.87597175554607 3 9.1907463558031512 4 8.6246918879134782 5 7.6248216363238823
		 6 6.5416386533840871 7 5.1158458598642982 8 3.5411528970537098 9 2.2559073477386855
		 10 1.7353126876282521 11 1.2781176121082343 12 0.82605680260572079 13 0.36841287254296023
		 14 -0.15071248692268338 15 -0.62899151469576142 16 -0.72773004478203052 17 0.05656074542664305
		 18 0.83521276847844583 19 1.6849696179933062 20 2.6413187948026402 21 2.8855063759799071
		 22 3.0332909283811711 23 3.7129936850947236 24 4.4143740460061762 25 5.889218801699152
		 26 7.6458139125636251 27 8.6718757464754859 28 9.0410438331468175 29 8.7534747197158165
		 30 7.8522643297185795 31 7.5508434696405864 32 7.5313433096126268;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Knee_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 65.191627962269038 1 63.47321661212392
		 2 55.698344864552091 3 46.734775465865887 4 35.1354545954499 5 23.071900461808152
		 6 8.7817830677630688 7 0.10010556444998096 8 0.032607740914515994 9 3.5744191637606262
		 10 9.6408521534333538 11 13.083083895016472 12 16.497228240777382 13 19.792712492066965
		 14 22.816367675054 15 25.700000522675641 16 26.593366751511507 17 26.356238681344127
		 18 26.192219435150893 19 24.955180158611721 20 23.976710996090009 21 21.823234472949313
		 22 20.149398184903919 23 17.29943949648457 24 13.958307155204757 25 17.651544822009502
		 26 25.732640236001689 27 34.858666067464334 28 42.199872362186845 29 50.219855125960898
		 30 59.124082982359475 31 63.598832001779392 32 65.191627962269038;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Ankle_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.9338552072410851 1 5.8412971443686663
		 2 3.7521056907718577 3 1.4738436075107386 4 -1.8845444198560821 5 -3.3243583161069412
		 6 -2.1846807387518186 7 -0.47497193784119124 8 1.563659269568676 9 3.432477298800189
		 10 5.7774500784718601 11 7.9182604718840048 12 8.5793233328998006 13 9.2052629187834363
		 14 9.1158123824829804 15 9.0769874496392493 16 6.1917784955756838 17 4.7536706556176256
		 18 3.2934648679561835 19 1.212737149936739 20 -1.0661555421495197 21 -2.7538422587169773
		 22 -4.2854182640728071 23 -5.5440094350760871 24 -6.6617899777717415 25 -7.7241927247344941
		 26 -9.7192563592480443 27 -8.6508877694072179 28 -4.5588817304862168 29 -0.73037113864584102
		 30 2.3658789382452605 31 4.3534363617795568 32 5.9338552072410851;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Ankle_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -4.5022420981910418 1 -1.2645579677976746
		 2 3.9290966369089464 3 5.6635670712953461 4 4.0586356630682845 5 1.2125664394862867
		 6 -4.7758083079623219 7 -7.939473066217805 8 -6.0060764298337155 9 -2.3714359242193357
		 10 4.6412459331658837 11 6.248767279168689 12 5.6322105709510941 13 5.5520974566462042
		 14 6.0524983188990511 15 7.1597230163475345 16 5.5329460143751605 17 5.2744001076152793
		 18 4.9300915993950571 19 4.4989183887281481 20 3.9302518455925326 21 3.3336219552473083
		 22 2.7560873689681293 23 1.5363932679101204 24 0.25426856366941131 25 -1.1557299780898147
		 26 -6.5419165168827691 27 -9.107645972089804 28 -17.010438560305367 29 -16.640351547768972
		 30 -9.8048145576899071 31 -6.079591544629328 32 -4.5022420981910418;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Ankle_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 6.5640689889195256 1 2.2609167485527348
		 2 -1.1989600284482467 3 -4.11047204037318 4 -5.8416490056456798 5 -5.6144676320782612
		 6 0.91566531777972615 7 3.8735402089837105 8 1.7357628985381595 9 -0.31253117518492557
		 10 1.0462463324212792 11 3.4819321400610139 12 3.6081953560570885 13 2.9046068588256801
		 14 -0.60606479800919055 15 -4.0937380118471358 16 -8.6975728827432679 17 -10.869183964567052
		 18 -13.07443168602822 19 -14.827545216377782 20 -16.8214745101196 21 -18.265874270335857
		 22 -19.732037183325634 23 -20.836661684850256 24 -21.827906037474481 25 -20.796611045262644
		 26 -17.955660739456622 27 -9.0990801912929555 28 7.1278201394801552 29 13.360974842475283
		 30 14.55072042470956 31 12.578496808651684 32 6.5640689889195256;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Toes_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.9967653444158042 1 -5.9965532074936947
		 2 -5.9957866703028753 3 -5.9951740021172313 4 -5.9950440518051531 5 -6.036204889929409
		 6 -6.2659742951179842 7 -6.4326785884331965 8 -6.5277934745898198 9 -6.5645149627692874
		 10 -6.2304407135507214 11 -5.9930455347230955 12 -5.9942202648224923 13 -5.9942723604702248
		 14 -5.9943152544130767 15 -5.9943669254425398 16 -5.9946919320360799 17 -5.9947370185655009
		 18 -5.9947668347468843 19 -5.9947881583008513 20 -5.9948353329849366 21 -5.9947384626304148
		 22 -5.9947371338207525 23 -6.3148210719018403 24 -6.6437568240801141 25 -14.3016840571866
		 26 -23.247134417858309 27 -36.805132434867332 28 -52.916155922263208 29 -49.24460396507034
		 30 -17.045381556874531 31 -5.9778575859435579 32 -5.9967653444158042;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTL -n "walk_macho:Root_M_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.31878762983182451 1 -0.33246722016452884
		 2 -0.33931935899449955 3 -0.33293654240554732 4 -0.33293963646601155 5 -0.33636712483401893
		 6 -0.33891387182235205 7 -0.33716366177390411 8 -0.32180512270532313 9 -0.28988896635736627
		 10 -0.24071349961389113 11 -0.17365345888615144 12 -0.090205466180267119 13 -0.0014246280791757604
		 14 0.07366819145289831 15 0.1344963941124975 16 0.17247003840725139 17 0.19484627567589854
		 18 0.20279987435576668 19 0.20124048206064557 20 0.19119733995065241 21 0.1764234133872043
		 22 0.15403016201473199 23 0.12738620042684037 24 0.095290931649499158 25 0.055235969534672379
		 26 0.0049018370555022964 27 -0.06587917465633028 28 -0.14063278936308099 29 -0.20773958653576274
		 30 -0.26131842792992055 31 -0.29728985849033607 32 -0.31878762983182451;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTL -n "walk_macho:Root_M_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.4472808394752299 1 5.5070191299621198
		 2 5.6693562337716843 3 5.7919799286234834 4 5.9041666956281826 5 5.9890884946467882
		 6 6.009882890362416 7 5.9891811442346565 8 5.9237007266639514 9 5.8575508801008365
		 10 5.8058346631686915 11 5.7663783489937046 12 5.7313189196140604 13 5.6898966392305255
		 14 5.6313317056238592 15 5.5696381690028272 16 5.5367146924849537 17 5.5426766537143255
		 18 5.6003071414424603 19 5.7054940021950449 20 5.8277485238234599 21 5.9283596573194588
		 22 5.9752840144655588 23 5.9733435835123636 24 5.9224220740424602 25 5.8639325070238044
		 26 5.8111489556662619 27 5.7292772781244166 28 5.6295076652409684 29 5.5384673706013459
		 30 5.4721625949132999 31 5.44575877501146 32 5.4472808394752299;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTL -n "walk_macho:Root_M_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.04711231698362997 1 0.035457689939119443
		 2 0.035935196827645947 3 -0.0067353553925531898 4 -0.050602451981643731 5 -0.10315663342204245
		 6 -0.14700285754237943 7 -0.16745401802044335 8 -0.16494871962210456 9 -0.14533156283228879
		 10 -0.11836807245317481 11 -0.086490054888653967 12 -0.05277036679711463 13 -0.032965451185075351
		 14 -0.04915607870135108 15 -0.088318025918327325 16 -0.12554892807641785 17 -0.14553796640264779
		 18 -0.14684533500954905 19 -0.14603636855368304 20 -0.14837214323596615 21 -0.16222576552220361
		 22 -0.17408363249970543 23 -0.16735195814821907 24 -0.12817865178878241 25 -0.072879635738715226
		 26 -0.011716850704911762 27 0.048787093425129144 28 0.096427823380875133 29 0.10667427845214703
		 30 0.10142363504045636 31 0.073656308062407083 32 0.04711231698362997;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Root_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 7.1061349696621532 1 6.2809586919597153
		 2 3.0935743902863768 3 2.9235234694614456 4 2.4954429901416768 5 2.2086256031248888
		 6 2.2618017484687463 7 2.6909488515283524 8 3.534661665380765 9 4.7746085156248546
		 10 6.286669321555916 11 7.841775748048085 12 9.0921654267865541 13 9.9228460373472327
		 14 10.291476872599022 15 10.02983357678829 16 9.1662052908759613 17 8.2838004614364316
		 18 7.7472417999389096 19 7.6575242331582727 20 7.7303690889946663 21 7.9722382364093756
		 22 8.3625006015468166 23 8.6383588995452332 24 8.5617558559259113 25 8.1178030538881583
		 26 7.5150715850440468 27 6.689817070061105 28 6.1286362336999209 29 6.1882185934122926
		 30 6.6819952391164454 31 7.0741901677438932 32 7.1061349696621532;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Root_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -6.7649430032456097 1 -6.3769085084795183
		 2 -4.7534214349877173 3 -3.8362267771388234 4 -2.7469021506824114 5 -2.0270601535636201
		 6 -2.2196493080536444 7 -3.2103991628943453 8 -4.2761022213010822 9 -4.5889874478296839
		 10 -4.343775211353508 11 -3.5470419851135464 12 -2.7310805614130582 13 -1.8511377899855084
		 14 -0.73290990579741921 15 0.67212213502847373 16 1.9897188998807243 17 2.6430262038462518
		 18 2.4079135386688728 19 1.1771081688161555 20 -0.42474616942844162 21 -1.8321989445013944
		 22 -2.4148751278652534 23 -2.1840639686479539 24 -1.4248767158400324 25 -1.134640215668165
		 26 -1.3901928560565477 27 -2.152788749436751 28 -3.0582108296898523 29 -4.1635769988912168
		 30 -5.4410021206284176 31 -6.4624794898381976 32 -6.7649430032456097;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Root_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.4938214513962289 1 -2.5832846533746268
		 2 -2.0983211075623389 3 -2.2918993667918115 4 -2.3359328745595267 5 -2.2906767944291144
		 6 -2.2148602816615393 7 -2.1999897856939068 8 -2.2231050314345322 9 -2.2946604344385721
		 10 -2.3658623191305717 11 -2.4377399706204668 12 -2.5960184466649778 13 -2.8792400296155343
		 14 -3.1780793727829062 15 -3.4258560283293233 16 -3.5489495216925233 17 -3.5709512926594127
		 18 -3.5449425359390982 19 -3.4178000670700923 20 -3.1908000216299595 21 -2.7985042226619967
		 22 -2.2043728166070373 23 -1.5767239185175892 24 -0.97348732879051769 25 -0.63160084835169805
		 26 -0.59824767761291697 27 -0.75981049958986968 28 -1.0995520104401286 29 -1.4610312525284435
		 30 -1.8319159383529553 31 -2.1990772041191202 32 -2.4938214513962289;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Spine1_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -32.541751643525792 1 -28.687521397770571
		 2 -20.31887501263385 3 -14.356609663313828 4 -8.5841628606914959 5 -3.3011750742151582
		 6 0.49805837655542023 7 3.0427760401023178 8 4.7538234257300696 9 5.8293669941085522
		 10 6.543081836055479 11 7.1890864925648019 12 7.7589338760837769 13 7.8859911181669426
		 14 7.4353623644923363 15 6.0464294759675603 16 3.4276007194765441 17 -0.14428153856969389
		 18 -4.6148071029348365 19 -9.8819860715265122 20 -15.441156215888002 21 -20.705183735470751
		 22 -25.377725094066935 23 -28.858035176682392 24 -31.622228438021981 25 -33.482699672399328
		 26 -34.85893101524502 27 -35.835161850598503 28 -36.495805622391728 29 -36.626052056069852
		 30 -36.413615178615366 31 -35.02799696851406 32 -32.541751643525792;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Spine1_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 15.493110064500502 1 14.763869850335867
		 2 11.554571159870992 3 9.1582156301432143 4 6.1794738572131651 5 3.1224870114264256
		 6 1.2244155867895716 7 0.59455192559635162 8 0.3090727702606153 9 -0.42147005237046536
		 10 -1.7323223694760059 11 -3.4101043373038715 12 -4.9093601626994756 13 -6.2033220387126891
		 14 -7.5157026914908158 15 -9.0455231863868928 16 -10.249183332408437 17 -10.19307434801501
		 18 -8.5627690611374909 19 -5.5539921732534117 20 -2.0172785406221756 21 1.0791588372876453
		 22 3.0315247358417921 23 3.6499420372615461 24 3.7074021014710747 25 4.3112966442346981
		 26 5.594871879077183 27 7.468522334272409 28 9.3494176605022812 29 11.286813901477712
		 30 13.338563889891908 31 14.97972706459327 32 15.493110064500502;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Spine1_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -10.941344976756364 1 -10.183352674168136
		 2 -9.2731626463749173 3 -7.98682037311203 4 -7.3467264913887869 5 -7.0708995937687602
		 6 -6.9240789080491929 7 -6.9038653048953398 8 -6.9355869163265842 9 -6.9489453095478124
		 10 -6.8342565190358142 11 -6.62960826579934 12 -6.3524371849025867 13 -5.8226324450396403
		 14 -4.9550535217199485 15 -3.716692366532834 16 -2.7212442776629682 17 -2.2685326913444634
		 18 -2.4099009303497194 19 -3.247334121292639 20 -4.5133099344547176 21 -6.0698729237052698
		 22 -7.8136279867630707 23 -9.3547014580246781 24 -10.704656804084189 25 -11.493666477917348
		 26 -11.966645848788549 27 -12.402405822308614 28 -12.744427560900053 29 -12.793146045320855
		 30 -12.475815525230887 31 -11.785022961384408 32 -10.941344976756364;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Spine2_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 12.484699923109989 1 10.912489965108474
		 2 7.6651497077811097 3 5.7202696172204117 4 3.8545072609988074 5 2.1700567742484052
		 6 0.97970099189782456 7 0.22201112469155174 8 -0.23202401849567753 9 -0.44331699784285583
		 10 -0.49954426599882346 11 -0.51456782760679465 12 -0.52470722197892505 13 -0.37885612437063809
		 14 -0.0065493455402163524 15 0.68936689095681969 16 1.7273200585130377 17 3.0770569741822764
		 18 4.7167302480564084 19 6.5803028206160565 20 8.4967737372807974 21 10.281841337802062
		 22 11.845117577508612 23 12.9868907881183 24 13.889862502716634 25 14.454058559631472
		 26 14.814281482162396 27 15.002812239571314 28 15.014720976730803 29 14.87729456716937
		 30 14.419772995435535 31 13.630781826278959 32 12.484699923109989;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Spine2_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -8.2716633418873435 1 -7.4232511362650797
		 2 -5.4886539762949562 3 -4.0052035132564194 4 -2.54799666707145 5 -1.1311874577959182
		 6 -0.092554102986721412 7 0.56060895694547119 8 1.0239077548062856 9 1.4455081711192121
		 10 1.8950942941087525 11 2.4276051805646346 12 3.0180510241651288 13 3.5519721281299619
		 14 3.8826698958010417 15 3.9347380962286316 16 3.7429908536251619 17 3.0976559055080872
		 18 2.0193463719292346 19 0.61346627175401591 20 -0.86927286511307644 21 -2.2300191168907033
		 22 -3.4129011207268474 23 -4.2492195094086584 24 -4.902101472970859 25 -5.4331445630494279
		 26 -6.0108558625274515 27 -6.7853469929986074 28 -7.5622059312067895 29 -8.1997255999204857
		 30 -8.61413848113237 31 -8.6882848349367698 32 -8.2716633418873435;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Spine2_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 8.0144648307873094 1 8.2354728073516981
		 2 8.8382969512527296 3 8.8542078971016878 4 8.952036820671335 5 9.0127486256653722
		 6 8.99446215493961 7 8.9656065598687942 8 8.9519713415821816 9 8.914222994845872
		 10 8.8138184770717185 11 8.6578937884317213 12 8.4670176995128106 13 8.1955863681421626
		 14 7.8290624919426453 15 7.3611073566634779 16 7.0378282482540122 17 7.0134479709479827
		 18 7.1906671101771549 19 7.5580582155090674 20 7.9614391629103816 21 8.347178757926855
		 22 8.7226985922660898 23 9.0443023275583947 24 9.3204407886048539 25 9.4096776733278134
		 26 9.3450182947377023 27 9.1591481404389548 28 8.9220077077964675 29 8.6428638017464046
		 30 8.3282290455898682 31 8.0718451862180096 32 8.0144648307873094;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Chest_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -13.595143822877569 1 -11.919104957628786
		 2 -8.4390808881646517 3 -6.2772887123334655 4 -4.2061606138732497 5 -2.3206197014373977
		 6 -0.98221816682169472 7 -0.13190523489685541 8 0.38862033714911209 9 0.66211295682267823
		 10 0.78430777243437266 11 0.8763365317209858 12 0.95996950628611921 13 0.88256439146121402
		 14 0.53505424615076591 15 -0.1773164796169264 16 -1.2591675931007427 17 -2.6814324136250045
		 18 -4.431407758007528 19 -6.4448431187461912 20 -8.534827730810159 21 -10.496260815267558
		 22 -12.227816744342194 23 -13.499351140983041 24 -14.510327889137107 25 -15.162637353520315
		 26 -15.616159267219233 27 -15.920945439376586 28 -16.062852644548055 29 -16.016718205915986
		 30 -15.603259392488642 31 -14.805649225402863 32 -13.595143822877569;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Chest_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 6.2668273243628567 1 5.6493847107962205
		 2 4.1963409892871448 3 3.0566038052674251 4 1.9116201428423887 5 0.77655993926823597
		 6 -0.061898482799150799 7 -0.58829775840121223 8 -0.9752865078895584 9 -1.3592932093491421
		 10 -1.7960562428852045 11 -2.3221027600880291 12 -2.9082173105366582 13 -3.4615125800346949
		 14 -3.8381061713497253 15 -4.0105170246700466 16 -3.9161575784169411 17 -3.4448985100485459
		 18 -2.587701164316218 19 -1.4688154953145161 20 -0.32123707350441094 21 0.68569418344185173
		 22 1.5166841868856078 23 2.0617415002525799 24 2.4632146831247845 25 2.8451809336423013
		 26 3.3467012986504572 27 4.0993481064705977 28 4.8960184314093382 29 5.6081766900717414
		 30 6.1883833015102745 31 6.4076158068239231 32 6.2668273243628567;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Chest_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -9.6725256423169643 1 -9.5371168930786805
		 2 -9.5160041453764119 3 -9.2229935985473794 4 -9.1085151745172279 5 -9.0514968687819319
		 6 -8.9944855353598498 7 -8.963278020899585 8 -8.9558665358111593 9 -8.9292787625001182
		 10 -8.8343317969293356 11 -8.6866225881327335 12 -8.5050674318089658 13 -8.2340206708291426
		 14 -7.8471325783459722 15 -7.3305102189756051 16 -6.9300939672328195 17 -6.8732467204126024
		 18 -6.9913265747720752 19 -7.4419446571935666 20 -8.002002794732034 21 -8.61060533421489
		 22 -9.2383873071566782 23 -9.772088597757751 24 -10.231678046036677 25 -10.479477951663046
		 26 -10.585579900729792 27 -10.625104614896564 28 -10.614208017664948 29 -10.503460510385821
		 30 -10.266347338796296 31 -9.947058352544607 32 -9.6725256423169643;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Scapula_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.1817433459952025e-006 1 -2.1817433459952025e-006
		 2 -2.1817433459952025e-006 3 -2.1817433459952025e-006 4 -2.1817433459952025e-006
		 5 -2.1817433459952025e-006 6 -2.1817433459952025e-006 7 -2.1817433459952025e-006
		 8 -2.1817433459952025e-006 9 -2.1817433459952025e-006 10 -2.1817433459952025e-006
		 11 -2.1817433459952025e-006 12 -2.1817433459952025e-006 13 -2.1817433459952025e-006
		 14 -2.1817433459952025e-006 15 -2.1817433459952025e-006 16 -2.1817433459952025e-006
		 17 -2.1817433459952025e-006 18 -2.1817433459952025e-006 19 -2.1817433459952025e-006
		 20 -2.1817433459952025e-006 21 -2.1817433459952025e-006 22 -2.1817433459952025e-006
		 23 -2.1817433459952025e-006 24 -2.1817433459952025e-006 25 -2.1817433459952025e-006
		 26 -2.1817433459952025e-006 27 -2.1817433459952025e-006 28 -2.1817433459952025e-006
		 29 -2.1817433459952025e-006 30 -2.1817433459952025e-006 31 -2.1817433459952025e-006
		 32 -2.1817433459952025e-006;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Scapula_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.4203839476090244e-006 1 2.4203839476090244e-006
		 2 2.4203839476090244e-006 3 2.4203839476090244e-006 4 2.4203839476090244e-006 5 2.4203839476090244e-006
		 6 2.4203839476090244e-006 7 2.4203839476090244e-006 8 2.4203839476090244e-006 9 2.4203839476090244e-006
		 10 2.4203839476090244e-006 11 2.4203839476090244e-006 12 2.4203839476090244e-006
		 13 2.4203839476090244e-006 14 2.4203839476090244e-006 15 2.4203839476090244e-006
		 16 2.4203839476090244e-006 17 2.4203839476090244e-006 18 2.4203839476090244e-006
		 19 2.4203839476090244e-006 20 2.4203839476090244e-006 21 2.4203839476090244e-006
		 22 2.4203839476090244e-006 23 2.4203839476090244e-006 24 2.4203839476090244e-006
		 25 2.4203839476090244e-006 26 2.4203839476090244e-006 27 2.4203839476090244e-006
		 28 2.4203839476090244e-006 29 2.4203839476090244e-006 30 2.4203839476090244e-006
		 31 2.4203839476090244e-006 32 2.4203839476090244e-006;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Scapula_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -8.1415927139264375e-006 1 -8.1415927139264375e-006
		 2 -8.1415927139264375e-006 3 -8.1415927139264375e-006 4 -8.1415927139264375e-006
		 5 -8.1415927139264375e-006 6 -8.1415927139264375e-006 7 -8.1415927139264375e-006
		 8 -8.1415927139264375e-006 9 -8.1415927139264375e-006 10 -8.1415927139264375e-006
		 11 -8.1415927139264375e-006 12 -8.1415927139264375e-006 13 -8.1415927139264375e-006
		 14 -8.1415927139264375e-006 15 -8.1415927139264375e-006 16 -8.1415927139264375e-006
		 17 -8.1415927139264375e-006 18 -8.1415927139264375e-006 19 -8.1415927139264375e-006
		 20 -8.1415927139264375e-006 21 -8.1415927139264375e-006 22 -8.1415927139264375e-006
		 23 -8.1415927139264375e-006 24 -8.1415927139264375e-006 25 -8.1415927139264375e-006
		 26 -8.1415927139264375e-006 27 -8.1415927139264375e-006 28 -8.1415927139264375e-006
		 29 -8.1415927139264375e-006 30 -8.1415927139264375e-006 31 -8.1415927139264375e-006
		 32 -8.1415927139264375e-006;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Shoulder_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -10.981232103454056 1 -7.0881673188132659
		 2 -1.6765008655323754 3 1.3889169232482241 4 4.6949073905361267 5 8.3390243901127086
		 6 11.505589711001029 7 13.888164855518129 8 15.418107575331256 9 15.974345278620291
		 10 15.965404089958565 11 15.463886481954669 12 14.870923982986662 13 13.959596825119485
		 14 12.569677715391689 15 10.435160278659092 16 7.6298238680728661 17 4.1949211199773702
		 18 0.21630748170194372 19 -4.0394381901904124 20 -8.2068250240865801 21 -12.053093993195381
		 22 -15.453699597338373 23 -17.955872440712273 24 -20.019735412829174 25 -21.33476870123264
		 26 -22.209268938306035 27 -22.655985918340786 28 -22.454537229013759 29 -20.894844070982472
		 30 -18.172427042061518 31 -14.778770037637198 32 -10.981232103454056;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Shoulder_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -4.6327797371251229 1 1.8587641220854938
		 2 10.460647729827139 3 14.622919454377886 4 18.331927233696661 5 21.943136685399718
		 6 25.455982119378543 7 29.106244648092165 8 32.380741489326681 9 34.598515154007359
		 10 35.296191143912743 11 34.42459987587673 12 31.625013717769082 13 28.340102326666329
		 14 25.355395643047355 15 22.092058849805181 16 18.835077976147591 17 15.489139632060651
		 18 11.714880118176874 19 7.4607892602173385 20 2.9610471939308685 21 -1.7284831947286792
		 22 -6.7088443348422562 23 -11.298417821301186 24 -15.994097352652071 25 -19.549049876248635
		 26 -21.938966709331982 27 -23.188986043089411 28 -22.951726229786001 29 -20.693303174303072
		 30 -16.605105619089986 31 -11.111137198348182 32 -4.6327797371251229;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Shoulder_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -62.871848913313016 1 -64.788568184144154
		 2 -67.02873184666899 3 -67.274965297053058 4 -66.918616265011721 5 -66.078395651455025
		 6 -64.607066646642437 7 -62.04915601264144 8 -58.839046088580403 9 -55.823813078208261
		 10 -53.527424633218956 11 -52.583742259934866 12 -53.740601065144112 13 -56.393559363746768
		 14 -59.759043666572573 15 -63.933828568786126 16 -67.905143076358172 17 -71.012503427752335
		 18 -72.885742352281625 19 -73.137409551679113 20 -71.884932760327487 21 -69.376395286986053
		 22 -66.750341697513093 23 -64.769816706121404 24 -62.928214951737637 25 -61.428846529282822
		 26 -60.403138998170789 27 -59.559466267062575 28 -58.94227259196424 29 -58.868705312099479
		 30 -59.524665956647183 31 -60.964803567131383 32 -62.871848913313016;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Elbow_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.987912196186167 1 -2.88731744986957
		 2 -3.38526575595548 3 -1.9374853490736161 4 1.5639562322584761 5 6.9218836339564165
		 6 11.836968317205088 7 15.457107859477969 8 17.983314516055781 9 19.54527253806458
		 10 20.335636706714329 11 21.207674389628352 12 22.507719530564671 13 22.362696701973082
		 14 19.730479739826045 15 14.951752417737003 16 8.8949960819114455 17 2.4703100280226469
		 18 -3.0754860696635884 19 -7.0176518106648365 20 -9.5443123021946583 21 -11.182070677240885
		 22 -11.941534607208769 23 -11.753537151753008 24 -10.599256359165642 25 -9.2957794058404044
		 26 -8.4685854988517502 27 -8.3893283482181253 28 -8.3223077774949719 29 -7.308242719470484
		 30 -5.2600774630805107 31 -3.6215809738200209 32 -2.987912196186167;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Elbow_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 21.450224873267423 1 20.846846060675812
		 2 24.254418799596607 3 27.556637028193933 4 31.073886776866839 5 34.507831708051334
		 6 37.292489296901934 7 39.69754778036372 8 41.787726604019021 9 43.400596064072261
		 10 44.574975522365385 11 45.161491169549862 12 45.130277144194956 13 44.317568249521528
		 14 42.858957690971927 15 40.373067717569967 16 37.271671719434259 17 34.226482117481048
		 18 31.599575156363827 19 29.409110844906845 20 27.808751359405424 21 26.991846356849141
		 22 26.532061973958264 23 26.224044879330119 24 26.556728556554738 25 27.087237704738989
		 26 27.233839487374105 27 27.337584271763877 28 27.321227623308996 29 26.686232348632451
		 30 25.187461655337373 31 23.221670429448466 32 21.450224873267423;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Elbow_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.9199064710467431 1 -5.9070475520772261
		 2 -7.9763461412656156 3 -10.427005098872833 4 -12.634993848822914 5 -14.993102044560558
		 6 -17.193787730733654 7 -18.881455109438456 8 -19.267958169915168 9 -18.982579799083329
		 10 -17.638759538223017 11 -16.548092997848912 12 -16.39437884828963 13 -16.274946120540356
		 14 -15.433126297344419 15 -14.014144459027317 16 -11.902613359146189 17 -9.256909852138266
		 18 -6.7869038835528972 19 -5.2257160540786431 20 -4.6334105017078668 21 -4.2330940861034048
		 22 -3.0533563098753116 23 -1.1138099614450141 24 1.05612524231341 25 2.2018042739047874
		 26 2.8194668141852404 27 2.8110917426052753 28 2.1547884519788885 29 0.68233514491611835
		 30 -0.97368402127369591 31 -2.3784444247960521 32 -3.9199064710467431;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Wrist_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.3536283822602 1 -5.1451105608323457
		 2 -4.8953364628910077 3 -4.8885419558412391 4 -4.9175348839924151 5 -4.9702243845118206
		 6 -4.9752203171250589 7 -4.9501624816986896 8 -4.8692155972527891 9 -4.7565956270455167
		 10 -4.7099427050921401 11 -4.7317176847943898 12 -4.7651131700323059 13 -4.8153185829194012
		 14 -4.8617991173447255 15 -4.8411226147810984 16 -4.71534715447733 17 -4.551386223998664
		 18 -4.448095944828709 19 -4.4506396520329199 20 -4.6721065716884382 21 -5.1340638814245354
		 22 -5.6485059707240532 23 -6.0299538639512225 24 -6.3584451395673325 25 -6.4684162440189787
		 26 -6.4115575491803662 27 -6.2397944187690291 28 -6.086757504834206 29 -5.9763976504706324
		 30 -5.8195941973078504 31 -5.5851025347576542 32 -5.3536283822602;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Wrist_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 6.8159350056801546 1 7.9072018117404852
		 2 5.0523221218532113 3 6.816864476435712 4 9.3565335354319359 5 12.93100105028765
		 6 15.918324248945343 7 17.436378869638759 8 17.562575086305209 9 16.614400718800113
		 10 14.636319574335358 11 12.798089459843901 12 12.057650872079533 13 11.099470360653626
		 14 9.835342246940904 15 8.3288601103034434 16 6.1269077050014067 17 3.1579354934961739
		 18 0.023143148363721219 19 -2.566811181113279 20 -3.884399640622807 21 -3.8877698936252938
		 22 -2.4564294153673503 23 -0.95339144679515941 24 -0.3843028409864413 25 -0.82263874303947782
		 26 -1.4008305691930842 27 -2.3993858144519065 28 -2.5905149302519321 29 -1.5006578748572967
		 30 1.6835328376793033 31 4.6334736533354866 32 6.8159350056801546;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Wrist_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.9953520640429119 1 -4.8999546060037344
		 2 0.066070423900221206 3 0.93497531743625617 4 1.8548215928727194 5 2.0090878068648967
		 6 1.7873412206875356 7 1.3935800633399118 8 0.62577344789203637 9 -0.68881854576947166
		 10 -1.9373322996293258 11 -2.3960945911379961 12 -1.9577037092519263 13 -0.73673468599505032
		 14 1.4203371689954387 15 4.58291897236482 16 6.9941746006482788 17 7.6426581518435608
		 18 7.4350146417845719 19 6.4954275193673841 20 4.6865601805316253 21 1.5271056365349782
		 22 -2.213000344490371 23 -5.547309373740787 24 -8.3504123955490588 25 -8.5330516319153151
		 26 -7.6751971068729823 27 -5.7914422374536025 28 -4.4817580918487518 29 -4.6174249394404079
		 30 -5.5189523928586475 31 -5.9820907642667258 32 -5.9953520640429119;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Neck_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.239815701227823 1 2.1870791192264547
		 2 1.8532212294836008 3 1.7787567211849564 4 1.5564486793398828 5 1.1277193820140177
		 6 0.71286527737564842 7 0.42984079547894671 8 0.25443422131757149 9 0.208875583865267
		 10 0.28471681286083489 11 0.3991973156950045 12 0.42198029441076518 13 0.50239447680630034
		 14 0.733248200778715 15 1.1211906368682369 16 1.6421715432321253 17 2.3166792675120589
		 18 3.1099257450392201 19 3.8956293554795063 20 4.4536212694332811 21 4.5838347826424055
		 22 4.354555816794214 23 3.8200308153014424 24 3.019175465879774 25 2.3226855284101613
		 26 1.8852257248481499 27 1.6779484576293691 28 1.6624994586052266 29 1.7343439713239306
		 30 1.941830528283728 31 2.1588534446104299 32 2.239815701227823;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Neck_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.4326550132983207 1 0.8305197490428311
		 2 -0.58516511999105303 3 -2.3975098953605016 4 -3.2061536657587584 5 -2.9546325405276392
		 6 -2.392636676079718 7 -2.021159659336905 8 -1.9880354476300557 9 -2.3920214555582389
		 10 -3.3658843924223314 11 -4.5531251603422946 12 -5.2525057735448906 13 -5.5458738357251747
		 14 -5.6125750844306319 15 -5.5192655484308153 16 -5.3274012149242749 17 -5.3047252121553079
		 18 -5.3717697691738167 19 -5.2940875598776653 20 -4.2129277486932795 21 -2.1217526492231489
		 22 0.49681097033167004 23 3.3225117247921894 24 6.6269265508323336 25 9.1383533419135006
		 26 10.639556533341258 27 10.989612450409732 28 10.681840249258626 29 9.2475169089947808
		 30 7.0260365890210537 31 4.5643264654300433 32 2.4326550132983207;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Neck_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 24.039388032726126 1 24.286491342305322
		 2 23.345192465604679 3 24.628582096973634 4 25.8229883779745 5 26.556478024595126
		 6 26.558083755433348 7 26.29926788141286 8 25.922675225986428 9 25.494062970301169
		 10 24.977068699864571 11 24.269891113109541 12 23.331225278231557 13 22.193267847689501
		 14 21.066763837837104 15 19.682656086147428 16 18.403855089752255 17 17.908560063289006
		 18 18.07923790494586 19 18.892159533317795 20 20.125443579716677 21 21.680736080022633
		 22 23.153390420015487 23 23.945464347718612 24 24.245221370365844 25 24.31678997455009
		 26 24.316003443921105 27 24.222027979047013 28 24.195475834767617 29 24.254883563884157
		 30 24.229573576972481 31 24.029934365865561 32 24.039388032726126;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Head_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 7.2949448993224895 1 6.1876673595168139
		 2 4.322766395109225 3 3.0150605815631879 4 1.7841867226422246 5 0.57756423978795357
		 6 -0.32119191829435423 7 -0.92658582334196482 8 -1.4029171099997044 9 -1.786387345682136
		 10 -2.0455374347256314 11 -2.2627689240130615 12 -2.4317088463778243 13 -2.1714244792722082
		 14 -1.3604203482453878 15 0.016701724107313784 16 1.8154259309938534 17 3.9397089354913701
		 18 6.2661076871200176 19 8.5988638802174329 20 10.562627060957954 21 11.809967921942377
		 22 12.354208788485614 23 12.396840635817197 24 11.998428349475009 25 11.479271385947778
		 26 11.099882523864428 27 10.780349704276095 28 10.394134551211204 29 9.8239347681493925
		 30 9.0908473890597783 31 8.2612173175495567 32 7.2949448993224895;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Head_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -1.9667584361257169 1 -1.2762578747661708
		 2 -1.0519529530437732 3 -0.040117800335203672 4 0.38358282054100373 5 0.20259171875873638
		 6 -0.14096540234098232 7 -0.37718444181257277 8 -0.41173319798217978 9 -0.22543662703024683
		 10 0.5310713015042634 11 1.4670843482737304 12 1.9589615801309956 13 2.0508375850208029
		 14 1.9039680869594344 15 1.5924783801906557 16 1.3861751499057151 17 1.4305328568678572
		 18 1.6703978521856777 19 1.759639668630997 20 1.2318523377174693 21 -0.077620160127884488
		 22 -1.6663390517185719 23 -3.1659788108934563 24 -4.6779980611390828 25 -5.6791194601020623
		 26 -6.2501813727095801 27 -6.3125216694744486 28 -6.1980326612760477 29 -5.5362544991780247
		 30 -4.3769647402904335 31 -3.0427653572350146 32 -1.9667584361257169;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Head_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -14.661889779587462 1 -14.967658131054678
		 2 -14.26307667019505 3 -15.228778163257674 4 -15.985477472190823 5 -16.532661378424777
		 6 -16.808457170377213 7 -16.870266433170038 8 -16.83754805416384 9 -16.786815567174159
		 10 -16.817872383581868 11 -17.063583504602459 12 -17.56320190060265 13 -18.230722175353314
		 14 -18.932744340357516 15 -19.21431985727537 16 -18.880791339439256 17 -18.467665195042809
		 18 -18.232139516548532 19 -18.053803930730353 20 -17.827369994559056 21 -17.458170175453102
		 22 -16.830409416778021 23 -15.806568632293963 24 -14.439561258122396 25 -13.329977115346955
		 26 -12.600403700448005 27 -12.274960361977316 28 -12.386543557993953 29 -12.951506748620034
		 30 -13.637764124171735 31 -14.192557397010713 32 -14.661889779587462;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Scapula_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.1307251692906871e-005 1 -2.1307251692906871e-005
		 2 -2.1307251692906871e-005 3 -2.1307251692906871e-005 4 -2.1307251692906871e-005
		 5 -2.1307251692906871e-005 6 -2.1307251692906871e-005 7 -2.1307251692906871e-005
		 8 -2.1307251692906871e-005 9 -2.1307251692906871e-005 10 -2.1307251692906871e-005
		 11 -2.1307251692906871e-005 12 -2.1307251692906871e-005 13 -2.1307251692906871e-005
		 14 -2.1307251692906871e-005 15 -2.1307251692906871e-005 16 -2.1307251692906871e-005
		 17 -2.1307251692906871e-005 18 -2.1307251692906871e-005 19 -2.1307251692906871e-005
		 20 -2.1307251692906871e-005 21 -2.1307251692906871e-005 22 -2.1307251692906871e-005
		 23 -2.1307251692906871e-005 24 -2.1307251692906871e-005 25 -2.1307251692906871e-005
		 26 -2.1307251692906871e-005 27 -2.1307251692906871e-005 28 -2.1307251692906871e-005
		 29 -2.1307251692906871e-005 30 -2.1307251692906871e-005 31 -2.1307251692906871e-005
		 32 -2.1307251692906871e-005;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Scapula_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.0005552369177469e-005 1 1.0005552369177469e-005
		 2 1.0005552369177469e-005 3 1.0005552369177469e-005 4 1.0005552369177469e-005 5 1.0005552369177469e-005
		 6 1.0005552369177469e-005 7 1.0005552369177469e-005 8 1.0005552369177469e-005 9 1.0005552369177469e-005
		 10 1.0005552369177469e-005 11 1.0005552369177469e-005 12 1.0005552369177469e-005
		 13 1.0005552369177469e-005 14 1.0005552369177469e-005 15 1.0005552369177469e-005
		 16 1.0005552369177469e-005 17 1.0005552369177469e-005 18 1.0005552369177469e-005
		 19 1.0005552369177469e-005 20 1.0005552369177469e-005 21 1.0005552369177469e-005
		 22 1.0005552369177469e-005 23 1.0005552369177469e-005 24 1.0005552369177469e-005
		 25 1.0005552369177469e-005 26 1.0005552369177469e-005 27 1.0005552369177469e-005
		 28 1.0005552369177469e-005 29 1.0005552369177469e-005 30 1.0005552369177469e-005
		 31 1.0005552369177469e-005 32 1.0005552369177469e-005;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Scapula_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.7472791986738114e-005 1 -2.7472791986738114e-005
		 2 -2.7472791986738114e-005 3 -2.7472791986738114e-005 4 -2.7472791986738114e-005
		 5 -2.7472791986738114e-005 6 -2.7472791986738114e-005 7 -2.7472791986738114e-005
		 8 -2.7472791986738114e-005 9 -2.7472791986738114e-005 10 -2.7472791986738114e-005
		 11 -2.7472791986738114e-005 12 -2.7472791986738114e-005 13 -2.7472791986738114e-005
		 14 -2.7472791986738114e-005 15 -2.7472791986738114e-005 16 -2.7472791986738114e-005
		 17 -2.7472791986738114e-005 18 -2.7472791986738114e-005 19 -2.7472791986738114e-005
		 20 -2.7472791986738114e-005 21 -2.7472791986738114e-005 22 -2.7472791986738114e-005
		 23 -2.7472791986738114e-005 24 -2.7472791986738114e-005 25 -2.7472791986738114e-005
		 26 -2.7472791986738114e-005 27 -2.7472791986738114e-005 28 -2.7472791986738114e-005
		 29 -2.7472791986738114e-005 30 -2.7472791986738114e-005 31 -2.7472791986738114e-005
		 32 -2.7472791986738114e-005;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Shoulder_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 13.976609169492871 1 10.855596687091269
		 2 2.4633176321788599 3 -2.1910458311229681 4 -7.0648109445506728 5 -12.211428236589486
		 6 -16.716583090180194 7 -20.809709558233795 8 -24.572539769589675 9 -27.826981412423702
		 10 -30.417395412702593 11 -31.856313701959625 12 -32.055376084381713 13 -32.004001702907779
		 14 -30.330802811418963 15 -26.830027586948361 16 -22.626515719555968 17 -18.330833914690466
		 18 -14.2562256083185 19 -10.24215782200578 20 -6.1953951820306497 21 -2.2955395158233802
		 22 1.5699156136713224 23 5.0157293015505342 24 8.4021051875928663 25 10.793492940500181
		 26 12.445791998999644 27 12.795510658060765 28 13.135019454725478 29 13.936374968422735
		 30 14.867477511722361 31 15.170533496983396 32 13.976609169492871;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Shoulder_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 23.293899150812237 1 19.078289604891975
		 2 11.223381793573079 3 6.2498559265812972 4 1.4499780284113544 5 -3.8839395337760947
		 6 -9.0981615035439241 7 -14.163333130043869 8 -18.718994353990535 9 -22.227221562807589
		 10 -24.431979584223868 11 -25.036371510314833 12 -24.246389014817275 13 -22.931380855701804
		 14 -19.454919378915307 15 -13.68068987946436 16 -7.3142777658062217 17 -1.265995310585265
		 18 3.8654455346750991 19 8.0716273234533951 20 11.529731420659438 21 14.441512953288528
		 22 17.574601460391097 23 20.919949325075091 24 24.882952546652877 25 28.431571973614179
		 26 31.298814857615671 27 31.567196877472522 28 31.342927624636467 29 30.489880246117977
		 30 29.003733342128715 31 26.627588638705692 32 23.293899150812237;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Shoulder_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -76.242477265521771 1 -78.733307067926432
		 2 -78.732632478167389 3 -76.974123510721 4 -74.27635462574392 5 -70.657623349176589
		 6 -67.287575651026202 7 -64.652744651771982 8 -62.873902252659782 9 -62.343457625587583
		 10 -62.316163679861106 11 -62.182598546575989 12 -61.66716482533888 13 -62.016324015111401
		 14 -63.089266019321776 15 -65.152918249476798 16 -67.574446607786442 17 -70.084648134582366
		 18 -72.616843184388912 19 -74.638821134974862 20 -75.220647078264605 21 -74.88838383765804
		 22 -73.497648530614441 23 -71.384429550687997 24 -68.2000855710575 25 -64.827747962166441
		 26 -62.287642049032065 27 -60.860104446774436 28 -61.162580997771236 29 -63.695673636521455
		 30 -67.808455480133446 31 -72.338958089470907 32 -76.242477265521771;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Elbow_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 7.5305752754470721 1 5.9066718471516344
		 2 -0.076012575476093663 3 -1.2963497080439725 4 -4.2067502541853923 5 -8.3056353189341046
		 6 -12.101787727059181 7 -15.620579228121443 8 -18.86591674022608 9 -21.511873050380775
		 10 -23.606575808449634 11 -25.588034231195678 12 -27.735760370936806 13 -29.982620750294906
		 14 -30.620262492041423 15 -29.837959379090496 16 -28.791642092430774 17 -27.959156189268356
		 18 -26.954815446690432 19 -25.013107046878133 20 -21.659805249158879 21 -17.114816764273616
		 22 -12.17700421257771 23 -7.9031425411897489 24 -3.7727564464463303 25 -0.78085652092589464
		 26 1.1512190442804666 27 2.5098807159881469 28 3.8151622956055213 29 5.1695829351152796
		 30 6.452439274296867 31 7.3787462203284706 32 7.5305752754470721;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Elbow_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 17.910714933132873 1 15.054926767066263
		 2 13.047283498591861 3 12.380507882972699 4 13.274338637455354 5 16.147033481123668
		 6 19.785897395466478 7 23.619361327867892 8 27.173310366533055 9 30.030213261713758
		 10 32.187362229955795 11 33.99231898071794 12 35.789870324140402 13 37.578095187670932
		 14 37.405251995984095 15 35.486425094366517 16 32.7663865252566 17 30.21894238613223
		 18 28.395389804325696 19 28.052192091072527 20 29.118168423023064 21 31.194062354176914
		 22 32.875891521457639 23 33.601246861905047 24 33.682546591004346 25 32.914418074825562
		 26 31.553539946711503 27 30.680392407963922 28 29.47050999491573 29 27.26976634583615
		 30 24.344586504564006 31 21.164677009494834 32 17.910714933132873;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Elbow_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.6384562657317945 1 -4.8549770712102749
		 2 -3.1182558987831186 3 -2.6598816436443777 4 -1.9846297268249682 5 -1.2128127819287129
		 6 -0.50209156121525467 7 0.25431527348657712 8 1.0488203373714924 9 1.7222458171269359
		 10 2.3356733602218158 11 3.3475263470682162 12 5.1091489975626789 13 7.23477842741387
		 14 8.9660153417419668 15 10.192139526338195 16 10.578752582010647 17 10.323549727454152
		 18 9.4399604077846035 19 8.2234420378539674 20 6.7684773589199638 21 5.0360578404813845
		 22 3.0364927277034139 23 1.1789290031320119 24 -0.69223928438189608 25 -2.0302763663348653
		 26 -2.7729175084184527 27 -3.7343022933842618 28 -4.5778566829373686 29 -5.090040827850542
		 30 -5.4541179235099202 31 -5.6685882958367397 32 -5.6384562657317945;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Wrist_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -6.7755427098748111 1 -6.9882754234682096
		 2 -7.1753020696530836 3 -7.0883683887189397 4 -6.6138098657713327 5 -6.4798174570104168
		 6 -6.3247964617623094 7 -5.35024693610257 8 -2.9161576657588597 9 1.3706223427758017
		 10 7.1225283660546506 11 12.607439071522208 12 16.100675926561028 13 18.335578193006121
		 14 19.940735264055668 15 20.975631269419626 16 20.442710869691876 17 18.934261402068852
		 18 17.229551714392308 19 15.291557889330914 20 12.759411501645529 21 9.8072745226855353
		 22 7.1014483317021684 23 4.5804054941010071 24 1.4855751244763278 25 -0.96905973625154906
		 26 -3.0539391047627658 27 -5.1994616952620856 28 -5.8414762442884927 29 -5.7986310731419097
		 30 -5.9058874165870821 31 -6.5463448130936301 32 -6.7755427098748111;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Wrist_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.069644801370865 1 5.5834412475664736
		 2 6.2090054625318531 3 7.3192862861208647 4 9.0984773379348507 5 10.376175440437081
		 6 10.810016507245068 7 10.70449368861974 8 9.7869495450392723 9 8.9724827691132063
		 10 9.127285994696722 11 10.68135620743287 12 11.106531200711752 13 10.88921405080249
		 14 10.105904934864697 15 8.279272218680223 16 6.4684802769315439 17 5.1517988324781117
		 18 4.533783377498926 19 4.7990089329708274 20 5.3247857968131358 21 4.8648244969026742
		 22 4.2183803818336623 23 4.461991402738982 24 5.6426387573484309 25 7.2568197581688167
		 26 8.6040674204361096 27 9.1172500714573346 28 8.5461156020302109 29 7.0508518361892705
		 30 5.8150872864487386 31 5.1718809427931571 32 5.069644801370865;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Wrist_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 7.785734683310122 1 8.2587133350313593
		 2 6.3286405660582687 3 6.4516966243802782 4 3.9287060661686164 5 -1.8078912944428334
		 6 -7.4038611710406057 7 -10.538332881002875 8 -10.465397764053067 9 -6.7333962029960945
		 10 -0.35683833487005218 11 5.7486573130800327 12 8.8766095398867311 13 10.381096161445559
		 14 11.055079099462207 15 10.190528882405642 16 7.3212587260491437 17 4.7200246378520356
		 18 2.7116101442780294 19 0.8104359246770757 20 0.049908521588742094 21 0.27740243997069991
		 22 -0.028184456094667052 23 -1.0802937275244182 24 -2.062087077397901 25 -2.5960103205195595
		 26 -2.9304707352495143 27 -2.8574255261870474 28 -1.5333968592086122 29 1.4523836255329206
		 30 4.5466694935633063 31 6.5367270649678249 32 7.785734683310122;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Hip_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.89670411513780812 1 0.76603371387490904
		 2 0.49505959636542668 3 1.1095799785607585 4 1.7596239105361116 5 2.3994388180854642
		 6 2.9264428342616542 7 3.3876740169044002 8 3.8084464140000729 9 4.191437660587864
		 10 4.5731095315370442 11 4.9417197838306812 12 5.1748702893528131 13 5.2946828669282091
		 14 5.2057998519946356 15 5.3284560282561664 16 5.787789593105944 17 6.0512324458476439
		 18 5.9321339133227742 19 5.4166846276211205 20 4.753934447525249 21 4.0383472461464454
		 22 3.436990363810164 23 3.2082068316430741 24 3.100164920863465 25 2.7959185240044206
		 26 2.3330271319044189 27 1.9013121704170972 28 1.6692000023442652 29 1.449077729980832
		 30 1.1308801801481694 31 0.93205927475140493 32 0.89670411513780812;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Hip_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -10.24176410973836 1 -11.208278594255463
		 2 -12.058929729160173 3 -11.626311418684905 4 -10.430347096506537 5 -9.5988444251665825
		 6 -9.6778807594250456 7 -10.444306655605081 8 -11.284505921504058 9 -11.478467969417768
		 10 -11.072759759943311 11 -10.099591266222049 12 -7.9799252351179444 13 -4.4428202161883172
		 14 -1.1167563708308739 15 1.8308827309774369 16 3.902992244147415 17 4.116005256320217
		 18 3.3838308475918342 19 1.6779251157669672 20 0.093942103162846624 21 -0.94861638305866902
		 22 -1.1896811642662004 23 -0.59312670825887126 24 0.0030506239915024931 25 -0.5859851354685649
		 26 -2.0317156378521251 27 -3.6949649101221 28 -5.0332156265581256 29 -6.3654966148067942
		 30 -7.9137138515076542 31 -9.2849688966582296 32 -10.24176410973836;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Hip_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -31.7627977963669 1 -27.922979417222297
		 2 -20.028673100033835 3 -14.161088237689059 4 -8.1959091889917648 5 -3.0307587152548972
		 6 -0.10163743380886268 7 1.4511411653395212 8 2.8488936581707471 9 4.4346854798619066
		 10 5.7379690307220281 11 5.9813461888313393 12 3.7947807781490672 13 0.114805172965111
		 14 -4.411056187094677 15 -11.019924268835394 16 -18.864119118844584 17 -26.198537490277399
		 18 -31.821099777015633 19 -35.208272581275232 20 -35.894955395396067 21 -34.445106210870037
		 22 -31.515902013666796 23 -28.398672013798471 24 -29.549993715146638 25 -31.382400710199171
		 26 -32.216598745696942 27 -33.75878832627005 28 -35.681804730919467 29 -36.348789430226745
		 30 -36.121502024165387 31 -34.438235028621534 32 -31.7627977963669;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Knee_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 7.4344403748925636 1 6.1750227117451839
		 2 2.969763876027895 3 3.0933396781288844 4 3.6046643359249808 5 4.5556586201156355
		 6 5.5767047159166809 7 6.4379278154395196 8 6.9921642528913521 9 7.3158265802587747
		 10 7.6423027115169893 11 8.0252261339255533 12 8.4555787966499292 13 9.0103924319080111
		 14 8.9099047598751042 15 8.1627452037340529 16 6.9930083216995857 17 6.0602785590980561
		 18 6.0359037087352361 19 6.9704075744946676 20 8.3336678778767705 21 8.9656028371310477
		 22 8.5239892528305372 23 7.6561001231195664 24 6.9030845786899278 25 6.4481699301477624
		 26 6.2645554219089892 27 6.3874264853590885 28 6.9547558625919894 29 7.459443524187412
		 30 7.6115889509817736 31 7.6212682126585056 32 7.4344403748925636;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Knee_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 3.3749957989503381 1 4.5764546895950122
		 2 6.7469729444446145 3 7.0841879377203201 4 6.5085396888640021 5 5.6408756228302961
		 6 5.1822797134797858 7 5.3443990718069312 8 6.0716545642149065 9 7.0173722853163243
		 10 8.303936804563298 11 10.080412301507737 12 11.016945737258084 13 10.242387815450485
		 14 8.6568203888789803 15 7.9758085033810318 16 8.3978731432127471 17 8.5108172193881355
		 18 8.1685162965833289 19 7.2480907620242592 20 5.6499309694571389 21 3.415157403358783
		 22 1.2507596258087865 23 0.087128810114471891 24 -0.01132726011598725 25 0.30094420751798795
		 26 0.63391670361129038 27 1.1965187931424848 28 1.5364054247614236 29 1.8906487026743846
		 30 2.3932308356100802 31 2.8081065183144647 32 3.3749957989503381;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Knee_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 54.064542905593299 1 52.567056519097612
		 2 45.777361794771252 3 39.164214354295325 4 31.791748454077624 5 25.571010038082001
		 6 23.900135009152677 7 24.781737026275085 8 27.261577066698759 9 29.546380683503866
		 10 32.013434283814924 11 36.17745244990256 12 43.223263818948702 13 51.151107322404783
		 14 57.557704734196214 15 65.941611640480431 16 74.379985338652716 17 79.659198478469918
		 18 79.753062213952958 19 74.644891536025852 20 64.57343870038585 21 50.839055227417731
		 22 35.625356034368714 23 22.596990759928662 24 19.018099150898156 25 20.862658660854063
		 26 23.369207446375579 27 29.576543979206388 28 38.242860911633599 29 45.859532351676528
		 30 50.743380759366872 31 53.361723301452045 32 54.064542905593299;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Ankle_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 10.551275504068942 1 10.390793444450257
		 2 9.1566184737921095 3 8.7751611780453835 4 8.0666758725587968 5 8.1894656481227717
		 6 8.4767439927358392 7 8.6690253522911895 8 8.8288360601015263 9 9.121687375083221
		 10 9.7931164363548451 11 11.095319320950569 12 12.571681700662541 13 13.158820672027156
		 14 12.04045899835109 15 10.743940572546499 16 10.025026301872833 17 9.377605261401694
		 18 9.1337620575757263 19 9.3049972704230921 20 10.302195142854586 21 11.55389457947865
		 22 12.429841990875904 23 12.547683582985462 24 10.374323339688173 25 8.0360974634308224
		 26 6.8950116361569922 27 7.041838731939575 28 7.8067357999345903 29 8.8331133943462401
		 30 9.7759174530537774 31 10.388830707415115 32 10.551275504068942;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Ankle_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.8337913853783432 1 4.9565695653157862
		 2 2.975467328873993 3 2.4104262008922013 4 2.2216351379276866 5 4.5487321959923541
		 6 6.6848926696854436 7 6.4520275096989552 8 4.7675159127472417 9 2.6090830474000937
		 10 0.33798503973784572 11 -1.7936914088406837 12 -3.6695737271581876 13 -4.7403178617580455
		 14 -4.6870743406815789 15 -5.0048190839782887 16 -5.5771577804580534 17 -5.6790447559879782
		 18 -5.7058689779314484 19 -6.0176759690635411 20 -6.8054831201863415 21 -8.2504892739103148
		 22 -10.648042851149894 23 -13.550309526307386 24 -10.263523064960065 25 -3.6260852457894011
		 26 2.5688765755446341 27 4.4919283804554064 28 5.7245416512100711 29 6.3316283644667353
		 30 6.3252708187459961 31 6.1761180171153702 32 5.8337913853783432;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Ankle_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -21.25317365232009 1 -23.396749656022564
		 2 -24.526192958602909 3 -23.585794431966466 4 -22.10179142881281 5 -20.914366480856735
		 6 -20.314410537038878 7 -20.645249609936915 8 -21.875937582943205 9 -22.43864297340475
		 10 -22.114403705513137 11 -19.230775543507406 12 -12.575710884505719 13 -1.5667250286843695
		 14 11.013666734463577 15 18.748554644619357 16 18.482320921658211 17 15.578187552130768
		 18 11.787677098189619 19 8.6268368989649709 20 6.4135293039934629 21 4.443280814239599
		 22 2.5556671046451065 23 1.8933471876863406 24 1.7526920157729218 25 1.4586628502827705
		 26 2.0364182620108493 27 1.9300486644963577 28 -2.1850648088587294 29 -8.9153462659591316
		 30 -14.096681737047623 31 -18.099456678275736 32 -21.25317365232009;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Toes_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.9948705989436553 1 -5.9948031894290423
		 2 -5.9948777134092328 3 -5.9949797174617592 4 -6.0108429687927254 5 -6.0481034696626876
		 6 -6.5938227089005572 7 -7.6969811229105405 8 -8.9706943687486724 9 -11.097206822088399
		 10 -14.844691529417558 11 -20.3827265751443 12 -29.763747080307262 13 -43.619913536220338
		 14 -61.139551013423386 15 -61.017382917473157 16 -48.461320196407357 17 -32.73042483543697
		 18 -23.308765307267834 19 -19.537005854040807 20 -16.485573240662379 21 -10.395477259847988
		 22 -6.4177528501527625 23 -5.9897925178930969 24 -5.9946275114678373 25 -5.9947410593912638
		 26 -5.9948092349079127 27 -5.9948057060992648 28 -5.9948104785519067 29 -5.9948132332092214
		 30 -5.9948067372507525 31 -5.9948162771999725 32 -5.9948705989436553;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Hip_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.18182706202416493 1 1.3899349998516581
		 2 3.4805008426381616 3 2.7378650434120764 4 2.0966666346130416 5 1.9532208927205434
		 6 2.2008951204409062 7 3.0326496356976054 8 3.3429678381981707 9 2.8941481238020015
		 10 0.96398960077430318 11 -1.2794790385736536 12 -2.9882546887408719 13 -3.9382459977920918
		 14 -4.1601799409652189 15 -3.8416368723440169 16 -3.3670577559033816 17 -2.8971014844789535
		 18 -2.4387558611423832 19 -2.0834348631124242 20 -1.9203160228561889 21 -1.8614222270641996
		 22 -1.70488817194139 23 -1.4295937888702024 24 -1.0193456761722852 25 -0.62568116861817513
		 26 -0.40378110189733224 27 -0.40560176765127737 28 -0.55085730897833796 29 -0.71929220403952621
		 30 -0.73325870030510776 31 -0.45182162458378028 32 0.18182706202416493;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Hip_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 16.166636370574476 1 14.130137815825174
		 2 10.081818892165353 3 7.89986962330065 4 6.3457586839288851 5 5.9975000991717264
		 6 6.5664894760142483 7 7.2973157184075257 8 7.6281750121615124 9 7.6063538853491304
		 10 6.7159095943176821 11 5.3627297232219933 12 3.8424896414935605 13 2.3886049989035119
		 14 0.79333663697747026 15 -1.2744050463345507 16 -3.3500777602900067 17 -4.7353470453539792
		 18 -4.8415879049059543 19 -4.0758033902176294 20 -2.685728092544108 21 -1.0236376482526572
		 22 0.43183077490975841 23 1.2299934195750539 24 1.7824076758272702 25 3.2046499939314859
		 26 5.2237122955043738 27 7.9063469085588354 28 10.641852471413301 29 13.407218396069753
		 30 15.880608209558069 31 16.760533395258349 32 16.166636370574476;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Hip_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -9.0671463632632854 1 -14.761643376030548
		 2 -20.795009623994495 3 -24.435843292090048 4 -26.290057558953524 5 -26.832841615770381
		 6 -26.434321072488551 7 -27.104629889088766 8 -30.048925838880482 9 -32.853131431933839
		 10 -33.702734835088087 11 -33.486435379105529 12 -32.378500558454284 13 -30.752096896501676
		 14 -29.051044349018614 15 -26.674114683966035 16 -23.351158014087282 17 -19.042118918017831
		 18 -13.93387202893196 19 -8.4053999643190718 20 -3.1057503213176445 21 1.2665002218408004
		 22 4.4837228279425805 23 6.8036192615715345 24 9.3852533918526735 25 11.984385781587999
		 26 14.434533238734385 27 16.260121285721088 28 15.381482866348918 29 10.80745524022457
		 30 4.4380925150989272 31 -2.4046777357713482 32 -9.0671463632632854;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Knee_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.74221930079857423 1 0.93174664594647572
		 2 2.4681420224031418 3 2.454423416201843 4 2.5657910253591472 5 2.5662237059996142
		 6 2.5822979940519803 7 2.8420828595568826 8 2.8134672687710989 9 1.7088143061879062
		 10 -0.10203532787193105 11 -1.9076120801318304 12 -2.9407144239146064 13 -3.0596284717534168
		 14 -2.504027357912237 15 -1.7165581019609473 16 -1.2022498003944335 17 -0.94111563945585552
		 18 -0.9569224694692442 19 -1.2376986924986959 20 -1.5535531306350978 21 -1.6092224413402456
		 22 -1.291052427473252 23 -0.8513534078202053 24 -0.26971568525682393 25 0.49340764561386974
		 26 1.2526736300350969 27 1.9104852756131687 28 2.0207927603916875 29 1.9303207424425488
		 30 1.5323996577354317 31 1.0372400254109326 32 0.74221930079857423;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Knee_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.7316569403277392 1 -0.057052414107690352
		 2 0.67506523291553477 3 -0.18133669606515515 4 -1.167930286268047 5 -1.779041575948106
		 6 -1.7853060670637548 7 -1.2261075641636994 8 -0.17878878667906947 9 0.89464485477551559
		 10 1.3772909263274971 11 1.3825309493452764 12 0.79882229538739358 13 -0.24268295198580536
		 14 -1.052806305115064 15 -0.86767630100257276 16 -0.16172955857200094 17 0.4793504463618467
		 18 1.2045475750926227 19 2.3483953883006325 20 3.6340846957057611 21 4.3443435493768332
		 22 4.4094828098742944 23 4.1226156483279341 24 3.7003361035366287 25 2.8762390169291496
		 26 1.8491671617018179 27 1.2971911184311398 28 0.74127862874526973 29 -0.043432788980151953
		 30 -0.69680467430672011 31 -0.85335253373037012 32 -0.7316569403277392;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Knee_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 71.115588742614193 1 74.954567480651562
		 2 72.217528805573977 3 68.39903067203042 4 61.044794858151036 5 50.64854337205454
		 6 39.68728179856091 7 32.947272629374723 8 32.395014273535345 9 34.159973465826049
		 10 36.278821890363311 11 38.78028758737095 12 43.108339394522595 13 47.811218871246226
		 14 51.67393240063744 15 54.713994880344977 16 55.116489963574175 17 54.097093022587501
		 18 50.443329933224192 19 45.08021770996222 20 39.017931455505867 21 33.790496212751641
		 22 30.483433101895919 23 29.241495581091446 24 28.831411398555296 25 28.354772378551829
		 26 27.382468146627609 27 26.589687854093953 28 30.13564658344016 29 40.913638228292015
		 30 52.644574025476018 31 63.067754457057688 32 71.115588742614193;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Ankle_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 13.708954555272099 1 14.633399078256421
		 2 11.321313200161685 3 12.898709481683076 4 13.863291771814533 5 13.266225890937168
		 6 11.344362113682074 7 8.8158244117411986 8 6.1946233861751487 9 4.129398678498255
		 10 3.3525085721601844 11 3.3057043222003668 12 3.5010924589497701 13 4.1193975956441173
		 14 4.9001276241550995 15 5.4514319640123308 16 6.2069624298061665 17 7.2617811986475829
		 18 7.7661360846123308 19 7.6220562698870022 20 6.7873885558344469 21 5.5783469669217345
		 22 3.7375947445242512 23 1.6565582079321273 24 -0.5684585505641705 25 -2.5620694677318596
		 26 -5.001392079616533 27 -4.9793898221129549 28 -2.7988023408817604 29 1.0689901463216247
		 30 5.7628860741007273 31 10.36795429289459 32 13.708954555272099;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Ankle_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -11.073130544325165 1 -7.2224535663002687
		 2 -8.1668982183190799 3 -6.4890936966053054 4 -5.4706626404827139 5 -6.0234282340493088
		 6 -7.1613949842725653 7 -3.7830506377714914 8 -0.85836972426737024 9 -1.55974754751751
		 10 -2.6748931714456488 11 -3.124286732495098 12 -2.7407662666117618 13 -1.4903533809762788
		 14 -0.16885144691560253 15 0.61330106815463969 16 0.84280007212307673 17 1.1318045855874566
		 18 1.069045818261559 19 0.077777133507690971 20 -1.3956084566576854 21 -2.7021936477608386
		 22 -3.6180281129398013 23 -4.1338829139499547 24 -4.4667154102567359 25 -4.4552592776772508
		 26 -3.8237702249661751 27 -6.6788792354798776 28 -10.451450063978871 29 -12.191432715191644
		 30 -13.047295460075619 31 -13.271571027232554 32 -11.073130544325165;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Ankle_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 26.346796256770411 1 20.313023160183665
		 2 9.4138220607195073 3 3.2671148474654976 4 -1.0347645502815015 5 -4.371125118310391
		 6 -6.8841212571736436 7 -9.018735571689005 8 -9.3282285292044413 9 -8.0936418799587564
		 10 -6.4793435577290657 11 -5.1303466927363299 12 -8.5809681944041074 13 -14.58928205569377
		 14 -19.628828386732284 15 -24.328966455607169 16 -28.046864925734585 17 -31.092480818696107
		 18 -31.711528823823059 19 -30.661647561954453 20 -26.752766563003767 21 -21.997348498142408
		 22 -17.239330206101325 23 -13.334941443626709 24 -8.9023527093364034 25 -2.7171050889988599
		 26 6.1247145062420323 27 21.741875017661041 28 32.687037455715256 29 35.557829621604903
		 30 35.163923930725339 31 31.543647161483964 32 26.346796256770411;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Toes_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -8.4353856447523352 1 -17.720581322891029
		 2 -41.406365553403525 3 -33.141130590001239 4 -25.18496860266875 5 -13.581402167765456
		 6 -6.7446505962011596 7 -6.0019113323199891 8 -5.994302121464683 9 -5.9948806639694645
		 10 -5.9952710254297523 11 -5.9957349811597638 12 -5.9961786863258268 13 -5.9965712440178898
		 14 -5.9967328943979998 15 -5.9966353307375728 16 -5.9984827684235986 17 -6.0498537122361205
		 18 -6.8365779427045856 19 -9.1418120033068906 20 -12.864050281242154 21 -17.937189918501844
		 22 -24.051234989838196 23 -30.708491105109715 24 -39.360320222938569 25 -50.241936660408754
		 26 -64.463873844714954 27 -86.911517378114226 28 -91.473140924433551 29 -81.768936421943607
		 30 -35.86543300333549 31 -5.1336129477192838 32 -8.4353856447523352;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTL -n "walk_male:Root_M_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.26264586128107942 1 -0.29462124225124992
		 2 -0.31707909441368187 3 -0.33391203447746282 4 -0.34149763130035038 5 -0.34479175540786439
		 6 -0.34127393425102809 7 -0.33350803226202874 8 -0.31174144125945985 9 -0.28494705183456026
		 10 -0.23242919615477525 11 -0.17833483807848474 12 -0.10144243627287165 13 -0.025431320494029189
		 14 0.051672915370898159 15 0.12759301272283757 16 0.2400087426268378 17 0.26424480754291563
		 18 0.28808793735344534 19 0.29392885293798393 20 0.29773177632678877 21 0.28869209847207566
		 22 0.27758412983415565 23 0.25589684978141874 24 0.23235221325987304 25 0.18780480477100875
		 26 0.13939850757237657 27 0.063219092333094418 28 -0.024527365312033408 29 -0.10015483765916008
		 30 -0.17051313781921679 31 -0.22300693777058833 32 -0.26264586128107942;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTL -n "walk_male:Root_M_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 6.0510159518054092 1 6.0664978838212171
		 2 6.0945561470884355 3 6.1128712136291243 4 6.1191043307748201 5 6.1184192754201296
		 6 6.0979257524477397 7 6.0756289327256541 8 6.0447698861096768 9 6.0193569049628834
		 10 6.0147531102632339 11 6.0104819891749655 12 6.0346593717737429 13 6.0524572835197876
		 14 6.0698565958890534 15 6.0670525184482491 16 6.0153056623104586 17 6.0265308937774265
		 18 6.0375739304550855 19 6.0617372282186297 20 6.0843146165724953 21 6.0799240029074291
		 22 6.0704026817999006 23 6.0453518961297794 24 6.0157635994307697 25 6.0028436311531603
		 26 5.9928841966458277 27 6.0045422425796966 28 6.0219565408000699 29 6.0382746440933914
		 30 6.0444170530356915 31 6.047184985275198 32 6.0510159518054092;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTL -n "walk_male:Root_M_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.20128761020047786 1 0.17491807126246089
		 2 0.13924475100745787 3 0.099494693828119957 4 0.053450172932157217 5 0.007796657607382438
		 6 -0.037552310933990529 7 -0.075053938010133395 8 -0.08548914026181606 9 -0.09274378326176784
		 10 -0.067218256529894285 11 -0.043260689943979629 12 -0.0014363083951215083 13 0.035041212791363976
		 14 0.050116440959939723 15 0.055781373321870088 16 0 17 -0.0045594588019367633 18 -0.010896748721267743
		 19 -0.023766642997433501 20 -0.042468719651486256 21 -0.065804032026239204 22 -0.093559428237858636
		 23 -0.087798865195670442 24 -0.081079737635340821 25 -0.040148035499962882 26 0.0076368252878293852
		 27 0.078191940505030158 28 0.15907470483981789 29 0.20399481619056006 30 0.2269709627167297
		 31 0.22326572048571647 32 0.20128761020047786;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Root_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.182335781577045 1 4.5380585505113409
		 2 3.4528136630670208 3 2.4549514577601697 4 1.4768577903539801 5 0.60145352298475774
		 6 -0.13213228423260451 7 -0.86483002326847735 8 -1.4783389752897864 9 -2.1688962827122875
		 10 -3.1190177879520706 11 -4.0076491612519636 12 -4.5950735490673189 13 -5.1297697991815454
		 14 -5.0970825752064144 15 -5.1023289035783543 16 -4.0125505723634021 17 -3.6143307022963085
		 18 -3.2353335875300941 19 -2.6736895821038331 20 -2.1420165325600413 21 -1.3431954775113693
		 22 -0.58304452886277969 23 0.7025304192647801 24 2.0997103018886452 25 3.2607300400525219
		 26 4.3889605221920931 27 4.933712063513628 28 5.2561245847697018 29 5.4239122889526437
		 30 5.5081701561019738 31 5.4261033900276905 32 5.182335781577045;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Root_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.6798275826518276 1 -5.1885943177575307
		 2 -4.3117364779114 3 -3.6218970574566178 4 -3.094599873106362 5 -2.8561518662660506
		 6 -2.9592617951865097 7 -3.1739447038001258 8 -3.6765297194252957 9 -3.9940784686964412
		 10 -3.7930261980007738 11 -3.5274974191670534 12 -2.6841598736683991 13 -1.8588332191848307
		 14 -1.0478400983680609 15 -0.01063119331780636 16 0.86412584630350342 17 0.43861339630178559
		 18 0.026754992247879507 19 -0.85031790156427045 20 -1.6959696068738073 21 -2.1445108377401252
		 22 -2.4998796570070065 23 -2.4545883022789119 24 -2.3356355081014217 25 -2.5916149881983142
		 26 -2.9716636922908481 27 -3.617440936150297 28 -4.4465231660432707 29 -5.0439751185547577
		 30 -5.7003262568716702 31 -5.8316728332141565 32 -5.6798275826518276;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Root_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -1.3812497160830139 1 -1.4328622908150386
		 2 -1.3830023285335939 3 -1.2984985996552747 4 -1.1436731241294098 5 -0.94448588310321369
		 6 -0.6115865361483166 7 -0.27821290921896424 8 0.060330138791104659 9 0.38883955244927848
		 10 0.62520549347249654 11 0.84625376386148909 12 0.9252682507958877 13 0.99916376493181736
		 14 1.017391833219629 15 1.0190441982395451 16 1.0157509631961807 17 1.0184703713953227
		 18 1.0176990592132245 19 1.0017027312432214 20 0.96783928342506209 21 0.99808838311044668
		 22 1.0322368778358706 23 1.0378404956954845 24 1.0426209007930607 25 0.96291585938091495
		 26 0.857839039801091 27 0.4914099793448149 28 0.0094185421896305754 29 -0.43064264287710813
		 30 -0.88221862396727158 31 -1.1832366653002162 32 -1.3812497160830139;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Spine1_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -9.0590956739125641 1 -7.1899902073397985
		 2 -4.8986282108277326 3 -2.9321258131181058 4 -1.3043385152902713 5 0.081880814247661873
		 6 1.044788633699655 7 1.9600996894323881 8 2.5249046606696548 9 3.1307996274675318
		 10 3.7379518727310947 11 4.2956479881047462 12 4.4940337190770085 13 4.6815573466401768
		 14 3.965092865608042 15 3.3511872719159683 16 0.10820519145733996 17 -1.5801737670514431
		 18 -3.2330606593824274 19 -4.9092586981569779 20 -6.5495553410358545 21 -8.0242941041707248
		 22 -9.4018790780443506 23 -10.765969663103386 24 -12.176703662475264 25 -12.915308581021311
		 26 -13.534859292854104 27 -13.41464967206047 28 -13.086511788052476 29 -12.468172256257375
		 30 -11.741749676802202 31 -10.570320571500787 32 -9.0590956739125641;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Spine1_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 6.553542309446887 1 5.8846869489481044
		 2 4.9872046660236107 3 4.265430384542273 4 3.7347261074075329 5 3.47745694338637
		 6 3.5016008074763909 7 3.6453206560961036 8 4.1493790787592211 9 4.4484385975505285
		 10 4.0788968434659783 11 3.6847906628653351 12 2.8098285222742336 13 1.9689667473685231
		 14 1.3924268816046468 15 0.5815474654997288 16 -0.05882457052894717 17 1.024854967605511
		 18 2.0923302558951686 19 3.1893630050253869 20 4.2314192617266819 21 4.8235274846457923
		 22 5.3223447735133673 23 5.2391138232970631 24 5.0424071853818724 25 5.2727490304188755
		 26 5.6361987973604792 27 6.1468626391902639 28 6.8379292694263549 29 7.0481921601680924
		 30 7.2007888475169857 31 7.0661626444918992 32 6.553542309446887;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Spine1_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -8.8601102641377043 1 -8.2996589767513349
		 2 -7.8620552678947799 3 -7.5325119742444109 4 -7.3356701979616723 5 -7.2535275606993102
		 6 -7.33930741359619 7 -7.472239460819889 8 -7.7668935480345249 9 -8.0344241305865438
		 10 -8.2450054143278191 11 -8.4516448959128887 12 -8.5874779152939773 13 -8.7230872394693648
		 14 -8.7867040518872468 15 -8.8446811850297333 16 -8.4003392374443298 17 -8.4689435178379426
		 18 -8.5682119356626565 19 -8.6177955688396395 20 -8.6818024790251123 21 -8.8455110934774908
		 22 -9.0079056564428264 23 -9.3740725328877232 24 -9.7764977993373332 25 -10.137461089393375
		 26 -10.501679051452633 27 -10.66053866464917 28 -10.741322707185734 29 -10.5470240473375
		 30 -10.111632323393117 31 -9.5518497912521472 32 -8.8601102641377043;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Spine2_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 3.4878424999809057 1 2.7423573403775419
		 2 1.8054008792138949 3 0.98362057633942923 4 0.27893393416972478 5 -0.33718578474319194
		 6 -0.79588831818400074 7 -1.2487104559499689 8 -1.5799456584099629 9 -1.9268971484869546
		 10 -2.259971996653146 11 -2.5624374242628756 12 -2.6425006861764517 13 -2.716762347334186
		 14 -2.3648412662150058 15 -2.0320319396342552 16 -0.53505288654674821 17 0.085606262768111799
		 18 0.69484919988370464 19 1.3223229397154614 20 1.9469595557832169 21 2.5686159924090068
		 22 3.1579089727696297 23 3.8291152181545538 24 4.5417028599761622 25 4.9342431632351458
		 26 5.2745818450173916 27 5.2431250792315645 28 5.1050376729222835 29 4.8500602026622071
		 30 4.5387537312180566 31 4.0691326109101569 32 3.4878424999809057;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Spine2_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.9759798545379259 1 -2.4815177331153424
		 2 -1.9377580969059549 3 -1.4910801709539807 4 -1.1558388622167586 5 -0.93776018567475761
		 6 -0.90375113707992694 7 -0.89559672117965894 8 -1.0774419704797826 9 -1.1749359238238508
		 10 -1.0020950490305223 11 -0.82048274075037542 12 -0.44207646922245719 13 -0.092691570006632973
		 14 0.05483528393128996 15 0.20571921709603927 16 -0.15500094634565667 17 -0.7167977261921068
		 18 -1.2704489358760085 19 -1.7511052708375237 20 -2.2311276367336035 21 -2.5256853727024065
		 22 -2.7934271343562105 23 -2.8922124487712337 24 -2.9523369698916966 25 -3.1392768956496706
		 26 -3.3546964787677007 27 -3.5967817527891635 28 -3.8853869574932238 29 -3.8792464437183449
		 30 -3.7634029772998199 31 -3.4492939671605591 32 -2.9759798545379259;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Spine2_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 8.9081742837742333 1 8.75609047757162
		 2 8.6571688887656464 3 8.5769030838639893 4 8.5374354904007195 5 8.5284602547236812
		 6 8.6071596707480449 7 8.700688736755529 8 8.8617688562321302 9 9.0116571042968445
		 10 9.1243907195710285 11 9.2320344395026837 12 9.2884325049191521 13 9.3449260929478069
		 14 9.3685089187553068 15 9.3933450961091065 16 9.2175529676258314 17 9.2280410173550198
		 18 9.2323525181077599 19 9.1977022205168755 20 9.1507454290175172 21 9.1651144334183154
		 22 9.1787003035588821 23 9.2885826596050372 24 9.4229384665977722 25 9.5262562893551515
		 26 9.6321558713532465 27 9.6259863922090538 28 9.5966005772258161 29 9.4757964617630712
		 30 9.3013898169342468 31 9.1159546402125589 32 8.9081742837742333;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Chest_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.9099101357295942 1 -3.0899564750113071
		 2 -2.0773831840549377 3 -1.1952325848946765 4 -0.44821387173939575 5 0.19558312131004843
		 6 0.65234749478311849 7 1.0978092805195363 8 1.3954375513833777 9 1.7197301100145348
		 10 2.0730351721852869 11 2.3981622800271012 12 2.5373566727173524 13 2.6624711838030817
		 14 2.3422474403646745 15 2.0383478600592038 16 0.50331954482235486 17 -0.19945945712509744
		 18 -0.88986755912388504 19 -1.5857395253779925 20 -2.2782058817331943 21 -2.9399548350596283
		 22 -3.5655918585670672 23 -4.248802533634624 24 -4.9670577849189561 25 -5.3897346799240697
		 26 -5.7724248526001727 27 -5.7733804407838081 28 -5.6869545701385045 29 -5.4307638954269075
		 30 -5.0937272544113039 31 -4.5693703920028019 32 -3.9099101357295942;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Chest_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.3942391374860477 1 2.032182177502003
		 2 1.6427476681443456 3 1.3276007317186442 4 1.0976365111439519 5 0.98402842242902866
		 6 1.0110908541127408 7 1.0772882282486012 8 1.3103447990731212 9 1.4537959436224031
		 10 1.3470246662620555 11 1.2200371206710134 12 0.86248095414015524 13 0.53081147736732026
		 14 0.33049741158576307 15 0.13133309133987606 16 0.23869873859831675 17 0.69378982690749935
		 18 1.14236634720787 19 1.5167022019215683 20 1.8916694973737271 21 2.081593110777046
		 22 2.2563870065291836 23 2.2275721614762802 24 2.1669834463053319 25 2.2650361117634423
		 26 2.413407156742132 27 2.6530902338345572 28 2.9718205373093616 29 3.0084760278031526
		 30 2.963925354573171 31 2.7555218165309525 32 2.3942391374860477;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Chest_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -9.0802269952178261 1 -8.8706923376773581
		 2 -8.717789958315171 3 -8.6032010148706455 4 -8.5438003585011426 5 -8.5254948251920979
		 6 -8.5952410378168089 7 -8.6803807300955498 8 -8.8309044668189021 9 -8.9701183087868497
		 10 -9.0802421786216883 11 -9.1881413452357972 12 -9.2591507720252793 13 -9.3303553125266365
		 14 -9.3628820415134335 15 -9.3946715482852294 16 -9.2157807860993 17 -9.2298009036624276
		 18 -9.2500705745779879 19 -9.2387373997710451 20 -9.2298407943506735 21 -9.2743985349540115
		 22 -9.3232052418406841 23 -9.4687359825542181 24 -9.6336209748858774 25 -9.7683467555353936
		 26 -9.9117489531133174 27 -9.9227718988665252 28 -9.9086809744722277 29 -9.7888210329137593
		 30 -9.5822821169339818 31 -9.348744829396022 32 -9.0802269952178261;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Scapula_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.1817433459952025e-006 1 -2.1817433459952025e-006
		 2 -2.1817433459952025e-006 3 -2.1817433459952025e-006 4 -2.1817433459952025e-006
		 5 -2.1817433459952025e-006 6 -2.1817433459952025e-006 7 -2.1817433459952025e-006
		 8 -2.1817433459952025e-006 9 -2.1817433459952025e-006 10 -2.1817433459952025e-006
		 11 -2.1817433459952025e-006 12 -2.1817433459952025e-006 13 -2.1817433459952025e-006
		 14 -2.1817433459952025e-006 15 -2.1817433459952025e-006 16 -2.1817433459952025e-006
		 17 -2.1817433459952025e-006 18 -2.1817433459952025e-006 19 -2.1817433459952025e-006
		 20 -2.1817433459952025e-006 21 -2.1817433459952025e-006 22 -2.1817433459952025e-006
		 23 -2.1817433459952025e-006 24 -2.1817433459952025e-006 25 -2.1817433459952025e-006
		 26 -2.1817433459952025e-006 27 -2.1817433459952025e-006 28 -2.1817433459952025e-006
		 29 -2.1817433459952025e-006 30 -2.1817433459952025e-006 31 -2.1817433459952025e-006
		 32 -2.1817433459952025e-006;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Scapula_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.4203839476090244e-006 1 2.4203839476090244e-006
		 2 2.4203839476090244e-006 3 2.4203839476090244e-006 4 2.4203839476090244e-006 5 2.4203839476090244e-006
		 6 2.4203839476090244e-006 7 2.4203839476090244e-006 8 2.4203839476090244e-006 9 2.4203839476090244e-006
		 10 2.4203839476090244e-006 11 2.4203839476090244e-006 12 2.4203839476090244e-006
		 13 2.4203839476090244e-006 14 2.4203839476090244e-006 15 2.4203839476090244e-006
		 16 2.4203839476090244e-006 17 2.4203839476090244e-006 18 2.4203839476090244e-006
		 19 2.4203839476090244e-006 20 2.4203839476090244e-006 21 2.4203839476090244e-006
		 22 2.4203839476090244e-006 23 2.4203839476090244e-006 24 2.4203839476090244e-006
		 25 2.4203839476090244e-006 26 2.4203839476090244e-006 27 2.4203839476090244e-006
		 28 2.4203839476090244e-006 29 2.4203839476090244e-006 30 2.4203839476090244e-006
		 31 2.4203839476090244e-006 32 2.4203839476090244e-006;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Scapula_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -8.1415927139264375e-006 1 -8.1415927139264375e-006
		 2 -8.1415927139264375e-006 3 -8.1415927139264375e-006 4 -8.1415927139264375e-006
		 5 -8.1415927139264375e-006 6 -8.1415927139264375e-006 7 -8.1415927139264375e-006
		 8 -8.1415927139264375e-006 9 -8.1415927139264375e-006 10 -8.1415927139264375e-006
		 11 -8.1415927139264375e-006 12 -8.1415927139264375e-006 13 -8.1415927139264375e-006
		 14 -8.1415927139264375e-006 15 -8.1415927139264375e-006 16 -8.1415927139264375e-006
		 17 -8.1415927139264375e-006 18 -8.1415927139264375e-006 19 -8.1415927139264375e-006
		 20 -8.1415927139264375e-006 21 -8.1415927139264375e-006 22 -8.1415927139264375e-006
		 23 -8.1415927139264375e-006 24 -8.1415927139264375e-006 25 -8.1415927139264375e-006
		 26 -8.1415927139264375e-006 27 -8.1415927139264375e-006 28 -8.1415927139264375e-006
		 29 -8.1415927139264375e-006 30 -8.1415927139264375e-006 31 -8.1415927139264375e-006
		 32 -8.1415927139264375e-006;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Shoulder_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -15.220668377901449 1 -12.61799770082461
		 2 -9.9342948865032614 3 -7.4119572030122196 4 -5.0296274120966133 5 -2.8646939280634296
		 6 -0.93877151239054413 7 0.68943721727001317 8 1.2192622830428355 9 1.625380769689394
		 10 0.98219230483374376 11 0.27147887413296706 12 -1.3994289215991178 13 -3.0589050141474279
		 14 -5.1433523248529864 15 -7.2310170042414059 16 -11.399919456397248 17 -13.411788301747823
		 18 -15.373756343877542 19 -17.224980039852184 20 -19.089333499327033 21 -20.544862025397546
		 22 -21.932453642797345 23 -22.82242353255613 24 -23.672828112778742 25 -24.042481190274639
		 26 -24.299906809508634 27 -23.928051172230735 28 -23.279067109143167 29 -21.852782317556084
		 30 -20.005624415598895 31 -17.771814226989488 32 -15.220668377901449;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Shoulder_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -4.825493520910725 1 -2.0479068645015861
		 2 0.74656350044658359 3 3.3109904547979623 4 5.5628508320059211 5 7.5897109782864334
		 6 9.2583373428730393 7 10.656463626196437 8 10.981201551798071 9 11.240676782093372
		 10 10.638229127204552 11 9.9906390677864696 12 8.5413167003751447 13 7.1215099526363908
		 14 5.3697613881690494 15 3.6289413900445799 16 -0.51524762293384541 17 -2.908741665877792
		 18 -5.2452448887098413 19 -7.5758771517004284 20 -9.9025340936385344 21 -11.668974864698788
		 22 -13.317575776508614 23 -14.300869647941505 24 -15.214193485671178 25 -15.519638354218118
		 26 -15.675030217365626 27 -15.08062930995491 28 -14.049972001727358 29 -12.304054861788837
		 30 -10.106748649406558 31 -7.6093694833223733 32 -4.825493520910725;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Shoulder_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -74.960883232328655 1 -74.168436547216459
		 2 -73.275693837213666 3 -72.535591103650106 4 -71.881499076202303 5 -71.383639077876595
		 6 -71.146422998359924 7 -71.022284286224703 8 -71.371447620336099 9 -71.666050924818649
		 10 -71.915822675051629 11 -72.204224761230492 12 -72.735751141437618 13 -73.249480570133358
		 14 -73.717809361200466 15 -74.210630917313807 16 -74.448825679395043 17 -74.427554899279244
		 18 -74.501092812164174 19 -74.696689020117148 20 -74.976429660511457 21 -75.360044534336481
		 22 -75.780486310456908 23 -76.247172291760378 24 -76.749342786811084 25 -77.076321501644415
		 26 -77.386624100897677 27 -77.367910457641713 28 -77.295493540898406 29 -76.910627929679976
		 30 -76.386703974250878 31 -75.715360263256684 32 -74.960883232328655;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Elbow_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -10.690514190623892 1 -9.0347563569020402
		 2 -7.0393819365782271 3 -4.8964507604802048 4 -2.4411796342893508 5 -0.13787817195769803
		 6 2.1201696348974584 7 4.0102136711871381 8 4.6067054332450867 9 5.0638086013606403
		 10 4.3594506807417162 11 3.5583511298585933 12 1.5445539178977186 13 -0.44761240209109238
		 14 -3.1573028559997862 15 -5.8118660796118089 16 -9.7980592923033409 17 -10.799548841099101
		 18 -11.762174528279983 19 -12.099981709495097 20 -12.395548135738869 21 -12.559743259228467
		 22 -12.710117930810011 23 -12.724208278352778 24 -12.725247582550097 25 -12.771985646778955
		 26 -12.828524407865222 27 -13.066435612804174 28 -13.419829739976919 29 -13.300897558800845
		 30 -12.927531161685666 31 -12.016024463753819 32 -10.690514190623892;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Elbow_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 13.448552301019047 1 14.765168761159524
		 2 16.023103638726724 3 17.504481622411273 4 19.301351483286822 5 21.194312639064275
		 6 23.471779369260663 7 25.470487752104869 8 26.539589664281365 9 27.312879739602607
		 10 26.643078994418381 11 25.819211593903621 12 23.390353564251559 13 21.05584950046191
		 14 18.471686632136223 15 15.919870197814332 16 12.754827038785191 17 12.840751950522383
		 18 12.90410596225559 19 13.303303945527981 20 13.757627256700223 21 13.492769531899173
		 22 13.184925448728828 23 12.279270396264179 24 11.238693962123882 25 10.530627494289325
		 26 9.8933119784245509 27 9.591665718648283 28 9.4089558877104604 29 9.8670344592812533
		 30 10.902764903872235 31 12.080801849684509 32 13.448552301019047;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Elbow_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.89808346952532681 1 0.77540126293119349
		 2 0.88006980942671165 3 1.017598323545635 4 1.2521543104832746 5 1.4597654051354003
		 6 1.6909915926634558 7 1.9172617125556015 8 2.2226816737805435 9 2.428281852725569
		 10 2.3535846052814247 11 2.2801566438370484 12 2.1577278165618874 13 2.0174238646490004
		 14 2.0986369797030511 15 2.073327768034924 16 2.81812706403952 17 3.3439584756323146
		 18 3.8897388685962508 19 3.94199086018221 20 3.9741916936690513 21 4.1375630465834892
		 22 4.3125356909746317 23 4.4640061498841312 24 4.6308862364373704 25 4.5584030797111366
		 26 4.4557005762367252 27 4.0048698973319148 28 3.4319586134349973 29 2.7320668205500462
		 30 1.8962330669699463 31 1.3304027786999735 32 0.89808346952532681;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Wrist_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 3.6253985879105137 1 4.7371814122525437
		 2 5.7909933775357603 3 6.7136067401688031 4 7.4575423284538314 5 8.1082028309761878
		 6 8.6089918802525087 7 8.935783091565817 8 8.9410057270783128 9 8.9428100822642502
		 10 8.8742080849590241 11 8.7672215700988847 12 8.2545605615872972 13 7.7197843878951886
		 14 6.4913331958468818 15 5.2791116963354883 16 2.1465786626511525 17 1.1078271688596231
		 18 0.072658897018645002 19 -0.34793080011455663 20 -0.73269401982964288 21 -0.95785643992333369
		 22 -1.1685840900368245 23 -1.1984191900232088 24 -1.2150969870090476 25 -1.1742845708707321
		 26 -1.1267574911426246 27 -0.82336523369129866 28 -0.4374236541155993 29 0.34379858192377211
		 30 1.3460746211693331 31 2.4384913882059496 32 3.6253985879105137;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Wrist_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.3619288490620962 1 1.9543698898392239
		 2 2.511942482242103 3 3.1752616437447849 4 3.9770286495206055 5 4.7806895940382841
		 6 5.7091014651115897 7 6.3389960193808088 8 6.3879864812410512 9 6.3946316592928634
		 10 5.8092354003234847 11 5.2354163172303814 12 4.2660114773265452 13 3.322926796023566
		 14 2.3762394392328274 15 1.4427874893195418 16 0.14268729276315212 17 0.045873567180510402
		 18 -0.047638756803842594 19 0.009054125888760034 20 0.076186102576498674 21 0.18395405346440794
		 22 0.30939213886826067 23 0.090109868977001753 24 -0.22274268096460667 25 -0.4307441705206147
		 26 -0.61787454301595646 27 -0.7114563381607929 28 -0.76894470272526028 29 -0.48396642565819892
		 30 0.18247222015998529 31 0.77225838073088382 32 1.3619288490620962;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Wrist_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -4.424750933349137 1 -3.4964119977804398
		 2 -2.9893999774874174 3 -2.7584088899211463 4 -2.7711448013024604 5 -2.7565735463034842
		 6 -2.558861055711164 7 -2.4573681226196271 8 -2.4572093492812459 9 -2.4779563952372885
		 10 -2.7649692242696795 11 -2.9913160971790234 12 -3.0302605354070002 13 -3.1126374937788466
		 14 -3.4764516060353663 15 -3.8647603203423389 16 -5.7327625545621634 17 -5.951108847674373
		 18 -6.1619846808009626 19 -6.6210356752099546 20 -7.0857150733405367 21 -7.6920678196073284
		 22 -8.306018257309141 23 -8.7241327164335374 24 -9.1210601563997624 25 -9.3586805647653613
		 26 -9.572243950823232 27 -9.4351511344763406 28 -9.2000313080204545 29 -8.3252487958543444
		 30 -7.0821871689737277 31 -5.8053080832632054 32 -4.424750933349137;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Neck_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.34001495548069982 1 0.19809873164513081
		 2 0.096996675747820588 3 0.015728495360574402 4 -0.030161744249131116 5 -0.07147950010218744
		 6 -0.10063733317738338 7 -0.12864394866589132 8 -0.14710387647975498 9 -0.15832634605731105
		 10 -0.12504252308839209 11 -0.095806488898575404 12 -0.067973741884319996 13 -0.037455157169287302
		 14 0.025712153711968798 15 0.088474089633317543 16 0.31932056984581508 17 0.48320275582435562
		 18 0.64668516115910701 19 0.7437063386260846 20 0.83675161786091845 21 0.91542834067120493
		 22 0.99055125571323355 23 1.0394635884310814 24 1.0898237038435468 25 1.075209491927571
		 26 1.0477906915316619 27 0.99602335959482469 28 0.94032828236747945 29 0.82881874281197154
		 30 0.68598891172047838 31 0.52410560302507547 32 0.34001495548069982;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Neck_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.017965315060089564 1 0.032097840364294215
		 2 0.026370295375256324 3 0.038625891987425991 4 0.096727564717740869 5 0.15501195345068117
		 6 0.23103853786205519 7 0.30304456454950185 8 0.35969398162733945 9 0.42129831151524
		 10 0.49455818638691235 11 0.54948717564547023 12 0.5049940220630178 13 0.45947258713905786
		 14 0.33800809338992371 15 0.22133941867829834 16 0.14651062336536619 17 -0.1237196310737778
		 18 -0.39318277301642823 19 -0.48758816403588384 20 -0.57061046201536414 21 -0.64320416457218332
		 22 -0.71188909285943047 23 -0.7708732831294729 24 -0.83528236901614983 25 -0.84492037956694488
		 26 -0.84680768008210883 27 -0.7886467794104427 28 -0.69136749023342581 29 -0.53219786588464113
		 30 -0.32777194739954579 31 -0.16619637871078288 32 -0.017965315060089564;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Neck_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 22.975484635294489 1 23.015695292676316
		 2 23.083282603729046 3 23.101937022686613 4 23.067980405268301 5 23.022475546643712
		 6 22.943320249212341 7 22.880664135585977 8 22.864181811823777 9 22.839548118964579
		 10 22.801129251855667 11 22.76360301563906 12 22.726085945102671 13 22.685735830803811
		 14 22.610410008184772 15 22.536528383587697 16 22.400155719228017 17 22.591992119195631
		 18 22.779664835972937 19 23.004254266926203 20 23.243370760449125 21 23.277334564211088
		 22 23.291878822728773 23 23.223705488891763 24 23.13043164240878 25 23.045828833077231
		 26 22.953186071826416 27 22.937428046734876 28 22.937016716641278 29 22.93852862885328
		 30 22.940994586496437 31 22.953936382313369 32 22.975484635294489;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Head_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.23123998058325004 1 -0.14037756669054907
		 2 -0.45146681100011876 3 -0.67864382568233372 4 -0.77550810185608965 5 -0.85631423867109735
		 6 -0.88875688748979265 7 -0.92076418643164726 8 -0.93310994720817553 9 -0.93135509449945553
		 10 -0.77518018012479373 11 -0.6485792928220403 12 -0.5993988394395976 13 -0.54174885629776537
		 14 -0.44147076923385037 15 -0.3387002431812654 16 0.28987308688285018 17 0.58465560997957033
		 18 0.87715246153254034 19 1.0960786916347054 20 1.3107269942169344 21 1.4911456286699114
		 22 1.6639247984480043 23 1.7669061720931731 24 1.8699424510798954 25 1.8215141209833228
		 26 1.734475338883922 27 1.6309311269015536 28 1.5327353219670263 29 1.3162915190650306
		 30 1.0394666169042284 31 0.67585658465078158 32 0.23123998058325004;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Head_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.26963288167775806 1 -0.15441120576207665
		 2 -0.13011053733881472 3 -0.082084559318824288 4 -0.014811187757289663 5 0.054249816354783834
		 6 0.13510449304360589 7 0.21167402269823038 8 0.27004842687201513 9 0.33017562785896548
		 10 0.38602941581533923 11 0.42780469398096937 12 0.37516219744733215 13 0.32172736585939504
		 14 0.18542673810941618 15 0.053574535714930482 16 -0.10731944358513648 17 -0.41961187118076154
		 18 -0.73024032875078937 19 -0.85237855524598882 20 -0.96168438769696141 21 -1.0582687622247591
		 22 -1.1501323241334778 23 -1.2244472112700251 24 -1.3058875951167666 25 -1.3089528136045057
		 26 -1.3031573163429637 27 -1.2281890944427141 28 -1.1173317723334113 29 -0.92721466825865928
		 30 -0.68322053232183 31 -0.47122201169294625 32 -0.26963288167775806;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Head_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -12.726255382060094 1 -12.687616070702344
		 2 -12.620847144616707 3 -12.602604479673012 4 -12.637052263880916 5 -12.682420428012668
		 6 -12.760430127587377 7 -12.822283501355253 8 -12.838472608484262 9 -12.862939214824172
		 10 -12.901960609801929 11 -12.93998050721604 12 -12.97746152754846 13 -13.017755192593434
		 14 -13.092864512993074 15 -13.166421101094365 16 -13.301837693463211 17 -13.107340295672019
		 18 -12.916188115653823 19 -12.689347683298031 20 -12.448246447779653 21 -12.411319468411211
		 22 -12.394150141193794 23 -12.460865043403103 24 -12.552169117675612 25 -12.637100254314118
		 26 -12.729867133847472 27 -12.74869543833926 28 -12.750962513405849 29 -12.752677915342478
		 30 -12.753610971298482 31 -12.745661423754662 32 -12.726255382060094;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Scapula_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.1307251692906871e-005 1 -2.1307251692906871e-005
		 2 -2.1307251692906871e-005 3 -2.1307251692906871e-005 4 -2.1307251692906871e-005
		 5 -2.1307251692906871e-005 6 -2.1307251692906871e-005 7 -2.1307251692906871e-005
		 8 -2.1307251692906871e-005 9 -2.1307251692906871e-005 10 -2.1307251692906871e-005
		 11 -2.1307251692906871e-005 12 -2.1307251692906871e-005 13 -2.1307251692906871e-005
		 14 -2.1307251692906871e-005 15 -2.1307251692906871e-005 16 -2.1307251692906871e-005
		 17 -2.1307251692906871e-005 18 -2.1307251692906871e-005 19 -2.1307251692906871e-005
		 20 -2.1307251692906871e-005 21 -2.1307251692906871e-005 22 -2.1307251692906871e-005
		 23 -2.1307251692906871e-005 24 -2.1307251692906871e-005 25 -2.1307251692906871e-005
		 26 -2.1307251692906871e-005 27 -2.1307251692906871e-005 28 -2.1307251692906871e-005
		 29 -2.1307251692906871e-005 30 -2.1307251692906871e-005 31 -2.1307251692906871e-005
		 32 -2.1307251692906871e-005;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Scapula_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.0005552369177469e-005 1 1.0005552369177469e-005
		 2 1.0005552369177469e-005 3 1.0005552369177469e-005 4 1.0005552369177469e-005 5 1.0005552369177469e-005
		 6 1.0005552369177469e-005 7 1.0005552369177469e-005 8 1.0005552369177469e-005 9 1.0005552369177469e-005
		 10 1.0005552369177469e-005 11 1.0005552369177469e-005 12 1.0005552369177469e-005
		 13 1.0005552369177469e-005 14 1.0005552369177469e-005 15 1.0005552369177469e-005
		 16 1.0005552369177469e-005 17 1.0005552369177469e-005 18 1.0005552369177469e-005
		 19 1.0005552369177469e-005 20 1.0005552369177469e-005 21 1.0005552369177469e-005
		 22 1.0005552369177469e-005 23 1.0005552369177469e-005 24 1.0005552369177469e-005
		 25 1.0005552369177469e-005 26 1.0005552369177469e-005 27 1.0005552369177469e-005
		 28 1.0005552369177469e-005 29 1.0005552369177469e-005 30 1.0005552369177469e-005
		 31 1.0005552369177469e-005 32 1.0005552369177469e-005;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Scapula_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.7472791986738114e-005 1 -2.7472791986738114e-005
		 2 -2.7472791986738114e-005 3 -2.7472791986738114e-005 4 -2.7472791986738114e-005
		 5 -2.7472791986738114e-005 6 -2.7472791986738114e-005 7 -2.7472791986738114e-005
		 8 -2.7472791986738114e-005 9 -2.7472791986738114e-005 10 -2.7472791986738114e-005
		 11 -2.7472791986738114e-005 12 -2.7472791986738114e-005 13 -2.7472791986738114e-005
		 14 -2.7472791986738114e-005 15 -2.7472791986738114e-005 16 -2.7472791986738114e-005
		 17 -2.7472791986738114e-005 18 -2.7472791986738114e-005 19 -2.7472791986738114e-005
		 20 -2.7472791986738114e-005 21 -2.7472791986738114e-005 22 -2.7472791986738114e-005
		 23 -2.7472791986738114e-005 24 -2.7472791986738114e-005 25 -2.7472791986738114e-005
		 26 -2.7472791986738114e-005 27 -2.7472791986738114e-005 28 -2.7472791986738114e-005
		 29 -2.7472791986738114e-005 30 -2.7472791986738114e-005 31 -2.7472791986738114e-005
		 32 -2.7472791986738114e-005;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Shoulder_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -12.822313679054021 1 -14.765190486189029
		 2 -16.648339090092588 3 -18.34674633442599 4 -19.81339147802349 5 -21.149540584151424
		 6 -22.309290169582145 7 -23.337030381344501 8 -23.838017265969242 9 -24.163838604260793
		 10 -23.305612142315553 11 -22.448956830897771 12 -21.040234583777817 13 -19.603531514487603
		 14 -17.506908339237601 15 -15.413521624278436 16 -9.3038466854655759 17 -8.3793972868433357
		 18 -7.4291723129186602 19 -6.2435354744143421 20 -5.0528048516411657 21 -3.9649283824980159
		 22 -2.9198772929856864 23 -2.3685511282245164 24 -1.8417479882861387 25 -2.052454388871745
		 26 -2.3915959048359374 27 -3.5097284009664329 28 -4.9290418818940038 29 -6.7433593923749395
		 30 -8.8011212982820179 31 -10.821606961154547 32 -12.822313679054021;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Shoulder_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -1.5638706309655133 1 -3.7392750643108896
		 2 -6.0041414948011935 3 -8.0816762304911904 4 -9.9251653390360826 5 -11.600227643528289
		 6 -13.007426921958119 7 -14.264344105000074 8 -14.848693910951285 9 -15.237746671123302
		 10 -14.280193048251716 11 -13.319526341827968 12 -11.578658381504143 13 -9.8347671282867459
		 14 -7.2716985934723892 15 -4.7306024003594098 16 2.1304482366913584 17 3.6221040527745649
		 18 5.1208830427456489 19 6.2504308066629504 20 7.3672970719486921 21 8.0886954663689554
		 22 8.7450007458468573 23 9.0323947949442616 24 9.2820987802952235 25 9.0178852689602849
		 26 8.6440824059616972 27 7.5260597095835431 28 6.1482723661286185 29 4.4496138854457437
		 30 2.5443254690381725 31 0.53744949949578391 32 -1.5638706309655133;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Shoulder_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -78.90003401695617 1 -78.311288448204962
		 2 -77.638123598690484 3 -77.026643800482333 4 -76.415987476330443 5 -75.885832495283964
		 6 -75.409884434654074 7 -74.996355265211378 8 -74.756315419820069 9 -74.633670108972396
		 10 -75.387261795344656 11 -76.02864420781988 12 -76.578550443410805 13 -77.138815571186655
		 14 -77.32861724291898 15 -77.626698992711169 16 -77.428976966856979 17 -77.589836267739088
		 18 -77.808607348148996 19 -77.590646505128632 20 -77.356431380690665 21 -77.017549799620198
		 22 -76.612917560415653 23 -76.637951131935878 24 -76.684380006507908 25 -77.183706638549069
		 26 -77.840108261079322 27 -78.692203818264005 28 -79.753491348969163 29 -79.89344498185703
		 30 -79.786401227167758 31 -79.425426893027748 32 -78.90003401695617;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Elbow_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -12.007314233335805 1 -12.581393201023113
		 2 -12.933932963644445 3 -13.256307758916142 4 -13.505720724412805 5 -13.775281002592994
		 6 -14.117766071116099 7 -14.41798507795148 8 -14.592575463289561 9 -14.664828847649797
		 10 -13.811146987166543 11 -13.088097076754554 12 -12.661719001675845 13 -12.224216772269251
		 14 -12.019398695147901 15 -11.779615093918144 16 -10.164826825218377 17 -11.162789122342367
		 18 -12.143723792277953 19 -11.527876179688441 20 -10.895659394923049 21 -9.693656141465576
		 22 -8.4878176087479122 23 -7.7321269969573683 24 -6.9581296450743828 25 -7.0005005037017645
		 26 -7.1550772629448911 27 -7.6601491007767555 28 -8.329926954497191 29 -9.243234759788459
		 30 -10.333038370128847 31 -11.237821344558775 32 -12.007314233335805;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Elbow_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 12.405280820912893 1 12.025648902837858
		 2 12.0814905980275 3 12.064103862850859 4 11.938686867953789 5 11.592427969849654
		 6 10.630550850989563 7 9.7246672102191916 8 8.8672890256493666 9 7.9744368268613668
		 10 7.0290226559966724 11 6.1038595870403114 12 5.2978355244000088 13 4.5343103768874657
		 14 4.3859083012764435 15 4.215536633110835 16 4.5092144967487915 17 6.3062231058299218
		 18 8.0588219729678183 19 10.405212674016504 20 12.755839880372822 21 15.56687612792037
		 22 18.397781919960966 23 20.195480186030505 24 22.042307881074127 25 22.174366946090231
		 26 22.11278705753471 27 21.076075541086531 28 19.41740581709557 29 17.41223115710951
		 30 15.056090498253909 31 13.494836957081779 32 12.405280820912893;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Elbow_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.61948372524648598 1 -0.70727403995033722
		 2 -0.57804383952169169 3 -0.54980572228538327 4 -0.62025945921155412 5 -0.78947794967727858
		 6 -1.1869280324759048 7 -1.5702898312072804 8 -1.9611521882942271 9 -2.208761868654709
		 10 -1.8594994370362714 11 -1.5412596692718412 12 -1.1717639448703407 13 -0.79966990260116644
		 14 -0.37831649634744885 15 0.051874839873522025 16 1.9055333482991987 17 2.0774145400856274
		 18 2.2383785188696534 19 3.2792706176898196 20 4.3884011004238968 21 5.2844332516292685
		 22 6.2482314768728182 23 6.2569493449380218 24 6.2109283302694651 25 5.6266233051796002
		 26 4.8562376881174671 27 3.6688552558249539 28 2.3012472756889681 29 1.238788408313259
		 30 0.29199207892910228 31 -0.29231135457397572 32 -0.61948372524648598;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Wrist_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.94100768899813581 1 0.68934802545035079
		 2 0.391485437412529 3 0.16793425419806665 4 0.018666435547067851 5 -0.048518155928619952
		 6 -0.013549747221467729 7 0.048545831355903825 8 0.19968001865577412 9 0.34152020029384078
		 10 0.46268534942404371 11 0.5831588896490657 12 0.68065154333767908 13 0.78056466136806812
		 14 0.89101071201057769 15 0.99893552856158685 16 1.0997592405935281 17 1.0976123317026554
		 18 1.098182392009539 19 1.1193520993228081 20 1.1418692265398533 21 0.92182907268289205
		 22 0.64440276027976007 23 0.5470823780647962 24 0.47229771068996546 25 0.57979481885031414
		 26 0.74854519151364962 27 0.97784753955848658 28 1.2709183752049855 29 1.312521909750449
		 30 1.2844137531152249 31 1.1564583558652362 32 0.94100768899813581;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Wrist_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.7671583592644651 1 1.8707963109081833
		 2 2.2910203393943198 3 2.6347853010556261 4 2.9605049633382059 5 3.1063526868128797
		 6 2.9975982686061466 7 2.8356973451617669 8 2.4817689492893211 9 2.1879402744728531
		 10 2.1015251905952983 11 2.004453082659694 12 1.9394689737910134 13 1.8841598741131083
		 14 2.0176944441499352 15 2.1459769700459743 16 2.8097841979449516 17 2.7032929747212679
		 18 2.5927223858839303 19 2.6132136274804401 20 2.6409654112608267 21 2.6225981495609538
		 22 2.6043602491652256 23 2.4561238272767798 24 2.2681671035369146 25 2.1982906948354408
		 26 2.1634384277776531 27 2.0967223556911514 28 2.0191704553114715 29 1.9561254425569292
		 30 1.90074191189716 31 1.8381532806723551 32 1.7671583592644651;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Wrist_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.7312749384253745 1 -2.2612524737453685
		 2 -4.8048975134939571 3 -6.9577042149724218 4 -8.9019967551780983 5 -9.8364169127772314
		 6 -9.5644841605136488 7 -9.3219091619538403 8 -9.0702919124161827 9 -8.7957083011603956
		 10 -8.4403774454070497 11 -8.1270353136407287 12 -8.0705475837999696 13 -7.9700627852246564
		 14 -7.4536088927744881 15 -6.9347617312199628 16 -3.5404820264781334 17 -2.1409172456499128
		 18 -0.74798721816607627 19 -0.13532211198660887 20 0.44131166222434065 21 0.6001923845525714
		 22 0.70477997094641642 23 0.67657956991379131 24 0.63119319667122864 25 0.5784422643058087
		 26 0.51794210497175486 27 0.61451774885043708 28 0.83057328661022645 29 0.71235172876748709
		 30 0.39215565134685082 31 -0.12967575312114099 32 -0.7312749384253745;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Hip_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.56837353660915246 1 -0.25362192558158719
		 2 0.13141927561821268 3 0.43735823208895902 4 0.58060364202636239 5 0.72665469461024956
		 6 0.9297662237661164 7 1.1536290662823665 8 1.4166039769593022 9 1.6406327049674143
		 10 1.6725944728581494 11 1.6584960503842867 12 1.135595635139915 13 0.77913386060500189
		 14 0.57990987572706598 15 0.62124719481338531 16 1.6251156035544996 17 1.898279204168275
		 18 2.1058623055739538 19 1.5798388941015589 20 0.96914925279283881 21 0.30884826455444664
		 22 -0.2817151675043974 23 -0.4200483565595583 24 -0.49015443978723655 25 -0.46449014088939172
		 26 -0.41064979573790489 27 -0.56428265188585447 28 -0.82886851627049207 29 -0.92903450081804484
		 30 -0.93322068457884588 31 -0.84028499592482098 32 -0.56837353660915246;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Hip_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -9.562794408430042 1 -9.6966424092272092
		 2 -9.1353943371735582 3 -8.7059296295197601 4 -8.3568054603899213 5 -8.1987467664846658
		 6 -8.5052844370918006 7 -8.8595511094289279 8 -9.4074834033933001 9 -9.6875377921630648
		 10 -8.5952981218807381 11 -7.4086013972579652 12 -4.856474048943892 13 -2.3987481956438392
		 14 -0.2468054481396289 15 2.0531564226020356 16 4.0524875618286433 17 3.2219493693959493
		 18 2.3371345524860985 19 1.1705393415255609 20 0.048772156045823391 21 -0.41650153978511928
		 22 -0.78818375512476191 23 -0.78203455040148284 24 -0.78058079913794276 25 -0.99071502002049106
		 26 -1.2256644887199648 27 -2.4616495678679002 28 -4.1625741002020256 29 -5.815190803177904
		 30 -7.6381734532311691 31 -8.8169435354549766 32 -9.562794408430042;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Hip_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -9.2837369392144655 1 -6.5361458272800323
		 2 -2.2896141462308885 3 1.9890918525460655 4 5.1534727773620723 5 7.5977713485067024
		 6 9.3579252555243873 7 11.168047168976495 8 12.838624995965965 9 14.473236429363363
		 10 16.287762570780707 11 17.578408876087792 12 14.992948368005608 13 12.515725412197195
		 14 5.9437207631247011 15 -0.67123104187097959 16 -14.028429473819555 17 -18.45634359896837
		 18 -22.851380979072434 19 -24.581691144914696 20 -26.2683944424234 21 -25.40700377289539
		 22 -24.304320748101244 23 -23.423994791851317 24 -22.581179721735616 25 -21.976319647086562
		 26 -21.570580659543278 27 -19.742777965288738 28 -17.546478730571963 29 -14.893617487277091
		 30 -12.451428796726747 31 -10.864458196455866 32 -9.2837369392144655;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Knee_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -1.8165626151160112 1 -1.5093784368300749
		 2 -1.4322364475660114 3 -1.4681902717843696 4 -1.7051922274151419 5 -1.7630012349119126
		 6 -1.5876211983671054 7 -1.401914713156899 8 -1.1548665201682853 9 -0.94360466863454051
		 10 -0.8448271310182961 11 -0.7640025135488856 12 -0.88606787570826773 13 -0.90242281408568747
		 14 -0.75049260399389939 15 -0.53140225509184758 16 0.85098435181815502 17 1.836499686586103
		 18 2.8751940155700328 19 2.4090191692898704 20 1.7309591351909652 21 -0.23681264551946624
		 22 -2.2107894107826072 23 -2.9716121355803859 24 -3.3523154137296705 25 -3.1743360276708388
		 26 -2.8164755208055299 27 -2.8115132732939379 28 -2.9088955783035524 29 -2.8743734505351131
		 30 -2.7284611163602754 31 -2.3521442895896558 32 -1.8165626151160112;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Knee_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.3416138166321163 1 1.3673588101257481
		 2 1.0784345274679084 3 0.84791275207843908 4 0.75621631543453716 5 0.77361265556926473
		 6 1.0674068729396313 7 1.425334842113962 8 2.0562372162986198 9 2.5552620223385274
		 10 2.6225387979506332 11 2.657459045113439 12 1.8584600762264776 13 1.1572955640448512
		 14 0.4752605686515321 15 0.087044103994529734 16 0.33716776086596956 17 -0.22568701700167679
		 18 -0.70239423392509281 19 -1.9484169970173162 20 -3.3843938214436933 21 -3.3612163792061547
		 22 -2.7509397704705356 23 -1.5725672822012575 24 -0.059860134328536464 25 0.3349602262958557
		 26 0.51910047091557376 27 0.51352796556491109 28 0.45594354437810197 29 0.51391222044190643
		 30 0.71867963454351702 31 1.0126766808770498 32 1.3416138166321163;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Knee_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 12.358578039478733 1 11.68530171593555
		 2 7.1023998668519726 3 2.2503850037177369 4 -1.0053902975908888 5 -2.5999552818867864
		 6 -2.7511711957668936 7 -2.8099431975605516 8 -2.6481712116417069 9 -2.2711162102567659
		 10 -1.959187832384867 11 -1.1610354850157822 12 6.8851242599638196 13 14.087065260582063
		 14 25.21156319876609 15 36.495163592847049 16 53.896013963900707 17 55.410891263865501
		 18 56.926805308983845 19 51.544076494585894 20 45.803822021588488 21 35.127056178684661
		 22 23.981490417991623 23 16.135006633655074 24 8.0845421966389459 25 6.8064032436005046
		 26 6.4195971557782165 27 6.7887373836105231 28 7.944771943211383 29 8.1785168674055182
		 30 8.8289058073647748 31 10.831114756422691 32 12.358578039478733;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Ankle_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 12.121504628307443 1 11.06383322237189
		 2 9.8165162688357537 3 8.84285193581489 4 8.2108892856828302 5 7.6297224212866617
		 6 7.1808644073456946 7 6.6961534126439446 8 6.2006270779770114 9 5.6870096537064247
		 10 5.1387607226992431 11 4.7425295808739643 12 5.0696827400139242 13 5.4637552598156978
		 14 6.9113432129172994 15 8.4246839256848141 16 12.142016544735879 17 12.196880246984733
		 18 12.517057085857317 19 13.358199041091483 20 14.063317560630674 21 15.204891971053847
		 22 16.187172297967699 23 15.606610928897936 24 14.438602274260699 25 13.916904513736416
		 26 13.52895466527314 27 13.661320663699339 28 14.103652105541839 29 14.029892877453907
		 30 13.739886358966283 31 13.074507210218982 32 12.121504628307443;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Ankle_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.6851333920806151 1 3.3713992982039755
		 2 3.817419161365446 3 4.5890289314420087 4 5.1150486924225254 5 5.0987136360156748
		 6 4.8544424546095026 7 4.478898618503024 8 3.7155067358800253 9 2.8155286621351912
		 10 1.272734642402652 11 -0.3597498789090246 12 -3.0191435768620298 13 -5.4867124547825323
		 14 -6.3665370478755907 15 -7.6169481813188913 16 -8.1490694898454361 17 -4.8238735094080658
		 18 -1.4524073203793475 19 -2.9274587612331309 20 -4.5054079499391237 21 -6.6997430032835048
		 22 -9.1429162610706953 23 -5.7083926443153166 24 -0.59037567647003275 25 1.2640991708287197
		 26 2.3840087687608409 27 2.2892157873953707 28 1.6774007084395079 29 1.8504708293344831
		 30 2.0716283390305894 31 2.1235537901092627 32 2.6851333920806151;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Ankle_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.5280599964522867 1 -4.0240784323556555
		 2 -3.8703853165246018 3 -3.2729079348558026 4 -3.1172859940926401 5 -3.3514139454978262
		 6 -4.8198081092393181 7 -6.0725770554662946 8 -7.0213729929428714 9 -7.7128240034118702
		 10 -6.6409341791816381 11 -5.6054145404050937 12 -4.0874567358707727 13 -1.8633977727690285
		 14 7.646670638389895 15 16.490002936981725 16 22.447249193967014 17 17.713720643109362
		 18 13.114294844313237 19 6.9121102819211693 20 0.51762346187388208 21 -2.2466812791924498
		 22 -4.6254803577785326 23 -3.1425635815313595 24 -1.0408453642234778 25 0.31944012841858299
		 26 1.4553371860195217 27 2.908955520583401 28 4.5906099805562546 29 4.4803948667802498
		 30 3.1832678182418706 31 0.70622362871101219 32 -2.5280599964522867;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Toes_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.9068959561271486 1 -5.898473360176129
		 2 -5.9231400362959201 3 -5.9213395958725679 4 -6.3395645538150642 5 -6.8057605876913927
		 6 -7.4785119005823359 7 -8.3147313457084504 8 -9.547744204166241 9 -11.217384748222628
		 10 -14.802849873861836 11 -18.895346802560002 12 -27.316655932672859 13 -35.862035199991496
		 14 -51.059218365720803 15 -61.252405137243031 16 -48.393049369330704 17 -39.995478171037291
		 18 -31.690709026830337 19 -23.217961006136665 20 -14.273971935422242 21 -9.9522834202003789
		 22 -6.0504348068581306 23 -5.8310067479498757 24 -5.830599694218999 25 -5.8296657735494728
		 26 -5.8287058183156644 27 -5.8272323663455738 28 -5.8255843338987843 29 -5.8238445983039835
		 30 -5.8224029756164981 31 -5.9165698766744521 32 -5.9068959561271486;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Hip_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.4641143374086119 1 1.8256491395161352
		 2 1.8687975906635081 3 1.6863353224688575 4 0.86953987604969207 5 0.37111670043083383
		 6 0.28981192811910095 7 0.2725443713257249 8 0.61953140806978657 9 0.818011038919778
		 10 0.54240017172431543 11 0.23978764387500395 12 -0.41611224716686723 13 -0.99795786428425437
		 14 -1.4050803653890256 15 -1.813724280935844 16 -2.2354369944705259 17 -1.997066245978691
		 18 -1.7017493001908492 19 -1.5182582091822192 20 -1.4137530398740106 21 -1.2932968489710763
		 22 -1.26800311283167 23 -0.96922090963856444 24 -0.5841166209404145 25 -0.34236433301197317
		 26 -0.18491218761608116 27 -0.0018147187397220357 28 0.21297747637403688 29 0.36793532214401159
		 30 0.50693374832109794 31 0.88289514194211693 32 1.4641143374086119;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Hip_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 9.4185391751855505 1 8.3938443078737155
		 2 6.6517899651350243 3 5.3342641518143612 4 4.4682926043804887 5 4.0418683062476548
		 6 4.045716268315469 7 4.1471039575323108 8 4.5796047233509096 9 4.8072218912367939
		 10 4.0590680993894823 11 3.3126944580125319 12 1.9107600065704227 13 0.47926125560127225
		 14 -1.3023627312523767 15 -3.31812075892773 16 -6.6706091347914622 17 -6.761977352729339
		 18 -6.7167026231475484 19 -5.4221454441488577 20 -4.087691629878889 21 -2.587034174678958
		 22 -1.1285423631383147 23 -0.72006197452399456 24 -0.53795206707161669 25 0.8494204798771926
		 26 2.5860820033500644 27 4.509143088639628 28 6.5787220178464896 29 8.0783157449167859
		 30 9.4892045436420354 31 9.7629141185002268 32 9.4185391751855505;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Hip_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -8.7655563876886475 1 -13.041001869876828
		 2 -15.817655816549275 3 -17.537956203128402 4 -17.811467855027498 5 -18.158714590275157
		 6 -18.467271213258602 7 -19.232801383069834 8 -21.011313581348823 9 -22.503552326860301
		 10 -22.896511302783665 11 -23.159071672669942 12 -20.622233313696675 13 -18.432141296796281
		 14 -16.713769161553913 15 -15.657072449548076 16 -14.430715224728505 17 -11.645167705516252
		 18 -8.4893791153480151 19 -4.5447150846117452 20 -0.1809526976786372 21 4.0639641447943289
		 22 8.1198922931998023 23 12.15306837018449 24 15.750459995940471 25 17.928136086952975
		 26 19.954675023697682 27 17.763794844139543 28 13.853650282260331 29 8.9228670745223724
		 30 2.8660748935894014 31 -2.9628526504369255 32 -8.7655563876886475;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Knee_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.18658188417381685 1 -0.13189289741542748
		 2 0.3404115410903325 3 0.50396913485460548 4 0.45959509196433346 5 0.41920408778845891
		 6 0.66429615909768902 7 0.83691856109303431 8 1.0582749977159505 9 1.1858540555140646
		 10 0.97448925320764979 11 0.75505001402580296 12 0.43080797890085876 13 0.11131390941544242
		 14 -0.0915085556312311 15 -0.35929380230999514 16 -0.97971508484286229 17 -0.92391185459794034
		 18 -0.76377114378601407 19 -0.57975973726056385 20 -0.39226944702208721 21 -0.12388095905377294
		 22 0.038468466118323746 23 0.48238412295081606 24 1.0001012224611336 25 1.4414554469865835
		 26 1.9350420359319773 27 2.0061118678831469 28 1.9162302336919881 29 1.4025588368128783
		 30 0.57440790587759938 31 0.053564311105389673 32 -0.18658188417381685;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Knee_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.1518207126700304 1 5.0634055115188135
		 2 4.712825010003904 3 4.2890823751630629 4 3.7333778415629277 5 3.2114088509168472
		 6 2.7885065339641772 7 2.4058358589594744 8 2.1348565164700806 9 1.9781983653900419
		 10 2.5501666421730969 11 3.0148925266746178 12 3.2338919706383722 13 3.4810752214508809
		 14 3.8458360356861236 15 4.2872763707912132 16 6.4863860857973181 17 6.9588347405948161
		 18 7.2948726015886365 19 6.5361264618199719 20 5.753443413557453 21 4.4401009797854876
		 22 2.9149145152550391 23 3.370471443252764 24 4.2333783221268462 25 3.9520925289806117
		 26 3.3252601662419168 27 3.7209759011769101 28 4.5611073844534502 29 4.9637748975494
		 30 5.1435289159455291 31 5.1624932797339484 32 5.1518207126700304;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Knee_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 52.99597226769238 1 54.382895656688113
		 2 51.494243802911917 3 46.445712987329479 4 37.615300904239589 5 28.854727287868883
		 6 18.922800892241547 7 11.247862917028035 8 9.8809361085042919 9 8.704880722129305
		 10 10.790471483879427 11 12.210354213272762 12 11.794520172740761 13 11.554017976935675
		 14 12.939800805100061 15 15.458026494568953 16 22.319752997915124 17 21.619192650813115
		 18 20.011475260795287 19 16.800662001980811 20 12.596902567034327 21 8.3387422101552744
		 22 4.2052374233200291 23 0.4846734911477768 24 -2.3969990709358768 25 -2.2589833100755765
		 26 -1.8503530051336492 27 5.7205082428592808 28 17.153451453512666 29 27.256759156494041
		 30 38.068544793466707 31 46.269419136868372 32 52.99597226769238;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Ankle_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 11.600969414730404 1 13.579539208992049
		 2 15.176574027762795 3 16.390579847186913 4 16.850836230808827 5 16.794071112823293
		 6 14.8522919444643 7 13.11734725936553 8 11.650843809553646 9 10.637778740020602
		 10 11.317472058709333 11 11.983866842728947 12 13.056395072361838 13 13.986422218645233
		 14 13.969525577915112 15 14.044414709396596 16 13.251597782193382 17 13.458592934915824
		 18 13.627266586359839 19 12.906247014096859 20 12.242784987813778 21 10.876002639414482
		 22 9.5885975266180079 23 8.5908080778992115 24 7.635263534553582 25 6.8295890507469448
		 26 6.0528366629815187 27 5.5255180993498687 28 5.1321850874024451 29 5.6246586656018884
		 30 6.9799146536805452 31 9.0290632170938032 32 11.600969414730404;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Ankle_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -9.2979387367294919 1 -8.8696784809825218
		 2 -7.2208894702810644 3 -6.6041753259300675 4 -6.7543904102164127 5 -6.369507633081338
		 6 -3.57962201541925 7 -1.7074436774476376 8 -1.4286464860789008 9 -1.1458145814889364
		 10 -1.4416267343892939 11 -1.7171875931316698 12 -2.042757020322636 13 -2.3453198296999442
		 14 -1.5788472207332276 15 -1.194395674374191 16 -1.0000061021936248 17 -0.90034312232259206
		 18 -0.76971096742333622 19 -0.34456950229786704 20 0.39335947950191247 21 0.60171810490612809
		 22 1.313200311922113 23 0.41039703773270275 24 -1.0386578762964991 25 -0.95550890545144096
		 26 -0.57954199470360823 27 -1.8266192210794054 28 -4.0487196337915217 29 -6.0159214512599908
		 30 -8.3880273797560374 31 -9.2405345586266492 32 -9.2979387367294919;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Ankle_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 10.237433864988889 1 7.2025336183248694
		 2 2.196822658867561 3 -1.5431012519239913 4 -4.05416822857027 5 -5.0088643198189837
		 6 -3.1952384157107216 7 -1.9059259769710974 8 -1.1349096490481503 9 -0.32393060093694315
		 10 0.55206119208668736 11 1.5616172924118221 12 3.5245750459122447 13 5.101186161954371
		 14 2.4910256069138579 15 -0.64872248505323904 16 -8.6687985870200954 17 -10.71098692072146
		 18 -12.226456036708472 19 -12.909145757423754 20 -13.135527590305008 21 -13.154556860498678
		 22 -13.293644381054477 23 -12.43949836825743 24 -11.840902974734117 25 -10.952533449521271
		 26 -10.102718396793863 27 -7.4174346069488726 28 -2.647668387870751 29 3.3808718205209742
		 30 10.420758644047929 31 11.641345168809195 32 10.237433864988889;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Toes_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -26.169612177860781 1 -19.281367006394255
		 2 -17.480582139547725 3 -14.344120804838353 4 -9.9749857999912503 5 -6.9515378283762388
		 6 -6.3481101774855109 7 -5.8225047149080291 8 -5.8276762955905586 9 -5.827592243439625
		 10 -5.8275877018843385 11 -5.8276571305719536 12 -5.8278008740479361 13 -5.8279858847399755
		 14 -5.8304447079830606 15 -5.9945112690503839 16 -5.9944734645258988 17 -5.9947489726769794
		 18 -5.9947023106186981 19 -5.9946785853527293 20 -5.8338151783824062 21 -5.8278353021894302
		 22 -5.828026724144225 23 -7.0759031143205497 24 -8.7278284606718923 25 -10.701679896389454
		 26 -12.156314117473611 27 -21.303128062375187 28 -34.648708728070069 29 -40.70482564371531
		 30 -43.145709805331364 31 -39.127749829870211 32 -26.169612177860781;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTL -n "walk_proud:Root_M_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.20118404380874738 1 -0.25467916577814576
		 2 -0.28865548544885733 3 -0.29762381927890608 4 -0.29658520202614119 5 -0.2430566705173493
		 6 -0.22844841631520785 7 -0.21341292732137021 8 -0.19148635291375715 9 -0.16102850146713057
		 10 -0.12233091121453191 11 -0.073475708496951619 12 -0.014738519279614407 13 0.051607459026977776
		 14 0.11928557334833514 15 0.18010211746670027 16 0.2272125078861385 17 0.25714574752445291
		 18 0.27026082666510198 19 0.2713120312742241 20 0.26637111097370214 21 0.25277279985593704
		 22 0.23356453919414227 23 0.21000262433142025 24 0.18333529506371224 25 0.15765747770342678
		 26 0.12809393306605463 27 0.0944433595024433 28 0.052967325999923605 29 0.00024924909602842479
		 30 -0.063684230576541462 31 -0.13336069127421896 32 -0.20118404380874738;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTL -n "walk_proud:Root_M_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.6575082931755283 1 5.6023548553195273
		 2 5.5945956817294817 3 5.6220332808668569 4 5.6889572229558665 5 5.9116021824438736
		 6 6.0340424948479496 7 6.1127250196989769 8 6.1171611684037437 9 6.0834492130831439
		 10 6.0165554293414196 11 5.928672624020682 12 5.8324015406597969 13 5.7316862166680815
		 14 5.6339943234815353 15 5.5523177409014064 16 5.502678379580396 17 5.4945196970012775
		 18 5.5459409042730297 19 5.6389201037743746 20 5.7653230463530125 21 5.900527783837437
		 22 6.0244367123563221 23 6.1239286527391723 24 6.1842023890575382 25 6.1887242639541347
		 26 6.1541010891325048 27 6.0880444658459112 28 6.00631573056123 29 5.9142932854061048
		 30 5.8212482989835932 31 5.7345500438931252 32 5.6575082931755283;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTL -n "walk_proud:Root_M_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.17892096708587552 1 0.1943165074129849
		 2 0.18557717689242312 3 0.14848549629479274 4 0.097700391770312284 5 -0.030835673571079178
		 6 -0.053354601002225006 7 -0.079516933666979844 8 -0.099242658253270624 9 -0.10235011922878724
		 10 -0.086464632564228053 11 -0.053005173420383689 12 -0.0083820015885598606 13 0.040598484155001606
		 14 0.081468397444493718 15 0.089923282314375269 16 0.082257034398318732 17 0.056636923629517673
		 18 0.02895474091495407 19 0.0047322141493257273 20 -0.019854095049039146 21 -0.047632953457446794
		 22 -0.077428187421861666 23 -0.1066136921069183 24 -0.13309048053983896 25 -0.14768216326541955
		 26 -0.14365992046497428 27 -0.12161682008841602 28 -0.079567685874239735 29 -0.017746411436096291
		 30 0.058399508244726353 31 0.1300818820305914 32 0.17892096708587552;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Root_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 6.7246346776238024 1 7.116939644118915
		 2 7.5550484304185455 3 7.7229562109071459 4 7.5970898121004717 5 5.910619879762633
		 6 4.4963566143821367 7 3.3605372950327697 8 2.481349715520524 9 1.8021675675306732
		 10 1.2959825835424157 11 0.86479914973246164 12 0.53090494352883699 13 0.11067971129870444
		 14 -0.50117398543641023 15 -1.228882892446334 16 -1.9519273804766701 17 -2.550548529192096
		 18 -2.8819566190689376 19 -2.6143032410470277 20 -1.5327479219837483 21 -0.0094390362219994636
		 22 1.6166755373570596 23 3.1590502471277797 24 4.5333105512553065 25 5.435632781537957
		 26 6.0052518117535101 27 6.2431137192514354 28 6.2189743401855742 29 6.1478345642162848
		 30 6.2136393053022561 31 6.4532847722351052 32 6.7246346776238024;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Root_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.2539605286786664 1 -4.2088981046957317
		 2 -4.9296455979225069 3 -5.3038713827842328 4 -5.3529777058345243 5 -4.3602659970897042
		 6 -3.4839259425824505 7 -3.2275996088806163 8 -3.4978654273029735 9 -4.1559614622980607
		 10 -4.6613599012713598 11 -4.8528821016340213 12 -4.7518939213023401 13 -4.4784679330066757
		 14 -3.9714519996015918 15 -3.1089185517910503 16 -1.9953764041139432 17 -0.94028876689730434
		 18 -0.1862167785744023 19 0.086745121715417622 20 -0.20510298728043244 21 -0.8997208984573084
		 22 -1.6764521324976824 23 -2.3119657335166939 24 -2.5847201151154047 25 -2.2892404818311176
		 26 -1.7430277593848926 27 -1.2973475662459888 28 -1.2025129853018053 29 -1.240241141876032
		 30 -1.679933842524278 31 -2.3313682310530615 32 -3.2539605286786664;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Root_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.9788211947166015 1 -4.4977716384020026
		 2 -4.8012602928737005 3 -4.863842954286044 4 -4.8611104530943585 5 -4.5869020343133924
		 6 -4.5402878760642968 7 -4.4486023880599443 8 -4.3605758214944776 9 -4.2850439108684943
		 10 -4.1980764630737246 11 -4.0983163766003816 12 -4.0928389634205207 13 -4.1781903723861404
		 14 -4.2651512878503013 15 -4.2826676270025503 16 -4.2975679799258248 17 -4.3727696773696216
		 18 -4.381335317793952 19 -4.2163711656325873 20 -3.8805526087985922 21 -3.4464195018901282
		 22 -2.9694077033100985 23 -2.4725004188026412 24 -1.9424835702979661 25 -1.4552764738261177
		 26 -1.1237828736652029 27 -1.1047514538451713 28 -1.3232433276221711 29 -1.8525090025146911
		 30 -2.613801264938473 31 -3.3367186944975287 32 -3.9788211947166015;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Spine1_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -17.172810306412849 1 -17.236673735125308
		 2 -16.931359566331093 3 -15.474612764901391 4 -13.120233099765965 5 -6.01395559023634
		 6 -3.217434054844817 7 -1.1146088858253289 8 0.29672064570771212 9 1.1888048083022948
		 10 1.6717423060699887 11 1.9648334342243519 12 2.2322269919145037 13 2.67625790162184
		 14 3.2669814346045731 15 3.7886957223554241 16 4.0247886018166676 17 4.033875959679059
		 18 3.4499548138737985 19 2.0723683706366467 20 -0.20892634534479956 21 -2.8817941759912826
		 22 -5.6118151376395868 23 -8.2619170551728409 24 -10.688917187184154 25 -12.298060004520115
		 26 -13.451076137885043 27 -14.197341732683704 28 -14.710827486746769 29 -15.242530636874296
		 30 -15.96299879504005 31 -16.687586716475614 32 -17.172810306412849;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Spine1_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 4.9550579035975151 1 6.0921717474008945
		 2 6.9076416962556504 3 7.3310258061717537 4 7.4147576810591982 5 6.0434348863302869
		 6 4.7781619626276193 7 4.216821047352151 8 4.4252162492081268 9 5.020968689181962
		 10 5.4832270778452976 11 5.6060002760964762 12 5.3841845617184934 13 4.9936901378709218
		 14 4.3027371759791135 15 3.0976069724601039 16 1.5062205546585545 17 -0.037134848288565427
		 18 -1.1962032410550418 19 -1.7173336433944877 20 -1.3874325557048237 21 -0.50525852265250348
		 22 0.52590648245493055 23 1.405912699862331 24 1.8551402451846097 25 1.6806936295689372
		 26 1.2839615530071971 27 1.2245414366423149 28 1.3790535047221031 29 2.0058806859168903
		 30 2.8439045590881311 31 3.790638231725322 32 4.9550579035975151;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Spine1_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -10.066431442507803 1 -10.178945140854195
		 2 -10.043611703634873 3 -9.3659388527878598 4 -8.3138742040823548 5 -6.0277370171857738
		 6 -6.1201243909800835 7 -6.4255020422218729 8 -6.8997800884796279 9 -7.4355601698992189
		 10 -7.9427443787898362 11 -8.3672497318038399 12 -8.5344826513908458 13 -8.4866390527685986
		 14 -8.3913344575298545 15 -8.1512089198934294 16 -7.6702413121010107 17 -6.9781764853412502
		 18 -6.2919166984030612 19 -5.7811471662060043 20 -5.7603873592020802 21 -5.9701395237937289
		 22 -6.5579212041347636 23 -7.3057068995849557 24 -8.1984491330281042 25 -9.0478705853182788
		 26 -9.6729523793896917 27 -9.9698584874472349 28 -9.9789407295710841 29 -9.858890599752506
		 30 -9.7293019461500609 31 -9.8116506974607969 32 -10.066431442507803;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Spine2_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 6.6972539948064815 1 6.6401931302262369
		 2 6.3084720103859926 3 5.6666876251568654 4 4.7063851156394874 5 2.0562332280306905
		 6 1.0621262069811983 7 0.26758720936415781 8 -0.32864505655528226 9 -0.74874600104624112
		 10 -0.99633321187229806 11 -1.145052489944391 12 -1.2609389839169769 13 -1.4411316469497351
		 14 -1.6687750032203721 15 -1.7602521092694019 16 -1.747146541573928 17 -1.5477440021708251
		 18 -1.1758782312411047 19 -0.52840581237443818 20 0.38319838756321167 21 1.3884511996557376
		 22 2.3926779966927998 23 3.3702308025045942 24 4.2836371065731962 25 4.9188838647708772
		 26 5.3982758848787533 27 5.7120396997904033 28 5.9210931053795255 29 6.1221364727342378
		 30 6.3775743851775353 31 6.6142091959065157 32 6.6972539948064815;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Spine2_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.6856354828818563 1 -3.998815156481732
		 2 -4.0322035515462682 3 -3.8628469885733145 4 -3.4977212293576225 5 -2.3272010581245226
		 6 -1.8329002814591788 7 -1.4674008510164214 8 -1.215639455907551 9 -1.0527432430172479
		 10 -0.98728364237456023 11 -0.97590667764637118 12 -0.93306051121780509 13 -0.7970858853436974
		 14 -0.55198128264459045 15 -0.18389408499052032 16 0.22857786346726672 17 0.5361440424632653
		 18 0.63480150107176825 19 0.5096411995746738 20 0.14342573634119393 21 -0.35478748923988185
		 22 -0.88967060130820985 23 -1.3928405249117854 24 -1.8069190270161495 25 -2.0129898056744873
		 26 -2.1174431755190617 27 -2.1871324112365809 28 -2.2878977759582626 29 -2.4866256390262929
		 30 -2.824651148490374 31 -3.2492264809854698 32 -3.6856354828818563;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Spine2_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 9.6342038103164462 1 9.6259993290859605
		 2 9.541897394897072 3 9.3497348768733382 4 9.0499366588554508 5 8.4465225647603805
		 6 8.5683165856057606 7 8.7396763698529316 8 8.9487926118288623 9 9.1661176413702137
		 10 9.3657498425471513 11 9.5354069369501389 12 9.6052795695690794 13 9.5875331049539554
		 14 9.5456373468632911 15 9.4390358245226746 16 9.2327960875310797 17 8.9456717992700945
		 18 8.6713064643144531 19 8.4829468715000491 20 8.4796479260418849 21 8.5716967805952322
		 22 8.7687704238154716 23 9.0122496517439821 24 9.305099457545257 25 9.6045806089937233
		 26 9.8303381820074236 27 9.92746918225623 28 9.9165235695913854 29 9.8209042080661479
		 30 9.6919504229778699 31 9.6292442742898938 32 9.6342038103164462;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Chest_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -7.2347374114840948 1 -7.2151533233574945
		 2 -6.9000599960483342 3 -6.2264057471626906 4 -5.2036703221948226 5 -2.3771403877186867
		 6 -1.323846232371213 7 -0.48755978809171058 8 0.13562232980735775 9 0.57134153488957051
		 10 0.82292136245113667 11 0.96777732157705842 12 1.0878357722000518 13 1.2884498879069302
		 14 1.5446894511410167 15 1.7234579060127038 16 1.750411625518896 17 1.6124109800917286
		 18 1.2582816934566774 19 0.59782777989358626 20 -0.35781477667319522 21 -1.4259136714630931
		 22 -2.5004850209784801 23 -3.5471670189280262 24 -4.5201103027660663 25 -5.1866880847744712
		 26 -5.6814114039506975 27 -6.0045598432385177 28 -6.2277034589091054 29 -6.4580451418957594
		 30 -6.7646515254977171 31 -7.0687455329304845 32 -7.2347374114840948;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Chest_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.4876750925897286 1 2.8090335861156857
		 2 2.8976264340978051 3 2.8815120264474281 4 2.7012827203248135 5 1.9982816282333562
		 6 1.6538734357302061 7 1.4097018817974438 8 1.2520617661099791 9 1.1582467575002788
		 10 1.1361465910321658 11 1.1522348649300442 12 1.1301921495392482 13 1.0257612892905228
		 14 0.81919388831327467 15 0.47282061719611485 16 0.052964494245217722 17 -0.29007672951120494
		 18 -0.4530628868261824 19 -0.42127909410801795 20 -0.19921264933578611 21 0.14349221770604983
		 22 0.51371400794621069 23 0.84538414448724042 24 1.086023153583721 25 1.1609056204681651
		 26 1.1557144610452343 27 1.1592457060355255 28 1.2232005570160758 29 1.3933873078133263
		 30 1.6947223114785861 31 2.0767335526531463 32 2.4876750925897286;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Chest_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -10.010992549346781 1 -10.017522647784473
		 2 -9.9512464463304262 3 -9.6973310906484578 4 -9.3172620116839102 5 -8.5297555588132585
		 6 -8.6051580049680272 7 -8.7490346715565455 8 -8.9437945864212161 9 -9.1533302241461314
		 10 -9.3489981876024313 11 -9.5159235666275706 12 -9.584185942813507 13 -9.5659735745106342
		 14 -9.5267529331171747 15 -9.4290971506020629 16 -9.2353364609835307 17 -8.9569547770178133
		 18 -8.6827366926330107 19 -8.4864236075810275 20 -8.481629416284644 21 -8.5760433699720355
		 22 -8.798695979032777 23 -9.0793659316427888 24 -9.415455966461165 25 -9.7434965438986314
		 26 -9.9874935147933694 27 -10.100111965150136 28 -10.098539226324723 29 -10.030816933687136
		 30 -9.9530771511172915 31 -9.9492130870694719 32 -10.010992549346781;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Scapula_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.1817433459952025e-006 1 -2.1817433459952025e-006
		 2 -2.1817433459952025e-006 3 -2.1817433459952025e-006 4 -2.1817433459952025e-006
		 5 -2.1817433459952025e-006 6 -2.1817433459952025e-006 7 -2.1817433459952025e-006
		 8 -2.1817433459952025e-006 9 -2.1817433459952025e-006 10 -2.1817433459952025e-006
		 11 -2.1817433459952025e-006 12 -2.1817433459952025e-006 13 -2.1817433459952025e-006
		 14 -2.1817433459952025e-006 15 -2.1817433459952025e-006 16 -2.1817433459952025e-006
		 17 -2.1817433459952025e-006 18 -2.1817433459952025e-006 19 -2.1817433459952025e-006
		 20 -2.1817433459952025e-006 21 -2.1817433459952025e-006 22 -2.1817433459952025e-006
		 23 -2.1817433459952025e-006 24 -2.1817433459952025e-006 25 -2.1817433459952025e-006
		 26 -2.1817433459952025e-006 27 -2.1817433459952025e-006 28 -2.1817433459952025e-006
		 29 -2.1817433459952025e-006 30 -2.1817433459952025e-006 31 -2.1817433459952025e-006
		 32 -2.1817433459952025e-006;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Scapula_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.4203839476090244e-006 1 2.4203839476090244e-006
		 2 2.4203839476090244e-006 3 2.4203839476090244e-006 4 2.4203839476090244e-006 5 2.4203839476090244e-006
		 6 2.4203839476090244e-006 7 2.4203839476090244e-006 8 2.4203839476090244e-006 9 2.4203839476090244e-006
		 10 2.4203839476090244e-006 11 2.4203839476090244e-006 12 2.4203839476090244e-006
		 13 2.4203839476090244e-006 14 2.4203839476090244e-006 15 2.4203839476090244e-006
		 16 2.4203839476090244e-006 17 2.4203839476090244e-006 18 2.4203839476090244e-006
		 19 2.4203839476090244e-006 20 2.4203839476090244e-006 21 2.4203839476090244e-006
		 22 2.4203839476090244e-006 23 2.4203839476090244e-006 24 2.4203839476090244e-006
		 25 2.4203839476090244e-006 26 2.4203839476090244e-006 27 2.4203839476090244e-006
		 28 2.4203839476090244e-006 29 2.4203839476090244e-006 30 2.4203839476090244e-006
		 31 2.4203839476090244e-006 32 2.4203839476090244e-006;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Scapula_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -8.1415927139264375e-006 1 -8.1415927139264375e-006
		 2 -8.1415927139264375e-006 3 -8.1415927139264375e-006 4 -8.1415927139264375e-006
		 5 -8.1415927139264375e-006 6 -8.1415927139264375e-006 7 -8.1415927139264375e-006
		 8 -8.1415927139264375e-006 9 -8.1415927139264375e-006 10 -8.1415927139264375e-006
		 11 -8.1415927139264375e-006 12 -8.1415927139264375e-006 13 -8.1415927139264375e-006
		 14 -8.1415927139264375e-006 15 -8.1415927139264375e-006 16 -8.1415927139264375e-006
		 17 -8.1415927139264375e-006 18 -8.1415927139264375e-006 19 -8.1415927139264375e-006
		 20 -8.1415927139264375e-006 21 -8.1415927139264375e-006 22 -8.1415927139264375e-006
		 23 -8.1415927139264375e-006 24 -8.1415927139264375e-006 25 -8.1415927139264375e-006
		 26 -8.1415927139264375e-006 27 -8.1415927139264375e-006 28 -8.1415927139264375e-006
		 29 -8.1415927139264375e-006 30 -8.1415927139264375e-006 31 -8.1415927139264375e-006
		 32 -8.1415927139264375e-006;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Shoulder_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -28.378073075166249 1 -26.30005728274946
		 2 -23.586405487205987 3 -20.379018738889549 4 -16.865090601241665 5 -9.5227714698023558
		 6 -6.3219024382316089 7 -3.4443666154492707 8 -0.76242905330590649 9 1.6555656101751359
		 10 3.6372230028044941 11 5.2920377790907596 12 6.4490511215230848 13 7.2726406187047763
		 14 7.7101086558394014 15 7.6269240288326481 16 6.7179905086994847 17 5.0373366253845555
		 18 2.5043017945809436 19 -0.57016892476665326 20 -4.1642264350286329 21 -8.0379367450568626
		 22 -11.94153677841024 23 -15.777860315648603 24 -19.605348640428119 25 -22.955242397514027
		 26 -26.104889928109746 27 -28.532192830663185 28 -30.220028831487589 29 -30.80977246529207
		 30 -30.739323303922081 31 -29.882367090548961 32 -28.378073075166249;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Shoulder_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -18.813883177953922 1 -17.067831188690857
		 2 -14.539782243887441 3 -11.343631195011243 4 -7.6528144550888086 5 1.2713551884589107
		 6 4.4117340643099316 7 7.265357593262479 8 10.088275096266431 9 12.813483947215648
		 10 15.232858654462671 11 17.410712087582954 12 18.923184462780739 13 19.561882882079306
		 14 19.287136049000104 15 18.109887027680532 16 16.359925939751868 17 14.304981356147406
		 18 11.882684115703318 19 9.1669140659943853 20 5.9512067748776571 21 2.4066631191113683
		 22 -1.3113433996179726 23 -5.1898996753158544 24 -9.2673083719818514 25 -12.765577310158013
		 26 -15.894544531354033 27 -18.313322053703658 28 -20.070226157396196 29 -20.752478724343092
		 30 -20.752961926106863 31 -20.015211056310672 32 -18.813883177953922;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Shoulder_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -70.624510174201347 1 -70.22405524453599
		 2 -70.304061291100538 3 -70.82310725658995 4 -71.409535389811978 5 -71.63236143573252
		 6 -70.071865262559115 7 -68.080959145841987 8 -65.59428830473577 9 -62.870275702443138
		 10 -60.202927917424006 11 -57.733774066157721 12 -56.323286116485534 13 -56.376743814529583
		 14 -57.342087244917778 15 -59.617715084539938 16 -62.430859573267526 17 -65.061010857417344
		 18 -67.18201286716176 19 -68.69224877279126 20 -69.710154413455513 21 -70.379926397848593
		 22 -70.782641266076624 23 -70.991398288240617 24 -71.129105114770425 25 -71.333325704489368
		 26 -71.750766272969656 27 -72.302979913426853 28 -72.720842812405934 29 -72.750351849253306
		 30 -72.062198997410803 31 -71.29455275522497 32 -70.624510174201347;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Elbow_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -24.246857833340485 1 -22.078135865359133
		 2 -19.321003480654458 3 -16.306747689664178 4 -13.507292225314416 5 -10.992574859276132
		 6 -7.8471128490174458 7 -4.4796811017851432 8 -0.78761414360345749 9 3.0584061991191427
		 10 6.7502468942165992 11 10.151581727979204 12 12.410547644872267 13 14.051723078036336
		 14 15.258536695821842 15 15.304198423198088 16 13.740406676031498 17 10.69659015477961
		 18 6.5103948664784586 19 2.0631904801056069 20 -2.3984427677091835 21 -6.706962578493922
		 22 -10.559851163171912 23 -13.775228589837939 24 -16.526708783075101 25 -19.117650780880371
		 26 -21.813629560968508 27 -23.706066450862686 28 -24.75115647647366 29 -25.343378905911873
		 30 -25.707356644330723 31 -25.52182343812715 32 -24.246857833340485;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Elbow_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 9.3331418680573943 1 10.934213770170659
		 2 12.715923856676136 3 14.418995982526726 4 15.81067904487816 5 17.312526127462579
		 6 19.370931352832255 7 21.902252462755254 8 24.776729352602349 9 27.446745530793443
		 10 29.565559144228889 11 31.37939218563962 12 32.553285110275844 13 33.002759511819953
		 14 32.914685561953767 15 32.121768015852716 16 30.47293230152097 17 27.996833243558068
		 18 24.881181694318801 19 21.601606148104548 20 18.488696955907887 21 15.947603270891577
		 22 14.191444092601301 23 13.158323156654239 24 12.560495116333131 25 12.114150926865927
		 26 11.425929519347541 27 10.432284276913258 28 9.1843687710449711 29 8.06856467612789
		 30 7.6813814906843998 31 8.1363805247709973 32 9.3331418680573943;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Elbow_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 4.4469586322564352 1 4.4054254183160175
		 2 4.3836743902142832 3 4.3986952772568051 4 4.4466142288782056 5 5.7516937473294538
		 6 4.7236560241268597 7 3.0397312833368972 8 0.68307714199733027 9 -2.0880892369444846
		 10 -4.9287159775746847 11 -7.496953007148635 12 -8.7566100357728445 13 -9.2116838439738746
		 14 -9.2156200809295914 15 -8.9142368200720874 16 -7.9292986829530525 17 -6.7339151834789437
		 18 -5.7516396858358805 19 -5.3416610772578723 20 -5.3279626161950766 21 -5.3341213141679678
		 22 -5.4200924042734568 23 -5.5778078792752703 24 -5.5981870775890803 25 -4.8067623232582628
		 26 -3.197554192539092 27 -1.3141014328458365 28 0.57453763150898651 29 2.2139958628901355
		 30 3.351858827192749 31 4.0982940117648434 32 4.4469586322564352;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Wrist_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -6.3014143783885501 1 -6.138026311021771
		 2 -5.8173710547465625 3 -5.4044749789477091 4 -4.9938847465144898 5 -4.3831033438276341
		 6 -4.0548389886620102 7 -3.7143760322772441 8 -3.4077831949017465 9 -3.1941370744317701
		 10 -3.140398460244648 11 -3.2248692653093434 12 -3.3976942153091674 13 -3.5867763249683793
		 14 -3.7825638516066502 15 -3.9322756058024204 16 -3.97451275932444 17 -3.9406006036009549
		 18 -3.7601539428394437 19 -3.483478185483436 20 -3.1998904117106135 21 -3.0045269220383188
		 22 -2.9710266923340809 23 -3.1108047165535706 24 -3.4382382495722621 25 -3.8565670898879487
		 26 -4.3544777917508037 27 -4.858981241528026 28 -5.374710916579887 29 -5.8558358858388209
		 30 -6.1877588009616167 31 -6.3279041521391513 32 -6.3014143783885501;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Wrist_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.9930091451643799 1 1.0753436539644616
		 2 0.34734218046668802 3 -0.28353174465245906 4 -0.98333366143360335 5 -0.22049470276025232
		 6 1.6424553521794734 7 4.0322853089200548 8 7.044961526243922 9 10.496672193553785
		 10 13.962309372900098 11 16.987904624231632 12 18.747541278607017 13 20.034064109606447
		 14 21.04944151780834 15 21.621726769641345 16 21.688410175759152 17 21.182544209108219
		 18 19.77196192563116 19 17.533697613739104 20 14.912059349036275 21 12.180093369929001
		 22 9.6464188349728861 23 7.6064042824015861 24 6.2556108644606407 25 5.6545323481586669
		 26 5.2848392892564542 27 4.8930857938971943 28 4.3082437970266456 29 3.6271538585955647
		 30 3.1118418235165031 31 2.7135128634965731 32 1.9930091451643799;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Wrist_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -21.35560710572118 1 -19.544411396912146
		 2 -17.146126040500722 3 -14.440488489576527 4 -11.803216269799037 5 -8.485201330218981
		 6 -7.2061746857099997 7 -5.650554177611026 8 -3.7300646870460992 9 -1.681258277934405
		 10 0.49253104157632149 11 3.1856705067110824 12 5.6233920641444168 13 7.589259036548051
		 14 9.2963231379435349 15 10.558490558522577 16 11.238648365291418 17 11.387371049359359
		 18 11.210857531922532 19 10.670504063965707 20 9.1920676630575198 21 6.975852638051677
		 22 4.2504525367204069 23 1.0015896692269812 24 -2.9820615649928759 25 -7.009586794446891
		 26 -11.189085270384012 27 -14.928411573032262 28 -18.148849006669899 29 -20.673848675669245
		 30 -22.030945285479213 31 -22.256222859348266 32 -21.35560710572118;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Neck_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.4959966349206995 1 2.5668144062855394
		 2 2.4916868083604111 3 2.2072434354650956 4 1.8654283183312141 5 1.1999154826421679
		 6 1.1310436601658003 7 1.1562155919909565 8 1.2301985853121273 9 1.3256322682688801
		 10 1.4210878471852637 11 1.4787138643805786 12 1.431804564207096 13 1.2816291600171834
		 14 1.0390086982091116 15 0.78979357195460675 16 0.67177723963214864 17 0.66829638626549037
		 18 0.7994005858992933 19 0.99354044939933606 20 1.19381261436171 21 1.3329929618438383
		 22 1.4109040953132312 23 1.4589136434272556 24 1.4847584949831283 25 1.4688100876524588
		 26 1.4559245077966054 27 1.4623143959349061 28 1.530300157941725 29 1.6977020643961211
		 30 1.9789899537113742 31 2.2707138449813855 32 2.4959966349206995;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Neck_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -4.8907835929135324 1 -5.3974936170607863
		 2 -5.6426469343032979 3 -5.7493704076112406 4 -5.9149112354944489 5 -6.5013816867254821
		 6 -6.9974858312469577 7 -7.4819018918395122 8 -7.8855361624112961 9 -8.2504234723225753
		 10 -8.6168276820098377 11 -8.9038485128370031 12 -8.8813172389379016 13 -8.4995539616243914
		 14 -7.5679233676728082 15 -6.2584546506776668 16 -4.9790697288646886 17 -4.1915207155638941
		 18 -3.9270407241122092 19 -4.0593415218716036 20 -4.382623229803432 21 -4.5790318499905673
		 22 -4.5526316369763551 23 -4.250007284758416 24 -3.7992858811224361 25 -3.330538104442462
		 26 -2.9157863758731621 27 -2.6336531996833785 28 -2.5927800391787343 29 -2.8580397929140138
		 30 -3.4771799233519456 31 -4.1962827354878991 32 -4.8907835929135324;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Neck_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 32.790080002605322 1 32.516206578125214
		 2 31.417646195831374 3 29.68169251091787 4 27.651194669754343 5 24.497876974248662
		 6 25.941861052181189 7 27.647943916757789 8 29.384372026788988 9 30.886648563086165
		 10 31.832175240842023 11 32.040517164732314 12 31.356601948570439 13 30.219052970658517
		 14 28.721649251800564 15 26.91327102618714 16 25.044474268039966 17 23.495241764621287
		 18 22.455442449370267 19 22.020618382468857 20 22.280888419778123 21 23.110946070438054
		 22 24.269210106215205 23 25.608662159302064 24 27.073198215490631 25 28.411605131380313
		 26 29.653176399282231 27 30.597424245456072 28 31.293485110587959 29 31.873089635778808
		 30 32.400236459409705 31 32.790823616535796 32 32.790080002605322;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Head_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.2238359691812231 1 2.1683126908201769
		 2 1.8597933540804523 3 1.303569859847955 4 0.54660029724827219 5 -1.223001283387994
		 6 -1.9705454130653048 7 -2.5084025402725274 8 -2.8563134853071528 9 -3.0794722949948596
		 10 -3.2112887367597853 11 -3.2775909992477814 12 -3.2587821035424471 13 -3.1580093306929813
		 14 -2.9392017375473478 15 -2.4975867290554525 16 -1.8643932933766854 17 -1.1978615564191375
		 18 -0.59013886589994258 19 -0.044501206503599754 20 0.34431761215487594 21 0.55254007657490467
		 22 0.68217738764553615 23 0.84658565196077451 24 1.0437657625137609 25 1.1571345924929868
		 26 1.2661112627136644 27 1.3819371849171136 28 1.5195541192387285 29 1.7066013295049185
		 30 1.9506340978031516 31 2.1538058457762053 32 2.2238359691812231;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Head_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -1.2739533676093537 1 -0.93834425369499741
		 2 -0.51763731066473395 3 -0.010646706239533671 4 0.60149818842194469 5 1.748615975479525
		 6 2.3177132858825891 7 2.9619777255348483 8 3.6457860076986131 9 4.3044924630379242
		 10 4.8503573254872023 11 5.1683942486988901 12 5.1701787658981004 13 4.9407925005501028
		 14 4.2912077763239269 15 3.2925151052714159 16 2.2320139982464418 17 1.4798973936581172
		 18 1.0672532922542064 19 0.98648092092485851 20 1.1116820267905034 21 1.2425960908492368
		 22 1.2422179784087 23 1.039608136611252 24 0.65354734461805597 25 0.18045365960504375
		 26 -0.29034522874394347 27 -0.71221968706294281 28 -1.0710457994229083 29 -1.3354841784980662
		 30 -1.4408391043734559 31 -1.4437637065610005 32 -1.2739533676093537;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Head_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -16.086885958981274 1 -15.332041491393616
		 2 -14.301264595843584 3 -13.090947929287045 4 -11.894088103972019 5 -10.362923145596817
		 6 -10.731216174834248 7 -11.522723051919243 8 -12.745769089888361 9 -14.155761881811635
		 10 -15.300938141620733 11 -15.704828128164545 12 -15.227621117379439 13 -14.45135015450591
		 14 -13.486351034813003 15 -12.367827035389984 16 -11.306250100565268 17 -10.581466122746376
		 18 -10.17681128887987 19 -9.9250692151371123 20 -9.965188700787186 21 -10.40212630700413
		 22 -11.209869755764377 23 -12.234732575614059 24 -13.330890000537138 25 -14.322965972079437
		 26 -15.293631585582904 27 -15.996928230241718 28 -16.397921916225155 29 -16.59905619926835
		 30 -16.692198901697541 31 -16.579917672064067 32 -16.086885958981274;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Scapula_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.1307251692906871e-005 1 -2.1307251692906871e-005
		 2 -2.1307251692906871e-005 3 -2.1307251692906871e-005 4 -2.1307251692906871e-005
		 5 -2.1307251692906871e-005 6 -2.1307251692906871e-005 7 -2.1307251692906871e-005
		 8 -2.1307251692906871e-005 9 -2.1307251692906871e-005 10 -2.1307251692906871e-005
		 11 -2.1307251692906871e-005 12 -2.1307251692906871e-005 13 -2.1307251692906871e-005
		 14 -2.1307251692906871e-005 15 -2.1307251692906871e-005 16 -2.1307251692906871e-005
		 17 -2.1307251692906871e-005 18 -2.1307251692906871e-005 19 -2.1307251692906871e-005
		 20 -2.1307251692906871e-005 21 -2.1307251692906871e-005 22 -2.1307251692906871e-005
		 23 -2.1307251692906871e-005 24 -2.1307251692906871e-005 25 -2.1307251692906871e-005
		 26 -2.1307251692906871e-005 27 -2.1307251692906871e-005 28 -2.1307251692906871e-005
		 29 -2.1307251692906871e-005 30 -2.1307251692906871e-005 31 -2.1307251692906871e-005
		 32 -2.1307251692906871e-005;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Scapula_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.0005552369177469e-005 1 1.0005552369177469e-005
		 2 1.0005552369177469e-005 3 1.0005552369177469e-005 4 1.0005552369177469e-005 5 1.0005552369177469e-005
		 6 1.0005552369177469e-005 7 1.0005552369177469e-005 8 1.0005552369177469e-005 9 1.0005552369177469e-005
		 10 1.0005552369177469e-005 11 1.0005552369177469e-005 12 1.0005552369177469e-005
		 13 1.0005552369177469e-005 14 1.0005552369177469e-005 15 1.0005552369177469e-005
		 16 1.0005552369177469e-005 17 1.0005552369177469e-005 18 1.0005552369177469e-005
		 19 1.0005552369177469e-005 20 1.0005552369177469e-005 21 1.0005552369177469e-005
		 22 1.0005552369177469e-005 23 1.0005552369177469e-005 24 1.0005552369177469e-005
		 25 1.0005552369177469e-005 26 1.0005552369177469e-005 27 1.0005552369177469e-005
		 28 1.0005552369177469e-005 29 1.0005552369177469e-005 30 1.0005552369177469e-005
		 31 1.0005552369177469e-005 32 1.0005552369177469e-005;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Scapula_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.7472791986738114e-005 1 -2.7472791986738114e-005
		 2 -2.7472791986738114e-005 3 -2.7472791986738114e-005 4 -2.7472791986738114e-005
		 5 -2.7472791986738114e-005 6 -2.7472791986738114e-005 7 -2.7472791986738114e-005
		 8 -2.7472791986738114e-005 9 -2.7472791986738114e-005 10 -2.7472791986738114e-005
		 11 -2.7472791986738114e-005 12 -2.7472791986738114e-005 13 -2.7472791986738114e-005
		 14 -2.7472791986738114e-005 15 -2.7472791986738114e-005 16 -2.7472791986738114e-005
		 17 -2.7472791986738114e-005 18 -2.7472791986738114e-005 19 -2.7472791986738114e-005
		 20 -2.7472791986738114e-005 21 -2.7472791986738114e-005 22 -2.7472791986738114e-005
		 23 -2.7472791986738114e-005 24 -2.7472791986738114e-005 25 -2.7472791986738114e-005
		 26 -2.7472791986738114e-005 27 -2.7472791986738114e-005 28 -2.7472791986738114e-005
		 29 -2.7472791986738114e-005 30 -2.7472791986738114e-005 31 -2.7472791986738114e-005
		 32 -2.7472791986738114e-005;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Shoulder_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.02609502129598287 1 -1.6162079067140849
		 2 -3.3419478128852291 3 -5.0133172619442536 4 -6.6493647024519511 5 -10.657487154372266
		 6 -14.809634823788389 7 -18.833784155153257 8 -22.822042091305065 9 -26.633739063718114
		 10 -30.101813460531083 11 -33.407598753928887 12 -35.766317192519111 13 -37.065289878928411
		 14 -36.915995342928433 15 -35.661133813575788 16 -33.443037252700179 17 -30.464187686198706
		 18 -26.806815985661849 19 -22.784477293840421 20 -18.532977598382004 21 -14.387680724577242
		 22 -10.606747325338276 23 -7.2823503721734806 24 -4.3893950427421133 25 -2.1889835994833069
		 26 -0.20870753900965688 27 1.3671082453430803 28 2.4467002487141873 29 2.7615575284269007
		 30 2.3160260318037973 31 1.3999361711505875 32 0.02609502129598287;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Shoulder_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 13.63724745289824 1 12.407630303662476
		 2 11.267294888339832 3 10.134042631944958 4 8.7328128200421933 5 3.6907494974097177
		 6 -0.4602470216950702 7 -4.6768807519429094 8 -9.0861168070665865 9 -13.363648966404361
		 10 -17.116146672005232 11 -20.423223772207045 12 -22.602204051083238 13 -23.618442829955384
		 14 -23.118297120838243 15 -21.164313485341086 16 -18.152946845140519 17 -14.212682414861279
		 18 -9.458438450426824 19 -4.3541945341465356 20 0.76057540128074064 21 5.4039487461276767
		 22 9.2800346365506439 23 12.337071004121805 24 14.669700523629123 25 16.183519581182253
		 26 17.390568208306991 27 18.11991852785513 28 18.202977463456026 29 17.645431460322154
		 30 16.414017618033366 31 14.999628119373517 32 13.63724745289824;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Shoulder_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -65.2910760951318 1 -67.659615408145214
		 2 -69.910858890030212 3 -71.777560916030779 4 -73.183657477991019 5 -74.6607744257836
		 6 -73.940221538376022 7 -72.904978871085845 8 -71.552662806470465 9 -70.166567516966282
		 10 -69.023531974526136 11 -68.142859072474863 12 -67.536559439838342 13 -67.187950975246054
		 14 -67.461356812697318 15 -67.954693859625849 16 -68.240510035454719 17 -68.362151293207916
		 18 -68.431448869982958 19 -68.525243911758182 20 -68.615025616390426 21 -68.630561435805419
		 22 -68.575650416100544 23 -68.151921458349051 24 -67.387565181739177 25 -66.25877519153299
		 26 -64.674299664839864 27 -63.124712316291507 28 -61.880921408759932 29 -61.430165803130478
		 30 -61.861562207093229 31 -63.205026992845866 32 -65.2910760951318;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Elbow_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.8283505881854244 1 -3.843361925950322
		 2 -8.3489363121880391 3 -11.94309870272202 4 -14.33045720812331 5 -16.068788016897635
		 6 -18.190950101984118 7 -20.114119379255708 8 -22.020302163549029 9 -24.152245536943614
		 10 -26.683013941968881 11 -29.689770181731042 12 -32.282746549769001 13 -34.067755080518275
		 14 -34.768533073940013 15 -34.520257096947944 16 -33.380031672580145 17 -32.022799604291251
		 18 -30.562667471018202 19 -28.952036043094228 20 -27.030077734414036 21 -24.774196503869373
		 22 -22.124143388396629 23 -18.972056074439806 24 -15.250386269607608 25 -11.420407866871223
		 26 -6.95526287578741 27 -2.3993307570340248 28 1.845350469260215 29 4.9211695950527261
		 30 5.7435468756744843 31 4.4385828103439282 32 0.8283505881854244;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Elbow_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 40.870432340547914 1 38.333660007953512
		 2 34.132954263384555 3 28.794623293698763 4 23.161226115441245 5 14.101922449049974
		 6 12.508621399551419 7 11.649735842168932 8 11.748146094661767 9 12.529753904344444
		 10 13.719471705975069 11 14.955606031696409 12 15.845576172560495 13 16.593783084778604
		 14 16.616813781105812 15 16.591597058939453 16 16.612437570953922 17 16.634211724695049
		 18 16.533975174030839 19 16.227514086588208 20 16.263770436322776 21 16.912116040742085
		 22 18.453304007403545 23 20.843955424215888 24 24.069969351754668 25 27.551272036875819
		 26 31.277025377619864 27 34.522576547330658 28 37.30271598654879 29 39.663345220127347
		 30 41.303791727917684 31 41.792063616605866 32 40.870432340547914;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Elbow_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -10.019797069183911 1 -6.4901035462628469
		 2 -3.7218042714049271 3 -2.131114700499376 4 -1.4479628558280928 5 -0.67342755415987832
		 6 -0.63956795362480667 7 -0.87630087235673226 8 -1.6130563305646781 9 -2.5981343396811685
		 10 -3.6505327224689372 11 -4.7120340753793446 12 -5.5473345434693675 13 -5.7858944251279594
		 14 -5.0329636519174237 15 -3.7445323160205413 16 -2.8451797955099964 17 -2.1801053992499142
		 18 -1.6435938771948602 19 -1.2674266640002561 20 -0.9160485223781305 21 -0.52132595797657111
		 22 -0.37882072722796706 23 -0.72595066106529649 24 -1.9472843477030344 25 -3.864173108401578
		 26 -6.6063912844699608 27 -9.5890929475264528 28 -12.424116224107564 29 -14.381753685604018
		 30 -14.683865935041567 31 -13.148287624791905 32 -10.019797069183911;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Wrist_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 7.3203610317495293 1 8.363041417942128
		 2 9.2522299158717001 3 9.6946994791278041 4 9.6610611721093118 5 6.7425394702186061
		 6 8.9084363483222315 7 10.955458896863867 8 12.834608174059822 9 14.559820097990427
		 10 16.201775595046904 11 17.865100902379304 12 18.620408526737972 13 18.413689651772845
		 14 18.379335810973892 15 18.989123118662903 16 21.074517073829465 17 23.039704373218562
		 18 24.294027992704304 19 24.524534878099548 20 23.730111814626017 21 21.934688169581797
		 22 19.953087175029395 23 18.059467352063809 24 16.10938667953587 25 13.922654442272391
		 26 11.373352748041938 27 8.9429122501758389 28 7.01184337025897 29 6.2418406010092138
		 30 6.2190847038125039 31 6.5448249708105894 32 7.3203610317495293;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Wrist_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.9809639230750422 1 4.0776131191330363
		 2 4.2192959808943424 3 4.0414263622799709 4 3.6056303871028086 5 1.4304797590346732
		 6 0.46717430398496584 7 -0.91125556957664744 8 -2.1876995011912475 9 -3.1229528892158611
		 10 -3.6383610790424132 11 -3.7465203559189542 12 -3.4004622167830556 13 -3.4025574928713795
		 14 -4.1052981510325246 15 -5.0789651165547749 16 -5.2964605924689172 17 -5.0905454733805104
		 18 -4.7483432791545876 19 -4.3809399145338963 20 -4.0534698508846434 21 -3.9447271361686509
		 22 -3.9794512536267921 23 -4.225838138946286 24 -4.4899894668599689 25 -4.4344584281185968
		 26 -4.1159282094185734 27 -3.6429729215768001 28 -2.8535198000174553 29 -1.6584629158476054
		 30 -0.19346067126149671 31 1.344038384090372 32 2.9809639230750422;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Wrist_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 6.2621718911248818 1 5.888090082452039
		 2 5.8661917148338345 3 5.8984894456820243 4 5.8517341964401979 5 3.4759847360328449
		 6 0.25653431116886971 7 -1.8102770986024692 8 -3.2547993765485712 9 -3.386401867373571
		 10 -1.6431522048695328 11 0.37271078130449192 12 -1.1793310412543152 13 -4.5702313311716729
		 14 -6.5469384650970941 15 -6.5736725960490014 16 -5.8125742870430823 17 -4.7659421563963758
		 18 -2.7796998788979499 19 -1.2353313594385598 20 -1.7801142180669614 21 -2.5271716011771228
		 22 -2.3915661578724472 23 -0.3407233890394622 24 2.5114410895420529 25 4.3394496655334374
		 26 5.3167736605104592 27 5.8921484488962514 28 6.4015591976456285 29 6.8900325750040139
		 30 7.1237885212363343 31 6.8565083539159559 32 6.2621718911248818;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Hip_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 3.5564672066936009 1 3.5755274514147688
		 2 3.6119444778414151 3 3.6336644627691199 4 3.5832404408304175 5 3.2661472802798288
		 6 3.1712529954665256 7 3.0365614267818577 8 2.8837775163368837 9 2.7527500861531924
		 10 2.6570702553734313 11 2.5542490943013298 12 2.3878276356838226 13 2.1206256155380894
		 14 1.7942253867406825 15 1.5641243150109061 16 1.5539102376335121 17 1.9981099208708109
		 18 2.8285753886501195 19 3.8156287962139732 20 4.6313280827748473 21 5.1015356356072665
		 22 5.1469750089931923 23 4.7933142313801929 24 4.1344280569581624 25 3.6026287463085604
		 26 3.2974626415526864 27 3.1296645414577928 28 3.0532301042273224 29 3.0643681428056677
		 30 3.2748543359464986 31 3.4885723951144567 32 3.5564672066936009;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Hip_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -4.6954113047885828 1 -6.4760112423823459
		 2 -7.8721201228480933 3 -8.7073656277591809 4 -8.9758289155566473 5 -7.8460935537662593
		 6 -7.1575915284595277 7 -6.8824187301699551 8 -6.9891319352010681 9 -7.0694844836664297
		 10 -6.706246985233113 11 -5.7364823073010607 12 -4.1807385682809786 13 -2.1930083208844575
		 14 0.13120646359376367 15 2.7018221013224091 16 5.1338866115837494 17 6.8362768590950784
		 18 7.4186328478425008 19 6.9735794533673809 20 5.7128013092567196 21 4.0737209502337786
		 22 2.4169091392629345 23 0.99924991357159709 24 0.037088006393789362 25 -0.18449563810625469
		 26 -0.080201476540819647 27 -0.062310704588902047 28 -0.23716816850664774 29 -0.96927406595270915
		 30 -2.0907942144688572 31 -3.0644480176263911 32 -4.6954113047885828;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Hip_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -19.798232396641097 1 -18.101941702172116
		 2 -15.996766934032605 3 -13.594834236016446 4 -10.905197234185609 5 -4.4704395852074876
		 6 -1.1478230590000609 7 1.270289535218885 8 2.762659308866644 9 3.9459268093607416
		 10 5.3513813610309038 11 7.1502652206739867 12 8.5915301168675775 13 8.5796248845891014
		 14 7.3955831546555215 15 3.9040693201338308 16 -0.8769053821005719 17 -6.1749287281692515
		 18 -11.604345137278816 19 -16.370767790398375 20 -19.863423957661794 21 -22.191596212492549
		 22 -23.439675689753781 23 -23.662543572122761 24 -23.005130536419717 25 -22.015044189027833
		 26 -21.125549845665798 27 -20.913728292848873 28 -21.075408415765153 29 -21.433781568071669
		 30 -21.448005702258992 31 -20.991971605806555 32 -19.798232396641097;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Knee_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 9.6084366021367895 1 9.9884114243677207
		 2 10.15200190082105 3 10.101547978890808 4 9.5149039753486857 5 7.3117549047767207
		 6 6.3352021004710384 7 5.4682048677244994 8 4.6500422583151311 9 3.9503769865827336
		 10 3.4543120367845854 11 3.0823462961053112 12 2.7994240823917451 13 2.4451280782256082
		 14 1.8800411930104097 15 1.1655218508439833 16 0.50162083200441177 17 0.1957677500061635
		 18 0.46291797858879546 19 1.6613304916423905 20 3.9208291597718987 21 6.4709506881827128
		 22 8.6088193450049868 23 9.4883644238369467 24 9.2451265002427352 25 8.1739816362039956
		 26 7.3271319156815879 27 6.78554486066355 28 6.6945020555308306 29 7.0708655864605303
		 30 8.1316127097945667 31 9.0003041307862652 32 9.6084366021367895;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Knee_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.4722706979256852 1 3.0356470908271316
		 2 3.3611188571966069 3 3.4010910273797399 4 3.3552324262619635 5 3.1227204176585337
		 6 3.7468242908609364 7 4.2989069933944064 8 4.7452559361932209 9 4.8503795065608655
		 10 4.6093809970267561 11 4.0912187684955814 12 3.5318138254798797 13 3.1115303350474464
		 14 2.9803162678666091 15 2.9917027842829484 16 3.2486338775689667 17 3.93530667846025
		 18 5.2232669374672902 19 6.5271729956916564 20 6.9098257680015713 21 6.6582446816321159
		 22 5.5356507075680987 23 3.859380276793416 24 1.9753173775640134 25 1.0967554016281571
		 26 0.98575782735804929 27 1.0256526992918917 28 1.0394926952598591 29 1.0433205860347581
		 30 1.379519428274822 31 1.8682321828618638 32 2.4722706979256852;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Knee_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 48.552082748434692 1 50.865329919226113
		 2 51.023970844588931 3 49.837096406997865 4 47.335739811484864 5 39.013922469858691
		 6 34.382550963863935 7 31.2948489240387 8 31.23003748817866 9 32.382591838810441
		 10 33.964235875152347 11 35.539507173615256 12 37.831033585492612 13 41.623008353337312
		 14 46.944729533882061 15 53.326505983247124 16 59.916854428815121 17 65.694703316313337
		 18 69.802828103656779 19 71.474383408071674 20 70.091296183402619 21 65.660300100752309
		 22 59.043825877285769 23 50.765158471726664 24 41.504556923584921 25 33.798190186698299
		 26 27.997430888933291 27 26.840577211159911 28 27.73385769014482 29 32.349660760278617
		 30 38.369700248915926 31 44.352856464977243 32 48.552082748434692;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Ankle_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 11.679704397179259 1 12.505395706750511
		 2 12.673901463027937 3 12.492704376765774 4 11.628184680295151 5 8.5203649585908359
		 6 7.6695406128385128 7 6.8769177446434382 8 6.0812045096087823 9 5.2292597752165797
		 10 4.3226855656142513 11 3.3736251971630202 12 2.5728616614054158 13 2.083719838396211
		 14 2.2171051406410744 15 2.8734955519106546 16 3.7367994282791814 17 4.531912374656951
		 18 5.3785909188844636 19 6.13077910015478 20 6.9177951162750384 21 7.9432728293526074
		 22 9.0338186206938662 23 9.7513123624017677 24 9.848183540703797 25 9.5072099562268999
		 26 9.166468060451459 27 8.8476780603920542 28 8.7716064254581649 29 9.0886630301278721
		 30 10.166910953624294 31 10.849542603358129 32 11.679704397179259;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Ankle_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 7.6574835104906169 1 8.3901490073884908
		 2 8.3264594369713514 3 7.3945556208085055 4 5.8683945420708685 5 1.3489637566461314
		 6 -0.22086573712607491 7 -1.4170924154366882 8 -2.6436458113444936 9 -3.8888472151022802
		 10 -4.9574942683110139 11 -5.9553704448765812 12 -7.2827502739230052 13 -9.1641044003478331
		 14 -11.48655240815288 15 -13.655562314087325 16 -14.43779454256978 17 -13.884515294099499
		 18 -11.204486390205878 19 -7.0558884113251574 20 -2.6535193791641993 21 0.46042094816404378
		 22 1.1603423736456373 23 1.0781693798485008 24 -0.055997107904073168 25 -1.799846103781346
		 26 -3.2461706250689728 27 -3.295175556563676 28 -1.4286815439540816 29 2.9125311144009762
		 30 6.9009057376750471 31 6.8885101919109708 32 7.6574835104906169;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Ankle_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -21.000343614237241 1 -23.555328791575672
		 2 -23.975466773023644 3 -23.371746804157482 4 -20.718307038465944 5 -10.777173935434009
		 6 -4.1885120546104613 7 1.2420882711724157 8 4.2122927153717189 9 4.592280915281056
		 10 3.8851031464652723 11 2.9806066931312611 12 3.0502184422308929 13 4.9711488162189941
		 14 10.003192184413635 15 16.104196661967638 16 20.826327930689327 17 22.25820703973455
		 18 21.295786514826297 19 17.528390529687151 20 11.866529770372127 21 6.8994654104014161
		 22 3.4416562158909993 23 0.87403448219849444 24 -1.494812484039566 25 -3.0730676112405524
		 26 -4.266180355920004 27 -5.2315348625244926 28 -6.2997476766868754 29 -8.5945067196301057
		 30 -13.066855903110062 31 -17.445837367125652 32 -21.000343614237241;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Toes_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -10.039915373200284 1 -10.289217112378825
		 2 -11.314226359069083 3 -13.327746698210388 4 -16.2086682215167 5 -25.233614300756493
		 6 -30.973426139363653 7 -36.384714404366214 8 -40.142668085112284 9 -42.335533874073114
		 10 -43.751412581459284 11 -45.563698487645972 12 -48.396227123399576 13 -52.89714487040137
		 14 -58.705307549043575 15 -60.042429218984488 16 -54.096769193745679 17 -40.643399856826306
		 18 -27.246299564756594 19 -22.337048346365361 20 -17.853909506903705 21 -13.130581317400944
		 22 -8.8965483007086075 23 -6.3300891833733193 24 -5.9901219610844096 25 -5.9947225633921821
		 26 -5.9950113151501183 27 -5.9962983812563397 28 -6.1972761816411994 29 -7.1424583117372578
		 30 -8.3709581763720919 31 -9.6561644693444926 32 -10.039915373200284;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Hip_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.94501791373264821 1 -0.64142458893070464
		 2 0.018484912171536267 3 1.1625539703820753 4 2.5742509713298523 5 3.6382224853434244
		 6 2.5484411623001924 7 1.3304513094702022 8 0.23155224338409056 9 -0.64811433243198513
		 10 -1.3087832615913677 11 -1.8607241967714792 12 -2.3527013968843296 13 -2.751061153555125
		 14 -2.8839192742377251 15 -2.776540252691281 16 -2.2869624090411751 17 -1.6628837949623585
		 18 -1.0390388729672448 19 -1.0650396162737144 20 -1.6930887534666863 21 -2.80809549525594
		 22 -3.8474253116532946 23 -4.5439768971677665 24 -4.7393741859678435 25 -4.4910787754154731
		 26 -3.9513922809972479 27 -3.1778750526946875 28 -2.2818042699890464 29 -1.5433866138817487
		 30 -1.2470828924484352 31 -1.1545688349856464 32 -0.94501791373264821;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Hip_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 11.806376244546525 1 14.295982010043536
		 2 15.310451163525325 3 15.189356735985738 4 13.506668035285234 5 7.2135515893371664
		 6 5.3030398892884847 7 4.4785429429608641 8 4.6584978953618394 9 5.1755965309510268
		 10 5.3590813160796191 11 4.5098731598451458 12 3.3282770200717873 13 1.9404065926149969
		 14 0.42505798252719285 15 -1.4404951005056073 16 -3.3612425027099753 17 -4.6980267399570295
		 18 -5.3814827772484559 19 -5.6245016068652598 20 -5.4835989844827191 21 -4.9992837505840209
		 22 -4.3392943013218233 23 -3.6610776351153107 24 -3.0382223559307531 25 -2.5548095999793836
		 26 -1.975917174681437 27 -0.93247342724225946 28 0.7618314145369246 29 3.0333967051235025
		 30 5.6732230231519702 31 8.6624560920874512 32 11.806376244546525;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Hip_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 9.1035791375842052 1 5.4046259483521784
		 2 0.84105380666595397 3 -4.1673499932941667 4 -9.0882456535078404 5 -16.869781052804282
		 6 -17.890182577573562 7 -18.258459715924317 8 -18.224326216212209 9 -18.207289759455243
		 10 -18.889243559062251 11 -21.362350314313698 12 -22.702358843532767 13 -22.808744291927649
		 14 -22.544216703314348 15 -21.791657416905508 16 -20.525583398709433 17 -18.344876290073639
		 18 -15.040385649695908 19 -11.121970331988885 20 -6.8196727849576062 21 -2.7602390626547693
		 22 0.84391737980171799 23 4.0476577492285033 24 6.7856883015452327 25 8.4436277556610353
		 26 9.827880015728832 27 11.140532762672137 28 12.380224138320413 29 13.096671468356929
		 30 13.140187374524807 31 11.82676961515728 32 9.1035791375842052;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Knee_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.604153607084609 1 2.8291684740978336
		 2 2.7890142285693575 3 2.7291729606656627 4 2.7690477618471223 5 3.4582408758008163
		 6 3.3683086932872799 7 2.6396067975157584 8 1.457603749903833 9 0.3330601599275414
		 10 -0.42283875539736232 11 -0.75170245537817926 12 -0.79217757993206717 13 -0.64047276747446114
		 14 -0.20210969457564734 15 0.40758741330354903 16 1.0739943588132501 17 1.6973200305404865
		 18 2.1670228128303184 19 1.9368823065983363 20 0.75609686963746026 21 -0.87626553403692364
		 22 -2.4141229421564194 23 -3.4538784628584076 24 -3.7730042612534094 25 -3.5005956558725502
		 26 -2.8872371292101975 27 -1.9461775742967977 28 -0.72470034341551437 29 0.49950508128064092
		 30 1.369125144616804 31 2.0402302029256534 32 2.604153607084609;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Knee_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.4220075793268259 1 -3.3309068415716498
		 2 -2.6410122147539963 3 -1.3883316132349617 4 0.043465861034468693 5 0.65699718644942651
		 6 -0.75848226377569161 7 -1.7371103446627909 8 -1.8040736557178139 9 -1.6522638405979395
		 10 -1.5814119712739911 11 -1.9973989138022299 12 -2.5517451745190249 13 -3.031575755048741
		 14 -3.427798464199181 15 -3.3878390780293484 16 -2.982583605348113 17 -2.7263869385520079
		 18 -2.6944101576885249 19 -2.7167533942802167 20 -2.4588538666883624 21 -1.5943765648322652
		 22 -0.30110929222243482 23 1.0922724486283861 24 1.9566281809651016 25 1.8562225422064307
		 26 1.2960724884081354 27 0.46850561539721486 28 -0.57642574722904905 29 -1.6598963885278679
		 30 -2.491672567309196 31 -3.1281284463730632 32 -3.4220075793268259;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Knee_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 45.59748730570152 1 52.425716006073642
		 2 58.821960450799295 3 64.262771742575453 4 67.912037319924721 5 65.837090627471525
		 6 58.15255679324936 7 49.680001393269244 8 41.476897925157388 9 35.107725870260396
		 10 33.243268414153668 11 36.749672916264892 12 40.970339280812446 13 45.189545228684516
		 14 49.448715787084538 15 53.020197551953281 16 54.500561845012555 17 54.503537965258126
		 18 51.543491070951035 19 46.890911926491405 20 40.870285487053749 21 34.733179300442998
		 22 29.004380568877401 23 23.845109410359434 24 19.804987804062471 25 18.346400560509977
		 26 18.898228237252134 27 20.487220803040334 28 23.143466902123333 29 27.108141160184427
		 30 32.448364072744134 31 38.622351591878434 32 45.59748730570152;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Ankle_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.1812832087486216 1 2.7896456898417554
		 2 5.0277767428554396 3 8.2749161073095561 4 11.768563706317124 5 17.28176720402071
		 6 17.160524908217848 7 16.070628384015137 8 13.890997695913303 9 11.520736059020338
		 10 10.448055624876801 11 10.45916912155149 12 12.140521351982683 13 14.405964541989661
		 14 16.681464720459417 15 18.625017839049434 16 19.315887510398461 17 19.000994181318546
		 18 18.192005485776885 19 17.6824381014486 20 17.529239992972872 21 17.38682726170045
		 22 17.220903268690002 23 17.015442336156436 24 16.420404234094551 25 15.170416037712579
		 26 13.307049917234723 27 10.992917333939181 28 8.3661054378671675 29 5.8202645022132327
		 30 3.8808141487616536 31 2.5327397136917091 32 2.1812832087486216;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Ankle_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -8.6441930339663724 1 -8.7209970115797031
		 2 -8.4721344500323568 3 -7.3225586463504522 4 -4.8450485900953009 5 3.9154368807412503
		 6 3.0053309607371959 7 0.11263091513293512 8 -4.3735769970714582 9 -8.553142476741419
		 10 -9.5942802036641215 11 -4.3497409145098995 12 0.038967845994368144 13 3.6263968741092585
		 14 6.2828974470804848 15 8.3635511527211257 16 9.0695316570106037 17 8.441366259845088
		 18 7.9501658907210704 19 7.4839468276018293 20 6.3793886675187679 21 3.6657319810429967
		 22 -0.053687207454951903 23 -3.2043408109214182 24 -4.4739184515380339 25 -4.594099469141633
		 26 -4.74889183730214 27 -5.1813362189214356 28 -5.6950095658123825 29 -6.1120682498205348
		 30 -6.5722338439943284 31 -7.5835876669075066 32 -8.6441930339663724;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Ankle_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 6.1134520614662513 1 11.828658174471474
		 2 13.68048707183824 3 13.279193555335537 4 9.5020901436691325 5 -1.4402639357852731
		 6 -4.4583549522987216 7 -7.4661708115750249 8 -10.224325631540147 9 -12.223146280511529
		 10 -13.487589049313961 11 -14.956345644833871 12 -16.352017161979891 13 -18.495230282072988
		 14 -22.087665523704882 15 -25.398179161536508 16 -27.415895449463186 17 -28.183184721064976
		 18 -27.934346658142264 19 -26.223950488899092 20 -22.863081306406603 21 -18.74429108877499
		 22 -14.268692039601051 23 -9.8230190507169528 24 -6.3318531821416038 25 -4.8462944375476917
		 26 -5.1540144488629576 27 -6.1313087037543363 28 -7.0008590893017582 29 -7.0568602962799387
		 30 -4.6909922943268523 31 -0.16330006282399417 32 6.1134520614662513;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Toes_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -50.889346722917857 1 -51.145652715718825
		 2 -43.515363388163962 3 -27.350585253819848 4 -16.575218230526808 5 -9.4155912953921206
		 6 -7.5703418671602734 7 -6.1640830380236098 8 -5.9920353157425552 9 -5.9942963999226917
		 10 -5.9942782177312441 11 -5.9942475655212446 12 -5.9942056004077369 13 -5.9945220850856433
		 14 -6.0151068880436158 15 -6.252240150496954 16 -7.1637625531093869 17 -8.8267828778288973
		 18 -10.325682744788232 19 -11.72353113504443 20 -13.804494506637839 21 -15.886966221752587
		 22 -18.190750634557382 23 -20.674018058840073 24 -22.038087782806993 25 -22.839556516863773
		 26 -23.819381341197868 27 -25.051354560601737 28 -27.026193237787854 29 -30.617535143306046
		 30 -36.502244502228947 31 -43.877405741681173 32 -50.889346722917857;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTL -n "walk_sad:Root_M_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.21795336697558221 1 -0.2771682052224016
		 2 -0.31661302344291259 3 -0.33867344049575931 4 -0.35184884450530618 5 -0.36740235509144087
		 6 -0.33164364232170956 7 -0.28753377609896846 8 -0.23387123978279234 9 -0.16647685959573394
		 10 -0.080679306368901194 11 0.017370404764831114 12 0.12124093827452298 13 0.22170953265698398
		 14 0.30461012261657611 15 0.36682518711206624 16 0.40613528031099527 17 0.42629522630627825
		 18 0.43535792855180638 19 0.43604651436997099 20 0.4317036858583127 21 0.421678756375087
		 22 0.40658376435024174 23 0.38350571940075845 24 0.35409194878945605 25 0.31408718536242697
		 26 0.26070419627904157 27 0.19440133053783315 28 0.11675546973167389 29 0.032372834701233123
		 30 -0.056988400841204344 31 -0.14201610274498794 32 -0.21795336697558221;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTL -n "walk_sad:Root_M_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.4590200954123995 1 5.5284833274136229
		 2 5.6022284417671022 3 5.6678403778300188 4 5.7213518522126945 5 5.787794339238916
		 6 5.8153720217484857 7 5.8123361665011677 8 5.7715347957127934 9 5.6964362144363951
		 10 5.5954623513148594 11 5.4863124988999408 12 5.3781520569878936 13 5.2793387969273402
		 14 5.2104162722838074 15 5.1879327551818779 16 5.2130221272394275 17 5.2841884124584002
		 18 5.37543820637908 19 5.4729945767116046 20 5.5685695007564107 21 5.6621344299381722
		 22 5.7375693407448543 23 5.7980600403095899 24 5.8291921050527939 25 5.8295922148015533
		 26 5.7867535523624154 27 5.7017313061262849 28 5.6005938717323662 29 5.5044353557904087
		 30 5.4333195878549345 31 5.418283650781655 32 5.4590200954123995;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTL -n "walk_sad:Root_M_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.36773647626430489 1 0.34922192051314077
		 2 0.30921798192725836 3 0.26727981165168124 4 0.23313206496981795 5 0.19691840854200859
		 6 0.20348897428894305 7 0.21448885606012885 8 0.23256652162941899 9 0.26106043325528921
		 10 0.29910359822522337 11 0.33831516855858484 12 0.3740571613159801 13 0.40007539027016387
		 14 0.40861455631573712 15 0.39946554559222908 16 0.38048539311633717 17 0.36094328164853384
		 18 0.34599042395618823 19 0.33604808698056465 20 0.33181279535200497 21 0.32828203342379497
		 22 0.32014086844742995 23 0.30430989336041164 24 0.28491833337953182 25 0.26252187106667735
		 26 0.24070372022005826 27 0.23834142382668075 28 0.2512464234601835 29 0.28259457493063439
		 30 0.32484180025423948 31 0.35758995470655358 32 0.36773647626430489;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Root_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.5903040802278063 1 5.0106795237481263
		 2 4.1813243388162604 3 3.2720426063503552 4 2.4347825475179441 5 1.5749380575890901
		 6 2.2381397793304654 7 2.8610239697917121 8 3.3831258232217811 9 3.8719094451304596
		 10 4.273987828844394 11 4.384467883555752 12 4.2150206961507104 13 3.7217480257315234
		 14 3.1772205408346039 15 2.8576960055382665 16 2.8838107100157946 17 3.2672651427132169
		 18 3.7145471659834621 19 4.0544100880835252 20 4.2016162822485432 21 4.2047995630453849
		 22 4.2302570366240468 23 4.3609253998101618 24 4.5068400379857723 25 4.6432900940158133
		 26 4.7807802151437775 27 4.9323281315137253 28 5.1792861462986934 29 5.5223464194671497
		 30 5.8110397355415211 31 5.8535837280712419 32 5.5903040802278063;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Root_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -1.9022897201840752 1 -1.504033780496832
		 2 -1.2906016826072937 3 -1.3014854644605225 4 -1.5669121816545883 5 -2.2398341245888438
		 6 -1.8396171249357227 7 -1.5477134698404433 8 -1.3328889173968099 9 -1.1389607136162454
		 10 -0.58111516283755704 11 0.33628130823781571 12 1.3186237259750895 13 1.897384718725867
		 14 2.0332816077627096 15 1.9580865782371915 16 1.6751060592308673 17 1.1565274133529453
		 18 0.54240318485613337 19 -0.095103698639973866 20 -0.7468996103145642 21 -1.3944830320597477
		 22 -1.9338896472385108 23 -2.4036265749441861 24 -2.6726365272699573 25 -2.7948750046948039
		 26 -2.73893690542458 27 -2.4005055795809263 28 -2.2428270607084957 29 -2.3294743097931199
		 30 -2.3623559303818626 31 -2.2440992276739373 32 -1.9022897201840752;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Root_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.17760846572375752 1 1.0040794440534457
		 2 1.7484698095303615 3 2.2254207419839895 4 2.4222685805014903 5 2.0827767365391816
		 6 1.52638652738984 7 0.97567200299223056 8 0.49188269706397186 9 0.1137166277650523
		 10 -0.11594887712702343 11 -0.29603777475606102 12 -0.51281926177976744 13 -0.69112190141408447
		 14 -0.69827754080052507 15 -0.46756292645230207 16 -0.11140746353284671 17 0.20463422741568882
		 18 0.37133322691848952 19 0.42730135166184247 20 0.36935186637360606 21 0.20410895052694139
		 22 -0.0016390880984511378 23 -0.24382168880976923 24 -0.45395815442232457 25 -0.59505961954505204
		 26 -0.6307750902363064 27 -0.66387589132454772 28 -0.76072277301729596 29 -0.85111439938662048
		 30 -0.83608592335683929 31 -0.49467988056945927 32 0.17760846572375752;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Spine1_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -16.319474200823738 1 -15.561691103276935
		 2 -14.038731034338561 3 -12.042669340478991 4 -9.9559925282112971 5 -7.1493374274894279
		 6 -6.2536147829990076 7 -5.3789147158584463 8 -4.5324841421897535 9 -3.879832464909688
		 10 -3.3145169062465314 11 -2.749511706160837 12 -2.2714892754421063 13 -1.9867128677685237
		 14 -2.2008474954922153 15 -3.1858883079062483 16 -4.8568810867095458 17 -6.882616701950953
		 18 -8.7326332396125999 19 -10.189429818874103 20 -11.2068201222065 21 -12.035386836057802
		 22 -12.782995704485021 23 -13.6577007470437 24 -14.505969830532717 25 -15.149679973407588
		 26 -15.480909969429446 27 -15.561269303898438 28 -15.544102723710358 29 -15.638427150268857
		 30 -16.024945538977995 31 -16.353942656816418 32 -16.319474200823738;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Spine1_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 3.7171228299529484 1 3.0442930004663658
		 2 2.6617494749985271 3 2.6851661015737038 4 3.0759549425642545 5 3.9059301806915885
		 6 3.4468240456193016 7 3.0985847141209364 8 2.9536751701042263 9 2.9000022951541027
		 10 2.3428019300359004 11 1.1722320537861373 12 -0.35794369978396046 13 -1.566245277117887
		 14 -2.252367121577258 15 -2.5381283135918671 16 -2.4415240795134343 17 -1.7760422049751619
		 18 -0.96836712471018138 19 -0.14272817146729364 20 0.63630446409778196 21 1.3858814847830436
		 22 2.0589325706240533 23 2.7253692892527526 24 3.1684746622508473 25 3.5238972805421414
		 26 3.7005150824896025 27 3.5646029697715642 28 3.6812023511354379 29 4.1310718970845315
		 30 4.3515547853018282 31 4.2350916685632267 32 3.7171228299529484;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Spine1_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 13.338809427775962 1 13.216656841417844
		 2 13.292991426239402 3 13.538472932014786 4 13.744337502706244 5 13.789730503485689
		 6 13.45862975989094 7 13.210827708087059 8 13.051646110506924 9 13.077809823438971
		 10 13.491399201717988 11 14.282084743308815 12 15.419670537925306 13 16.623721948970196
		 14 17.596339517923603 15 18.282473606938741 16 18.505108810292192 17 18.351607917841196
		 18 17.824281145140915 19 17.011448519377549 20 16.035634232990695 21 14.968710636768384
		 22 13.981339864465305 23 13.063322226087791 24 12.482397350069517 25 12.103679306569491
		 26 11.822648076980164 27 11.815444108171056 28 12.145294590790968 29 12.674831699046768
		 30 13.149174613683034 31 13.370212188407429 32 13.338809427775962;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Spine2_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 6.7990098361949736 1 6.4890329596550655
		 2 5.877028014201457 3 5.082369884603648 4 4.2641860689906173 5 3.1749824121198809
		 6 2.8032628704692724 7 2.4547975348185727 8 2.1326756206801609 9 1.8921257684911938
		 10 1.6504516463521424 11 1.3602836061556007 12 1.0657326258883377 13 0.8403686192409876
		 14 0.82406643601043805 15 1.164036388812143 16 1.8079039822341663 17 2.6352233224464361
		 18 3.4130293144984489 19 4.0418999523404491 20 4.502748554969874 21 4.8944730546064976
		 22 5.24735835451364 23 5.6420380960539003 24 6.0042557566459003 25 6.2732033533858589
		 26 6.4123296661087563 27 6.442152413011784 28 6.450895727467592 29 6.5181047784338704
		 30 6.6884489815220105 31 6.8182967269652055 32 6.7990098361949736;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Spine2_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -1.6359700613545387 1 -1.3456575923927809
		 2 -1.0547196680282642 3 -0.82791506808127568 4 -0.70186367717953591 5 -0.67622616695105309
		 6 -0.50715218036796539 7 -0.35321498930110468 8 -0.27323465020542098 9 -0.23898398564146278
		 10 -0.14789904398317039 11 0.046097330062958804 12 0.34377887112301442 13 0.61180823489124325
		 14 0.72046262664230132 15 0.68230040655663093 16 0.47096205879285158 17 0.1279625304419062
		 18 -0.25133247655649743 19 -0.64199591596345873 20 -1.0080733212815864 21 -1.3225175408116643
		 22 -1.5564143621897444 23 -1.7470420887354334 24 -1.8378122220093918 25 -1.887661124352972
		 26 -1.9008846765508942 27 -1.8712938853375527 28 -1.8770733751509496 29 -1.9221088391774643
		 30 -1.9285124525550275 31 -1.8386625756833077 32 -1.6359700613545387;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Spine2_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.76021935968001497 1 0.88756545270470499
		 2 0.91997713088105237 3 0.89252606252623878 4 0.84765210158602 5 0.8528983644961502
		 6 1.0036682709442322 7 1.1140844779122485 8 1.1800522259675277 9 1.1677174655902332
		 10 1.0065005560419886 11 0.70257530674324431 12 0.2617792484965365 13 -0.21391527319730669
		 14 -0.60004652391180602 15 -0.86755221323822429 16 -0.95401409845367358 17 -0.91433289896689962
		 18 -0.7435663137332309 19 -0.47417388717825465 20 -0.14181233368089818 21 0.23065663681722204
		 22 0.58029180538751357 23 0.90321297573942139 24 1.104324891852587 25 1.2343644448419162
		 26 1.3367876302208876 27 1.3407393355265211 28 1.2064271698941704 29 0.98139695169929753
		 30 0.77932499866218707 31 0.6973795503443635 32 0.76021935968001497;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Chest_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -6.8227195012794866 1 -6.5104981952310776
		 2 -5.8941340305852963 3 -5.0950799014082211 4 -4.2743687184874775 5 -3.1848873802011806
		 6 -2.8118084869430175 7 -2.4612427679515729 8 -2.1378812010061909 9 -1.8965835193724907
		 10 -1.652761724824843 11 -1.3595687918599413 12 -1.0641947512424479 13 -0.84269445861681502
		 14 -0.83127439197629993 15 -1.1741951376794164 16 -1.8156512008119403 17 -2.6369331291578968
		 18 -3.4095153933138236 19 -4.0367409669379812 20 -4.5009566919689536 21 -4.9010175833437639
		 22 -5.2646498288311641 23 -5.6711893674838718 24 -6.0412371771281492 25 -6.3152754840967775
		 26 -6.4578830522583974 27 -6.4871891115454767 28 -6.4926345542933168 29 -6.5533011675942445
		 30 -6.7174809483861599 31 -6.8428514275203671 32 -6.8227195012794866;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Chest_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.5344837841060199 1 1.2371098531430367
		 2 0.9542268405511346 3 0.74553242452622948 4 0.6361608029001139 5 0.62787378313680997
		 6 0.45737299000220133 7 0.3051060542418032 8 0.22899069117117193 9 0.20038035274664107
		 10 0.1188432364249138 11 -0.062743548493012891 12 -0.34861380687453469 13 -0.60860056556552045
		 14 -0.71230634243886848 15 -0.66270316506621807 16 -0.44021558972605229 17 -0.086024114330814763
		 18 0.29510749651341434 19 0.67376477494014342 20 1.0160943579762409 21 1.2979986039634328
		 22 1.496703489819365 23 1.6495553639092564 24 1.7118765828591298 25 1.7393445309810511
		 26 1.7420669104777322 27 1.7088840968869918 28 1.7290837592415678 29 1.7979412448927219
		 30 1.8229804133808296 31 1.7431896758791783 32 1.5344837841060199;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Chest_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.94621269036287625 1 -1.0304289551348087
		 2 -1.0286991777606371 3 -0.96166212444042531 4 -0.89758385066429969 5 -0.88909494875508954
		 6 -1.0273019518803959 7 -1.128194228427615 8 -1.189186795151447 9 -1.1752224226896684
		 10 -1.010328958054701 11 -0.70127139005235484 12 -0.25537242094500084 13 0.22287786123109782
		 14 0.61060224785919581 15 0.88114217594289568 16 0.96875455952626122 17 0.91865968830839184
		 18 0.72725029692937537 19 0.42772095216613054 20 0.062231616605741377 21 -0.34273225836381066
		 22 -0.72043687858999017 23 -1.0709872434008503 24 -1.2910287115480092 25 -1.4336266775050237
		 26 -1.5416328459425237 27 -1.5442534796469056 28 -1.4101248297773095 29 -1.1937990337808675
		 30 -0.99864001389515411 31 -0.91345937942669841 32 -0.94621269036287625;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Scapula_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.1817433459952025e-006 1 -2.1817433459952025e-006
		 2 -2.1817433459952025e-006 3 -2.1817433459952025e-006 4 -2.1817433459952025e-006
		 5 -2.1817433459952025e-006 6 -2.1817433459952025e-006 7 -2.1817433459952025e-006
		 8 -2.1817433459952025e-006 9 -2.1817433459952025e-006 10 -2.1817433459952025e-006
		 11 -2.1817433459952025e-006 12 -2.1817433459952025e-006 13 -2.1817433459952025e-006
		 14 -2.1817433459952025e-006 15 -2.1817433459952025e-006 16 -2.1817433459952025e-006
		 17 -2.1817433459952025e-006 18 -2.1817433459952025e-006 19 -2.1817433459952025e-006
		 20 -2.1817433459952025e-006 21 -2.1817433459952025e-006 22 -2.1817433459952025e-006
		 23 -2.1817433459952025e-006 24 -2.1817433459952025e-006 25 -2.1817433459952025e-006
		 26 -2.1817433459952025e-006 27 -2.1817433459952025e-006 28 -2.1817433459952025e-006
		 29 -2.1817433459952025e-006 30 -2.1817433459952025e-006 31 -2.1817433459952025e-006
		 32 -2.1817433459952025e-006;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Scapula_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.4203839476090244e-006 1 2.4203839476090244e-006
		 2 2.4203839476090244e-006 3 2.4203839476090244e-006 4 2.4203839476090244e-006 5 2.4203839476090244e-006
		 6 2.4203839476090244e-006 7 2.4203839476090244e-006 8 2.4203839476090244e-006 9 2.4203839476090244e-006
		 10 2.4203839476090244e-006 11 2.4203839476090244e-006 12 2.4203839476090244e-006
		 13 2.4203839476090244e-006 14 2.4203839476090244e-006 15 2.4203839476090244e-006
		 16 2.4203839476090244e-006 17 2.4203839476090244e-006 18 2.4203839476090244e-006
		 19 2.4203839476090244e-006 20 2.4203839476090244e-006 21 2.4203839476090244e-006
		 22 2.4203839476090244e-006 23 2.4203839476090244e-006 24 2.4203839476090244e-006
		 25 2.4203839476090244e-006 26 2.4203839476090244e-006 27 2.4203839476090244e-006
		 28 2.4203839476090244e-006 29 2.4203839476090244e-006 30 2.4203839476090244e-006
		 31 2.4203839476090244e-006 32 2.4203839476090244e-006;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Scapula_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -8.1415927139264375e-006 1 -8.1415927139264375e-006
		 2 -8.1415927139264375e-006 3 -8.1415927139264375e-006 4 -8.1415927139264375e-006
		 5 -8.1415927139264375e-006 6 -8.1415927139264375e-006 7 -8.1415927139264375e-006
		 8 -8.1415927139264375e-006 9 -8.1415927139264375e-006 10 -8.1415927139264375e-006
		 11 -8.1415927139264375e-006 12 -8.1415927139264375e-006 13 -8.1415927139264375e-006
		 14 -8.1415927139264375e-006 15 -8.1415927139264375e-006 16 -8.1415927139264375e-006
		 17 -8.1415927139264375e-006 18 -8.1415927139264375e-006 19 -8.1415927139264375e-006
		 20 -8.1415927139264375e-006 21 -8.1415927139264375e-006 22 -8.1415927139264375e-006
		 23 -8.1415927139264375e-006 24 -8.1415927139264375e-006 25 -8.1415927139264375e-006
		 26 -8.1415927139264375e-006 27 -8.1415927139264375e-006 28 -8.1415927139264375e-006
		 29 -8.1415927139264375e-006 30 -8.1415927139264375e-006 31 -8.1415927139264375e-006
		 32 -8.1415927139264375e-006;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Shoulder_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -6.366791167914819 1 -4.3077678692801786
		 2 -1.9566966931554421 3 0.68874268699689012 4 3.5570082593372012 5 8.3082555868807919
		 6 9.6956836459173577 7 10.820216981154045 8 11.776628818397603 9 12.562070956922033
		 10 13.006946784408893 11 13.037891504760914 12 12.884295520224015 13 12.573910207102685
		 14 12.038983570347948 15 11.143149397851705 16 9.7214340890970004 17 7.6779781456420118
		 18 5.2361179790641472 19 2.441650565619963 20 -0.34921689435518311 21 -2.9436121447057184
		 22 -5.0201307746238788 23 -6.7831334273562947 24 -7.9060433455661272 25 -8.7994700049295673
		 26 -9.6318512891457146 27 -10.329116305709885 28 -10.699342957171922 29 -10.493457302519742
		 30 -9.6417441385152518 31 -8.2129914242229169 32 -6.366791167914819;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Shoulder_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 3.2326314368782771 1 6.0647215984325662
		 2 9.3475984860902166 3 13.015188424151766 4 16.778889300738726 5 22.359509885603902
		 6 23.747938439140036 7 24.861727282271225 8 25.745441829565159 9 26.360560191667737
		 10 26.451295708747654 11 26.161848719188978 12 25.497717416687159 13 24.509222779535925
		 14 23.293755687681013 15 21.855357324762643 16 20.198184606876975 17 18.254057698013536
		 18 16.030912201874195 19 13.404938681018109 20 10.55800706072241 21 7.5758332523449523
		 22 4.8665656678691294 23 2.2271255409200141 24 0.33859743051918501 25 -1.0481786017855832
		 26 -2.2318506659581767 27 -3.0831707408863753 28 -3.2793140207675164 29 -2.7097816946836137
		 30 -1.299884745537891 31 0.72722959459741321 32 3.2326314368782771;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Shoulder_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -75.142027173852441 1 -75.424980479190467
		 2 -75.390566239420821 3 -75.245308710498335 4 -75.103235583449745 5 -74.882109645893749
		 6 -73.768752993468865 7 -72.75495061110189 8 -71.881014763440049 9 -71.222549610855935
		 10 -70.683008742256007 11 -70.332076918991604 12 -70.509110361602268 13 -71.305285643264938
		 14 -72.454863232917461 15 -73.754178007434419 16 -74.752166812067159 17 -75.217317926914177
		 18 -75.188945042892215 19 -74.712345309164334 20 -73.96325054010596 21 -73.158820062379149
		 22 -72.501373345428604 23 -72.007701581882813 24 -71.733410749149883 25 -71.562106315664863
		 26 -71.537031042216753 27 -71.761822903353391 28 -72.267202539329659 29 -72.985483634919134
		 30 -73.846454990021442 31 -74.602818878905666 32 -75.142027173852441;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Elbow_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.4631211595460805 1 -5.7659665465202519
		 2 -6.1533913970181215 3 -6.559653437818759 4 -6.5511576775679474 5 -5.2372984800547808
		 6 -3.1745020645144906 7 -1.3167355073567404 8 0.43853330020713549 9 2.1211847434553337
		 10 3.646291815935828 11 4.8400407647160488 12 5.613720795260261 13 6.0880348057176352
		 14 6.1747778649246507 15 5.6505544256736648 16 4.438907684509628 17 2.5244390018840148
		 18 0.4000939703349326 19 -1.6735228140624014 20 -3.2492710398350786 21 -4.1125973223839773
		 22 -4.2590002517998853 23 -3.7735435847943646 24 -3.1061763408052094 25 -2.8458482089090733
		 26 -2.8432428728008099 27 -3.1573955711259369 28 -3.7569595158801632 29 -4.4235857722656302
		 30 -4.9717245958450782 31 -5.263202869401522 32 -5.4631211595460805;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Elbow_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -8.092846059767103 1 -6.4362243151156227
		 2 -3.9339023102584441 3 -1.6163390321328484 4 -0.0052115815629040774 5 1.0971177903874956
		 6 2.7272425142493875 7 4.0657745638365501 8 4.8767729463868505 9 5.2031324938079102
		 10 5.3731402458799984 11 5.5561604797223758 12 5.6303932997518444 13 5.6070483354332232
		 14 5.3480245084571223 15 4.7573786459150904 16 4.0581215906275805 17 3.2813518202160741
		 18 2.5991535724574444 19 2.151708383318407 20 1.812202698617567 21 1.3419571385623874
		 22 0.65032111776573265 23 -0.55855582065511389 24 -1.8166695946909281 25 -2.6629632588926739
		 26 -3.234442040137866 27 -3.8186292438839504 28 -4.6653209031123319 29 -5.9816957182464288
		 30 -7.4621786688299343 31 -8.2324731222213838 32 -8.092846059767103;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Elbow_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -11.704002636104995 1 -12.211197688985894
		 2 -12.532033025881329 3 -12.270342143008145 4 -11.444453014601082 5 -9.8318531120864439
		 6 -9.3642040208492361 7 -8.7232114351808434 8 -7.8986558389642134 9 -6.9269421487854022
		 10 -5.8350723367276887 11 -4.7957782099161532 12 -3.7944311922932856 13 -3.0281103931710196
		 14 -2.7338104394771903 15 -2.891493086901725 16 -3.5863317511589972 17 -4.7501730609837107
		 18 -6.125125045990842 19 -7.6072426629037713 20 -9.1040358688526783 21 -10.554661908723633
		 22 -11.565057982593373 23 -12.179206763557607 24 -12.380574079769961 25 -12.309698769686131
		 26 -12.029956710572833 27 -11.836441536797441 28 -11.650782616689762 29 -11.404480676677084
		 30 -11.23407005729573 31 -11.32041574918458 32 -11.704002636104995;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Wrist_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.8889504015544496 1 -5.701345119636124
		 2 -5.6501493628857355 3 -5.7033682929385963 4 -5.8921415563231294 5 -6.353193835966116
		 6 -6.2462470683600761 7 -6.1849900525903356 8 -6.1403273575346935 9 -6.051090085655531
		 10 -5.9518197077307207 11 -5.805951085397461 12 -5.6108061733405732 13 -5.4125675750670128
		 14 -5.1698545449260553 15 -4.9087286593915307 16 -4.7280061835787848 17 -4.6924005362856347
		 18 -4.8393522915172902 19 -5.1856501546204576 20 -5.5753734623741673 21 -5.9155142252707247
		 22 -6.0907653918695583 23 -6.1149330285758721 24 -6.0745689148938435 25 -6.0430112275737411
		 26 -6.0582318144917426 27 -6.1857148082000837 28 -6.2918006372483806 29 -6.3087670045946131
		 30 -6.2195271520428719 31 -6.0746461594267691 32 -5.8889504015544496;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Wrist_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 8.0293704425363117 1 7.1046661216958089
		 2 6.5487492182299087 3 5.9248748522435379 4 4.9022572248142238 5 3.0037363980600773
		 6 3.9952303512890062 7 4.6914807286257378 8 5.0539663484072461 9 5.3679586744397216
		 10 5.7940516733625378 11 6.2864157970863648 12 6.8257908014147013 13 7.647717968214871
		 14 8.4177256193359042 15 8.7955668435601275 16 8.8481321538282813 17 8.6714225550050443
		 18 8.5217509183344173 19 8.5799657646543448 20 9.0118622210103574 21 9.649698133458628
		 22 10.518213103180464 23 11.571770275592641 24 12.394737836984401 25 13.365182635233458
		 26 14.036806346646722 27 13.467700526438501 28 12.756198633529525 29 11.963165871541429
		 30 10.636308504776714 31 9.2350429922244697 32 8.0293704425363117;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Wrist_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.3341884629649887 1 -1.0207947751991553
		 2 -0.25147872360458556 3 -0.22199824251003947 4 -0.82037751127969571 5 -2.7389447834638609
		 6 -2.5268424965796696 7 -2.4081920241560568 8 -2.2428943994232808 9 -1.8237505906351048
		 10 -1.35645290505699 11 -0.60791434215300699 12 0.4902325484603165 13 1.5216538520520455
		 14 2.7143161763642962 15 3.9924258342910184 16 4.7234436620359475 17 4.6818988206921475
		 18 3.595856903272499 19 1.5991514197445615 20 -0.61446756398708979 21 -2.6447773931330389
		 22 -3.924295133512143 23 -4.5466514732806216 24 -4.7693705134512463 25 -5.004751901125851
		 26 -5.3642873685052255 27 -5.7986146857618239 28 -6.0461272160320112 29 -5.7911395459255255
		 30 -4.8420219604325414 31 -3.6650280306465284 32 -2.3341884629649887;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Neck_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.9697724261888734 1 2.8558894551337071
		 2 2.6737616756235174 3 2.4699651738006225 4 2.2871014032914414 5 2.0241264159310473
		 6 1.7482727408236056 7 1.644960697026431 8 1.8018036355945359 9 2.1211930774639622
		 10 2.4138121554506546 11 2.5479415742445828 12 2.4305154708249388 13 2.1001720144554437
		 14 1.8612195791404196 15 1.8262429668047175 16 2.0685890102160798 17 2.5568205738442491
		 18 3.0716879616786645 19 3.4875753767774023 20 3.7540921511276419 21 3.9278347557161011
		 22 4.0316812469433287 23 4.087117716793335 24 4.0784543231791552 25 3.9803935259419068
		 26 3.8247788362539059 27 3.6375393690039255 28 3.4474989036541275 29 3.2781843888039388
		 30 3.1410365518483698 31 3.0493000348953481 32 2.9697724261888734;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Neck_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.2143372890464161 1 -1.8800827833809626
		 2 -1.5624168690503368 3 -1.3080647502050193 4 -1.075907217563292 5 -0.6777878710536972
		 6 -0.19569732873148948 7 -0.036479993719337869 8 -0.7588824204538922 9 -2.0581989244078533
		 10 -3.3741106218908516 11 -4.0354597898214326 12 -3.6197432889616095 13 -2.5422552941349634
		 14 -1.7429126111171556 15 -1.4872346652371908 16 -1.7465578630700687 17 -2.4385266965768566
		 18 -3.2292479445284092 19 -3.982136715887433 20 -4.5899038742886926 21 -5.0525896536726869
		 22 -5.339304924530178 23 -5.4609615991241718 24 -5.2903630105826016 25 -4.9656219364250944
		 26 -4.6126606076478058 27 -4.2593459382114229 28 -3.93869687839139 29 -3.5904358157159404
		 30 -3.0931303359457045 31 -2.6012784273256466 32 -2.2143372890464161;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Neck_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 39.794277533355974 1 40.088241561984802
		 2 40.060123748846976 3 39.907234148640065 4 39.645812515076862 5 39.00454314879314
		 6 38.175532644165628 7 37.165973885733678 8 36.168022238452217 9 35.383820918025428
		 10 35.156525552141879 11 35.4950847404698 12 36.462553444943879 13 37.679158757680632
		 14 38.940124995829223 15 40.033606698971575 16 40.734012160847307 17 41.08839502742228
		 18 41.10153763814165 19 40.791893759159585 20 40.257599335384924 21 39.693931662816915
		 22 39.263741636206589 23 38.919164719582831 24 38.63741511119256 25 38.377371976869092
		 26 38.176416889610593 27 37.981747355425142 28 37.903277919648289 29 38.173578721117103
		 30 38.702631404105347 31 39.241925523602518 32 39.794277533355974;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Head_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.7816050370166385 1 5.7851542260298823
		 2 5.5834145153708636 3 5.2579160083133809 4 4.9787265272080106 5 4.6555092855880424
		 6 4.3520210255257696 7 4.188610680718801 8 3.972946848709074 9 3.6839932481130999
		 10 3.3072460579991403 11 3.0245882368798425 12 2.9670486859958856 13 2.9494549277156787
		 14 2.983912632613571 15 3.1410291188270625 16 3.5195418023436322 17 4.1910376625713068
		 18 4.8477513381551578 19 5.2890331555704444 20 5.4871942523978534 21 5.5883575757948858
		 22 5.6596333116747592 23 5.7655179647937862 24 5.9452611210431128 25 6.029722365238535
		 26 5.973807978815393 27 5.7950077434614284 28 5.5617587606326628 29 5.3785297387324835
		 30 5.4360740914853993 31 5.6428563113076802 32 5.7816050370166385;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Head_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.8200162079616815 1 -3.7844415452465991
		 2 -3.7376816665920942 3 -3.6905282582224941 4 -3.7290719393227865 5 -3.9101412764560219
		 6 -4.4753912513969887 7 -4.768662666223844 8 -4.3175388136441795 9 -3.2851627695078411
		 10 -2.0501631439392765 11 -1.2130844384230162 12 -1.3583541233166152 13 -2.1814028626718809
		 14 -2.9470299786925329 15 -3.3771512435742137 16 -3.3808390553973955 17 -2.9479475353321378
		 18 -2.4123504469885453 19 -2.0007666689591557 20 -1.882935136984617 21 -1.9745231239202483
		 22 -2.1325142924614751 23 -2.32839448838069 24 -2.6140010385857542 25 -2.8861660750301161
		 26 -3.0545995471026033 27 -3.1757080552785522 28 -3.2313042266059111 29 -3.3043304007867302
		 30 -3.5672358655882248 31 -3.7898698011839547 32 -3.8200162079616815;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Head_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.61763268934938886 1 0.50500920417144102
		 2 0.42500367335564571 3 0.47480752283027028 4 0.72326559561891912 5 1.3441310425104995
		 6 1.2939289991814031 7 1.3511596421613565 8 1.3807420149530987 9 1.1460592415275364
		 10 0.62995559820284008 11 0.075564170877060646 12 -0.27548279947420595 13 -0.30650696897818774
		 14 -0.18604424765629873 15 -0.022127287640641591 16 0.084793803572777146 17 0.19543462104099416
		 18 0.39960812988065331 19 0.70298406080378584 20 1.0123090736702138 21 1.260129001115474
		 22 1.3665034369098823 23 1.3177185140246268 24 1.2193236990572174 25 1.1758062567838183
		 26 1.064984305030116 27 0.88290160502342818 28 0.69487412315507724 29 0.51221524540281216
		 30 0.48324121351711302 31 0.60399759752706839 32 0.61763268934938886;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Scapula_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.1307251692906871e-005 1 -2.1307251692906871e-005
		 2 -2.1307251692906871e-005 3 -2.1307251692906871e-005 4 -2.1307251692906871e-005
		 5 -2.1307251692906871e-005 6 -2.1307251692906871e-005 7 -2.1307251692906871e-005
		 8 -2.1307251692906871e-005 9 -2.1307251692906871e-005 10 -2.1307251692906871e-005
		 11 -2.1307251692906871e-005 12 -2.1307251692906871e-005 13 -2.1307251692906871e-005
		 14 -2.1307251692906871e-005 15 -2.1307251692906871e-005 16 -2.1307251692906871e-005
		 17 -2.1307251692906871e-005 18 -2.1307251692906871e-005 19 -2.1307251692906871e-005
		 20 -2.1307251692906871e-005 21 -2.1307251692906871e-005 22 -2.1307251692906871e-005
		 23 -2.1307251692906871e-005 24 -2.1307251692906871e-005 25 -2.1307251692906871e-005
		 26 -2.1307251692906871e-005 27 -2.1307251692906871e-005 28 -2.1307251692906871e-005
		 29 -2.1307251692906871e-005 30 -2.1307251692906871e-005 31 -2.1307251692906871e-005
		 32 -2.1307251692906871e-005;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Scapula_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.0005552369177469e-005 1 1.0005552369177469e-005
		 2 1.0005552369177469e-005 3 1.0005552369177469e-005 4 1.0005552369177469e-005 5 1.0005552369177469e-005
		 6 1.0005552369177469e-005 7 1.0005552369177469e-005 8 1.0005552369177469e-005 9 1.0005552369177469e-005
		 10 1.0005552369177469e-005 11 1.0005552369177469e-005 12 1.0005552369177469e-005
		 13 1.0005552369177469e-005 14 1.0005552369177469e-005 15 1.0005552369177469e-005
		 16 1.0005552369177469e-005 17 1.0005552369177469e-005 18 1.0005552369177469e-005
		 19 1.0005552369177469e-005 20 1.0005552369177469e-005 21 1.0005552369177469e-005
		 22 1.0005552369177469e-005 23 1.0005552369177469e-005 24 1.0005552369177469e-005
		 25 1.0005552369177469e-005 26 1.0005552369177469e-005 27 1.0005552369177469e-005
		 28 1.0005552369177469e-005 29 1.0005552369177469e-005 30 1.0005552369177469e-005
		 31 1.0005552369177469e-005 32 1.0005552369177469e-005;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Scapula_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.7472791986738114e-005 1 -2.7472791986738114e-005
		 2 -2.7472791986738114e-005 3 -2.7472791986738114e-005 4 -2.7472791986738114e-005
		 5 -2.7472791986738114e-005 6 -2.7472791986738114e-005 7 -2.7472791986738114e-005
		 8 -2.7472791986738114e-005 9 -2.7472791986738114e-005 10 -2.7472791986738114e-005
		 11 -2.7472791986738114e-005 12 -2.7472791986738114e-005 13 -2.7472791986738114e-005
		 14 -2.7472791986738114e-005 15 -2.7472791986738114e-005 16 -2.7472791986738114e-005
		 17 -2.7472791986738114e-005 18 -2.7472791986738114e-005 19 -2.7472791986738114e-005
		 20 -2.7472791986738114e-005 21 -2.7472791986738114e-005 22 -2.7472791986738114e-005
		 23 -2.7472791986738114e-005 24 -2.7472791986738114e-005 25 -2.7472791986738114e-005
		 26 -2.7472791986738114e-005 27 -2.7472791986738114e-005 28 -2.7472791986738114e-005
		 29 -2.7472791986738114e-005 30 -2.7472791986738114e-005 31 -2.7472791986738114e-005
		 32 -2.7472791986738114e-005;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Shoulder_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 8.6702906609985462 1 6.1222837185850478
		 2 3.4776366897017246 3 0.76481579832610791 4 -2.0792176998040981 5 -6.5248609015582835
		 6 -9.0249848056821804 7 -11.15820360922152 8 -13.076992434351336 9 -14.593169073773634
		 10 -15.652322873440493 11 -16.357397559646198 12 -16.420067319617281 13 -15.207658182150745
		 14 -12.890308201308969 15 -10.147282844543968 16 -7.1078790956540976 17 -3.8959225726751168
		 18 -0.68279334715098228 19 2.4775214591730745 20 5.2695169949059659 21 7.7242911079697345
		 22 9.7254987377783468 23 11.587457554826575 24 13.031615505072468 25 14.231538287773727
		 26 15.179186274483435 27 15.279142671980811 28 15.054006372304148 29 14.324682936476899
		 30 12.977671024391356 31 11.055935287099379 32 8.6702906609985462;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Shoulder_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.6766097944405538 1 0.078888993466519522
		 2 -1.6380547433982133 3 -3.2090672085075131 4 -5.1131811170947712 5 -8.5271814774385195
		 6 -10.960425567048924 7 -13.419662483539188 8 -15.591216828569559 9 -17.440346871296637
		 10 -18.922561352048923 11 -20.029371388824494 12 -20.613945398605985 13 -19.814336638387399
		 14 -17.817907412123411 15 -15.190383784513367 16 -12.080464208050342 17 -8.53105990395958
		 18 -4.891928863241481 19 -1.461233564737199 20 1.5041322192865854 21 4.2231269662844939
		 22 6.5883966531745459 23 8.8328151688312584 24 10.565380437366224 25 12.064451861031037
		 26 13.216007972603002 27 13.316048253605411 28 12.885430183425427 29 11.542966615221372
		 30 9.1328420326809727 31 5.9838325719918757 32 2.6766097944405538;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Shoulder_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -76.683899057438509 1 -77.543575294689077
		 2 -78.223949729162541 3 -78.712373094214655 4 -79.058126020549764 5 -79.377646348554435
		 6 -79.26092983848983 7 -79.19443476845646 8 -79.225843568314289 9 -79.254071825911197
		 10 -79.251484395115241 11 -79.045294164154214 12 -78.536586006672763 13 -78.237983061208652
		 14 -78.170881629536979 15 -78.169528703944962 16 -78.262454559105009 17 -78.224022369097085
		 18 -77.894575870804204 19 -77.334896271617481 20 -76.640365382679917 21 -75.872642816567819
		 22 -75.141716792622915 23 -74.332904145918064 24 -73.576464713866713 25 -73.007894145288901
		 26 -72.693671029139779 27 -72.681210248908698 28 -72.965994905872265 29 -73.636689462947487
		 30 -74.533423736079726 31 -75.608985837214334 32 -76.683899057438509;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Elbow_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 30.529424272413163 1 28.480561329771042
		 2 25.265051019535601 3 21.929362545919144 4 18.902312664119862 5 14.779082630723636
		 6 13.136115845629371 7 12.534763457292151 8 12.141064280058087 9 12.160206702374211
		 10 12.493969691731909 11 12.773130403681943 12 13.07181862828512 13 14.202783514736817
		 14 15.792642899033211 15 17.330591708676351 16 18.880647344853269 17 20.211317502415433
		 18 21.518035687740113 19 23.17364697741899 20 24.823132702201491 21 26.237597365692856
		 22 27.398368513220788 23 28.698371434742345 24 29.970387542019591 25 30.975763174263523
		 26 31.692516421256951 27 31.950523796666008 28 31.913377683295742 29 31.817465211738114
		 30 31.824113436434939 31 31.523890221217609 32 30.529424272413163;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Elbow_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 22.001722631241375 1 17.399054382510297
		 2 12.736976490025656 3 9.3655756752589507 4 7.6510465818129676 5 6.7235098607914976
		 6 7.252403691165239 7 8.2812881707656327 8 9.1320528162479011 9 9.6304887367483509
		 10 9.7832263177509571 11 9.7185263552536938 12 9.528307289836123 13 9.2518167089119121
		 14 8.8136867651818438 15 8.2282392313907007 16 7.5701060345565239 17 6.9084848346657042
		 18 6.765770253338804 19 7.4605230537489833 20 9.436580370637067 21 12.264284325272214
		 22 15.195418600738932 23 18.352186660062813 24 21.065663098083807 25 23.50008799947588
		 26 25.81178934420927 27 27.569541425136954 28 28.594844940269006 29 28.692257256319945
		 30 27.793810422500108 31 25.588823083749354 32 22.001722631241375;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Elbow_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -7.1258208997810817 1 -5.5206047336728883
		 2 -4.5680880634041783 3 -4.6258229552818655 4 -5.2109375924741421 5 -6.0886445660513333
		 6 -6.4329290621337503 7 -6.7767382455797947 8 -7.3462105821144181 9 -8.1177985719603569
		 10 -8.8969430857131382 11 -9.690455580007626 12 -10.30160711939074 13 -9.9534887929540758
		 14 -9.1404984783635452 15 -8.4366794392886959 16 -7.841506167532418 17 -7.5564165988784184
		 18 -7.5804776813247274 19 -7.8926242238944111 20 -8.5574666699226007 21 -9.3680703985874185
		 22 -10.124891442821941 23 -10.893208567899329 24 -11.375810941772118 25 -11.631218811443093
		 26 -11.801804342921287 27 -11.940317448111125 28 -11.766198981125596 29 -11.19298600595986
		 30 -10.265970155660952 31 -8.8581793711271786 32 -7.1258208997810817;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Wrist_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -39.309167947274801 1 -39.765329757794433
		 2 -37.393498734134241 3 -34.286959469633686 4 -31.860642005120816 5 -29.767036330167443
		 6 -30.5629802967896 7 -31.703863843248097 8 -32.133050317725072 9 -32.516838548828439
		 10 -33.282132447414405 11 -34.22693363736655 12 -35.177293145958387 13 -36.200285726714363
		 14 -37.107230250082218 15 -37.557074473375081 16 -37.4176979570057 17 -35.939673201215335
		 18 -33.951769932839952 19 -32.402060197498891 20 -31.696980044843485 21 -31.256138696608787
		 22 -30.577269996437256 23 -29.757491975280381 24 -28.983681431861712 25 -28.277020720911853
		 26 -28.190005986849464 27 -28.478116946275904 28 -29.157518587062377 29 -30.660958233025685
		 30 -33.145124143663558 31 -36.394044465697334 32 -39.309167947274801;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Wrist_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -4.418588438864985 1 -3.1762905376319117
		 2 -1.9271546139609737 3 -0.86320298519791117 4 -0.24728810958177783 5 -0.32402150405408636
		 6 0.33536266565808592 7 0.46722774578877652 8 0.43316440673371781 9 0.5553509318765808
		 10 0.49341723207321447 11 0.35425115247393346 12 0.25684621672769165 13 -0.0421604340758173
		 14 -0.27570874463143868 15 -0.39504564078148535 16 -0.51664025484068687 17 -0.63284493288724364
		 18 -0.7008412541042095 19 -1.1222677560640333 20 -1.7886901051784698 21 -2.3455136437856554
		 22 -2.8085568231902629 23 -3.0362499705610908 24 -2.9563646862355641 25 -2.805707806262316
		 26 -2.7556421929517048 27 -3.1567399376308378 28 -4.2157315115918212 29 -5.1896130932696085
		 30 -5.6380622722797833 31 -5.4012258713249821 32 -4.418588438864985;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Wrist_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -4.6321124155794546 1 -6.1666272877084589
		 2 -6.2006804438425842 3 -4.8862061704755737 4 -2.9903663800901827 5 -0.41279403895507311
		 6 -3.3432881232092746 7 -4.8389402513621178 8 -4.8015378852343957 9 -3.9672112630621532
		 10 -2.7565042664424158 11 -1.5915489382117458 12 -0.56242222974629263 13 0.48769811816666231
		 14 1.0828388130529811 15 1.5156003505515734 16 2.2633967609767769 17 3.3372309250748349
		 18 4.4876363666970871 19 5.4014370228694117 20 5.7771409051659157 21 5.761794584299996
		 22 5.5410073409116061 23 5.2179692619299782 24 4.8505790311405725 25 4.2780175008441805
		 26 3.4518038879776607 27 2.2118772484940399 28 0.83551007677617239 29 -0.18334529971312069
		 30 -1.2490449043107816 31 -2.7648467930224729 32 -4.6321124155794546;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Hip_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.3833102989037705 1 -0.3101434886623809
		 2 -0.16938980544976756 3 -0.0056279405216898976 4 0.11787157201379109 5 0.35502696772978681
		 6 0.89223235630285513 7 1.3958358617855671 8 1.8885316187814214 9 2.3671592275925266
		 10 2.8505914692543568 11 3.3179433655227775 12 3.5993576585229246 13 3.3804769322201174
		 14 2.8804698182361186 15 2.2170020778582149 16 1.4944812781151233 17 0.92070360995307743
		 18 0.57331446133745589 19 0.44520270331485523 20 0.34778434972692768 21 0.18717012679892919
		 22 0.020692901873435331 23 -0.17575622564681709 24 -0.31508584585830596 25 -0.36755680036091404
		 26 -0.33203104360756475 27 -0.1250593082548247 28 0.020320819600492958 29 0.00051614904124616223
		 30 -0.13885607179773099 31 -0.32507003291802583 32 -0.3833102989037705;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Hip_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -9.3758355861393596 1 -9.5001489785803663
		 2 -9.3735331666546866 3 -9.0953428477657727 4 -9.0904515223598903 5 -9.2561635613386137
		 6 -8.3827915412354592 7 -7.56459348938131 8 -6.8487155415391401 9 -6.1769175010872459
		 10 -5.1716223047127885 11 -3.6416768183867037 12 -1.6376715148474656 13 0.204823068058611
		 14 1.4080827734997607 15 2.0871566450004795 16 2.2375885521947443 17 2.0375204365501114
		 18 1.6597131096190585 19 1.1981071900278117 20 0.67136044055028332 21 0.11557758042223694
		 22 -0.34444508903089743 23 -0.76536531411663244 24 -1.1480325922999211 25 -1.5731688052950068
		 26 -2.0403027127504867 27 -2.6533098700628783 28 -3.7352648813080203 29 -5.3108424549264042
		 30 -7.0691695130556749 31 -8.5252477021683113 32 -9.3758355861393596;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Hip_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -32.965949384320389 1 -30.610926356412634
		 2 -28.28317827040118 3 -25.90754106818051 4 -23.399797476617753 5 -18.926145298223869
		 6 -16.431155033157275 7 -14.588128603103707 8 -13.325445080885622 9 -12.681256739539251
		 10 -12.669631049008979 11 -13.128502435168551 12 -14.041376537075491 13 -15.45546187433334
		 14 -17.605411823562338 15 -20.53253242762182 16 -23.549238314633719 17 -26.311010773506631
		 18 -28.616450361405668 19 -30.665466209134692 20 -32.330788787765492 21 -33.711792673175715
		 22 -34.714094945473093 23 -35.199177878909566 24 -35.085997794405152 25 -34.501791691980095
		 26 -33.950291783124882 27 -34.426655024431803 28 -35.525966998293256 29 -36.409498161978696
		 30 -36.478118805355905 31 -35.141311142159687 32 -32.965949384320389;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Knee_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.58107374246547516 1 0.58811205499680974
		 2 0.65466577985610874 3 0.72703796278761001 4 0.71924965138213348 5 0.70025531863022139
		 6 1.4033473956426425 7 2.0655324008271498 8 2.6708975870171878 9 3.0474580784094938
		 10 2.9615511663367822 11 2.4023348601145003 12 1.3665783917449907 13 -0.11324231834868323
		 14 -1.7937786165626004 15 -3.4472855886624161 16 -4.4267291602095247 17 -4.4867781619826967
		 18 -4.0738777984499119 19 -3.4854009722238679 20 -2.9800602679654178 21 -2.6936066453976362
		 22 -2.571692976491498 23 -2.552324005125727 24 -2.5839799034219588 25 -2.5473379632300959
		 26 -2.251399540797316 27 -1.4433242804176725 28 -0.43929867571212233 29 0.35984724502755927
		 30 0.70638041934028661 31 0.68476655527347963 32 0.58107374246547516;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Knee_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 8.4012123196163753 1 8.3126981105239093
		 2 7.90818975964996 3 7.4509593705664354 4 7.146902369064561 5 6.8075454268909272
		 6 6.5688704968677172 7 6.5993507572201642 8 7.0837372032356738 9 8.0481488071969007
		 10 9.6468731457012389 11 11.377156454412017 12 12.466914879113641 13 12.014385262762639
		 14 10.91724451109509 15 9.3190786308381917 16 7.1380614055254581 17 4.8984279525409375
		 18 3.1937222198681106 19 2.2944676541806541 20 1.7580265819267462 21 1.3479012426574704
		 22 1.0699193213682789 23 0.78479946448104199 24 0.79650864787450926 25 1.2287907275057643
		 26 1.9976041433228702 27 3.109715984128488 28 4.275975171531174 29 5.6597793536266234
		 30 7.0946824874468408 31 8.0450177406891452 32 8.4012123196163753;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Knee_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 57.477518037845059 1 55.355745834223853
		 2 53.014763585035524 3 50.901285452440881 4 49.124538718848825 5 47.027392723516492
		 6 46.887471567601118 7 48.13649264725462 8 50.418451982961706 9 53.806131866694187
		 10 58.179929771432235 11 62.826742467327207 12 67.02853252015997 13 69.855083616445086
		 14 72.440174725552311 15 75.143143425081718 16 76.637276231622408 17 76.627660033600947
		 18 75.313207007588957 19 73.327485974304096 20 71.473139602594628 21 69.984439796072621
		 22 68.620522641572435 23 66.128393965028195 24 61.954688009610393 25 56.017715879113148
		 26 49.209748901350821 27 47.273263330923186 28 48.793889213535969 29 52.56624179117361
		 30 56.597378139517986 31 58.130582037434898 32 57.477518037845059;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Ankle_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 11.129630980631749 1 10.96740724388567
		 2 10.158637226139245 3 9.209477976424095 4 8.4993326197835728 5 7.6693126208293192
		 6 8.2293798952499593 7 8.721002847537358 8 9.3778309288737418 9 10.2725174735136
		 10 11.553282480380133 11 12.824141268821494 12 13.29248575429947 13 12.506452753477113
		 14 11.716156049616766 15 11.093004088083976 16 9.9930698775979252 17 8.3757585604985092
		 18 7.1061754470749143 19 6.8017039196380704 20 6.5065762271597194 21 5.9061717931875828
		 22 5.1471352886994968 23 4.1200235347784178 24 3.4981828831930488 25 3.5087085464412882
		 26 4.1640542355386945 27 5.1049823146382511 28 6.2733071886942815 29 7.7708041708936033
		 30 9.5366346559539021 31 10.752960041462075 32 11.129630980631749;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Ankle_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 7.410071775242427 1 7.2402662813315599
		 2 6.3955618399042464 3 5.5680899784726465 4 5.1192626652749533 5 4.3648687743217973
		 6 6.6355939553318741 7 7.7557273768013077 8 8.0713736200941284 9 7.6905274909254189
		 10 7.0828121308586551 11 6.5658042037836255 12 4.9794649204290939 13 2.1151394992259038
		 14 -1.5232482293387948 15 -5.5303421855706558 16 -8.427940913752062 17 -9.5338595659146943
		 18 -10.15712166079307 19 -11.223170232238566 20 -12.019657840652403 21 -12.747778638227356
		 22 -13.702444460465044 23 -14.65829455626101 24 -14.898930259418687 25 -14.455034895101964
		 26 -12.837114764252838 27 -9.0261162188595563 28 -4.1376382941324463 29 0.39648194060804842
		 30 4.3081772398309237 31 6.6525483616690835 32 7.410071775242427;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Ankle_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -19.531542850654386 1 -20.150378245892789
		 2 -20.199147614884215 3 -19.993089245880014 4 -19.552742904323509 5 -18.185749929918899
		 6 -16.382421288223505 7 -14.905559799502228 8 -13.624442332938273 9 -12.388101207305448
		 10 -10.644904706615682 11 -6.9819690850526248 12 0.26752950232476186 13 11.917371558753144
		 14 22.436771491370592 15 29.766476255694162 16 34.424273795269713 17 37.106041661672727
		 18 38.711672670733805 19 39.07118603283994 20 37.235056436381093 21 32.019904251819639
		 22 24.849308742452934 23 16.386282397286958 24 9.3719437664417757 25 3.9645075486698644
		 26 0.57587030237653303 27 -3.7788805061289339 28 -8.476879243256457 29 -12.511565173154391
		 30 -15.872525574433734 31 -18.145451679399724 32 -19.531542850654386;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Toes_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -12.2293808405219 1 -12.229384654117412
		 2 -12.229386901116188 3 -12.229352538224148 4 -12.229365079733123 5 -12.22940397896434
		 6 -12.443117902451389 7 -14.910681698897051 8 -19.363279478053048 9 -24.217795190177615
		 10 -28.14736198042824 11 -32.490861704367411 12 -41.018079504143834 13 -54.614417650258162
		 14 -57.51301441966303 15 -46.989754154160899 16 -37.687403127029739 17 -32.53544107022767
		 18 -38.789685287486236 19 -52.437714463882841 20 -58.850016640744471 21 -53.056878322218203
		 22 -40.087045919298163 23 -26.72762773636536 24 -23.441548822114473 25 -21.471586569018822
		 26 -20.790042967323366 27 -17.335869654983473 28 -13.251409586799275 29 -12.229380316811358
		 30 -12.229381950529749 31 -12.229400779535624 32 -12.2293808405219;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Hip_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.5515857941287909 1 -4.0399894726464973
		 2 -4.2902120953300598 3 -4.1981743030945564 4 -3.914781954961569 5 -3.2218492356589801
		 6 -3.3326519083254271 7 -3.5558695654229089 8 -3.6465445404879135 9 -3.758628083271959
		 10 -4.2314905728578616 11 -5.110989454932076 12 -6.1903771115096458 13 -6.7936486671480925
		 14 -6.7169057687330289 15 -6.1939505409994071 16 -5.5904191216261543 17 -5.1008666300675847
		 18 -5.0287849694579814 19 -5.2269607183355484 20 -5.34892244266298 21 -5.3910997300221766
		 22 -5.4105112475026234 23 -5.4482615201108215 24 -5.316123702041911 25 -4.9631647926797839
		 26 -4.4579667286740419 27 -3.6927664719683198 28 -3.033081629414756 29 -2.7697484111075528
		 30 -2.7466914159455493 31 -3.0697992580788331 32 -3.5515857941287909;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Hip_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 3.4848061215915567 1 3.7836841711056066
		 2 4.0115791603330893 3 4.086705358332499 4 4.0106416805132508 5 3.3960009495011829
		 6 2.3839562193018682 7 1.685885806846859 8 1.0841191161581409 9 0.23531288002868025
		 10 -1.2554268009358234 11 -3.0579028723637784 12 -4.986758132635801 13 -6.5902164555407321
		 14 -7.6671846361644755 15 -8.5060833441918593 16 -8.9887059339051536 17 -9.0156342973248478
		 18 -8.6838783537534177 19 -8.0517211986696662 20 -7.5742325080290103 21 -7.0501361643600573
		 22 -6.4263457173024792 23 -5.5569642314815226 24 -4.5398447937733692 25 -3.371774851589195
		 26 -2.2408769021603634 27 -1.2806936011926342 28 -0.11839018550661137 29 1.1109683375548813
		 30 2.2217609782250296 31 3.0299712635829472 32 3.4848061215915567;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Hip_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -8.0932467179360366 1 -10.370033082414077
		 2 -13.453156757137517 3 -16.723861112294863 4 -19.88065418405499 5 -24.044625847199217
		 6 -25.910386713825631 7 -27.585041400315763 8 -29.171453470048434 9 -30.764422722824524
		 10 -33.391721812279421 11 -35.981210602183275 12 -37.146768610832687 13 -36.991223928780727
		 14 -36.200093096754294 15 -34.781496874312325 16 -32.629955621054918 17 -29.541267682327156
		 18 -25.959142203014249 19 -22.138284558988602 20 -18.40824641381559 21 -14.54981294949005
		 22 -11.147694524415838 23 -8.0651677126741017 24 -5.9668286931963186 25 -4.7093793125931516
		 26 -4.4947271309100163 27 -4.8374961250199577 28 -5.3287745526087038 29 -5.7682695236073096
		 30 -6.1158699248705615 31 -6.7591398861451744 32 -8.0932467179360366;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Knee_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.1927510736383868 1 -2.535124575057123
		 2 -2.5345562859678488 3 -2.2857004434621375 4 -1.9890239368724918 5 -1.6969422000239724
		 6 -2.0688919475395924 7 -2.3145498948306158 8 -2.3435228128660621 9 -2.2961612295941665
		 10 -2.2999930968060309 11 -2.311436010138022 12 -2.2012114168614949 13 -1.6260365406764814
		 14 -0.89973471246912584 15 -0.46263565678890195 16 -0.42391260069494496 17 -0.7096277643625114
		 18 -1.2820998854916277 19 -2.0567750382254681 20 -2.7210665150811635 21 -3.2589141257650676
		 22 -3.6268734950953618 23 -3.8185163391482928 24 -3.6564512050118085 25 -3.1314498868484035
		 26 -2.3370020023609945 27 -1.3382414248552241 28 -0.61683226132200664 29 -0.51408983183913959
		 30 -0.85241576730450275 31 -1.5383559655068859 32 -2.1927510736383868;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Knee_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.34328496185987134 1 -0.78294266716981242
		 2 -1.4932112580786592 3 -2.016982670037899 4 -2.2131624606317741 5 -1.5220146064901243
		 6 -0.80747206427060747 7 -0.54410916817759136 8 -0.423236389833754 9 -0.32797957812011419
		 10 -0.36488701642326526 11 -0.90219457145382764 12 -1.9016935911396462 13 -2.9655085915180455
		 14 -3.4014867080324001 15 -2.9320643183134885 16 -2.0334191556658046 17 -1.1860541579032258
		 18 -0.66660023617579567 19 -0.39172756485233162 20 0.056168322627915573 21 0.51642745230819609
		 22 0.76940826606463231 23 0.64353608123461381 24 0.0040717749273749696 25 -0.85481015757543122
		 26 -1.8128120204909539 27 -2.3615442616213578 28 -2.33654773431042 29 -1.9267133437593333
		 30 -1.2152334233584641 31 -0.55327594424738025 32 -0.34328496185987134;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Knee_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 60.47914270837007 1 60.230370211511307
		 2 60.308659084302413 3 60.654661070116667 4 61.109901962654646 5 61.455152619662861
		 6 56.235204145148373 7 51.431860654688343 8 47.465377195996801 9 45.136426010341111
		 10 46.270193670858937 11 50.355402641349635 12 55.127330288794383 13 59.752857296201135
		 14 62.829812757115732 15 63.828963081411139 16 63.097705598108689 17 60.58576572446006
		 18 57.379470072614097 19 53.70494216287765 20 50.168265515052731 21 46.477375978733669
		 22 43.334438673947467 23 40.883064872054234 24 39.873958267642209 25 40.235267935519964
		 26 42.791982380942002 27 46.84387562898447 28 51.448852781277395 29 55.75148770000358
		 30 58.951876240135938 31 60.387068705352839 32 60.47914270837007;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Ankle_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 8.2465193423625589 1 8.905009659331931
		 2 10.911453832445313 3 12.741824376206498 4 13.895239356668643 5 13.83303529631009
		 6 14.010396549600767 7 13.984173221414467 8 13.672707773726865 9 13.922031994913109
		 10 15.495434223571444 11 18.254077899206521 12 22.308628593006347 13 25.683072519867491
		 14 27.054804466244537 15 27.061884052651436 16 26.316679127343999 17 25.60732620540481
		 18 24.922289292295719 19 23.827018286918477 20 23.554334425951126 21 23.454387035555637
		 22 23.223610902112025 23 22.900553987700519 24 22.328367753399839 25 21.375740120326697
		 26 20.410459318013729 27 18.938270145453096 28 16.851209872470342 29 14.60249351039289
		 30 11.829764426663901 31 9.2133115536288201 32 8.2465193423625589;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Ankle_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -8.1147586029891929 1 -11.190000961460994
		 2 -13.284805695764351 3 -13.528911110602063 4 -12.462166992031928 5 -8.9570765074885177
		 6 -8.0691096942019556 7 -7.2822963897702557 8 -5.5448130070715402 9 -2.5501267265758143
		 10 -0.023059798935040659 11 1.3174376989141909 12 3.0814966108506883 13 5.4775917480411538
		 14 7.5605073947573143 15 8.7462974862347664 16 9.08985167458059 17 9.334276842501616
		 18 8.8427787893634022 19 6.4215466624848894 20 5.9799820683736558 21 5.911814022763477
		 22 5.6264433632306039 23 5.276917935042321 24 5.0802515811307423 25 4.8216281776124204
		 26 4.756611182747247 27 4.414999001025115 28 3.1450929278951194 29 1.3827260915332522
		 30 -1.1720155783395696 31 -4.5821818708626392 32 -8.1147586029891929;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Ankle_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -15.778201971419255 1 -6.7538865092932712
		 2 0.0013553734369922603 3 3.2129046227904867 4 2.6125433662337691 5 -4.4782836987032679
		 6 -7.3749882794871251 7 -9.1930457460534782 8 -11.110899156524392 9 -12.809093595149402
		 10 -12.868346721729628 11 -13.658850270599274 12 -16.744067084437496 13 -20.947959049080939
		 14 -24.572229325478666 15 -27.208403961126063 16 -28.882178131277239 17 -30.425726761200071
		 18 -31.813185641509207 19 -32.398431609804007 20 -32.053612579809361 21 -31.314364075816378
		 22 -30.666932638436471 23 -30.134133474359778 24 -29.919035269561416 25 -30.097141006861403
		 26 -31.110072337259489 27 -32.48985008372064 28 -33.383728212776226 29 -32.81892001622564
		 30 -30.060272078369319 31 -24.285537325356895 32 -15.778201971419255;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Toes_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -36.555608478190067 1 -46.897828913643899
		 2 -52.526598240070783 3 -52.609658257386116 4 -48.201222145579088 5 -29.70114324635793
		 6 -25.754736351669475 7 -20.811617573675601 8 -13.609831517528365 9 -7.1405088789206523
		 10 -6.0078413119787903 11 -5.9944939284599252 12 -5.9946269117431097 13 -5.9944415423972259
		 14 -5.9945556549268026 15 -5.9946288954141096 16 -5.9943968781906678 17 -5.994208773381942
		 18 -5.994203289792809 19 -5.9941914158291167 20 -5.9941515796111293 21 -5.9941078304007362
		 22 -5.9940920611368416 23 -5.9940596520771008 24 -5.9940055899599551 25 -5.9939572069870133
		 26 -5.9939570306052881 27 -5.9938730310620576 28 -5.9953816615204012 29 -6.5849562484340947
		 30 -12.912514967724267 31 -24.283517738197251 32 -36.555608478190067;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTL -n "walk_sneak:Root_M_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -0.29300851543454365 1 -0.37682538531013593
		 2 -0.44207287204731216 3 -0.4970577849818803 4 -0.54285536592805395 5 -0.57683124642065564
		 6 -0.59331938918257776 7 -0.59024112666395967 8 -0.56705142792920749 9 -0.5258101146107268
		 10 -0.46615273048007683 11 -0.39064189716086323 12 -0.30620367101043189 13 -0.21181932020110228
		 14 -0.1063422620752843 15 0.011590231392836339 16 0.11916317854106984 17 0.20977537152390646
		 18 0.29727723165174597 19 0.33325460764848103 20 0.35030786159315214 21 0.34440219927379051
		 22 0.32025101955905361 23 0.28032495659080681 24 0.23395594976266201 25 0.19190087200659028
		 26 0.15099962397749533 27 0.1109136145761427 28 0.06155091534304484 29 -0.0049233545443904646
		 30 -0.092462491716251274 31 -0.19387327145642058 32 -0.29300851543454365;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTL -n "walk_sneak:Root_M_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.8325793286531429 1 5.6601880199539059
		 2 5.4892712197490177 3 5.3377610327165286 4 5.2311312059160713 5 5.1769555149235815
		 6 5.1674474769632539 7 5.191470259805353 8 5.2661167798083186 9 5.3984880073088917
		 10 5.5852220323485104 11 5.8026971091799044 12 6.0076401525361529 13 6.1409804024552734
		 14 6.1765975856568351 15 6.0997354003415305 16 5.9282917021324799 17 5.6757600580199288
		 18 5.3372062559349871 19 5.1280185708663746 20 5.0385881106612853 21 5.0291642102061056
		 22 5.0672668060271615 23 5.1928719188393959 24 5.4057625507562621 25 5.6614281858682434
		 26 5.9451979865021807 27 6.1426628864517694 28 6.2378331335557551 29 6.2229510173963583
		 30 6.124914838320068 31 5.9850242914501504 32 5.8325793286531429;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTL -n "walk_sneak:Root_M_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.70571493526335993 1 0.63165826968183203
		 2 0.56087153191485173 3 0.50236322861484073 4 0.45184920795649536 5 0.40322672388212855
		 6 0.35683829764168085 7 0.30908600053513396 8 0.2519172227598393 9 0.18346416088687373
		 10 0.11698845813790777 11 0.070148296931217755 12 0.058645555331771952 13 0.09418332315565886
		 14 0.15028889514095262 15 0.18530187649759752 16 0.16208893300362531 17 0.1099581359708643
		 18 0.066723996460389304 19 0.056135253860167919 20 0.063848009245961651 21 0.063032151080234092
		 22 0.068099110726168074 23 0.072138897167993946 24 0.076014798549422793 25 0.081979119141186718
		 26 0.13268092931367492 27 0.25298888988741247 28 0.41765232089567284 29 0.57660626926038017
		 30 0.69632078031915701 31 0.73731130122434096 32 0.70571493526335993;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Root_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 13.094599697936612 1 11.644991442641896
		 2 10.288905600093063 3 9.794736043796691 4 9.4989757305791773 5 9.1366077428446371
		 6 8.9221157661375319 7 8.7220141872013563 8 8.232026380048401 9 7.3820929464978864
		 10 6.0038028547067901 11 4.112292365537602 12 1.9431322019243047 13 0.41383839474749012
		 14 -0.0053918742611633484 15 0.22274145509883636 16 0.87370461118686971 17 1.7826687299859834
		 18 3.2132321457963693 19 4.6285183805453736 20 6.285278060344222 21 8.0487697588053955
		 22 9.5899397111308016 23 10.789337034060406 24 11.74818579513847 25 12.546729427580777
		 26 13.539285924823981 27 14.659837383228178 28 15.748521528857799 29 16.071240993393555
		 30 15.2491544575315 31 14.179583901742998 32 13.094599697936612;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Root_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -1.2378463516916742 1 -1.2504660362564048
		 2 -0.98978035661078034 3 -1.1035759270889809 4 -1.0117143980082424 5 -0.57582422376805853
		 6 -0.26614665691143785 7 -0.063365365978027263 8 0.097123775754628813 9 0.1000873752823289
		 10 -0.10439160617958887 11 -0.45216410026664733 12 -0.96170735080720238 13 -1.7631555397764309
		 14 -2.4475711626974568 15 -2.5700696611185676 16 -1.2358092417708375 17 1.18846854787936
		 18 3.8309092849064048 19 5.3963322724387863 20 5.725738581216814 21 5.0142597009667513
		 22 3.9426754148395657 23 2.4199516188484949 24 0.68309351373520288 25 -1.2218700887618268
		 26 -2.5057112720648385 27 -2.3995430645533196 28 -1.9116511677411241 29 -1.6579675896553148
		 30 -1.2363794602203231 31 -1.090434249907914 32 -1.2378463516916742;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Root_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.1131940917174588 1 0.6940227419490328
		 2 -0.10910821589449232 3 -1.1612058959390599 4 -2.401633865321259 5 -3.9449415332360136
		 6 -5.5811674297413809 7 -6.8663727070431433 8 -7.3877814539258884 9 -7.1112088441239791
		 10 -6.070041029628233 11 -4.4141527530964773 12 -2.4629905723743604 13 -0.67759294391435798
		 14 0.65327143142149624 15 1.374041377534212 16 1.3538670422431636 17 0.52766774140098227
		 18 -1.1792679469462979 19 -1.2648938753646271 20 -1.5843048736571543 21 -2.4500688155050181
		 22 -3.7246445039228413 23 -5.0689691328966564 24 -6.0171809965484426 25 -6.4036636872036841
		 26 -6.0183232216086431 27 -4.8250314878374416 28 -3.2334704589028593 29 -1.683864376156226
		 30 -0.2494732707273008 31 0.79260316313455648 32 1.1131940917174588;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Spine1_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -8.706807836972029 1 -7.5778222435178275
		 2 -6.4242419840042881 3 -5.8063029820003509 4 -5.3448672478417141 5 -4.956309914383672
		 6 -4.8853521577755457 7 -4.9736609545427566 8 -4.8163578805467404 9 -4.3783125105518215
		 10 -3.6603264273311091 11 -2.83882042905736 12 -1.5858934107899278 13 -0.37525671077884182
		 14 0.57259132868076124 15 1.156639592380958 16 1.0282595675707109 17 -0.024089097725562069
		 18 -1.8782128362166273 19 -3.7328253761897483 20 -5.219447420829006 21 -6.4644398220205268
		 22 -7.2882422393131607 23 -7.5818725551608503 24 -7.7111915761529222 25 -7.8906124631171659
		 26 -8.3108098140334281 27 -8.8156564767247918 28 -9.2835640085636566 29 -9.4029503877197342
		 30 -9.1588587889820392 31 -9.04715202856638 32 -8.706807836972029;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Spine1_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 6.5901427006677293 1 5.9778195079091558
		 2 4.9578107772520594 3 4.6142223057217331 4 3.7312271997869102 5 2.1719984078285521
		 6 1.2146308369399563 7 0.72096634993401654 8 0.39055489960821782 9 0.34551143358916264
		 10 0.58943025648410896 11 1.0238924967031124 12 1.1951354705784747 13 1.3574809895342406
		 14 1.3521125948128054 15 1.1454785176421081 16 -0.47380321943932685 17 -2.8930753388271375
		 18 -5.1825932696502228 19 -6.0914515175452832 20 -5.7359875891237033 21 -4.4575773903418945
		 22 -2.8961061533895291 23 -0.97338141523221788 24 1.1653494018094541 25 3.7034989258450288
		 26 5.9365612965578771 27 6.5300079999340728 28 6.6178430926952219 29 6.8976176764031907
		 30 6.8039022246504839 31 6.690123175522845 32 6.5901427006677293;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Spine1_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.0027916431053374 1 4.7161927471400249
		 2 7.31488400555466 3 8.8390256603081081 4 9.5401099129730991 5 9.8425123304160369
		 6 9.4524505094924809 7 8.5123238932361787 8 7.1607402475663475 9 5.74670514187458
		 10 4.3188663538077749 11 3.0633801697028855 12 2.1027838218658692 13 1.8373084604598937
		 14 2.4763160296391336 15 4.3138544134339787 16 6.9475244892663657 17 9.8576334448747662
		 18 12.915521874053457 19 14.150923497764932 20 14.72873366502942 21 14.86782215031841
		 22 13.921023592024412 23 12.003494534342234 24 9.3494687214973506 25 6.5458539436302985
		 26 2.8939824709208795 27 -1.0677926353940326 28 -4.3351908039619236 29 -5.6747092491647582
		 30 -4.9024628885056165 31 -2.4763498721117116 32 1.0027916431053374;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Spine2_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 3.5223654665719368 1 3.24420745023194
		 2 2.8854189421558711 3 2.6749098657997621 4 2.4886752439448157 5 2.3066044335338032
		 6 2.2643479503801078 7 2.3031192830051053 8 2.2520793896768883 9 2.0756490472155851
		 10 1.7623870788144804 11 1.3758689286340213 12 0.8071571068011637 13 0.28039214125977557
		 14 -0.10889795009845755 15 -0.33889348612048215 16 -0.33894719454104366 17 -0.048304482525538088
		 18 0.48984869257565261 19 1.02622074776567 20 1.4946984304878166 21 1.9671665651978567
		 22 2.3431404163399834 23 2.5937515740610846 24 2.8347148523399941 25 3.0931724409604655
		 26 3.3321321665114234 27 3.4480639091482566 28 3.5229204072534008 29 3.5039659287153739
		 30 3.4385984784643369 31 3.4989014317716212 32 3.5223654665719368;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Spine2_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.8486959087761448 1 -2.1878178976732889
		 2 -1.4454360849137622 3 -0.98095883377943394 4 -0.53421976384215619 5 -0.0024197293923965382
		 6 0.28844834287742921 7 0.42769812057079731 8 0.50617874868984458 9 0.50272717226043562
		 10 0.40827343054504384 11 0.20373103203870371 12 0.043120222170153745 13 -0.063858724247780607
		 14 -0.10714052746722724 15 -0.095691700360022933 16 0.13038774552957832 17 0.38896084405295078
		 18 0.43034858301615864 19 0.32695729282434371 20 0.051006577835165427 21 -0.34575039532104257
		 22 -0.83096192561781701 23 -1.3686711411208377 24 -1.9006655594717938 25 -2.4091873697581914
		 26 -2.8156410059148991 27 -2.9712467278228778 28 -3.0858279929519821 29 -3.258271492250064
		 30 -3.2678795301718773 31 -3.158092334626319 32 -2.8486959087761448;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Spine2_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.481533403025824 1 4.0843026668298297
		 2 3.1321204631975963 3 2.5728828713390079 4 2.3316481175256181 5 2.2487759163367902
		 6 2.4279735289276339 7 2.8169220124941461 8 3.3650048050137458 9 3.9291128700371636
		 10 4.4902040938455432 11 4.9800225226051689 12 5.3588687544850337 13 5.4619928496665553
		 14 5.2038682996067394 15 4.4669380136310126 16 3.4151249145935703 17 2.2657635799019764
		 18 1.0721894831831487 19 0.59473416083270525 20 0.34345371525152885 21 0.22767406567438717
		 22 0.52684777141373007 23 1.2209015793837283 24 2.2300601719294337 25 3.3191931909011978
		 26 4.7577579915742172 27 6.3254461996074793 28 7.6117759942700038 29 8.1231412134791174
		 30 7.8130661643787214 31 6.8433889228255556 32 5.481533403025824;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Chest_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.7817355486302189 1 -3.393716756596501
		 2 -2.9608196236998054 3 -2.716512026834045 4 -2.5084255070378561 5 -2.3048827587421727
		 6 -2.2523027424298805 7 -2.2810901574876152 8 -2.2186260277010033 9 -2.0364470188865358
		 10 -1.725096908227582 11 -1.3530057945798888 12 -0.79961346097572483 13 -0.2851939970131111
		 14 0.098730657276299927 15 0.33044080046260854 16 0.34524914852798405 17 0.06358833701693456
		 18 -0.48172442752685535 19 -1.0227765659414898 20 -1.4943480167991332 21 -1.9685820923743045
		 22 -2.3509188633398783 23 -2.6230269322236457 24 -2.9079568912586025 25 -3.2297970638410867
		 26 -3.5575325942500395 27 -3.758048282396282 28 -3.9026878469247062 29 -3.9308019830929264
		 30 -3.8526739014913165 31 -3.8542225308934857 32 -3.7817355486302189;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Chest_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.4938650875232518 1 1.9476405329432649
		 2 1.2838130342553231 3 0.85887083577970713 4 0.43205333093747245 5 -0.088106499903442867
		 6 -0.38380407877417061 7 -0.54014393913532499 8 -0.63715158875415445 9 -0.64327043823994123
		 10 -0.5448163218134261 11 -0.32231236756665577 12 -0.11827200247532617 13 0.036861612336594511
		 14 0.11707591510513109 15 0.12173171389641879 16 -0.11012086236029102 17 -0.38674434292844212
		 18 -0.4394237795151652 19 -0.33754252037545163 20 -0.059930911208507763 21 0.33766478929706445
		 22 0.8086626869049377 23 1.3117018082195091 24 1.7865620124175354 25 2.2225590598275375
		 26 2.5270087091329172 27 2.5681366828842109 28 2.5859549382620823 29 2.7187460524183118
		 30 2.761777853461866 31 2.7125313691829063 32 2.4938650875232518;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Chest_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.651389930013309 1 -4.2040244596772949
		 2 -3.2017061763820847 3 -2.6161150674552669 4 -2.3527421792479855 5 -2.2476213532270606
		 6 -2.41474026883128 7 -2.7975563148105871 8 -3.3427174618133093 9 -3.908579199155207
		 10 -4.475731330272243 11 -4.9737590532916274 12 -5.3577359507102189 13 -5.4621842451075695
		 14 -5.2036635889815379 15 -4.4663038969906248 16 -3.4158404011931989 17 -2.2661362054306435
		 18 -1.0685025500215581 19 -0.58880824552445032 20 -0.34201318590780289 21 -0.23884851719257744
		 22 -0.56046698798190731 23 -1.2819098049624165 24 -2.3224498659432267 25 -3.4469146451218431
		 26 -4.9180686733614678 27 -6.4991464220137409 28 -7.7947769423069637 29 -8.3163670348110639
		 30 -8.0039155829281903 31 -7.031161828519469 32 -5.651389930013309;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Scapula_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.1817433459952025e-006 1 -2.1817433459952025e-006
		 2 -2.1817433459952025e-006 3 -2.1817433459952025e-006 4 -2.1817433459952025e-006
		 5 -2.1817433459952025e-006 6 -2.1817433459952025e-006 7 -2.1817433459952025e-006
		 8 -2.1817433459952025e-006 9 -2.1817433459952025e-006 10 -2.1817433459952025e-006
		 11 -2.1817433459952025e-006 12 -2.1817433459952025e-006 13 -2.1817433459952025e-006
		 14 -2.1817433459952025e-006 15 -2.1817433459952025e-006 16 -2.1817433459952025e-006
		 17 -2.1817433459952025e-006 18 -2.1817433459952025e-006 19 -2.1817433459952025e-006
		 20 -2.1817433459952025e-006 21 -2.1817433459952025e-006 22 -2.1817433459952025e-006
		 23 -2.1817433459952025e-006 24 -2.1817433459952025e-006 25 -2.1817433459952025e-006
		 26 -2.1817433459952025e-006 27 -2.1817433459952025e-006 28 -2.1817433459952025e-006
		 29 -2.1817433459952025e-006 30 -2.1817433459952025e-006 31 -2.1817433459952025e-006
		 32 -2.1817433459952025e-006;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Scapula_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.4203839476090244e-006 1 2.4203839476090244e-006
		 2 2.4203839476090244e-006 3 2.4203839476090244e-006 4 2.4203839476090244e-006 5 2.4203839476090244e-006
		 6 2.4203839476090244e-006 7 2.4203839476090244e-006 8 2.4203839476090244e-006 9 2.4203839476090244e-006
		 10 2.4203839476090244e-006 11 2.4203839476090244e-006 12 2.4203839476090244e-006
		 13 2.4203839476090244e-006 14 2.4203839476090244e-006 15 2.4203839476090244e-006
		 16 2.4203839476090244e-006 17 2.4203839476090244e-006 18 2.4203839476090244e-006
		 19 2.4203839476090244e-006 20 2.4203839476090244e-006 21 2.4203839476090244e-006
		 22 2.4203839476090244e-006 23 2.4203839476090244e-006 24 2.4203839476090244e-006
		 25 2.4203839476090244e-006 26 2.4203839476090244e-006 27 2.4203839476090244e-006
		 28 2.4203839476090244e-006 29 2.4203839476090244e-006 30 2.4203839476090244e-006
		 31 2.4203839476090244e-006 32 2.4203839476090244e-006;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Scapula_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -8.1415927139264375e-006 1 -8.1415927139264375e-006
		 2 -8.1415927139264375e-006 3 -8.1415927139264375e-006 4 -8.1415927139264375e-006
		 5 -8.1415927139264375e-006 6 -8.1415927139264375e-006 7 -8.1415927139264375e-006
		 8 -8.1415927139264375e-006 9 -8.1415927139264375e-006 10 -8.1415927139264375e-006
		 11 -8.1415927139264375e-006 12 -8.1415927139264375e-006 13 -8.1415927139264375e-006
		 14 -8.1415927139264375e-006 15 -8.1415927139264375e-006 16 -8.1415927139264375e-006
		 17 -8.1415927139264375e-006 18 -8.1415927139264375e-006 19 -8.1415927139264375e-006
		 20 -8.1415927139264375e-006 21 -8.1415927139264375e-006 22 -8.1415927139264375e-006
		 23 -8.1415927139264375e-006 24 -8.1415927139264375e-006 25 -8.1415927139264375e-006
		 26 -8.1415927139264375e-006 27 -8.1415927139264375e-006 28 -8.1415927139264375e-006
		 29 -8.1415927139264375e-006 30 -8.1415927139264375e-006 31 -8.1415927139264375e-006
		 32 -8.1415927139264375e-006;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Shoulder_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.04400272967949 1 2.9235587076925991
		 2 3.3353168624170819 3 3.2417060557027746 4 3.2117362596753893 5 3.2664503575856849
		 6 3.259920283962201 7 3.656080490244761 8 4.3459876397553536 9 4.7511559113108639
		 10 4.5007918870947003 11 3.8570075549103717 12 3.2188436154868056 13 3.0900304181491181
		 14 3.3644691275122156 15 4.7740619621386386 16 7.3027782063402258 17 10.099624034184711
		 18 12.296131757591665 19 13.054650490217169 20 13.274512682632089 21 13.019572786094241
		 22 11.690460648545212 23 9.5829957843357167 24 7.0057526315175114 25 4.6746708670220629
		 26 2.2294287043662648 27 0.31591066359757902 28 -0.8199966233564614 29 -0.99857051775784689
		 30 -0.22174625505201334 31 0.91230063357110402 32 2.04400272967949;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Shoulder_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 31.074046894454419 1 32.274364117252603
		 2 32.60350936288588 3 32.155748013641372 4 31.840625669036346 5 31.842853562887107
		 6 31.982461328328341 7 32.299840864684484 8 32.452549094801519 9 32.281905411400352
		 10 31.734588815605289 11 31.244586286834373 12 30.779164865484418 13 30.646825894658829
		 14 30.788864398597703 15 32.138918266924932 16 34.473214348912947 17 36.982401807629657
		 18 39.208140312990018 19 39.69579322921382 20 39.939097461853095 21 40.047792837306851
		 22 39.134286699957379 23 37.119942154337778 24 34.515723788447033 25 32.023152323956836
		 26 29.468140860363761 27 27.493229083303333 28 26.436956656550624 29 26.746433598595704
		 30 28.089788076359735 31 29.602417991664922 32 31.074046894454419;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Shoulder_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -62.472506432703632 1 -62.61086137058755
		 2 -62.921888178500033 3 -63.188343686440724 4 -63.716218656112794 5 -64.285467295007379
		 6 -64.550776037771016 7 -65.038385533986599 8 -65.981883945422567 9 -66.816051740110481
		 10 -67.043226885501952 11 -66.574378359076661 12 -66.026940164572792 13 -66.220578172134324
		 14 -66.992769451822952 15 -68.297895539996588 16 -70.082397566336525 17 -71.674347759142435
		 18 -72.240787582115161 19 -72.599319538344673 20 -72.720549475813684 21 -72.675495097744516
		 22 -72.047747346150501 23 -70.977816234998642 24 -69.181153639062032 25 -67.353331507556021
		 26 -65.79059113759638 27 -65.201969370081187 28 -64.696179367345422 29 -63.676400638827474
		 30 -62.799476010694072 31 -62.501679707308341 32 -62.472506432703632;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Elbow_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -59.828878369220782 1 -59.054544656236274
		 2 -59.175139424790608 3 -59.514323373835609 4 -59.570447789591078 5 -59.801521233935475
		 6 -60.318871176832722 7 -60.720764276836668 8 -61.294602315398684 9 -62.342333460431284
		 10 -63.580971579076632 11 -64.643185132184172 12 -65.326377836027063 13 -65.109488428884717
		 14 -64.212251941592143 15 -62.856412817807303 16 -61.431667454074976 17 -60.020317903673181
		 18 -58.181750115032692 19 -57.320849076462693 20 -56.009676285835603 21 -55.302722005571013
		 22 -55.634829230161657 23 -57.084580838667485 24 -59.258649127005533 25 -61.396783839621463
		 26 -62.413465554083452 27 -62.490268058140778 28 -62.314518184677034 29 -61.855318794821841
		 30 -61.306985171127813 31 -60.648377179007255 32 -59.828878369220782;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Elbow_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 16.407594982707796 1 15.943270728647828
		 2 16.101365000666348 3 16.469663351836815 4 16.575263431969987 5 16.542862526511762
		 6 16.541326459511563 7 16.811115274629696 8 17.663164070528993 9 18.826485537663064
		 10 19.775212149417072 11 20.204936397752718 12 20.295427805376345 13 19.821494758006445
		 14 18.90593715059752 15 17.888574294543812 16 17.187384830572459 17 16.72914790410077
		 18 16.007846446763583 19 15.579089569536198 20 14.375466723665705 21 12.980764156585911
		 22 12.453135793832345 23 13.304545535355148 24 15.20960896377688 25 17.175504276048692
		 26 17.741256929781574 27 17.243094084574185 28 16.73695722008047 29 16.390626246589708
		 30 16.47116280919143 31 16.573500002584193 32 16.407594982707796;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Elbow_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 105.71715760120847 1 105.92997933816847
		 2 106.30799799155743 3 106.62229239813357 4 106.32779301841822 5 105.80573960763711
		 6 105.51624121191115 7 105.57783087616781 8 105.86247315597966 9 106.1335336700339
		 10 106.29148061307366 11 106.43451495352028 12 106.6770337259719 13 106.69556176500728
		 14 106.63742510907583 15 106.35611402196831 16 106.01373555990162 17 105.72514166477504
		 18 105.43055150031422 19 106.16563489942126 20 106.46687315239207 21 106.44982644916207
		 22 106.49080959076653 23 106.57361340878653 24 106.87758753871211 25 107.19480277299137
		 26 106.97185470287189 27 105.98677217097173 28 105.15495054933849 29 104.90993580867801
		 30 105.09915687026508 31 105.44061440683082 32 105.71715760120847;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Wrist_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.45803133902324206 1 -0.77617614161922099
		 2 -2.5568876743788591 3 -3.9770552258801715 4 -4.9915932651988699 5 -4.2246513402285366
		 6 -2.5816778737687325 7 -1.2426876914205145 8 -1.2370619960372506 9 -1.2710166869036346
		 10 -1.3448939467684775 11 -1.5123955171032319 12 -1.6571560165756158 13 -2.44782514767995
		 14 -3.8014002751541236 15 -5.011617371983105 16 -5.316736183908171 17 -5.3567680813317589
		 18 -5.2512553821302728 19 -4.6881299394829403 20 -4.0259344698220936 21 -3.6773990312649891
		 22 -3.4586847028893861 23 -3.039179048192751 24 -2.6756442916762282 25 -2.637832242909925
		 26 -2.4325978245649398 27 -1.8825841008780348 28 -1.210365442616868 29 -0.92603896946338837
		 30 -0.58005567420531667 31 0.25663822722420854 32 0.45803133902324206;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Wrist_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 19.671719147133768 1 18.158082703935186
		 2 15.472977742883847 3 13.051501859810456 4 11.158959140206081 5 12.588624059337743
		 6 15.630019317034529 7 18.004867366048487 8 17.959317684064079 9 17.846935757415956
		 10 17.699966097026628 11 17.414166963135859 12 17.174545922454659 13 15.836960352326695
		 14 13.411139741241266 15 11.118850996816651 16 10.575108034632303 17 10.531220689261261
		 18 10.782806399647042 19 11.993839660966811 20 13.416624605550377 21 14.113053567159012
		 22 14.437736641010829 23 14.951082402206834 24 15.31980587266062 25 15.226425281748844
		 26 15.397971334531796 27 16.073823311933822 28 16.93007872931155 29 17.332175467540239
		 30 17.885699158081223 31 19.161180620843602 32 19.671719147133768;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Wrist_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -65.548106116277893 1 -62.483890550648738
		 2 -59.396267733280524 3 -56.934639887871008 4 -55.336612605550265 5 -54.756711155039902
		 6 -54.889269714903961 7 -55.34099036349383 8 -55.428499588185851 9 -55.348569249124672
		 10 -55.002558801173137 11 -54.629515364731532 12 -54.303539017861091 13 -53.35676867533634
		 14 -52.023955490973918 15 -51.273036563700565 16 -51.761074771153979 17 -52.504526942905713
		 18 -54.464835421658677 19 -55.758933340032414 20 -59.691710284057535 21 -64.808294411421642
		 22 -68.227918692999253 23 -69.14420525011613 24 -69.271699733622071 25 -69.380189610266484
		 26 -70.115058638120047 27 -71.177165973017964 28 -71.392606892330662 29 -70.562847546753744
		 30 -69.011155011672315 31 -67.649602185137866 32 -65.548106116277893;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Neck_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.4825949560995713 1 -2.776587461207678
		 2 -2.8061255198076847 3 -2.7890468830137265 4 -2.8400281742252003 5 -2.8989875423294409
		 6 -2.8164842262234551 7 -2.8909918206531322 8 -3.2629464939289736 9 -3.5256604725939344
		 10 -3.2348573750702476 11 -2.3860360675257963 12 -1.6229775353569114 13 -1.0988245299356294
		 14 -0.72866337664442393 15 -0.25446890024143803 16 0.029530825427852569 17 0.16172008949789002
		 18 -0.0051823126901241658 19 -0.084434452467746376 20 -0.18745175259032426 21 -0.27225419737514467
		 22 -0.29784973440977147 23 -0.42793737647830715 24 -0.7361844786514985 25 -1.0973529283914436
		 26 -1.2351162451501396 27 -1.1216867465727633 28 -1.0025350190745486 29 -1.2195525947726744
		 30 -1.6141071316548168 31 -2.0516215634030552 32 -2.4825949560995713;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Neck_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -8.144487939747405 1 -7.3219016391478737
		 2 -7.083302489105745 3 -7.0771768370117139 4 -6.8160691873798847 5 -6.8036895889392959
		 6 -7.8378003045101243 7 -9.1806408341727792 8 -9.3866608381460708 9 -7.7781064918139879
		 10 -5.119102867914112 11 -3.2853927240768201 12 -1.3503736006041429 13 1.2615436246975265
		 14 3.714815940262342 15 3.7387107197221621 16 2.2228286541450291 17 -0.10975434956799948
		 18 -2.9324062613653248 19 -3.3304829760256438 20 -3.8416372877720817 21 -4.4368326963428713
		 22 -5.3955900092742768 23 -6.1372797342236831 24 -6.147879625812374 25 -5.6430804017616154
		 26 -5.9870516500905353 27 -7.2314515530407002 28 -8.8214300770689107 29 -9.6542948601262104
		 30 -9.7020400718992619 31 -9.0858193706548303 32 -8.144487939747405;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Neck_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 20.404650228575687 1 21.769633829300385
		 2 23.934390155202259 3 25.876177284286459 4 27.184440772101102 5 27.92645386731138
		 6 27.945536816582042 7 26.272882408787734 8 23.048360299414536 9 19.694286963264698
		 10 17.955248746535439 11 17.818849633694111 12 18.30213139758289 13 18.466805296070579
		 14 18.401030236547719 15 18.38219088483498 16 19.043933435332253 17 20.201740732334809
		 18 23.911965860962205 19 24.286840531815447 20 24.624140131885543 21 24.947751642733344
		 22 25.774395620794508 23 26.09938616060947 24 25.679201678357149 25 25.373410977139844
		 26 26.207552988456982 27 27.089434688729437 28 26.490392337949839 29 24.31471765475035
		 30 21.890935844306615 31 20.618110943811953 32 20.404650228575687;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Head_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -11.742483587030147 1 -11.954035181043002
		 2 -11.732624284571031 3 -11.440723402950802 4 -11.31421158920419 5 -11.466813407217673
		 6 -11.889148284325184 7 -12.858523756118174 8 -13.962170917504771 9 -13.900944690097916
		 10 -12.005464414566877 11 -8.9248986891301101 12 -6.0314652072319763 13 -3.5060394773980179
		 14 -1.5153809329225305 15 -0.16223253956769765 16 0.03151958260687291 17 -0.53778968935163973
		 18 -2.4828717973387331 19 -2.8150001819319299 20 -3.2292043177598453 21 -3.6871619306032675
		 22 -4.3034534419002579 23 -5.1707861384276113 24 -6.261642394594209 25 -7.2763536010874708
		 26 -8.2531262895508934 27 -8.9877565814217668 28 -9.6228023933576985 29 -10.306038605553814
		 30 -10.832922755206038 31 -11.313455863338637 32 -11.742483587030147;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Head_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.6817465506949567 1 6.9977074121708318
		 2 8.4858903314258711 3 9.8317215865948544 4 10.462387491485364 5 10.795194032871162
		 6 11.616291121033189 7 12.375962899807949 8 11.792933409939339 9 9.3257087946239103
		 10 6.0743583978066633 11 3.6332626798691723 12 1.5346452494879159 13 -0.52676035254889086
		 14 -2.4889686410076335 15 -2.8729921097973086 16 -2.3992236073089144 17 -1.2670448654221154
		 18 0.6992963047223002 19 1.4593596789817822 20 2.3958443267192715 21 3.1628006684413204
		 22 3.9943654937976794 23 4.6327174816745202 24 4.4104116425401321 25 3.5544770284971232
		 26 3.0857958520278195 27 3.2903498400604345 28 3.8306055031238717 29 4.076007420315106
		 30 4.2947883809479341 31 4.8012980469304525 32 5.6817465506949567;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Head_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -17.067385517431752 1 -21.578318989605719
		 2 -25.685115798464135 3 -29.019828485197486 4 -30.979834652669986 5 -31.539471312844821
		 6 -30.394173525729453 7 -26.901304701876505 8 -22.067755159484978 9 -18.062286356346732
		 10 -16.289610091748248 11 -16.355403356288345 12 -17.230484433012091 13 -17.76927895349138
		 14 -17.882552483125075 15 -18.602291984314448 16 -20.273613169552583 17 -22.420922944038583
		 18 -22.407336699301901 19 -25.580893620584526 20 -27.751887784957539 21 -29.003006275820844
		 22 -29.158579819979696 23 -27.206235663909546 24 -22.874970844407642 25 -18.361869888174102
		 26 -14.781667897386422 27 -12.520875375571514 28 -10.56801544318326 29 -9.5548728177023872
		 30 -10.223292999841215 31 -13.115732112022128 32 -17.067385517431752;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Scapula_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.1307251692906871e-005 1 -2.1307251692906871e-005
		 2 -2.1307251692906871e-005 3 -2.1307251692906871e-005 4 -2.1307251692906871e-005
		 5 -2.1307251692906871e-005 6 -2.1307251692906871e-005 7 -2.1307251692906871e-005
		 8 -2.1307251692906871e-005 9 -2.1307251692906871e-005 10 -2.1307251692906871e-005
		 11 -2.1307251692906871e-005 12 -2.1307251692906871e-005 13 -2.1307251692906871e-005
		 14 -2.1307251692906871e-005 15 -2.1307251692906871e-005 16 -2.1307251692906871e-005
		 17 -2.1307251692906871e-005 18 -2.1307251692906871e-005 19 -2.1307251692906871e-005
		 20 -2.1307251692906871e-005 21 -2.1307251692906871e-005 22 -2.1307251692906871e-005
		 23 -2.1307251692906871e-005 24 -2.1307251692906871e-005 25 -2.1307251692906871e-005
		 26 -2.1307251692906871e-005 27 -2.1307251692906871e-005 28 -2.1307251692906871e-005
		 29 -2.1307251692906871e-005 30 -2.1307251692906871e-005 31 -2.1307251692906871e-005
		 32 -2.1307251692906871e-005;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Scapula_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.0005552369177469e-005 1 1.0005552369177469e-005
		 2 1.0005552369177469e-005 3 1.0005552369177469e-005 4 1.0005552369177469e-005 5 1.0005552369177469e-005
		 6 1.0005552369177469e-005 7 1.0005552369177469e-005 8 1.0005552369177469e-005 9 1.0005552369177469e-005
		 10 1.0005552369177469e-005 11 1.0005552369177469e-005 12 1.0005552369177469e-005
		 13 1.0005552369177469e-005 14 1.0005552369177469e-005 15 1.0005552369177469e-005
		 16 1.0005552369177469e-005 17 1.0005552369177469e-005 18 1.0005552369177469e-005
		 19 1.0005552369177469e-005 20 1.0005552369177469e-005 21 1.0005552369177469e-005
		 22 1.0005552369177469e-005 23 1.0005552369177469e-005 24 1.0005552369177469e-005
		 25 1.0005552369177469e-005 26 1.0005552369177469e-005 27 1.0005552369177469e-005
		 28 1.0005552369177469e-005 29 1.0005552369177469e-005 30 1.0005552369177469e-005
		 31 1.0005552369177469e-005 32 1.0005552369177469e-005;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Scapula_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.7472791986738114e-005 1 -2.7472791986738114e-005
		 2 -2.7472791986738114e-005 3 -2.7472791986738114e-005 4 -2.7472791986738114e-005
		 5 -2.7472791986738114e-005 6 -2.7472791986738114e-005 7 -2.7472791986738114e-005
		 8 -2.7472791986738114e-005 9 -2.7472791986738114e-005 10 -2.7472791986738114e-005
		 11 -2.7472791986738114e-005 12 -2.7472791986738114e-005 13 -2.7472791986738114e-005
		 14 -2.7472791986738114e-005 15 -2.7472791986738114e-005 16 -2.7472791986738114e-005
		 17 -2.7472791986738114e-005 18 -2.7472791986738114e-005 19 -2.7472791986738114e-005
		 20 -2.7472791986738114e-005 21 -2.7472791986738114e-005 22 -2.7472791986738114e-005
		 23 -2.7472791986738114e-005 24 -2.7472791986738114e-005 25 -2.7472791986738114e-005
		 26 -2.7472791986738114e-005 27 -2.7472791986738114e-005 28 -2.7472791986738114e-005
		 29 -2.7472791986738114e-005 30 -2.7472791986738114e-005 31 -2.7472791986738114e-005
		 32 -2.7472791986738114e-005;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Shoulder_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 15.517800800252912 1 16.902162128594203
		 2 17.382391830570423 3 17.852432624778036 4 18.266190874649311 5 18.521164571961531
		 6 18.258254548687606 7 17.960673446715116 8 17.673767462044076 9 17.59905086065368
		 10 17.159248971066148 11 15.916030016581221 12 14.177984639844436 13 13.12800064904833
		 14 13.210774684275252 15 13.864690909181567 16 14.75426492790225 17 15.391210993028652
		 18 15.595023024805545 19 15.899374275310221 20 15.581407673534002 21 15.106176912241457
		 22 14.715274136148567 23 14.4599982149449 24 14.029708191044055 25 13.128106608894152
		 26 11.183463573195128 27 9.2681005881151339 28 8.6359063912313996 29 9.5888462694173722
		 30 11.388842801830252 31 13.457365551650248 32 15.517800800252912;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Shoulder_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 19.693752353889785 1 20.774288498185957
		 2 21.158047085601559 3 21.779642260778051 4 22.716062170450094 5 23.302841265282769
		 6 23.126391152230337 7 22.801701082731171 8 22.542457873307946 9 22.253698687986066
		 10 20.960126313272109 11 18.154827690644538 12 15.3326899407596 13 13.977397122431734
		 14 14.15589170585192 15 15.020213949295362 16 16.470047526661382 17 17.629506824070322
		 18 18.052308670360699 19 17.825146542427913 20 17.29576671384131 21 17.255453347486938
		 22 17.056854981027197 23 16.797096861910862 24 16.103603607411962 25 14.846378516913568
		 26 12.675095965543317 27 11.202539392633581 28 11.506349173482954 29 13.463930708313995
		 30 15.737655439889148 31 17.837360062430058 32 19.693752353889785;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Shoulder_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -76.08573991588905 1 -75.046486381956086
		 2 -73.866868498005857 3 -73.073945742951764 4 -72.775080626370553 5 -72.594426814189021
		 6 -72.745830770776479 7 -73.105946016546582 8 -73.617852204201725 9 -73.722053486715353
		 10 -73.400950649687232 11 -73.031422303165414 12 -73.159604878558255 13 -73.608949158352203
		 14 -74.089128582706124 15 -74.346342199547337 16 -74.273890355408739 17 -74.170375126027608
		 18 -74.367191762209444 19 -74.603543395961125 20 -74.677433218565128 21 -74.746430113095172
		 22 -74.972653285066443 23 -75.453965776564189 24 -76.005510384359297 25 -76.436775431062017
		 26 -76.666887898557349 27 -76.898523510167166 28 -77.284089336566041 29 -77.629257477411883
		 30 -77.41036147570766 31 -76.805229304027662 32 -76.08573991588905;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Elbow_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 221.84121106405038 1 219.10071011517263
		 2 216.07019708503566 3 217.53736407137947 4 225.71638759702702 5 232.51942401014063
		 6 235.00234499633973 7 234.96049936983525 8 233.78723446546886 9 229.29989806825637
		 10 217.01599493847917 11 199.69396499113853 12 191.53359183221693 13 190.20893240502949
		 14 189.32296527502885 15 186.48248741831938 16 187.78167747808098 17 192.51062004699904
		 18 199.57872521033872 19 197.50858929125903 20 196.83976094667585 21 201.79512788476416
		 22 203.79772872023725 23 202.91543720352908 24 199.19993240815072 25 195.73847370369131
		 26 191.56979346137211 27 193.53152459982496 28 202.86398400413606 29 214.55653241538036
		 30 220.17201524752073 31 221.75032124061093 32 221.84121106405038;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Elbow_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 73.615861275379729 1 73.005272559414166
		 2 72.826420373458859 3 72.757808745661904 4 72.309522893185346 5 72.001353162033993
		 6 72.008026013904015 7 72.188191418838656 8 72.439104885765445 9 73.312108041548441
		 10 74.215500994781138 11 73.610720773550682 12 71.858300510109586 13 70.921392609811548
		 14 70.729679842640152 15 70.465910158167304 16 70.550902828091182 17 70.93892560759231
		 18 71.242713248587194 19 71.07136912272864 20 71.084632743805187 21 71.379782313287848
		 22 72.051672442561497 23 72.789947140967328 24 73.394151500528636 25 73.897183167123003
		 26 74.435686823879493 27 74.948491965347571 28 75.419556989170957 29 75.571578556606624
		 30 75.386694431920972 31 74.621656806587495 32 73.615861275379729;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Elbow_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -211.73133346665381 1 -207.66496976982492
		 2 -203.83311110669786 3 -204.28182428316319 4 -210.90014835396417 5 -216.44762970573973
		 6 -218.72166589015112 7 -219.04494865697279 8 -218.69414186344162 9 -215.28863520189557
		 10 -204.79231296800299 11 -189.96652473417106 12 -183.93385364082033 13 -183.94149932088214
		 14 -183.75850205097339 15 -181.12161449793268 16 -181.61242413991764 17 -185.11366207125309
		 18 -191.06358245699687 19 -189.02697743355648 20 -188.71543652139064 21 -193.28819310739314
		 22 -195.23014435404104 23 -194.83568507951671 24 -192.00421498955654 25 -189.59066857520577
		 26 -187.43742079628728 27 -190.49802928915409 28 -199.6214318152966 29 -209.69467295363091
		 30 -213.45747259335636 31 -213.35176977906789 32 -211.73133346665381;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Wrist_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -59.947069681596915 1 -61.446239840516292
		 2 -61.78226494830119 3 -62.120475841939424 4 -62.498537591428693 5 -62.801328021382588
		 6 -62.649855286897697 7 -62.098215650106695 8 -61.416555968268234 9 -61.388372835927981
		 10 -62.686760291669287 11 -66.016810910197009 12 -69.189836873867847 13 -71.00897791173071
		 14 -71.283939373753611 15 -69.652810257150307 16 -67.03511728556856 17 -65.562344084802106
		 18 -66.288812000880966 19 -67.892404102574972 20 -68.91520317184326 21 -68.242094023991783
		 22 -66.870605445878724 23 -65.898036974107328 24 -65.78988324292439 25 -66.326082955751005
		 26 -66.673641503349472 27 -66.012895567316235 28 -63.634217293433935 29 -60.375997052726532
		 30 -58.037617701723029 31 -58.286634819324689 32 -59.947069681596915;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Wrist_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -8.1110428670773675 1 -8.1581407906816032
		 2 -11.107497993116885 3 -13.21754882224719 4 -12.96884919183209 5 -12.47182327225398
		 6 -12.390789932352321 7 -12.319086639065834 8 -12.235624945794019 9 -12.245893780200459
		 10 -12.469628448376852 11 -11.96952413484094 12 -10.232204935787996 13 -8.1916051663573413
		 14 -8.5901348766046421 15 -11.969182130958314 16 -14.99923147602693 17 -15.619757915247002
		 18 -12.648790793635618 19 -11.79584152608621 20 -11.402467440796283 21 -11.010136765937837
		 22 -11.192266980819838 23 -12.165033739750012 24 -13.343199713532439 25 -13.288687490931805
		 26 -12.882613352386818 27 -12.585273751502946 28 -12.653529269600782 29 -13.439784872267573
		 30 -13.881497534063552 31 -11.355144306572384 32 -8.1110428670773675;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Wrist_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -44.663016912671054 1 -44.180390877739129
		 2 -43.667622833886085 3 -43.489611892370846 4 -43.77413175881339 5 -44.035270004669528
		 6 -44.78448228655013 7 -45.634883540136308 8 -46.623236592396815 9 -47.535911081248265
		 10 -48.211882372947386 11 -48.536825125967695 12 -48.664806149800363 13 -48.880760841546923
		 14 -48.562015101811646 15 -47.700470810310236 16 -46.702084850033536 17 -46.365666406422932
		 18 -46.263473996364588 19 -45.779634985865322 20 -45.440711088226969 21 -45.315292411857037
		 22 -45.48150157781911 23 -45.272621010922414 24 -45.205653243169252 25 -45.680445424240219
		 26 -46.493101401647095 27 -46.970324085573864 28 -46.981241070877267 29 -46.488332569050968
		 30 -45.542142295782391 31 -44.944277105179069 32 -44.663016912671054;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Hip_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.16404449346369582 1 -0.96012102070768313
		 2 -2.0421598245368884 3 -2.479105709607035 4 -2.377679307757298 5 -2.0346050945907921
		 6 -1.5380984424418807 7 -0.98182057569671077 8 -0.56966588161891796 9 -0.34806125036714936
		 10 -0.35746672740656887 11 -0.48588783862811641 12 -0.58192085780215375 13 -0.50533985966604678
		 14 -0.55926102035398928 15 -0.85542036607871297 16 -0.71516127732507273 17 0.38047937124948811
		 18 2.3072769945553451 19 3.2226549899231389 20 3.9001435249488297 21 4.1523348590847808
		 22 4.3507161865109039 23 4.5478367349736954 24 4.4569468924880749 25 3.7545067697060674
		 26 2.7805920147478846 27 2.2653110908929777 28 1.8744044695302666 29 1.532232381752396
		 30 1.2057128745828798 31 0.84877801091977478 32 0.16404449346369582;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Hip_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.40989320576257515 1 -1.576173316882044
		 2 -3.3907696632702065 3 -4.8079571509884804 4 -5.3533438138869176 5 -5.5904526657707647
		 6 -5.6649507996084187 7 -5.5421486656706112 8 -5.0236863872603505 9 -4.3920217484793707
		 10 -3.9316569038675269 11 -3.6707830618748516 12 -3.7015041006528246 13 -3.7526537112310954
		 14 -3.2378369193211478 15 -1.4235303089098919 16 1.9307441406933787 17 5.7264875146325318
		 18 9.0738834655143883 19 9.9104220504458613 20 9.8311281398325594 21 8.9812190397704565
		 22 8.2458554678091449 23 7.2946573317989678 24 6.1734957469276184 25 4.7388081132785125
		 26 3.5549013367066333 27 2.9792997131243726 28 2.5527841452683599 29 2.4186341351351675
		 30 2.2208801578292179 31 1.6326760075255233 32 0.40989320576257515;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Hip_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -36.382798672466684 1 -37.62387257999
		 2 -37.940627623201905 3 -37.206373340595405 4 -35.640238435121567 5 -33.384477324571584
		 6 -30.506743849128664 7 -27.452314733535438 8 -24.429459294988213 9 -21.66180461075297
		 10 -19.068775260102793 11 -16.66071364159254 12 -14.364604304284287 13 -12.165049348068678
		 14 -11.072491953648031 15 -12.871924940888826 16 -18.337537453028606 17 -26.337021390771117
		 18 -37.327202964131345 19 -48.920178586565072 20 -57.798798297570528 21 -63.325298208622648
		 22 -66.313606771144919 23 -65.873788866576859 24 -61.187106913001969 25 -53.842787850798828
		 26 -44.152117087523777 27 -36.271864002593489 28 -31.601763064843436 29 -30.457968681576716
		 30 -31.895803952443412 31 -34.416132395003885 32 -36.382798672466684;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Knee_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.1685773362623419 1 2.1935978987750295
		 2 2.3773315352162938 3 3.672076479255022 4 5.3366188061348554 5 6.5334410570800676
		 6 7.3923560105100901 7 7.8464149674644483 8 7.6996712854701972 9 6.7882435047284755
		 10 4.9412711254426736 11 2.4805514118250014 12 -0.016719222158045263 13 -1.5215522192851274
		 14 -2.5594613637944441 15 -3.2949685657329928 16 -2.8884834526758048 17 -1.379952203794039
		 18 1.0843785859771216 19 3.0158372371745488 20 4.9939235249900289 21 6.1266692039055748
		 22 6.6495883699401119 23 6.3964575008679514 24 5.7867660465485136 25 5.1326324281698046
		 26 3.7832421083307506 27 2.561786275637985 28 1.7438577039794094 29 1.3649975522390783
		 30 1.3817125872194873 31 1.8397897872694093 32 2.1685773362623419;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Knee_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -9.3827964292718296 1 -10.65008374221614
		 2 -11.981250585025917 3 -12.832237376632603 4 -13.545346486724332 5 -13.374387021722393
		 6 -12.793315371051616 7 -11.959056888471109 8 -11.501264065747128 9 -11.005898091701717
		 10 -10.004103371074191 11 -8.2384597018349677 12 -5.3767149142129336 13 -2.5428341676979209
		 14 -1.2152149156700631 15 -2.2915597960755156 16 -4.145264657183235 17 -4.8602693557632692
		 18 -5.3014901437289783 19 -7.1882011635388574 20 -8.9161628433099587 21 -9.9753912684317445
		 22 -10.336671710370394 23 -9.1819619794510352 24 -7.1459624120799967 25 -5.8456985303484199
		 26 -5.4902145197864725 27 -4.0384853051045972 28 -2.9582835351253327 29 -4.3906287498662788
		 30 -6.3322338071118489 31 -7.9087170477146032 32 -9.3827964292718296;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Knee_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 55.388597315371094 1 61.750655350591863
		 2 67.3680933113435 3 71.88564709348411 4 75.27805014947478 5 77.812427928623279 6 79.168816098180031
		 7 79.43863912533682 8 78.024712826869774 9 74.879490924793558 10 70.053450965868123
		 11 63.931976554558034 12 57.444905766783016 13 52.048582701132297 14 50.100698889170118
		 15 54.561595953806439 16 65.023170117898232 17 79.495230529212009 18 97.538625408847096
		 19 107.30215503583082 20 109.65814723522057 21 107.06810350797676 22 102.61025695970064
		 23 94.942352694443159 24 82.805960617245603 25 67.065282855446242 26 48.159061394736135
		 27 35.004019266787687 28 30.609931403138976 29 33.647196299217669 30 40.823711281340806
		 31 48.672352663858724 32 55.388597315371094;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Ankle_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 25.178663317777495 1 28.601517259506174
		 2 32.913341102342294 3 35.355855270828762 4 36.359661433838241 5 36.69798058027763
		 6 36.322648817897367 7 35.539605787041666 8 34.623075782453405 9 33.328695537783659
		 10 31.459583891367366 11 29.254847283306304 12 26.486614558498051 13 23.71332431648764
		 14 22.313699008339483 15 23.347045592496542 16 24.921998227463948 17 24.848040100042038
		 18 22.708278278885171 19 22.852549900184581 20 24.174910061091591 21 25.90042344280317
		 22 28.513062801947335 23 28.747888720104232 24 27.507773052592611 25 27.385932924304562
		 26 29.379571173332057 27 29.310930155335239 28 26.662850734081051 29 25.149139364596863
		 30 24.808364185039704 31 24.623006998817164 32 25.178663317777495;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Ankle_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -2.2312561385745844 1 1.5627178830155013
		 2 5.544106223652566 3 8.7632497384336574 4 10.350045400844413 5 10.263586100856749
		 6 9.2275810357108909 7 7.513625985440882 8 5.7785753321229736 9 3.8286872871801405
		 10 1.3765799926066333 11 -1.6396629534825864 12 -5.0541626133373931 13 -8.4281035468914407
		 14 -12.138719423753713 15 -17.012664977906113 16 -22.194654605397499 17 -24.455410579891783
		 18 -21.864881661906601 19 -18.89495013272985 20 -15.836704199109901 21 -11.864653232915211
		 22 -9.6298128887806502 23 -8.4622531369997862 24 -8.8165351258397422 25 -10.499777656292089
		 26 -13.60569702093612 27 -14.654391856054165 28 -12.611477927794049 29 -9.1948833322822505
		 30 -6.7835017182884165 31 -4.9134071113917486 32 -2.2312561385745844;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Ankle_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.8733575257224098 1 -3.0541234118746656
		 2 -7.4970836053859191 3 -11.239680968752713 4 -13.834990905615214 5 -15.122998452612652
		 6 -15.281976614589791 7 -14.805376430815308 8 -13.421864270461764 9 -10.62543835563477
		 10 -5.9783113854331535 11 0.5760572895158198 12 8.2417331616166738 13 15.686845510966606
		 14 21.777083114846331 15 26.212063361077309 16 30.288279554926635 17 33.019152279005425
		 18 31.076513705649365 19 28.771603400858226 20 24.086085800578608 21 20.122530127745577
		 22 18.312507314353958 23 18.415420702018064 24 20.605523413678561 25 24.43446547209275
		 26 28.314804060586678 27 29.585318002849647 28 27.087439374874553 29 21.240304257842489
		 30 13.82574747464613 31 7.2411647034482183 32 1.8733575257224098;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Toes_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -31.53333304263025 1 -30.318010577690465
		 2 -28.598214674538323 3 -27.899228776602001 4 -28.117005280032085 5 -28.500213762867357
		 6 -29.344987271884385 7 -30.44997158821651 8 -31.579790877926037 9 -32.760716418248066
		 10 -34.649559087652783 11 -37.325479314564411 12 -40.560005224505417 13 -44.161314085007042
		 14 -46.910202740778203 15 -41.673636199253501 16 -11.845497851298223 17 -5.9825708974077791
		 18 -5.9939773635827498 19 -5.993968505937417 20 -5.9940516801120278 21 -5.9940231400950692
		 22 -5.9940226989942422 23 -5.9939654209322466 24 -5.9940180601879227 25 -5.9940162255545681
		 26 -5.9939570890498119 27 -6.1370030798563961 28 -14.896759557027238 29 -24.460510960111964
		 30 -29.593780226664808 31 -31.286481511768429 32 -31.53333304263025;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Hip_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -6.6844866306803086 1 -5.2111166499166011
		 2 -4.1582769719381938 3 -4.641159149336672 4 -5.3732181117944826 5 -5.7283751559602862
		 6 -5.4486846846968957 7 -5.0285833617796998 8 -4.609877392696605 9 -4.365809489295323
		 10 -4.2789470803137322 11 -4.1774103485230754 12 -3.966779301844173 13 -3.6973931210736604
		 14 -3.7294496137016959 15 -4.529863106977567 16 -6.2838311838380418 17 -8.3794787021610357
		 18 -9.3846459499134873 19 -11.356052404783249 20 -12.471612815369227 21 -12.735544523481829
		 22 -12.293971876339489 23 -11.423338872388173 24 -9.6217116259766922 25 -7.0546661880844219
		 26 -4.9957925445090021 27 -4.7703308535260067 28 -5.6985948263913597 29 -6.2920404089240654
		 30 -6.7670331944110762 31 -7.1791098625795424 32 -6.6844866306803086;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Hip_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 6.9856439968342015 1 8.3588267617203016
		 2 8.4000657980510205 3 8.4293402411855514 4 8.0970419639857329 5 7.4482070744981952
		 6 6.6887578914606438 7 5.7451626064062902 8 5.1307118761163606 9 5.0950034282000463
		 10 5.5070088774085804 11 6.0037979633023602 12 6.5290434355747289 13 6.548077452619836
		 14 5.6841965241001455 15 4.2522191628315813 16 1.4518168825775699 17 -2.4298341487057113
		 18 -6.6564905898120132 19 -10.174720658500362 20 -11.46753148047199 21 -11.112712230800893
		 22 -10.168243716594477 23 -8.5109132544393837 24 -6.1430754104324059 25 -2.999772693889406
		 26 0.070654646173295546 27 1.3008430194995937 28 1.6541032063911505 29 2.1882181941030692
		 30 2.8492762096566322 31 4.6881993219159774 32 6.9856439968342015;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Hip_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -16.047099724052835 1 -25.817159464738335
		 2 -34.964178982378741 3 -43.463759255597331 4 -50.643046568528163 5 -56.145799310284424
		 6 -60.003090435693572 7 -62.256339685841411 8 -62.177360921129846 9 -59.507529299640645
		 10 -54.563215752998552 11 -48.195372123242464 12 -41.668663286728602 13 -36.85734547480024
		 14 -34.915554593476763 15 -35.349366798639132 16 -37.28622478757876 17 -39.559734982812458
		 18 -40.805499298668707 19 -41.128169885919633 20 -39.28042083110666 21 -36.240819467543922
		 22 -32.4931532532988 23 -28.168044998700481 24 -23.440704596885979 25 -19.016046366641547
		 26 -14.343723053574021 27 -9.8983121694270473 28 -5.7827296492548443 29 -3.3005586067398998
		 30 -3.5756413218593575 31 -8.1637500621561649 32 -16.047099724052835;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Knee_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -1.041153542725437 1 1.158119478728878
		 2 2.2581830996504837 3 2.2835216240369429 4 1.5960562001355931 5 0.58078313783138025
		 6 -0.2325907446482619 7 -0.91764185039894242 8 -1.2376281122964916 9 -1.6324447857250004
		 10 -2.3717052936575005 11 -3.2203561388068134 12 -3.7219318277718805 13 -3.6325840754494583
		 14 -3.3086425083471491 15 -3.1275783101574168 16 -2.8751818949997765 17 -1.9636438298583043
		 18 0.80602144502067086 19 1.6379639944812017 20 2.3819605559205748 21 2.5887605028866703
		 22 2.317927607450454 23 1.7795071293285361 24 1.0587686356830006 25 0.57441312741154826
		 26 0.19313946891907244 27 -0.70337057346637943 28 -2.2190789924328054 29 -3.1524472004773396
		 30 -3.4552780114867385 31 -2.8854163638482975 32 -1.041153542725437;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Knee_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -8.4578683476168024 1 -8.4858447834980364
		 2 -7.6987733411329016 3 -7.8347026388749859 4 -7.9566573125106634 5 -7.691993246136243
		 6 -7.0906875991618703 7 -6.2381115198926897 8 -5.8060651887443964 9 -5.7824939725148123
		 10 -5.6925110340544327 11 -4.9663675673163672 12 -3.9533579753461159 13 -3.0338262345306504
		 14 -2.8085913671669163 15 -3.9573134729759172 16 -5.8581564074580124 17 -7.8157216217799723
		 18 -9.5952054207782158 19 -10.47803865300812 20 -11.897228495939784 21 -12.717370026569506
		 22 -12.60060292039249 23 -12.278993871725412 24 -11.071568851848861 25 -8.9792735605939349
		 26 -7.1666804551417815 27 -6.2493336313657597 28 -5.5753482582093481 29 -4.9375548233807116
		 30 -5.1188334086548268 31 -6.7841539070862913 32 -8.4578683476168024;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Knee_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 67.551766726136549 1 82.041717837495028
		 2 93.325635312392905 3 100.31972428236577 4 102.22783424629006 5 100.79585047154073
		 6 97.096800815996332 7 92.009269624674346 8 85.016201670705712 9 75.71914966276708
		 10 64.460340458368321 11 52.324047062350921 12 41.443915762113605 13 35.669225306308391
		 14 36.379629313627547 15 42.146980299143443 16 50.362888840708358 17 60.033241387502748
		 18 71.024017212779967 19 77.405342774113564 20 80.525112800833242 21 81.913349964588647
		 22 82.195370148579713 23 80.334611545799575 24 75.714233326446333 25 69.310828080567944
		 26 60.924576855472054 27 53.14707463564779 28 46.947486713066468 29 44.581536754459997
		 30 46.688350953255053 31 54.939484459981628 32 67.551766726136549;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Ankle_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 5.5067099182906771 1 6.5216066164406037
		 2 7.8499856436452342 3 10.422230660131412 4 12.701275874272504 5 13.72317111409644
		 6 13.728831780028932 7 13.319761066925633 8 12.911314912003542 9 12.864758366217874
		 10 13.746048692704942 11 15.015099153568956 12 16.497767910051131 13 16.712151985455556
		 14 15.608417428046019 15 15.288024562383534 16 16.714663027892346 17 18.818684198051656
		 18 20.210604467524295 19 24.746211105066646 20 26.513211808035212 21 25.975955105285376
		 22 24.776455300227003 23 24.313077505256409 24 21.776682392943318 25 16.73174779975642
		 26 10.359704798515825 27 6.1334441209671118 28 4.5533793949477372 29 3.5595910200489658
		 30 3.4957271507297794 31 4.478200882309725 32 5.5067099182906771;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Ankle_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -14.473987164153012 1 -13.331462795544125
		 2 -9.4061428011977366 3 -6.0398772263405025 4 -3.1884436292723923 5 -3.1021672972114493
		 6 -4.3328291909944747 7 -6.5605018107302753 8 -9.2179699812426392 9 -11.867026818552153
		 10 -14.012223638767873 11 -16.092733558295446 12 -18.551190581740254 13 -19.298754255165683
		 14 -16.84492665995235 15 -13.03557854480559 16 -8.9324261213560288 17 -5.0581815911458365
		 18 0.65538139230835013 19 4.7225938284236193 20 7.7204246796798044 21 8.3261922800893053
		 22 8.4075854277407984 23 10.336350624944052 24 13.262468165459834 25 14.841182733330882
		 26 13.004804835546153 27 9.193227030465529 28 4.4384748198380315 29 1.292443112599023
		 30 -3.6996185888545683 31 -10.987629304615131 32 -14.473987164153012;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Ankle_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 20.731101793193162 1 20.778823534291654
		 2 19.311377603397816 3 14.984801624480683 4 11.787615720468349 5 10.560589419048705
		 6 12.412562814832226 7 15.313935714068206 8 18.746359776916133 9 21.616937965524329
		 10 23.685595179776346 11 25.493840901731588 12 26.043588366128244 13 23.612654108855331
		 14 18.017255477363189 15 10.1117274630623 16 2.5851603637567546 17 -4.3912652867892472
		 18 -12.176850758328621 19 -16.917147500192414 20 -19.962785906450399 21 -21.707864240005719
		 22 -21.929837585030885 23 -18.20451039959292 24 -12.068333337657434 25 -5.5544650661699153
		 26 1.7916252440824256 27 8.2560661590432609 28 12.530246048325125 29 15.132214590952126
		 30 17.735245948778928 31 19.349724664784461 32 20.731101793193162;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Toes_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -7.7060004356586624 1 -5.9927276533234801
		 2 -5.9944640055446987 3 -5.9945066959254696 4 -5.9944597598453626 5 -5.9944186768866121
		 6 -5.9944296240998662 7 -5.9944015763628187 8 -5.9944709539748953 9 -5.9944563765709793
		 10 -5.994381393817136 11 -6.0629259645506872 12 -10.467066934744286 13 -18.416875158755772
		 14 -21.600136062199983 15 -22.389829497272096 16 -22.118674313856229 17 -22.109444106637991
		 18 -22.043889864008491 19 -21.476797846757492 20 -20.75269429223146 21 -21.15678313192354
		 22 -22.539772558347575 23 -25.116731849524559 24 -27.451443249916014 25 -29.987466922653745
		 26 -34.331874296168273 27 -39.358039750739245 28 -43.469848545823183 29 -47.259465626302472
		 30 -50.661294466663058 31 -42.441772685980219 32 -7.7060004356586624;
	setAttr ".pre" 1;
	setAttr ".pst" 1;


createNode animCurveTA -n "run_male:Elbow_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 228.87809364392484 1 183.51447780863822
		 2 81.101322703466167 3 76.293412531254873 4 72.42538493666045 5 83.159320860758243
		 6 110.54240246166353 7 160.14311454130686 8 196.63710883811027 9 212.18696930686312
		 10 214.00782754199975 11 213.08771597096967 12 214.93834173983115 13 221.03765606477305
		 14 221.20435578247253 15 218.25390090008719 16 209.66097807584171 17 200.29502512668429
		 18 197.62006030331028 19 197.27761065705735 20 197.30862665422904 21 197.61358502220517
		 22 201.56485126012291 23 206.87412548769015 24 212.66383821820182 25 217.29873356399062
		 26 220.43464199631828 27 223.64762904476248 28 226.89012660057563 29 229.32238104719684
		 30 230.80080394257598 31 230.70651801933275 32 228.87809364392484;
createNode animCurveTA -n "run_male:Elbow_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -247.18813734988419 1 -199.26865418110165
		 2 -95.048117305800233 3 -89.818243542667972 4 -85.597989223410508 5 -96.321833417735419
		 6 -124.25450383927696 7 -175.20929015937531 8 -213.6317419803427 9 -231.71535980500045
		 10 -235.66294139474505 11 -235.87971830446844 12 -239.78589129087217 13 -247.38749124173714
		 14 -247.36759300183979 15 -243.25511885707868 16 -233.00894498892072 17 -221.20482090838132
		 18 -216.08703875304892 19 -213.63100593739921 20 -211.76456813455906 21 -211.35026724566748
		 22 -214.90707995885961 23 -220.33570078301815 24 -226.93957820455168 25 -233.12361796999124
		 26 -238.60458221377894 27 -243.78301236608175 28 -248.53550621610174 29 -250.95627139237817
		 30 -251.44245747407297 31 -251.09781477902283 32 -247.18813734988419;
createNode animCurveTA -n "run_male:MiddleToe2_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
createNode animCurveTA -n "run_male:MiddleToe2_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
createNode animCurveTA -n "run_male:MiddleToe2_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
createNode animCurveTA -n "run_male:MiddleToe2_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
createNode animCurveTA -n "run_male:MiddleToe2_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
createNode animCurveTA -n "run_male:MiddleToe2_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
createNode animCurveTA -n "run_male:WristENd_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.0887042116436532 1 1.0887042116436532
		 2 1.0887042116436532 3 1.0887042116436532 4 1.0887042116436532 5 1.0887042116436532
		 6 1.0887042116436532 7 1.0887042116436532 8 1.0887042116436532 9 1.0887042116436532
		 10 1.0887042116436532 11 1.0887042116436532 12 1.0887042116436532 13 1.0887042116436532
		 14 1.0887042116436532 15 1.0887042116436532 16 1.0887042116436532 17 1.0887042116436532
		 18 1.0887042116436532 19 1.0887042116436532 20 1.0887042116436532 21 1.0887042116436532
		 22 1.0887042116436532 23 1.0887042116436532 24 1.0887042116436532 25 1.0887042116436532
		 26 1.0887042116436532 27 1.0887042116436532 28 1.0887042116436532 29 1.0887042116436532
		 30 1.0887042116436532 31 1.0887042116436532 32 1.0887042116436532;
createNode animCurveTA -n "run_male:WristENd_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.7683551143625205 1 2.7683551143625205
		 2 2.7683551143625205 3 2.7683551143625205 4 2.7683551143625205 5 2.7683551143625205
		 6 2.7683551143625205 7 2.7683551143625205 8 2.7683551143625205 9 2.7683551143625205
		 10 2.7683551143625205 11 2.7683551143625205 12 2.7683551143625205 13 2.7683551143625205
		 14 2.7683551143625205 15 2.7683551143625205 16 2.7683551143625205 17 2.7683551143625205
		 18 2.7683551143625205 19 2.7683551143625205 20 2.7683551143625205 21 2.7683551143625205
		 22 2.7683551143625205 23 2.7683551143625205 24 2.7683551143625205 25 2.7683551143625205
		 26 2.7683551143625205 27 2.7683551143625205 28 2.7683551143625205 29 2.7683551143625205
		 30 2.7683551143625205 31 2.7683551143625205 32 2.7683551143625205;
createNode animCurveTA -n "run_male:WristENd_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.2216285703639405 1 -3.2216285703639405
		 2 -3.2216285703639405 3 -3.2216285703639405 4 -3.2216285703639405 5 -3.2216285703639405
		 6 -3.2216285703639405 7 -3.2216285703639405 8 -3.2216285703639405 9 -3.2216285703639405
		 10 -3.2216285703639405 11 -3.2216285703639405 12 -3.2216285703639405 13 -3.2216285703639405
		 14 -3.2216285703639405 15 -3.2216285703639405 16 -3.2216285703639405 17 -3.2216285703639405
		 18 -3.2216285703639405 19 -3.2216285703639405 20 -3.2216285703639405 21 -3.2216285703639405
		 22 -3.2216285703639405 23 -3.2216285703639405 24 -3.2216285703639405 25 -3.2216285703639405
		 26 -3.2216285703639405 27 -3.2216285703639405 28 -3.2216285703639405 29 -3.2216285703639405
		 30 -3.2216285703639405 31 -3.2216285703639405 32 -3.2216285703639405;
createNode animCurveTA -n "run_male:Hair_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
createNode animCurveTA -n "run_male:Hair_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
createNode animCurveTA -n "run_male:Hair_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
createNode animCurveTA -n "run_male:WristENd_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.9245617303760405 1 1.9245617303760405
		 2 1.9245617303760405 3 1.9245617303760405 4 1.9245617303760405 5 1.9245617303760405
		 6 1.9245617303760405 7 1.9245617303760405 8 1.9245617303760405 9 1.9245617303760405
		 10 1.9245617303760405 11 1.9245617303760405 12 1.9245617303760405 13 1.9245617303760405
		 14 1.9245617303760405 15 1.9245617303760405 16 1.9245617303760405 17 1.9245617303760405
		 18 1.9245617303760405 19 1.9245617303760405 20 1.9245617303760405 21 1.9245617303760405
		 22 1.9245617303760405 23 1.9245617303760405 24 1.9245617303760405 25 1.9245617303760405
		 26 1.9245617303760405 27 1.9245617303760405 28 1.9245617303760405 29 1.9245617303760405
		 30 1.9245617303760405 31 1.9245617303760405 32 1.9245617303760405;
createNode animCurveTA -n "run_male:WristENd_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.11648861672277798 1 0.11648861672277798
		 2 0.11648861672277798 3 0.11648861672277798 4 0.11648861672277798 5 0.11648861672277798
		 6 0.11648861672277798 7 0.11648861672277798 8 0.11648861672277798 9 0.11648861672277798
		 10 0.11648861672277798 11 0.11648861672277798 12 0.11648861672277798 13 0.11648861672277798
		 14 0.11648861672277798 15 0.11648861672277798 16 0.11648861672277798 17 0.11648861672277798
		 18 0.11648861672277798 19 0.11648861672277798 20 0.11648861672277798 21 0.11648861672277798
		 22 0.11648861672277798 23 0.11648861672277798 24 0.11648861672277798 25 0.11648861672277798
		 26 0.11648861672277798 27 0.11648861672277798 28 0.11648861672277798 29 0.11648861672277798
		 30 0.11648861672277798 31 0.11648861672277798 32 0.11648861672277798;
createNode animCurveTA -n "run_male:WristENd_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.7408703792188138 1 -5.7408703792188138
		 2 -5.7408703792188138 3 -5.7408703792188138 4 -5.7408703792188138 5 -5.7408703792188138
		 6 -5.7408703792188138 7 -5.7408703792188138 8 -5.7408703792188138 9 -5.7408703792188138
		 10 -5.7408703792188138 11 -5.7408703792188138 12 -5.7408703792188138 13 -5.7408703792188138
		 14 -5.7408703792188138 15 -5.7408703792188138 16 -5.7408703792188138 17 -5.7408703792188138
		 18 -5.7408703792188138 19 -5.7408703792188138 20 -5.7408703792188138 21 -5.7408703792188138
		 22 -5.7408703792188138 23 -5.7408703792188138 24 -5.7408703792188138 25 -5.7408703792188138
		 26 -5.7408703792188138 27 -5.7408703792188138 28 -5.7408703792188138 29 -5.7408703792188138
		 30 -5.7408703792188138 31 -5.7408703792188138 32 -5.7408703792188138;
createNode animCurveTA -n "walk_angry:MiddleToe2_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
createNode animCurveTA -n "walk_angry:MiddleToe2_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
createNode animCurveTA -n "walk_angry:MiddleToe2_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
createNode animCurveTA -n "walk_angry:WristENd_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.9245617303760405 1 1.9245617303760405
		 2 1.9245617303760405 3 1.9245617303760405 4 1.9245617303760405 5 1.9245617303760405
		 6 1.9245617303760405 7 1.9245617303760405 8 1.9245617303760405 9 1.9245617303760405
		 10 1.9245617303760405 11 1.9245617303760405 12 1.9245617303760405 13 1.9245617303760405
		 14 1.9245617303760405 15 1.9245617303760405 16 1.9245617303760405 17 1.9245617303760405
		 18 1.9245617303760405 19 1.9245617303760405 20 1.9245617303760405 21 1.9245617303760405
		 22 1.9245617303760405 23 1.9245617303760405 24 1.9245617303760405 25 1.9245617303760405
		 26 1.9245617303760405 27 1.9245617303760405 28 1.9245617303760405 29 1.9245617303760405
		 30 1.9245617303760405 31 1.9245617303760405 32 1.9245617303760405;
createNode animCurveTA -n "walk_angry:WristENd_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.11648861672277798 1 0.11648861672277798
		 2 0.11648861672277798 3 0.11648861672277798 4 0.11648861672277798 5 0.11648861672277798
		 6 0.11648861672277798 7 0.11648861672277798 8 0.11648861672277798 9 0.11648861672277798
		 10 0.11648861672277798 11 0.11648861672277798 12 0.11648861672277798 13 0.11648861672277798
		 14 0.11648861672277798 15 0.11648861672277798 16 0.11648861672277798 17 0.11648861672277798
		 18 0.11648861672277798 19 0.11648861672277798 20 0.11648861672277798 21 0.11648861672277798
		 22 0.11648861672277798 23 0.11648861672277798 24 0.11648861672277798 25 0.11648861672277798
		 26 0.11648861672277798 27 0.11648861672277798 28 0.11648861672277798 29 0.11648861672277798
		 30 0.11648861672277798 31 0.11648861672277798 32 0.11648861672277798;
createNode animCurveTA -n "walk_angry:WristENd_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.7408703792188138 1 -5.7408703792188138
		 2 -5.7408703792188138 3 -5.7408703792188138 4 -5.7408703792188138 5 -5.7408703792188138
		 6 -5.7408703792188138 7 -5.7408703792188138 8 -5.7408703792188138 9 -5.7408703792188138
		 10 -5.7408703792188138 11 -5.7408703792188138 12 -5.7408703792188138 13 -5.7408703792188138
		 14 -5.7408703792188138 15 -5.7408703792188138 16 -5.7408703792188138 17 -5.7408703792188138
		 18 -5.7408703792188138 19 -5.7408703792188138 20 -5.7408703792188138 21 -5.7408703792188138
		 22 -5.7408703792188138 23 -5.7408703792188138 24 -5.7408703792188138 25 -5.7408703792188138
		 26 -5.7408703792188138 27 -5.7408703792188138 28 -5.7408703792188138 29 -5.7408703792188138
		 30 -5.7408703792188138 31 -5.7408703792188138 32 -5.7408703792188138;
createNode animCurveTA -n "walk_angry:Hair_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
createNode animCurveTA -n "walk_angry:Hair_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
createNode animCurveTA -n "walk_angry:Hair_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
createNode animCurveTA -n "walk_angry:WristENd_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.0887042116436532 1 1.0887042116436532
		 2 1.0887042116436532 3 1.0887042116436532 4 1.0887042116436532 5 1.0887042116436532
		 6 1.0887042116436532 7 1.0887042116436532 8 1.0887042116436532 9 1.0887042116436532
		 10 1.0887042116436532 11 1.0887042116436532 12 1.0887042116436532 13 1.0887042116436532
		 14 1.0887042116436532 15 1.0887042116436532 16 1.0887042116436532 17 1.0887042116436532
		 18 1.0887042116436532 19 1.0887042116436532 20 1.0887042116436532 21 1.0887042116436532
		 22 1.0887042116436532 23 1.0887042116436532 24 1.0887042116436532 25 1.0887042116436532
		 26 1.0887042116436532 27 1.0887042116436532 28 1.0887042116436532 29 1.0887042116436532
		 30 1.0887042116436532 31 1.0887042116436532 32 1.0887042116436532;
createNode animCurveTA -n "walk_angry:WristENd_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.7683551143625205 1 2.7683551143625205
		 2 2.7683551143625205 3 2.7683551143625205 4 2.7683551143625205 5 2.7683551143625205
		 6 2.7683551143625205 7 2.7683551143625205 8 2.7683551143625205 9 2.7683551143625205
		 10 2.7683551143625205 11 2.7683551143625205 12 2.7683551143625205 13 2.7683551143625205
		 14 2.7683551143625205 15 2.7683551143625205 16 2.7683551143625205 17 2.7683551143625205
		 18 2.7683551143625205 19 2.7683551143625205 20 2.7683551143625205 21 2.7683551143625205
		 22 2.7683551143625205 23 2.7683551143625205 24 2.7683551143625205 25 2.7683551143625205
		 26 2.7683551143625205 27 2.7683551143625205 28 2.7683551143625205 29 2.7683551143625205
		 30 2.7683551143625205 31 2.7683551143625205 32 2.7683551143625205;
createNode animCurveTA -n "walk_angry:WristENd_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.2216285703639405 1 -3.2216285703639405
		 2 -3.2216285703639405 3 -3.2216285703639405 4 -3.2216285703639405 5 -3.2216285703639405
		 6 -3.2216285703639405 7 -3.2216285703639405 8 -3.2216285703639405 9 -3.2216285703639405
		 10 -3.2216285703639405 11 -3.2216285703639405 12 -3.2216285703639405 13 -3.2216285703639405
		 14 -3.2216285703639405 15 -3.2216285703639405 16 -3.2216285703639405 17 -3.2216285703639405
		 18 -3.2216285703639405 19 -3.2216285703639405 20 -3.2216285703639405 21 -3.2216285703639405
		 22 -3.2216285703639405 23 -3.2216285703639405 24 -3.2216285703639405 25 -3.2216285703639405
		 26 -3.2216285703639405 27 -3.2216285703639405 28 -3.2216285703639405 29 -3.2216285703639405
		 30 -3.2216285703639405 31 -3.2216285703639405 32 -3.2216285703639405;
createNode animCurveTA -n "walk_angry:MiddleToe2_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
createNode animCurveTA -n "walk_angry:MiddleToe2_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
createNode animCurveTA -n "walk_angry:MiddleToe2_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
createNode animCurveTA -n "walk_cool:MiddleToe2_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:MiddleToe2_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:MiddleToe2_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:WristENd_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.9245617303760405 1 1.9245617303760405
		 2 1.9245617303760405 3 1.9245617303760405 4 1.9245617303760405 5 1.9245617303760405
		 6 1.9245617303760405 7 1.9245617303760405 8 1.9245617303760405 9 1.9245617303760405
		 10 1.9245617303760405 11 1.9245617303760405 12 1.9245617303760405 13 1.9245617303760405
		 14 1.9245617303760405 15 1.9245617303760405 16 1.9245617303760405 17 1.9245617303760405
		 18 1.9245617303760405 19 1.9245617303760405 20 1.9245617303760405 21 1.9245617303760405
		 22 1.9245617303760405 23 1.9245617303760405 24 1.9245617303760405 25 1.9245617303760405
		 26 1.9245617303760405 27 1.9245617303760405 28 1.9245617303760405 29 1.9245617303760405
		 30 1.9245617303760405 31 1.9245617303760405 32 1.9245617303760405;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:WristENd_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.11648861672277798 1 0.11648861672277798
		 2 0.11648861672277798 3 0.11648861672277798 4 0.11648861672277798 5 0.11648861672277798
		 6 0.11648861672277798 7 0.11648861672277798 8 0.11648861672277798 9 0.11648861672277798
		 10 0.11648861672277798 11 0.11648861672277798 12 0.11648861672277798 13 0.11648861672277798
		 14 0.11648861672277798 15 0.11648861672277798 16 0.11648861672277798 17 0.11648861672277798
		 18 0.11648861672277798 19 0.11648861672277798 20 0.11648861672277798 21 0.11648861672277798
		 22 0.11648861672277798 23 0.11648861672277798 24 0.11648861672277798 25 0.11648861672277798
		 26 0.11648861672277798 27 0.11648861672277798 28 0.11648861672277798 29 0.11648861672277798
		 30 0.11648861672277798 31 0.11648861672277798 32 0.11648861672277798;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:WristENd_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.7408703792188138 1 -5.7408703792188138
		 2 -5.7408703792188138 3 -5.7408703792188138 4 -5.7408703792188138 5 -5.7408703792188138
		 6 -5.7408703792188138 7 -5.7408703792188138 8 -5.7408703792188138 9 -5.7408703792188138
		 10 -5.7408703792188138 11 -5.7408703792188138 12 -5.7408703792188138 13 -5.7408703792188138
		 14 -5.7408703792188138 15 -5.7408703792188138 16 -5.7408703792188138 17 -5.7408703792188138
		 18 -5.7408703792188138 19 -5.7408703792188138 20 -5.7408703792188138 21 -5.7408703792188138
		 22 -5.7408703792188138 23 -5.7408703792188138 24 -5.7408703792188138 25 -5.7408703792188138
		 26 -5.7408703792188138 27 -5.7408703792188138 28 -5.7408703792188138 29 -5.7408703792188138
		 30 -5.7408703792188138 31 -5.7408703792188138 32 -5.7408703792188138;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Hair_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Hair_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:Hair_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:WristENd_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.0887042116436532 1 1.0887042116436532
		 2 1.0887042116436532 3 1.0887042116436532 4 1.0887042116436532 5 1.0887042116436532
		 6 1.0887042116436532 7 1.0887042116436532 8 1.0887042116436532 9 1.0887042116436532
		 10 1.0887042116436532 11 1.0887042116436532 12 1.0887042116436532 13 1.0887042116436532
		 14 1.0887042116436532 15 1.0887042116436532 16 1.0887042116436532 17 1.0887042116436532
		 18 1.0887042116436532 19 1.0887042116436532 20 1.0887042116436532 21 1.0887042116436532
		 22 1.0887042116436532 23 1.0887042116436532 24 1.0887042116436532 25 1.0887042116436532
		 26 1.0887042116436532 27 1.0887042116436532 28 1.0887042116436532 29 1.0887042116436532
		 30 1.0887042116436532 31 1.0887042116436532 32 1.0887042116436532;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:WristENd_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.7683551143625205 1 2.7683551143625205
		 2 2.7683551143625205 3 2.7683551143625205 4 2.7683551143625205 5 2.7683551143625205
		 6 2.7683551143625205 7 2.7683551143625205 8 2.7683551143625205 9 2.7683551143625205
		 10 2.7683551143625205 11 2.7683551143625205 12 2.7683551143625205 13 2.7683551143625205
		 14 2.7683551143625205 15 2.7683551143625205 16 2.7683551143625205 17 2.7683551143625205
		 18 2.7683551143625205 19 2.7683551143625205 20 2.7683551143625205 21 2.7683551143625205
		 22 2.7683551143625205 23 2.7683551143625205 24 2.7683551143625205 25 2.7683551143625205
		 26 2.7683551143625205 27 2.7683551143625205 28 2.7683551143625205 29 2.7683551143625205
		 30 2.7683551143625205 31 2.7683551143625205 32 2.7683551143625205;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:WristENd_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.2216285703639405 1 -3.2216285703639405
		 2 -3.2216285703639405 3 -3.2216285703639405 4 -3.2216285703639405 5 -3.2216285703639405
		 6 -3.2216285703639405 7 -3.2216285703639405 8 -3.2216285703639405 9 -3.2216285703639405
		 10 -3.2216285703639405 11 -3.2216285703639405 12 -3.2216285703639405 13 -3.2216285703639405
		 14 -3.2216285703639405 15 -3.2216285703639405 16 -3.2216285703639405 17 -3.2216285703639405
		 18 -3.2216285703639405 19 -3.2216285703639405 20 -3.2216285703639405 21 -3.2216285703639405
		 22 -3.2216285703639405 23 -3.2216285703639405 24 -3.2216285703639405 25 -3.2216285703639405
		 26 -3.2216285703639405 27 -3.2216285703639405 28 -3.2216285703639405 29 -3.2216285703639405
		 30 -3.2216285703639405 31 -3.2216285703639405 32 -3.2216285703639405;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:MiddleToe2_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:MiddleToe2_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cool:MiddleToe2_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:MiddleToe2_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:MiddleToe2_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:MiddleToe2_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:WristENd_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.9245617303760405 1 1.9245617303760405
		 2 1.9245617303760405 3 1.9245617303760405 4 1.9245617303760405 5 1.9245617303760405
		 6 1.9245617303760405 7 1.9245617303760405 8 1.9245617303760405 9 1.9245617303760405
		 10 1.9245617303760405 11 1.9245617303760405 12 1.9245617303760405 13 1.9245617303760405
		 14 1.9245617303760405 15 1.9245617303760405 16 1.9245617303760405 17 1.9245617303760405
		 18 1.9245617303760405 19 1.9245617303760405 20 1.9245617303760405 21 1.9245617303760405
		 22 1.9245617303760405 23 1.9245617303760405 24 1.9245617303760405 25 1.9245617303760405
		 26 1.9245617303760405 27 1.9245617303760405 28 1.9245617303760405 29 1.9245617303760405
		 30 1.9245617303760405 31 1.9245617303760405 32 1.9245617303760405;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:WristENd_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.11648861672277798 1 0.11648861672277798
		 2 0.11648861672277798 3 0.11648861672277798 4 0.11648861672277798 5 0.11648861672277798
		 6 0.11648861672277798 7 0.11648861672277798 8 0.11648861672277798 9 0.11648861672277798
		 10 0.11648861672277798 11 0.11648861672277798 12 0.11648861672277798 13 0.11648861672277798
		 14 0.11648861672277798 15 0.11648861672277798 16 0.11648861672277798 17 0.11648861672277798
		 18 0.11648861672277798 19 0.11648861672277798 20 0.11648861672277798 21 0.11648861672277798
		 22 0.11648861672277798 23 0.11648861672277798 24 0.11648861672277798 25 0.11648861672277798
		 26 0.11648861672277798 27 0.11648861672277798 28 0.11648861672277798 29 0.11648861672277798
		 30 0.11648861672277798 31 0.11648861672277798 32 0.11648861672277798;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:WristENd_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.7408703792188138 1 -5.7408703792188138
		 2 -5.7408703792188138 3 -5.7408703792188138 4 -5.7408703792188138 5 -5.7408703792188138
		 6 -5.7408703792188138 7 -5.7408703792188138 8 -5.7408703792188138 9 -5.7408703792188138
		 10 -5.7408703792188138 11 -5.7408703792188138 12 -5.7408703792188138 13 -5.7408703792188138
		 14 -5.7408703792188138 15 -5.7408703792188138 16 -5.7408703792188138 17 -5.7408703792188138
		 18 -5.7408703792188138 19 -5.7408703792188138 20 -5.7408703792188138 21 -5.7408703792188138
		 22 -5.7408703792188138 23 -5.7408703792188138 24 -5.7408703792188138 25 -5.7408703792188138
		 26 -5.7408703792188138 27 -5.7408703792188138 28 -5.7408703792188138 29 -5.7408703792188138
		 30 -5.7408703792188138 31 -5.7408703792188138 32 -5.7408703792188138;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Hair_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Hair_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:Hair_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:WristENd_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.0887042116436532 1 1.0887042116436532
		 2 1.0887042116436532 3 1.0887042116436532 4 1.0887042116436532 5 1.0887042116436532
		 6 1.0887042116436532 7 1.0887042116436532 8 1.0887042116436532 9 1.0887042116436532
		 10 1.0887042116436532 11 1.0887042116436532 12 1.0887042116436532 13 1.0887042116436532
		 14 1.0887042116436532 15 1.0887042116436532 16 1.0887042116436532 17 1.0887042116436532
		 18 1.0887042116436532 19 1.0887042116436532 20 1.0887042116436532 21 1.0887042116436532
		 22 1.0887042116436532 23 1.0887042116436532 24 1.0887042116436532 25 1.0887042116436532
		 26 1.0887042116436532 27 1.0887042116436532 28 1.0887042116436532 29 1.0887042116436532
		 30 1.0887042116436532 31 1.0887042116436532 32 1.0887042116436532;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:WristENd_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.7683551143625205 1 2.7683551143625205
		 2 2.7683551143625205 3 2.7683551143625205 4 2.7683551143625205 5 2.7683551143625205
		 6 2.7683551143625205 7 2.7683551143625205 8 2.7683551143625205 9 2.7683551143625205
		 10 2.7683551143625205 11 2.7683551143625205 12 2.7683551143625205 13 2.7683551143625205
		 14 2.7683551143625205 15 2.7683551143625205 16 2.7683551143625205 17 2.7683551143625205
		 18 2.7683551143625205 19 2.7683551143625205 20 2.7683551143625205 21 2.7683551143625205
		 22 2.7683551143625205 23 2.7683551143625205 24 2.7683551143625205 25 2.7683551143625205
		 26 2.7683551143625205 27 2.7683551143625205 28 2.7683551143625205 29 2.7683551143625205
		 30 2.7683551143625205 31 2.7683551143625205 32 2.7683551143625205;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:WristENd_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.2216285703639405 1 -3.2216285703639405
		 2 -3.2216285703639405 3 -3.2216285703639405 4 -3.2216285703639405 5 -3.2216285703639405
		 6 -3.2216285703639405 7 -3.2216285703639405 8 -3.2216285703639405 9 -3.2216285703639405
		 10 -3.2216285703639405 11 -3.2216285703639405 12 -3.2216285703639405 13 -3.2216285703639405
		 14 -3.2216285703639405 15 -3.2216285703639405 16 -3.2216285703639405 17 -3.2216285703639405
		 18 -3.2216285703639405 19 -3.2216285703639405 20 -3.2216285703639405 21 -3.2216285703639405
		 22 -3.2216285703639405 23 -3.2216285703639405 24 -3.2216285703639405 25 -3.2216285703639405
		 26 -3.2216285703639405 27 -3.2216285703639405 28 -3.2216285703639405 29 -3.2216285703639405
		 30 -3.2216285703639405 31 -3.2216285703639405 32 -3.2216285703639405;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:MiddleToe2_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:MiddleToe2_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_cute:MiddleToe2_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:MiddleToe2_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:MiddleToe2_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:MiddleToe2_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:WristENd_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.9245617303760405 1 1.9245617303760405
		 2 1.9245617303760405 3 1.9245617303760405 4 1.9245617303760405 5 1.9245617303760405
		 6 1.9245617303760405 7 1.9245617303760405 8 1.9245617303760405 9 1.9245617303760405
		 10 1.9245617303760405 11 1.9245617303760405 12 1.9245617303760405 13 1.9245617303760405
		 14 1.9245617303760405 15 1.9245617303760405 16 1.9245617303760405 17 1.9245617303760405
		 18 1.9245617303760405 19 1.9245617303760405 20 1.9245617303760405 21 1.9245617303760405
		 22 1.9245617303760405 23 1.9245617303760405 24 1.9245617303760405 25 1.9245617303760405
		 26 1.9245617303760405 27 1.9245617303760405 28 1.9245617303760405 29 1.9245617303760405
		 30 1.9245617303760405 31 1.9245617303760405 32 1.9245617303760405;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:WristENd_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.11648861672277798 1 0.11648861672277798
		 2 0.11648861672277798 3 0.11648861672277798 4 0.11648861672277798 5 0.11648861672277798
		 6 0.11648861672277798 7 0.11648861672277798 8 0.11648861672277798 9 0.11648861672277798
		 10 0.11648861672277798 11 0.11648861672277798 12 0.11648861672277798 13 0.11648861672277798
		 14 0.11648861672277798 15 0.11648861672277798 16 0.11648861672277798 17 0.11648861672277798
		 18 0.11648861672277798 19 0.11648861672277798 20 0.11648861672277798 21 0.11648861672277798
		 22 0.11648861672277798 23 0.11648861672277798 24 0.11648861672277798 25 0.11648861672277798
		 26 0.11648861672277798 27 0.11648861672277798 28 0.11648861672277798 29 0.11648861672277798
		 30 0.11648861672277798 31 0.11648861672277798 32 0.11648861672277798;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:WristENd_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.7408703792188138 1 -5.7408703792188138
		 2 -5.7408703792188138 3 -5.7408703792188138 4 -5.7408703792188138 5 -5.7408703792188138
		 6 -5.7408703792188138 7 -5.7408703792188138 8 -5.7408703792188138 9 -5.7408703792188138
		 10 -5.7408703792188138 11 -5.7408703792188138 12 -5.7408703792188138 13 -5.7408703792188138
		 14 -5.7408703792188138 15 -5.7408703792188138 16 -5.7408703792188138 17 -5.7408703792188138
		 18 -5.7408703792188138 19 -5.7408703792188138 20 -5.7408703792188138 21 -5.7408703792188138
		 22 -5.7408703792188138 23 -5.7408703792188138 24 -5.7408703792188138 25 -5.7408703792188138
		 26 -5.7408703792188138 27 -5.7408703792188138 28 -5.7408703792188138 29 -5.7408703792188138
		 30 -5.7408703792188138 31 -5.7408703792188138 32 -5.7408703792188138;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Hair_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Hair_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Hair_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:WristENd_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.0887042116436532 1 1.0887042116436532
		 2 1.0887042116436532 3 1.0887042116436532 4 1.0887042116436532 5 1.0887042116436532
		 6 1.0887042116436532 7 1.0887042116436532 8 1.0887042116436532 9 1.0887042116436532
		 10 1.0887042116436532 11 1.0887042116436532 12 1.0887042116436532 13 1.0887042116436532
		 14 1.0887042116436532 15 1.0887042116436532 16 1.0887042116436532 17 1.0887042116436532
		 18 1.0887042116436532 19 1.0887042116436532 20 1.0887042116436532 21 1.0887042116436532
		 22 1.0887042116436532 23 1.0887042116436532 24 1.0887042116436532 25 1.0887042116436532
		 26 1.0887042116436532 27 1.0887042116436532 28 1.0887042116436532 29 1.0887042116436532
		 30 1.0887042116436532 31 1.0887042116436532 32 1.0887042116436532;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:WristENd_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.7683551143625205 1 2.7683551143625205
		 2 2.7683551143625205 3 2.7683551143625205 4 2.7683551143625205 5 2.7683551143625205
		 6 2.7683551143625205 7 2.7683551143625205 8 2.7683551143625205 9 2.7683551143625205
		 10 2.7683551143625205 11 2.7683551143625205 12 2.7683551143625205 13 2.7683551143625205
		 14 2.7683551143625205 15 2.7683551143625205 16 2.7683551143625205 17 2.7683551143625205
		 18 2.7683551143625205 19 2.7683551143625205 20 2.7683551143625205 21 2.7683551143625205
		 22 2.7683551143625205 23 2.7683551143625205 24 2.7683551143625205 25 2.7683551143625205
		 26 2.7683551143625205 27 2.7683551143625205 28 2.7683551143625205 29 2.7683551143625205
		 30 2.7683551143625205 31 2.7683551143625205 32 2.7683551143625205;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:WristENd_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.2216285703639405 1 -3.2216285703639405
		 2 -3.2216285703639405 3 -3.2216285703639405 4 -3.2216285703639405 5 -3.2216285703639405
		 6 -3.2216285703639405 7 -3.2216285703639405 8 -3.2216285703639405 9 -3.2216285703639405
		 10 -3.2216285703639405 11 -3.2216285703639405 12 -3.2216285703639405 13 -3.2216285703639405
		 14 -3.2216285703639405 15 -3.2216285703639405 16 -3.2216285703639405 17 -3.2216285703639405
		 18 -3.2216285703639405 19 -3.2216285703639405 20 -3.2216285703639405 21 -3.2216285703639405
		 22 -3.2216285703639405 23 -3.2216285703639405 24 -3.2216285703639405 25 -3.2216285703639405
		 26 -3.2216285703639405 27 -3.2216285703639405 28 -3.2216285703639405 29 -3.2216285703639405
		 30 -3.2216285703639405 31 -3.2216285703639405 32 -3.2216285703639405;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Toes_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Toes_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:MiddleToe2_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:MiddleToe2_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:MiddleToe2_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Toes_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_macho:Toes_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:MiddleToe2_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:MiddleToe2_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:MiddleToe2_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:WristENd_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.9245617303760405 1 1.9245617303760405
		 2 1.9245617303760405 3 1.9245617303760405 4 1.9245617303760405 5 1.9245617303760405
		 6 1.9245617303760405 7 1.9245617303760405 8 1.9245617303760405 9 1.9245617303760405
		 10 1.9245617303760405 11 1.9245617303760405 12 1.9245617303760405 13 1.9245617303760405
		 14 1.9245617303760405 15 1.9245617303760405 16 1.9245617303760405 17 1.9245617303760405
		 18 1.9245617303760405 19 1.9245617303760405 20 1.9245617303760405 21 1.9245617303760405
		 22 1.9245617303760405 23 1.9245617303760405 24 1.9245617303760405 25 1.9245617303760405
		 26 1.9245617303760405 27 1.9245617303760405 28 1.9245617303760405 29 1.9245617303760405
		 30 1.9245617303760405 31 1.9245617303760405 32 1.9245617303760405;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:WristENd_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.11648861672277798 1 0.11648861672277798
		 2 0.11648861672277798 3 0.11648861672277798 4 0.11648861672277798 5 0.11648861672277798
		 6 0.11648861672277798 7 0.11648861672277798 8 0.11648861672277798 9 0.11648861672277798
		 10 0.11648861672277798 11 0.11648861672277798 12 0.11648861672277798 13 0.11648861672277798
		 14 0.11648861672277798 15 0.11648861672277798 16 0.11648861672277798 17 0.11648861672277798
		 18 0.11648861672277798 19 0.11648861672277798 20 0.11648861672277798 21 0.11648861672277798
		 22 0.11648861672277798 23 0.11648861672277798 24 0.11648861672277798 25 0.11648861672277798
		 26 0.11648861672277798 27 0.11648861672277798 28 0.11648861672277798 29 0.11648861672277798
		 30 0.11648861672277798 31 0.11648861672277798 32 0.11648861672277798;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:WristENd_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.7408703792188138 1 -5.7408703792188138
		 2 -5.7408703792188138 3 -5.7408703792188138 4 -5.7408703792188138 5 -5.7408703792188138
		 6 -5.7408703792188138 7 -5.7408703792188138 8 -5.7408703792188138 9 -5.7408703792188138
		 10 -5.7408703792188138 11 -5.7408703792188138 12 -5.7408703792188138 13 -5.7408703792188138
		 14 -5.7408703792188138 15 -5.7408703792188138 16 -5.7408703792188138 17 -5.7408703792188138
		 18 -5.7408703792188138 19 -5.7408703792188138 20 -5.7408703792188138 21 -5.7408703792188138
		 22 -5.7408703792188138 23 -5.7408703792188138 24 -5.7408703792188138 25 -5.7408703792188138
		 26 -5.7408703792188138 27 -5.7408703792188138 28 -5.7408703792188138 29 -5.7408703792188138
		 30 -5.7408703792188138 31 -5.7408703792188138 32 -5.7408703792188138;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Hair_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Hair_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Hair_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:WristENd_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.0887042116436532 1 1.0887042116436532
		 2 1.0887042116436532 3 1.0887042116436532 4 1.0887042116436532 5 1.0887042116436532
		 6 1.0887042116436532 7 1.0887042116436532 8 1.0887042116436532 9 1.0887042116436532
		 10 1.0887042116436532 11 1.0887042116436532 12 1.0887042116436532 13 1.0887042116436532
		 14 1.0887042116436532 15 1.0887042116436532 16 1.0887042116436532 17 1.0887042116436532
		 18 1.0887042116436532 19 1.0887042116436532 20 1.0887042116436532 21 1.0887042116436532
		 22 1.0887042116436532 23 1.0887042116436532 24 1.0887042116436532 25 1.0887042116436532
		 26 1.0887042116436532 27 1.0887042116436532 28 1.0887042116436532 29 1.0887042116436532
		 30 1.0887042116436532 31 1.0887042116436532 32 1.0887042116436532;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:WristENd_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.7683551143625205 1 2.7683551143625205
		 2 2.7683551143625205 3 2.7683551143625205 4 2.7683551143625205 5 2.7683551143625205
		 6 2.7683551143625205 7 2.7683551143625205 8 2.7683551143625205 9 2.7683551143625205
		 10 2.7683551143625205 11 2.7683551143625205 12 2.7683551143625205 13 2.7683551143625205
		 14 2.7683551143625205 15 2.7683551143625205 16 2.7683551143625205 17 2.7683551143625205
		 18 2.7683551143625205 19 2.7683551143625205 20 2.7683551143625205 21 2.7683551143625205
		 22 2.7683551143625205 23 2.7683551143625205 24 2.7683551143625205 25 2.7683551143625205
		 26 2.7683551143625205 27 2.7683551143625205 28 2.7683551143625205 29 2.7683551143625205
		 30 2.7683551143625205 31 2.7683551143625205 32 2.7683551143625205;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:WristENd_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.2216285703639405 1 -3.2216285703639405
		 2 -3.2216285703639405 3 -3.2216285703639405 4 -3.2216285703639405 5 -3.2216285703639405
		 6 -3.2216285703639405 7 -3.2216285703639405 8 -3.2216285703639405 9 -3.2216285703639405
		 10 -3.2216285703639405 11 -3.2216285703639405 12 -3.2216285703639405 13 -3.2216285703639405
		 14 -3.2216285703639405 15 -3.2216285703639405 16 -3.2216285703639405 17 -3.2216285703639405
		 18 -3.2216285703639405 19 -3.2216285703639405 20 -3.2216285703639405 21 -3.2216285703639405
		 22 -3.2216285703639405 23 -3.2216285703639405 24 -3.2216285703639405 25 -3.2216285703639405
		 26 -3.2216285703639405 27 -3.2216285703639405 28 -3.2216285703639405 29 -3.2216285703639405
		 30 -3.2216285703639405 31 -3.2216285703639405 32 -3.2216285703639405;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Toes_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Toes_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:MiddleToe2_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:MiddleToe2_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:MiddleToe2_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Toes_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_male:Toes_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:MiddleToe2_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:MiddleToe2_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:MiddleToe2_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:WristENd_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.9245617303760405 1 1.9245617303760405
		 2 1.9245617303760405 3 1.9245617303760405 4 1.9245617303760405 5 1.9245617303760405
		 6 1.9245617303760405 7 1.9245617303760405 8 1.9245617303760405 9 1.9245617303760405
		 10 1.9245617303760405 11 1.9245617303760405 12 1.9245617303760405 13 1.9245617303760405
		 14 1.9245617303760405 15 1.9245617303760405 16 1.9245617303760405 17 1.9245617303760405
		 18 1.9245617303760405 19 1.9245617303760405 20 1.9245617303760405 21 1.9245617303760405
		 22 1.9245617303760405 23 1.9245617303760405 24 1.9245617303760405 25 1.9245617303760405
		 26 1.9245617303760405 27 1.9245617303760405 28 1.9245617303760405 29 1.9245617303760405
		 30 1.9245617303760405 31 1.9245617303760405 32 1.9245617303760405;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:WristENd_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.11648861672277798 1 0.11648861672277798
		 2 0.11648861672277798 3 0.11648861672277798 4 0.11648861672277798 5 0.11648861672277798
		 6 0.11648861672277798 7 0.11648861672277798 8 0.11648861672277798 9 0.11648861672277798
		 10 0.11648861672277798 11 0.11648861672277798 12 0.11648861672277798 13 0.11648861672277798
		 14 0.11648861672277798 15 0.11648861672277798 16 0.11648861672277798 17 0.11648861672277798
		 18 0.11648861672277798 19 0.11648861672277798 20 0.11648861672277798 21 0.11648861672277798
		 22 0.11648861672277798 23 0.11648861672277798 24 0.11648861672277798 25 0.11648861672277798
		 26 0.11648861672277798 27 0.11648861672277798 28 0.11648861672277798 29 0.11648861672277798
		 30 0.11648861672277798 31 0.11648861672277798 32 0.11648861672277798;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:WristENd_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.7408703792188138 1 -5.7408703792188138
		 2 -5.7408703792188138 3 -5.7408703792188138 4 -5.7408703792188138 5 -5.7408703792188138
		 6 -5.7408703792188138 7 -5.7408703792188138 8 -5.7408703792188138 9 -5.7408703792188138
		 10 -5.7408703792188138 11 -5.7408703792188138 12 -5.7408703792188138 13 -5.7408703792188138
		 14 -5.7408703792188138 15 -5.7408703792188138 16 -5.7408703792188138 17 -5.7408703792188138
		 18 -5.7408703792188138 19 -5.7408703792188138 20 -5.7408703792188138 21 -5.7408703792188138
		 22 -5.7408703792188138 23 -5.7408703792188138 24 -5.7408703792188138 25 -5.7408703792188138
		 26 -5.7408703792188138 27 -5.7408703792188138 28 -5.7408703792188138 29 -5.7408703792188138
		 30 -5.7408703792188138 31 -5.7408703792188138 32 -5.7408703792188138;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Hair_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Hair_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Hair_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:WristENd_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.0887042116436532 1 1.0887042116436532
		 2 1.0887042116436532 3 1.0887042116436532 4 1.0887042116436532 5 1.0887042116436532
		 6 1.0887042116436532 7 1.0887042116436532 8 1.0887042116436532 9 1.0887042116436532
		 10 1.0887042116436532 11 1.0887042116436532 12 1.0887042116436532 13 1.0887042116436532
		 14 1.0887042116436532 15 1.0887042116436532 16 1.0887042116436532 17 1.0887042116436532
		 18 1.0887042116436532 19 1.0887042116436532 20 1.0887042116436532 21 1.0887042116436532
		 22 1.0887042116436532 23 1.0887042116436532 24 1.0887042116436532 25 1.0887042116436532
		 26 1.0887042116436532 27 1.0887042116436532 28 1.0887042116436532 29 1.0887042116436532
		 30 1.0887042116436532 31 1.0887042116436532 32 1.0887042116436532;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:WristENd_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.7683551143625205 1 2.7683551143625205
		 2 2.7683551143625205 3 2.7683551143625205 4 2.7683551143625205 5 2.7683551143625205
		 6 2.7683551143625205 7 2.7683551143625205 8 2.7683551143625205 9 2.7683551143625205
		 10 2.7683551143625205 11 2.7683551143625205 12 2.7683551143625205 13 2.7683551143625205
		 14 2.7683551143625205 15 2.7683551143625205 16 2.7683551143625205 17 2.7683551143625205
		 18 2.7683551143625205 19 2.7683551143625205 20 2.7683551143625205 21 2.7683551143625205
		 22 2.7683551143625205 23 2.7683551143625205 24 2.7683551143625205 25 2.7683551143625205
		 26 2.7683551143625205 27 2.7683551143625205 28 2.7683551143625205 29 2.7683551143625205
		 30 2.7683551143625205 31 2.7683551143625205 32 2.7683551143625205;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:WristENd_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.2216285703639405 1 -3.2216285703639405
		 2 -3.2216285703639405 3 -3.2216285703639405 4 -3.2216285703639405 5 -3.2216285703639405
		 6 -3.2216285703639405 7 -3.2216285703639405 8 -3.2216285703639405 9 -3.2216285703639405
		 10 -3.2216285703639405 11 -3.2216285703639405 12 -3.2216285703639405 13 -3.2216285703639405
		 14 -3.2216285703639405 15 -3.2216285703639405 16 -3.2216285703639405 17 -3.2216285703639405
		 18 -3.2216285703639405 19 -3.2216285703639405 20 -3.2216285703639405 21 -3.2216285703639405
		 22 -3.2216285703639405 23 -3.2216285703639405 24 -3.2216285703639405 25 -3.2216285703639405
		 26 -3.2216285703639405 27 -3.2216285703639405 28 -3.2216285703639405 29 -3.2216285703639405
		 30 -3.2216285703639405 31 -3.2216285703639405 32 -3.2216285703639405;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Toes_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Toes_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:MiddleToe2_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:MiddleToe2_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:MiddleToe2_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Toes_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_proud:Toes_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:MiddleToe2_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:MiddleToe2_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:MiddleToe2_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:WristENd_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.9245617303760405 1 1.9245617303760405
		 2 1.9245617303760405 3 1.9245617303760405 4 1.9245617303760405 5 1.9245617303760405
		 6 1.9245617303760405 7 1.9245617303760405 8 1.9245617303760405 9 1.9245617303760405
		 10 1.9245617303760405 11 1.9245617303760405 12 1.9245617303760405 13 1.9245617303760405
		 14 1.9245617303760405 15 1.9245617303760405 16 1.9245617303760405 17 1.9245617303760405
		 18 1.9245617303760405 19 1.9245617303760405 20 1.9245617303760405 21 1.9245617303760405
		 22 1.9245617303760405 23 1.9245617303760405 24 1.9245617303760405 25 1.9245617303760405
		 26 1.9245617303760405 27 1.9245617303760405 28 1.9245617303760405 29 1.9245617303760405
		 30 1.9245617303760405 31 1.9245617303760405 32 1.9245617303760405;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:WristENd_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.11648861672277798 1 0.11648861672277798
		 2 0.11648861672277798 3 0.11648861672277798 4 0.11648861672277798 5 0.11648861672277798
		 6 0.11648861672277798 7 0.11648861672277798 8 0.11648861672277798 9 0.11648861672277798
		 10 0.11648861672277798 11 0.11648861672277798 12 0.11648861672277798 13 0.11648861672277798
		 14 0.11648861672277798 15 0.11648861672277798 16 0.11648861672277798 17 0.11648861672277798
		 18 0.11648861672277798 19 0.11648861672277798 20 0.11648861672277798 21 0.11648861672277798
		 22 0.11648861672277798 23 0.11648861672277798 24 0.11648861672277798 25 0.11648861672277798
		 26 0.11648861672277798 27 0.11648861672277798 28 0.11648861672277798 29 0.11648861672277798
		 30 0.11648861672277798 31 0.11648861672277798 32 0.11648861672277798;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:WristENd_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.7408703792188138 1 -5.7408703792188138
		 2 -5.7408703792188138 3 -5.7408703792188138 4 -5.7408703792188138 5 -5.7408703792188138
		 6 -5.7408703792188138 7 -5.7408703792188138 8 -5.7408703792188138 9 -5.7408703792188138
		 10 -5.7408703792188138 11 -5.7408703792188138 12 -5.7408703792188138 13 -5.7408703792188138
		 14 -5.7408703792188138 15 -5.7408703792188138 16 -5.7408703792188138 17 -5.7408703792188138
		 18 -5.7408703792188138 19 -5.7408703792188138 20 -5.7408703792188138 21 -5.7408703792188138
		 22 -5.7408703792188138 23 -5.7408703792188138 24 -5.7408703792188138 25 -5.7408703792188138
		 26 -5.7408703792188138 27 -5.7408703792188138 28 -5.7408703792188138 29 -5.7408703792188138
		 30 -5.7408703792188138 31 -5.7408703792188138 32 -5.7408703792188138;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Hair_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Hair_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Hair_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:WristENd_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.0887042116436532 1 1.0887042116436532
		 2 1.0887042116436532 3 1.0887042116436532 4 1.0887042116436532 5 1.0887042116436532
		 6 1.0887042116436532 7 1.0887042116436532 8 1.0887042116436532 9 1.0887042116436532
		 10 1.0887042116436532 11 1.0887042116436532 12 1.0887042116436532 13 1.0887042116436532
		 14 1.0887042116436532 15 1.0887042116436532 16 1.0887042116436532 17 1.0887042116436532
		 18 1.0887042116436532 19 1.0887042116436532 20 1.0887042116436532 21 1.0887042116436532
		 22 1.0887042116436532 23 1.0887042116436532 24 1.0887042116436532 25 1.0887042116436532
		 26 1.0887042116436532 27 1.0887042116436532 28 1.0887042116436532 29 1.0887042116436532
		 30 1.0887042116436532 31 1.0887042116436532 32 1.0887042116436532;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:WristENd_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.7683551143625205 1 2.7683551143625205
		 2 2.7683551143625205 3 2.7683551143625205 4 2.7683551143625205 5 2.7683551143625205
		 6 2.7683551143625205 7 2.7683551143625205 8 2.7683551143625205 9 2.7683551143625205
		 10 2.7683551143625205 11 2.7683551143625205 12 2.7683551143625205 13 2.7683551143625205
		 14 2.7683551143625205 15 2.7683551143625205 16 2.7683551143625205 17 2.7683551143625205
		 18 2.7683551143625205 19 2.7683551143625205 20 2.7683551143625205 21 2.7683551143625205
		 22 2.7683551143625205 23 2.7683551143625205 24 2.7683551143625205 25 2.7683551143625205
		 26 2.7683551143625205 27 2.7683551143625205 28 2.7683551143625205 29 2.7683551143625205
		 30 2.7683551143625205 31 2.7683551143625205 32 2.7683551143625205;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:WristENd_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.2216285703639405 1 -3.2216285703639405
		 2 -3.2216285703639405 3 -3.2216285703639405 4 -3.2216285703639405 5 -3.2216285703639405
		 6 -3.2216285703639405 7 -3.2216285703639405 8 -3.2216285703639405 9 -3.2216285703639405
		 10 -3.2216285703639405 11 -3.2216285703639405 12 -3.2216285703639405 13 -3.2216285703639405
		 14 -3.2216285703639405 15 -3.2216285703639405 16 -3.2216285703639405 17 -3.2216285703639405
		 18 -3.2216285703639405 19 -3.2216285703639405 20 -3.2216285703639405 21 -3.2216285703639405
		 22 -3.2216285703639405 23 -3.2216285703639405 24 -3.2216285703639405 25 -3.2216285703639405
		 26 -3.2216285703639405 27 -3.2216285703639405 28 -3.2216285703639405 29 -3.2216285703639405
		 30 -3.2216285703639405 31 -3.2216285703639405 32 -3.2216285703639405;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Toes_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Toes_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:MiddleToe2_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:MiddleToe2_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:MiddleToe2_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Toes_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sad:Toes_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:MiddleToe2_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:MiddleToe2_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:MiddleToe2_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:WristENd_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.9245617303760405 1 1.9245617303760405
		 2 1.9245617303760405 3 1.9245617303760405 4 1.9245617303760405 5 1.9245617303760405
		 6 1.9245617303760405 7 1.9245617303760405 8 1.9245617303760405 9 1.9245617303760405
		 10 1.9245617303760405 11 1.9245617303760405 12 1.9245617303760405 13 1.9245617303760405
		 14 1.9245617303760405 15 1.9245617303760405 16 1.9245617303760405 17 1.9245617303760405
		 18 1.9245617303760405 19 1.9245617303760405 20 1.9245617303760405 21 1.9245617303760405
		 22 1.9245617303760405 23 1.9245617303760405 24 1.9245617303760405 25 1.9245617303760405
		 26 1.9245617303760405 27 1.9245617303760405 28 1.9245617303760405 29 1.9245617303760405
		 30 1.9245617303760405 31 1.9245617303760405 32 1.9245617303760405;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:WristENd_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.11648861672277798 1 0.11648861672277798
		 2 0.11648861672277798 3 0.11648861672277798 4 0.11648861672277798 5 0.11648861672277798
		 6 0.11648861672277798 7 0.11648861672277798 8 0.11648861672277798 9 0.11648861672277798
		 10 0.11648861672277798 11 0.11648861672277798 12 0.11648861672277798 13 0.11648861672277798
		 14 0.11648861672277798 15 0.11648861672277798 16 0.11648861672277798 17 0.11648861672277798
		 18 0.11648861672277798 19 0.11648861672277798 20 0.11648861672277798 21 0.11648861672277798
		 22 0.11648861672277798 23 0.11648861672277798 24 0.11648861672277798 25 0.11648861672277798
		 26 0.11648861672277798 27 0.11648861672277798 28 0.11648861672277798 29 0.11648861672277798
		 30 0.11648861672277798 31 0.11648861672277798 32 0.11648861672277798;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:WristENd_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.7408703792188138 1 -5.7408703792188138
		 2 -5.7408703792188138 3 -5.7408703792188138 4 -5.7408703792188138 5 -5.7408703792188138
		 6 -5.7408703792188138 7 -5.7408703792188138 8 -5.7408703792188138 9 -5.7408703792188138
		 10 -5.7408703792188138 11 -5.7408703792188138 12 -5.7408703792188138 13 -5.7408703792188138
		 14 -5.7408703792188138 15 -5.7408703792188138 16 -5.7408703792188138 17 -5.7408703792188138
		 18 -5.7408703792188138 19 -5.7408703792188138 20 -5.7408703792188138 21 -5.7408703792188138
		 22 -5.7408703792188138 23 -5.7408703792188138 24 -5.7408703792188138 25 -5.7408703792188138
		 26 -5.7408703792188138 27 -5.7408703792188138 28 -5.7408703792188138 29 -5.7408703792188138
		 30 -5.7408703792188138 31 -5.7408703792188138 32 -5.7408703792188138;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Hair_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Hair_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Hair_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:WristENd_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.0887042116436532 1 1.0887042116436532
		 2 1.0887042116436532 3 1.0887042116436532 4 1.0887042116436532 5 1.0887042116436532
		 6 1.0887042116436532 7 1.0887042116436532 8 1.0887042116436532 9 1.0887042116436532
		 10 1.0887042116436532 11 1.0887042116436532 12 1.0887042116436532 13 1.0887042116436532
		 14 1.0887042116436532 15 1.0887042116436532 16 1.0887042116436532 17 1.0887042116436532
		 18 1.0887042116436532 19 1.0887042116436532 20 1.0887042116436532 21 1.0887042116436532
		 22 1.0887042116436532 23 1.0887042116436532 24 1.0887042116436532 25 1.0887042116436532
		 26 1.0887042116436532 27 1.0887042116436532 28 1.0887042116436532 29 1.0887042116436532
		 30 1.0887042116436532 31 1.0887042116436532 32 1.0887042116436532;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:WristENd_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.7683551143625205 1 2.7683551143625205
		 2 2.7683551143625205 3 2.7683551143625205 4 2.7683551143625205 5 2.7683551143625205
		 6 2.7683551143625205 7 2.7683551143625205 8 2.7683551143625205 9 2.7683551143625205
		 10 2.7683551143625205 11 2.7683551143625205 12 2.7683551143625205 13 2.7683551143625205
		 14 2.7683551143625205 15 2.7683551143625205 16 2.7683551143625205 17 2.7683551143625205
		 18 2.7683551143625205 19 2.7683551143625205 20 2.7683551143625205 21 2.7683551143625205
		 22 2.7683551143625205 23 2.7683551143625205 24 2.7683551143625205 25 2.7683551143625205
		 26 2.7683551143625205 27 2.7683551143625205 28 2.7683551143625205 29 2.7683551143625205
		 30 2.7683551143625205 31 2.7683551143625205 32 2.7683551143625205;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:WristENd_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.2216285703639405 1 -3.2216285703639405
		 2 -3.2216285703639405 3 -3.2216285703639405 4 -3.2216285703639405 5 -3.2216285703639405
		 6 -3.2216285703639405 7 -3.2216285703639405 8 -3.2216285703639405 9 -3.2216285703639405
		 10 -3.2216285703639405 11 -3.2216285703639405 12 -3.2216285703639405 13 -3.2216285703639405
		 14 -3.2216285703639405 15 -3.2216285703639405 16 -3.2216285703639405 17 -3.2216285703639405
		 18 -3.2216285703639405 19 -3.2216285703639405 20 -3.2216285703639405 21 -3.2216285703639405
		 22 -3.2216285703639405 23 -3.2216285703639405 24 -3.2216285703639405 25 -3.2216285703639405
		 26 -3.2216285703639405 27 -3.2216285703639405 28 -3.2216285703639405 29 -3.2216285703639405
		 30 -3.2216285703639405 31 -3.2216285703639405 32 -3.2216285703639405;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Toes_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Toes_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:MiddleToe2_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:MiddleToe2_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:MiddleToe2_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Toes_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_sneak:Toes_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTU -n "Group_timing";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 32 1;
createNode animCurveTA -n "walk_female:MiddleToe2_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:MiddleToe2_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:MiddleToe2_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:WristENd_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.9245617303760405 1 1.9245617303760405
		 2 1.9245617303760405 3 1.9245617303760405 4 1.9245617303760405 5 1.9245617303760405
		 6 1.9245617303760405 7 1.9245617303760405 8 1.9245617303760405 9 1.9245617303760405
		 10 1.9245617303760405 11 1.9245617303760405 12 1.9245617303760405 13 1.9245617303760405
		 14 1.9245617303760405 15 1.9245617303760405 16 1.9245617303760405 17 1.9245617303760405
		 18 1.9245617303760405 19 1.9245617303760405 20 1.9245617303760405 21 1.9245617303760405
		 22 1.9245617303760405 23 1.9245617303760405 24 1.9245617303760405 25 1.9245617303760405
		 26 1.9245617303760405 27 1.9245617303760405 28 1.9245617303760405 29 1.9245617303760405
		 30 1.9245617303760405 31 1.9245617303760405 32 1.9245617303760405;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:WristENd_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0.11648861672277798 1 0.11648861672277798
		 2 0.11648861672277798 3 0.11648861672277798 4 0.11648861672277798 5 0.11648861672277798
		 6 0.11648861672277798 7 0.11648861672277798 8 0.11648861672277798 9 0.11648861672277798
		 10 0.11648861672277798 11 0.11648861672277798 12 0.11648861672277798 13 0.11648861672277798
		 14 0.11648861672277798 15 0.11648861672277798 16 0.11648861672277798 17 0.11648861672277798
		 18 0.11648861672277798 19 0.11648861672277798 20 0.11648861672277798 21 0.11648861672277798
		 22 0.11648861672277798 23 0.11648861672277798 24 0.11648861672277798 25 0.11648861672277798
		 26 0.11648861672277798 27 0.11648861672277798 28 0.11648861672277798 29 0.11648861672277798
		 30 0.11648861672277798 31 0.11648861672277798 32 0.11648861672277798;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:WristENd_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -5.7408703792188138 1 -5.7408703792188138
		 2 -5.7408703792188138 3 -5.7408703792188138 4 -5.7408703792188138 5 -5.7408703792188138
		 6 -5.7408703792188138 7 -5.7408703792188138 8 -5.7408703792188138 9 -5.7408703792188138
		 10 -5.7408703792188138 11 -5.7408703792188138 12 -5.7408703792188138 13 -5.7408703792188138
		 14 -5.7408703792188138 15 -5.7408703792188138 16 -5.7408703792188138 17 -5.7408703792188138
		 18 -5.7408703792188138 19 -5.7408703792188138 20 -5.7408703792188138 21 -5.7408703792188138
		 22 -5.7408703792188138 23 -5.7408703792188138 24 -5.7408703792188138 25 -5.7408703792188138
		 26 -5.7408703792188138 27 -5.7408703792188138 28 -5.7408703792188138 29 -5.7408703792188138
		 30 -5.7408703792188138 31 -5.7408703792188138 32 -5.7408703792188138;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Hair_M_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Hair_M_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Hair_M_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:WristENd_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 1.0887042116436532 1 1.0887042116436532
		 2 1.0887042116436532 3 1.0887042116436532 4 1.0887042116436532 5 1.0887042116436532
		 6 1.0887042116436532 7 1.0887042116436532 8 1.0887042116436532 9 1.0887042116436532
		 10 1.0887042116436532 11 1.0887042116436532 12 1.0887042116436532 13 1.0887042116436532
		 14 1.0887042116436532 15 1.0887042116436532 16 1.0887042116436532 17 1.0887042116436532
		 18 1.0887042116436532 19 1.0887042116436532 20 1.0887042116436532 21 1.0887042116436532
		 22 1.0887042116436532 23 1.0887042116436532 24 1.0887042116436532 25 1.0887042116436532
		 26 1.0887042116436532 27 1.0887042116436532 28 1.0887042116436532 29 1.0887042116436532
		 30 1.0887042116436532 31 1.0887042116436532 32 1.0887042116436532;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:WristENd_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 2.7683551143625205 1 2.7683551143625205
		 2 2.7683551143625205 3 2.7683551143625205 4 2.7683551143625205 5 2.7683551143625205
		 6 2.7683551143625205 7 2.7683551143625205 8 2.7683551143625205 9 2.7683551143625205
		 10 2.7683551143625205 11 2.7683551143625205 12 2.7683551143625205 13 2.7683551143625205
		 14 2.7683551143625205 15 2.7683551143625205 16 2.7683551143625205 17 2.7683551143625205
		 18 2.7683551143625205 19 2.7683551143625205 20 2.7683551143625205 21 2.7683551143625205
		 22 2.7683551143625205 23 2.7683551143625205 24 2.7683551143625205 25 2.7683551143625205
		 26 2.7683551143625205 27 2.7683551143625205 28 2.7683551143625205 29 2.7683551143625205
		 30 2.7683551143625205 31 2.7683551143625205 32 2.7683551143625205;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:WristENd_L_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 -3.2216285703639405 1 -3.2216285703639405
		 2 -3.2216285703639405 3 -3.2216285703639405 4 -3.2216285703639405 5 -3.2216285703639405
		 6 -3.2216285703639405 7 -3.2216285703639405 8 -3.2216285703639405 9 -3.2216285703639405
		 10 -3.2216285703639405 11 -3.2216285703639405 12 -3.2216285703639405 13 -3.2216285703639405
		 14 -3.2216285703639405 15 -3.2216285703639405 16 -3.2216285703639405 17 -3.2216285703639405
		 18 -3.2216285703639405 19 -3.2216285703639405 20 -3.2216285703639405 21 -3.2216285703639405
		 22 -3.2216285703639405 23 -3.2216285703639405 24 -3.2216285703639405 25 -3.2216285703639405
		 26 -3.2216285703639405 27 -3.2216285703639405 28 -3.2216285703639405 29 -3.2216285703639405
		 30 -3.2216285703639405 31 -3.2216285703639405 32 -3.2216285703639405;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Toes_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Toes_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:MiddleToe2_R_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:MiddleToe2_R_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:MiddleToe2_R_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Toes_L_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
createNode animCurveTA -n "walk_female:Toes_L_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 33 ".ktv[0:32]"  0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0
		 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0
		 27 0 28 0 29 0 30 0 31 0 32 0;
	setAttr ".pre" 1;
	setAttr ".pst" 1;
select -ne :time1;
	setAttr ".o" 0;
select -ne :renderPartition;
	setAttr -s 2 ".st";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -s 2 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
select -ne :renderGlobalsList1;
select -ne :defaultRenderGlobals;
	setAttr ".fs" 1;
	setAttr ".ef" 10;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :defaultHardwareRenderGlobals;
	setAttr ".fn" -type "string" "im";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "Group_timing.o" "Group.timing";
connectAttr "run_female:Root_M_translateX.o" "run_female:Root_M.tx";
connectAttr "run_female:Root_M_translateY.o" "run_female:Root_M.ty";
connectAttr "run_female:Root_M_translateZ.o" "run_female:Root_M.tz";
connectAttr "run_female:Root_M_rotateX.o" "run_female:Root_M.rx";
connectAttr "run_female:Root_M_rotateY.o" "run_female:Root_M.ry";
connectAttr "run_female:Root_M_rotateZ.o" "run_female:Root_M.rz";
connectAttr "run_female:Root_M.s" "run_female:Spine1_M.is";
connectAttr "run_female:Spine1_M_rotateX.o" "run_female:Spine1_M.rx";
connectAttr "run_female:Spine1_M_rotateY.o" "run_female:Spine1_M.ry";
connectAttr "run_female:Spine1_M_rotateZ.o" "run_female:Spine1_M.rz";
connectAttr "run_female:Spine1_M.s" "run_female:Spine2_M.is";
connectAttr "run_female:Spine2_M_rotateX.o" "run_female:Spine2_M.rx";
connectAttr "run_female:Spine2_M_rotateY.o" "run_female:Spine2_M.ry";
connectAttr "run_female:Spine2_M_rotateZ.o" "run_female:Spine2_M.rz";
connectAttr "run_female:Spine2_M.s" "run_female:Chest_M.is";
connectAttr "run_female:Chest_M_rotateX.o" "run_female:Chest_M.rx";
connectAttr "run_female:Chest_M_rotateY.o" "run_female:Chest_M.ry";
connectAttr "run_female:Chest_M_rotateZ.o" "run_female:Chest_M.rz";
connectAttr "run_female:Chest_M.s" "run_female:Scapula_R.is";
connectAttr "run_female:Scapula_R_rotateX.o" "run_female:Scapula_R.rx";
connectAttr "run_female:Scapula_R_rotateY.o" "run_female:Scapula_R.ry";
connectAttr "run_female:Scapula_R_rotateZ.o" "run_female:Scapula_R.rz";
connectAttr "run_female:Scapula_R.s" "run_female:Shoulder_R.is";
connectAttr "run_female:Shoulder_R_rotateX.o" "run_female:Shoulder_R.rx";
connectAttr "run_female:Shoulder_R_rotateY.o" "run_female:Shoulder_R.ry";
connectAttr "run_female:Shoulder_R_rotateZ.o" "run_female:Shoulder_R.rz";
connectAttr "run_female:Shoulder_R.s" "run_female:Elbow_R.is";
connectAttr "run_female:Elbow_R_rotateX.o" "run_female:Elbow_R.rx";
connectAttr "run_female:Elbow_R_rotateY.o" "run_female:Elbow_R.ry";
connectAttr "run_female:Elbow_R_rotateZ.o" "run_female:Elbow_R.rz";
connectAttr "run_female:Elbow_R.s" "run_female:Wrist_R.is";
connectAttr "run_female:Wrist_R_rotateX.o" "run_female:Wrist_R.rx";
connectAttr "run_female:Wrist_R_rotateY.o" "run_female:Wrist_R.ry";
connectAttr "run_female:Wrist_R_rotateZ.o" "run_female:Wrist_R.rz";
connectAttr "run_female:Chest_M.s" "run_female:Neck_M.is";
connectAttr "run_female:Neck_M_rotateX.o" "run_female:Neck_M.rx";
connectAttr "run_female:Neck_M_rotateY.o" "run_female:Neck_M.ry";
connectAttr "run_female:Neck_M_rotateZ.o" "run_female:Neck_M.rz";
connectAttr "run_female:Neck_M.s" "run_female:Head_M.is";
connectAttr "run_female:Head_M_rotateX.o" "run_female:Head_M.rx";
connectAttr "run_female:Head_M_rotateY.o" "run_female:Head_M.ry";
connectAttr "run_female:Head_M_rotateZ.o" "run_female:Head_M.rz";
connectAttr "run_female:Chest_M.s" "run_female:Scapula_L.is";
connectAttr "run_female:Scapula_L_rotateX.o" "run_female:Scapula_L.rx";
connectAttr "run_female:Scapula_L_rotateY.o" "run_female:Scapula_L.ry";
connectAttr "run_female:Scapula_L_rotateZ.o" "run_female:Scapula_L.rz";
connectAttr "run_female:Scapula_L.s" "run_female:Shoulder_L.is";
connectAttr "run_female:Shoulder_L_rotateX.o" "run_female:Shoulder_L.rx";
connectAttr "run_female:Shoulder_L_rotateY.o" "run_female:Shoulder_L.ry";
connectAttr "run_female:Shoulder_L_rotateZ.o" "run_female:Shoulder_L.rz";
connectAttr "run_female:Shoulder_L.s" "run_female:Elbow_L.is";
connectAttr "run_female:Elbow_L_rotateX.o" "run_female:Elbow_L.rx";
connectAttr "run_female:Elbow_L_rotateY.o" "run_female:Elbow_L.ry";
connectAttr "run_female:Elbow_L_rotateZ.o" "run_female:Elbow_L.rz";
connectAttr "run_female:Elbow_L.s" "run_female:Wrist_L.is";
connectAttr "run_female:Wrist_L_rotateX.o" "run_female:Wrist_L.rx";
connectAttr "run_female:Wrist_L_rotateY.o" "run_female:Wrist_L.ry";
connectAttr "run_female:Wrist_L_rotateZ.o" "run_female:Wrist_L.rz";
connectAttr "run_female:Root_M.s" "run_female:Hip_R.is";
connectAttr "run_female:Hip_R_rotateX.o" "run_female:Hip_R.rx";
connectAttr "run_female:Hip_R_rotateY.o" "run_female:Hip_R.ry";
connectAttr "run_female:Hip_R_rotateZ.o" "run_female:Hip_R.rz";
connectAttr "run_female:Hip_R.s" "run_female:Knee_R.is";
connectAttr "run_female:Knee_R_rotateX.o" "run_female:Knee_R.rx";
connectAttr "run_female:Knee_R_rotateY.o" "run_female:Knee_R.ry";
connectAttr "run_female:Knee_R_rotateZ.o" "run_female:Knee_R.rz";
connectAttr "run_female:Knee_R.s" "run_female:Ankle_R.is";
connectAttr "run_female:Ankle_R_rotateX.o" "run_female:Ankle_R.rx";
connectAttr "run_female:Ankle_R_rotateY.o" "run_female:Ankle_R.ry";
connectAttr "run_female:Ankle_R_rotateZ.o" "run_female:Ankle_R.rz";
connectAttr "run_female:Ankle_R.s" "run_female:Toes_R.is";
connectAttr "run_female:Toes_R_rotateZ.o" "run_female:Toes_R.rz";
connectAttr "run_female:Toes_R.s" "run_female:MiddleToe2_R.is";
connectAttr "run_female:Root_M.s" "run_female:Hip_L.is";
connectAttr "run_female:Hip_L_rotateX.o" "run_female:Hip_L.rx";
connectAttr "run_female:Hip_L_rotateY.o" "run_female:Hip_L.ry";
connectAttr "run_female:Hip_L_rotateZ.o" "run_female:Hip_L.rz";
connectAttr "run_female:Hip_L.s" "run_female:Knee_L.is";
connectAttr "run_female:Knee_L_rotateX.o" "run_female:Knee_L.rx";
connectAttr "run_female:Knee_L_rotateY.o" "run_female:Knee_L.ry";
connectAttr "run_female:Knee_L_rotateZ.o" "run_female:Knee_L.rz";
connectAttr "run_female:Knee_L.s" "run_female:Ankle_L.is";
connectAttr "run_female:Ankle_L_rotateX.o" "run_female:Ankle_L.rx";
connectAttr "run_female:Ankle_L_rotateY.o" "run_female:Ankle_L.ry";
connectAttr "run_female:Ankle_L_rotateZ.o" "run_female:Ankle_L.rz";
connectAttr "run_female:Ankle_L.s" "run_female:Toes_L.is";
connectAttr "run_female:Toes_L_rotateZ.o" "run_female:Toes_L.rz";
connectAttr "run_female:Toes_L.s" "run_female:MiddleToe2_L.is";
connectAttr "run_male:Root_M_translateX.o" "run_male:Root_M.tx";
connectAttr "run_male:Root_M_translateY.o" "run_male:Root_M.ty";
connectAttr "run_male:Root_M_translateZ.o" "run_male:Root_M.tz";
connectAttr "run_male:Root_M_rotateX.o" "run_male:Root_M.rx";
connectAttr "run_male:Root_M_rotateY.o" "run_male:Root_M.ry";
connectAttr "run_male:Root_M_rotateZ.o" "run_male:Root_M.rz";
connectAttr "run_male:Root_M.s" "run_male:Spine1_M.is";
connectAttr "run_male:Spine1_M_rotateX.o" "run_male:Spine1_M.rx";
connectAttr "run_male:Spine1_M_rotateY.o" "run_male:Spine1_M.ry";
connectAttr "run_male:Spine1_M_rotateZ.o" "run_male:Spine1_M.rz";
connectAttr "run_male:Spine1_M.s" "run_male:Spine2_M.is";
connectAttr "run_male:Spine2_M_rotateX.o" "run_male:Spine2_M.rx";
connectAttr "run_male:Spine2_M_rotateY.o" "run_male:Spine2_M.ry";
connectAttr "run_male:Spine2_M_rotateZ.o" "run_male:Spine2_M.rz";
connectAttr "run_male:Spine2_M.s" "run_male:Chest_M.is";
connectAttr "run_male:Chest_M_rotateX.o" "run_male:Chest_M.rx";
connectAttr "run_male:Chest_M_rotateY.o" "run_male:Chest_M.ry";
connectAttr "run_male:Chest_M_rotateZ.o" "run_male:Chest_M.rz";
connectAttr "run_male:Chest_M.s" "run_male:Scapula_R.is";
connectAttr "run_male:Scapula_R_rotateX.o" "run_male:Scapula_R.rx";
connectAttr "run_male:Scapula_R_rotateY.o" "run_male:Scapula_R.ry";
connectAttr "run_male:Scapula_R_rotateZ.o" "run_male:Scapula_R.rz";
connectAttr "run_male:Scapula_R.s" "run_male:Shoulder_R.is";
connectAttr "run_male:Shoulder_R_rotateX.o" "run_male:Shoulder_R.rx";
connectAttr "run_male:Shoulder_R_rotateY.o" "run_male:Shoulder_R.ry";
connectAttr "run_male:Shoulder_R_rotateZ.o" "run_male:Shoulder_R.rz";
connectAttr "run_male:Shoulder_R.s" "run_male:Elbow_R.is";
connectAttr "run_male:Elbow_R_rotateX.o" "run_male:Elbow_R.rx";
connectAttr "run_male:Elbow_R_rotateY.o" "run_male:Elbow_R.ry";
connectAttr "run_male:Elbow_R_rotateZ.o" "run_male:Elbow_R.rz";
connectAttr "run_male:Elbow_R.s" "run_male:Wrist_R.is";
connectAttr "run_male:Wrist_R_rotateX.o" "run_male:Wrist_R.rx";
connectAttr "run_male:Wrist_R_rotateY.o" "run_male:Wrist_R.ry";
connectAttr "run_male:Wrist_R_rotateZ.o" "run_male:Wrist_R.rz";
connectAttr "run_male:WristENd_R_rotateX.o" "run_male:WristENd_R.rx";
connectAttr "run_male:WristENd_R_rotateY.o" "run_male:WristENd_R.ry";
connectAttr "run_male:WristENd_R_rotateZ.o" "run_male:WristENd_R.rz";
connectAttr "run_male:Chest_M.s" "run_male:Neck_M.is";
connectAttr "run_male:Neck_M_rotateX.o" "run_male:Neck_M.rx";
connectAttr "run_male:Neck_M_rotateY.o" "run_male:Neck_M.ry";
connectAttr "run_male:Neck_M_rotateZ.o" "run_male:Neck_M.rz";
connectAttr "run_male:Neck_M.s" "run_male:Head_M.is";
connectAttr "run_male:Head_M_rotateX.o" "run_male:Head_M.rx";
connectAttr "run_male:Head_M_rotateY.o" "run_male:Head_M.ry";
connectAttr "run_male:Head_M_rotateZ.o" "run_male:Head_M.rz";
connectAttr "run_male:Hair_M_rotateX.o" "run_male:Hair_M.rx";
connectAttr "run_male:Hair_M_rotateY.o" "run_male:Hair_M.ry";
connectAttr "run_male:Hair_M_rotateZ.o" "run_male:Hair_M.rz";
connectAttr "run_male:Chest_M.s" "run_male:Scapula_L.is";
connectAttr "run_male:Scapula_L_rotateX.o" "run_male:Scapula_L.rx";
connectAttr "run_male:Scapula_L_rotateY.o" "run_male:Scapula_L.ry";
connectAttr "run_male:Scapula_L_rotateZ.o" "run_male:Scapula_L.rz";
connectAttr "run_male:Scapula_L.s" "run_male:Shoulder_L.is";
connectAttr "run_male:Shoulder_L_rotateX.o" "run_male:Shoulder_L.rx";
connectAttr "run_male:Shoulder_L_rotateY.o" "run_male:Shoulder_L.ry";
connectAttr "run_male:Shoulder_L_rotateZ.o" "run_male:Shoulder_L.rz";
connectAttr "run_male:Shoulder_L.s" "run_male:Elbow_L.is";
connectAttr "run_male:Elbow_L_rotateX.o" "run_male:Elbow_L.rx";
connectAttr "run_male:Elbow_L_rotateY.o" "run_male:Elbow_L.ry";
connectAttr "run_male:Elbow_L_rotateZ.o" "run_male:Elbow_L.rz";
connectAttr "run_male:Elbow_L.s" "run_male:Wrist_L.is";
connectAttr "run_male:Wrist_L_rotateX.o" "run_male:Wrist_L.rx";
connectAttr "run_male:Wrist_L_rotateY.o" "run_male:Wrist_L.ry";
connectAttr "run_male:Wrist_L_rotateZ.o" "run_male:Wrist_L.rz";
connectAttr "run_male:WristENd_L_rotateX.o" "run_male:WristENd_L.rx";
connectAttr "run_male:WristENd_L_rotateY.o" "run_male:WristENd_L.ry";
connectAttr "run_male:WristENd_L_rotateZ.o" "run_male:WristENd_L.rz";
connectAttr "run_male:Root_M.s" "run_male:Hip_R.is";
connectAttr "run_male:Hip_R_rotateX.o" "run_male:Hip_R.rx";
connectAttr "run_male:Hip_R_rotateY.o" "run_male:Hip_R.ry";
connectAttr "run_male:Hip_R_rotateZ.o" "run_male:Hip_R.rz";
connectAttr "run_male:Hip_R.s" "run_male:Knee_R.is";
connectAttr "run_male:Knee_R_rotateX.o" "run_male:Knee_R.rx";
connectAttr "run_male:Knee_R_rotateY.o" "run_male:Knee_R.ry";
connectAttr "run_male:Knee_R_rotateZ.o" "run_male:Knee_R.rz";
connectAttr "run_male:Knee_R.s" "run_male:Ankle_R.is";
connectAttr "run_male:Ankle_R_rotateX.o" "run_male:Ankle_R.rx";
connectAttr "run_male:Ankle_R_rotateY.o" "run_male:Ankle_R.ry";
connectAttr "run_male:Ankle_R_rotateZ.o" "run_male:Ankle_R.rz";
connectAttr "run_male:Ankle_R.s" "run_male:Toes_R.is";
connectAttr "run_male:Toes_R_rotateZ.o" "run_male:Toes_R.rz";
connectAttr "run_male:Toes_R.s" "run_male:MiddleToe2_R.is";
connectAttr "run_male:MiddleToe2_R_rotateX.o" "run_male:MiddleToe2_R.rx";
connectAttr "run_male:MiddleToe2_R_rotateY.o" "run_male:MiddleToe2_R.ry";
connectAttr "run_male:MiddleToe2_R_rotateZ.o" "run_male:MiddleToe2_R.rz";
connectAttr "run_male:Root_M.s" "run_male:Hip_L.is";
connectAttr "run_male:Hip_L_rotateX.o" "run_male:Hip_L.rx";
connectAttr "run_male:Hip_L_rotateY.o" "run_male:Hip_L.ry";
connectAttr "run_male:Hip_L_rotateZ.o" "run_male:Hip_L.rz";
connectAttr "run_male:Hip_L.s" "run_male:Knee_L.is";
connectAttr "run_male:Knee_L_rotateX.o" "run_male:Knee_L.rx";
connectAttr "run_male:Knee_L_rotateY.o" "run_male:Knee_L.ry";
connectAttr "run_male:Knee_L_rotateZ.o" "run_male:Knee_L.rz";
connectAttr "run_male:Knee_L.s" "run_male:Ankle_L.is";
connectAttr "run_male:Ankle_L_rotateX.o" "run_male:Ankle_L.rx";
connectAttr "run_male:Ankle_L_rotateY.o" "run_male:Ankle_L.ry";
connectAttr "run_male:Ankle_L_rotateZ.o" "run_male:Ankle_L.rz";
connectAttr "run_male:Ankle_L.s" "run_male:Toes_L.is";
connectAttr "run_male:Toes_L_rotateZ.o" "run_male:Toes_L.rz";
connectAttr "run_male:Toes_L.s" "run_male:MiddleToe2_L.is";
connectAttr "run_male:MiddleToe2_L_rotateX.o" "run_male:MiddleToe2_L.rx";
connectAttr "run_male:MiddleToe2_L_rotateY.o" "run_male:MiddleToe2_L.ry";
connectAttr "run_male:MiddleToe2_L_rotateZ.o" "run_male:MiddleToe2_L.rz";
connectAttr "walk_angry:Root_M_translateX.o" "walk_angry:Root_M.tx";
connectAttr "walk_angry:Root_M_translateY.o" "walk_angry:Root_M.ty";
connectAttr "walk_angry:Root_M_translateZ.o" "walk_angry:Root_M.tz";
connectAttr "walk_angry:Root_M_rotateX.o" "walk_angry:Root_M.rx";
connectAttr "walk_angry:Root_M_rotateY.o" "walk_angry:Root_M.ry";
connectAttr "walk_angry:Root_M_rotateZ.o" "walk_angry:Root_M.rz";
connectAttr "walk_angry:Root_M.s" "walk_angry:Spine1_M.is";
connectAttr "walk_angry:Spine1_M_rotateX.o" "walk_angry:Spine1_M.rx";
connectAttr "walk_angry:Spine1_M_rotateY.o" "walk_angry:Spine1_M.ry";
connectAttr "walk_angry:Spine1_M_rotateZ.o" "walk_angry:Spine1_M.rz";
connectAttr "walk_angry:Spine1_M.s" "walk_angry:Spine2_M.is";
connectAttr "walk_angry:Spine2_M_rotateX.o" "walk_angry:Spine2_M.rx";
connectAttr "walk_angry:Spine2_M_rotateY.o" "walk_angry:Spine2_M.ry";
connectAttr "walk_angry:Spine2_M_rotateZ.o" "walk_angry:Spine2_M.rz";
connectAttr "walk_angry:Spine2_M.s" "walk_angry:Chest_M.is";
connectAttr "walk_angry:Chest_M_rotateX.o" "walk_angry:Chest_M.rx";
connectAttr "walk_angry:Chest_M_rotateY.o" "walk_angry:Chest_M.ry";
connectAttr "walk_angry:Chest_M_rotateZ.o" "walk_angry:Chest_M.rz";
connectAttr "walk_angry:Chest_M.s" "walk_angry:Scapula_R.is";
connectAttr "walk_angry:Scapula_R_rotateX.o" "walk_angry:Scapula_R.rx";
connectAttr "walk_angry:Scapula_R_rotateY.o" "walk_angry:Scapula_R.ry";
connectAttr "walk_angry:Scapula_R_rotateZ.o" "walk_angry:Scapula_R.rz";
connectAttr "walk_angry:Scapula_R.s" "walk_angry:Shoulder_R.is";
connectAttr "walk_angry:Shoulder_R_rotateX.o" "walk_angry:Shoulder_R.rx";
connectAttr "walk_angry:Shoulder_R_rotateY.o" "walk_angry:Shoulder_R.ry";
connectAttr "walk_angry:Shoulder_R_rotateZ.o" "walk_angry:Shoulder_R.rz";
connectAttr "walk_angry:Shoulder_R.s" "walk_angry:Elbow_R.is";
connectAttr "walk_angry:Elbow_R_rotateX.o" "walk_angry:Elbow_R.rx";
connectAttr "walk_angry:Elbow_R_rotateY.o" "walk_angry:Elbow_R.ry";
connectAttr "walk_angry:Elbow_R_rotateZ.o" "walk_angry:Elbow_R.rz";
connectAttr "walk_angry:Elbow_R.s" "walk_angry:Wrist_R.is";
connectAttr "walk_angry:Wrist_R_rotateX.o" "walk_angry:Wrist_R.rx";
connectAttr "walk_angry:Wrist_R_rotateY.o" "walk_angry:Wrist_R.ry";
connectAttr "walk_angry:Wrist_R_rotateZ.o" "walk_angry:Wrist_R.rz";
connectAttr "walk_angry:WristENd_R_rotateX.o" "walk_angry:WristENd_R.rx";
connectAttr "walk_angry:WristENd_R_rotateY.o" "walk_angry:WristENd_R.ry";
connectAttr "walk_angry:WristENd_R_rotateZ.o" "walk_angry:WristENd_R.rz";
connectAttr "walk_angry:Chest_M.s" "walk_angry:Neck_M.is";
connectAttr "walk_angry:Neck_M_rotateX.o" "walk_angry:Neck_M.rx";
connectAttr "walk_angry:Neck_M_rotateY.o" "walk_angry:Neck_M.ry";
connectAttr "walk_angry:Neck_M_rotateZ.o" "walk_angry:Neck_M.rz";
connectAttr "walk_angry:Neck_M.s" "walk_angry:Head_M.is";
connectAttr "walk_angry:Head_M_rotateX.o" "walk_angry:Head_M.rx";
connectAttr "walk_angry:Head_M_rotateY.o" "walk_angry:Head_M.ry";
connectAttr "walk_angry:Head_M_rotateZ.o" "walk_angry:Head_M.rz";
connectAttr "walk_angry:Hair_M_rotateX.o" "walk_angry:Hair_M.rx";
connectAttr "walk_angry:Hair_M_rotateY.o" "walk_angry:Hair_M.ry";
connectAttr "walk_angry:Hair_M_rotateZ.o" "walk_angry:Hair_M.rz";
connectAttr "walk_angry:Chest_M.s" "walk_angry:Scapula_L.is";
connectAttr "walk_angry:Scapula_L_rotateX.o" "walk_angry:Scapula_L.rx";
connectAttr "walk_angry:Scapula_L_rotateY.o" "walk_angry:Scapula_L.ry";
connectAttr "walk_angry:Scapula_L_rotateZ.o" "walk_angry:Scapula_L.rz";
connectAttr "walk_angry:Scapula_L.s" "walk_angry:Shoulder_L.is";
connectAttr "walk_angry:Shoulder_L_rotateX.o" "walk_angry:Shoulder_L.rx";
connectAttr "walk_angry:Shoulder_L_rotateY.o" "walk_angry:Shoulder_L.ry";
connectAttr "walk_angry:Shoulder_L_rotateZ.o" "walk_angry:Shoulder_L.rz";
connectAttr "walk_angry:Shoulder_L.s" "walk_angry:Elbow_L.is";
connectAttr "walk_angry:Elbow_L_rotateX.o" "walk_angry:Elbow_L.rx";
connectAttr "walk_angry:Elbow_L_rotateY.o" "walk_angry:Elbow_L.ry";
connectAttr "walk_angry:Elbow_L_rotateZ.o" "walk_angry:Elbow_L.rz";
connectAttr "walk_angry:Elbow_L.s" "walk_angry:Wrist_L.is";
connectAttr "walk_angry:Wrist_L_rotateX.o" "walk_angry:Wrist_L.rx";
connectAttr "walk_angry:Wrist_L_rotateY.o" "walk_angry:Wrist_L.ry";
connectAttr "walk_angry:Wrist_L_rotateZ.o" "walk_angry:Wrist_L.rz";
connectAttr "walk_angry:WristENd_L_rotateX.o" "walk_angry:WristENd_L.rx";
connectAttr "walk_angry:WristENd_L_rotateY.o" "walk_angry:WristENd_L.ry";
connectAttr "walk_angry:WristENd_L_rotateZ.o" "walk_angry:WristENd_L.rz";
connectAttr "walk_angry:Root_M.s" "walk_angry:Hip_R.is";
connectAttr "walk_angry:Hip_R_rotateX.o" "walk_angry:Hip_R.rx";
connectAttr "walk_angry:Hip_R_rotateY.o" "walk_angry:Hip_R.ry";
connectAttr "walk_angry:Hip_R_rotateZ.o" "walk_angry:Hip_R.rz";
connectAttr "walk_angry:Hip_R.s" "walk_angry:Knee_R.is";
connectAttr "walk_angry:Knee_R_rotateX.o" "walk_angry:Knee_R.rx";
connectAttr "walk_angry:Knee_R_rotateY.o" "walk_angry:Knee_R.ry";
connectAttr "walk_angry:Knee_R_rotateZ.o" "walk_angry:Knee_R.rz";
connectAttr "walk_angry:Knee_R.s" "walk_angry:Ankle_R.is";
connectAttr "walk_angry:Ankle_R_rotateX.o" "walk_angry:Ankle_R.rx";
connectAttr "walk_angry:Ankle_R_rotateY.o" "walk_angry:Ankle_R.ry";
connectAttr "walk_angry:Ankle_R_rotateZ.o" "walk_angry:Ankle_R.rz";
connectAttr "walk_angry:Ankle_R.s" "walk_angry:Toes_R.is";
connectAttr "walk_angry:Toes_R_rotateZ.o" "walk_angry:Toes_R.rz";
connectAttr "walk_angry:Toes_R.s" "walk_angry:MiddleToe2_R.is";
connectAttr "walk_angry:MiddleToe2_R_rotateX.o" "walk_angry:MiddleToe2_R.rx";
connectAttr "walk_angry:MiddleToe2_R_rotateY.o" "walk_angry:MiddleToe2_R.ry";
connectAttr "walk_angry:MiddleToe2_R_rotateZ.o" "walk_angry:MiddleToe2_R.rz";
connectAttr "walk_angry:Root_M.s" "walk_angry:Hip_L.is";
connectAttr "walk_angry:Hip_L_rotateX.o" "walk_angry:Hip_L.rx";
connectAttr "walk_angry:Hip_L_rotateY.o" "walk_angry:Hip_L.ry";
connectAttr "walk_angry:Hip_L_rotateZ.o" "walk_angry:Hip_L.rz";
connectAttr "walk_angry:Hip_L.s" "walk_angry:Knee_L.is";
connectAttr "walk_angry:Knee_L_rotateX.o" "walk_angry:Knee_L.rx";
connectAttr "walk_angry:Knee_L_rotateY.o" "walk_angry:Knee_L.ry";
connectAttr "walk_angry:Knee_L_rotateZ.o" "walk_angry:Knee_L.rz";
connectAttr "walk_angry:Knee_L.s" "walk_angry:Ankle_L.is";
connectAttr "walk_angry:Ankle_L_rotateX.o" "walk_angry:Ankle_L.rx";
connectAttr "walk_angry:Ankle_L_rotateY.o" "walk_angry:Ankle_L.ry";
connectAttr "walk_angry:Ankle_L_rotateZ.o" "walk_angry:Ankle_L.rz";
connectAttr "walk_angry:Ankle_L.s" "walk_angry:Toes_L.is";
connectAttr "walk_angry:Toes_L_rotateZ.o" "walk_angry:Toes_L.rz";
connectAttr "walk_angry:Toes_L.s" "walk_angry:MiddleToe2_L.is";
connectAttr "walk_angry:MiddleToe2_L_rotateX.o" "walk_angry:MiddleToe2_L.rx";
connectAttr "walk_angry:MiddleToe2_L_rotateY.o" "walk_angry:MiddleToe2_L.ry";
connectAttr "walk_angry:MiddleToe2_L_rotateZ.o" "walk_angry:MiddleToe2_L.rz";
connectAttr "walk_cool:Root_M_translateX.o" "walk_cool:Root_M.tx";
connectAttr "walk_cool:Root_M_translateY.o" "walk_cool:Root_M.ty";
connectAttr "walk_cool:Root_M_translateZ.o" "walk_cool:Root_M.tz";
connectAttr "walk_cool:Root_M_rotateX.o" "walk_cool:Root_M.rx";
connectAttr "walk_cool:Root_M_rotateY.o" "walk_cool:Root_M.ry";
connectAttr "walk_cool:Root_M_rotateZ.o" "walk_cool:Root_M.rz";
connectAttr "walk_cool:Root_M.s" "walk_cool:Spine1_M.is";
connectAttr "walk_cool:Spine1_M_rotateX.o" "walk_cool:Spine1_M.rx";
connectAttr "walk_cool:Spine1_M_rotateY.o" "walk_cool:Spine1_M.ry";
connectAttr "walk_cool:Spine1_M_rotateZ.o" "walk_cool:Spine1_M.rz";
connectAttr "walk_cool:Spine1_M.s" "walk_cool:Spine2_M.is";
connectAttr "walk_cool:Spine2_M_rotateX.o" "walk_cool:Spine2_M.rx";
connectAttr "walk_cool:Spine2_M_rotateY.o" "walk_cool:Spine2_M.ry";
connectAttr "walk_cool:Spine2_M_rotateZ.o" "walk_cool:Spine2_M.rz";
connectAttr "walk_cool:Spine2_M.s" "walk_cool:Chest_M.is";
connectAttr "walk_cool:Chest_M_rotateX.o" "walk_cool:Chest_M.rx";
connectAttr "walk_cool:Chest_M_rotateY.o" "walk_cool:Chest_M.ry";
connectAttr "walk_cool:Chest_M_rotateZ.o" "walk_cool:Chest_M.rz";
connectAttr "walk_cool:Chest_M.s" "walk_cool:Scapula_R.is";
connectAttr "walk_cool:Scapula_R_rotateX.o" "walk_cool:Scapula_R.rx";
connectAttr "walk_cool:Scapula_R_rotateY.o" "walk_cool:Scapula_R.ry";
connectAttr "walk_cool:Scapula_R_rotateZ.o" "walk_cool:Scapula_R.rz";
connectAttr "walk_cool:Scapula_R.s" "walk_cool:Shoulder_R.is";
connectAttr "walk_cool:Shoulder_R_rotateX.o" "walk_cool:Shoulder_R.rx";
connectAttr "walk_cool:Shoulder_R_rotateY.o" "walk_cool:Shoulder_R.ry";
connectAttr "walk_cool:Shoulder_R_rotateZ.o" "walk_cool:Shoulder_R.rz";
connectAttr "walk_cool:Shoulder_R.s" "walk_cool:Elbow_R.is";
connectAttr "walk_cool:Elbow_R_rotateX.o" "walk_cool:Elbow_R.rx";
connectAttr "walk_cool:Elbow_R_rotateY.o" "walk_cool:Elbow_R.ry";
connectAttr "walk_cool:Elbow_R_rotateZ.o" "walk_cool:Elbow_R.rz";
connectAttr "walk_cool:Elbow_R.s" "walk_cool:Wrist_R.is";
connectAttr "walk_cool:Wrist_R_rotateX.o" "walk_cool:Wrist_R.rx";
connectAttr "walk_cool:Wrist_R_rotateY.o" "walk_cool:Wrist_R.ry";
connectAttr "walk_cool:Wrist_R_rotateZ.o" "walk_cool:Wrist_R.rz";
connectAttr "walk_cool:WristENd_R_rotateX.o" "walk_cool:WristENd_R.rx";
connectAttr "walk_cool:WristENd_R_rotateY.o" "walk_cool:WristENd_R.ry";
connectAttr "walk_cool:WristENd_R_rotateZ.o" "walk_cool:WristENd_R.rz";
connectAttr "walk_cool:Chest_M.s" "walk_cool:Neck_M.is";
connectAttr "walk_cool:Neck_M_rotateX.o" "walk_cool:Neck_M.rx";
connectAttr "walk_cool:Neck_M_rotateY.o" "walk_cool:Neck_M.ry";
connectAttr "walk_cool:Neck_M_rotateZ.o" "walk_cool:Neck_M.rz";
connectAttr "walk_cool:Neck_M.s" "walk_cool:Head_M.is";
connectAttr "walk_cool:Head_M_rotateX.o" "walk_cool:Head_M.rx";
connectAttr "walk_cool:Head_M_rotateY.o" "walk_cool:Head_M.ry";
connectAttr "walk_cool:Head_M_rotateZ.o" "walk_cool:Head_M.rz";
connectAttr "walk_cool:Hair_M_rotateX.o" "walk_cool:Hair_M.rx";
connectAttr "walk_cool:Hair_M_rotateY.o" "walk_cool:Hair_M.ry";
connectAttr "walk_cool:Hair_M_rotateZ.o" "walk_cool:Hair_M.rz";
connectAttr "walk_cool:Chest_M.s" "walk_cool:Scapula_L.is";
connectAttr "walk_cool:Scapula_L_rotateX.o" "walk_cool:Scapula_L.rx";
connectAttr "walk_cool:Scapula_L_rotateY.o" "walk_cool:Scapula_L.ry";
connectAttr "walk_cool:Scapula_L_rotateZ.o" "walk_cool:Scapula_L.rz";
connectAttr "walk_cool:Scapula_L.s" "walk_cool:Shoulder_L.is";
connectAttr "walk_cool:Shoulder_L_rotateX.o" "walk_cool:Shoulder_L.rx";
connectAttr "walk_cool:Shoulder_L_rotateY.o" "walk_cool:Shoulder_L.ry";
connectAttr "walk_cool:Shoulder_L_rotateZ.o" "walk_cool:Shoulder_L.rz";
connectAttr "walk_cool:Shoulder_L.s" "walk_cool:Elbow_L.is";
connectAttr "walk_cool:Elbow_L_rotateX.o" "walk_cool:Elbow_L.rx";
connectAttr "walk_cool:Elbow_L_rotateY.o" "walk_cool:Elbow_L.ry";
connectAttr "walk_cool:Elbow_L_rotateZ.o" "walk_cool:Elbow_L.rz";
connectAttr "walk_cool:Elbow_L.s" "walk_cool:Wrist_L.is";
connectAttr "walk_cool:Wrist_L_rotateX.o" "walk_cool:Wrist_L.rx";
connectAttr "walk_cool:Wrist_L_rotateY.o" "walk_cool:Wrist_L.ry";
connectAttr "walk_cool:Wrist_L_rotateZ.o" "walk_cool:Wrist_L.rz";
connectAttr "walk_cool:WristENd_L_rotateX.o" "walk_cool:WristENd_L.rx";
connectAttr "walk_cool:WristENd_L_rotateY.o" "walk_cool:WristENd_L.ry";
connectAttr "walk_cool:WristENd_L_rotateZ.o" "walk_cool:WristENd_L.rz";
connectAttr "walk_cool:Root_M.s" "walk_cool:Hip_R.is";
connectAttr "walk_cool:Hip_R_rotateX.o" "walk_cool:Hip_R.rx";
connectAttr "walk_cool:Hip_R_rotateY.o" "walk_cool:Hip_R.ry";
connectAttr "walk_cool:Hip_R_rotateZ.o" "walk_cool:Hip_R.rz";
connectAttr "walk_cool:Hip_R.s" "walk_cool:Knee_R.is";
connectAttr "walk_cool:Knee_R_rotateX.o" "walk_cool:Knee_R.rx";
connectAttr "walk_cool:Knee_R_rotateY.o" "walk_cool:Knee_R.ry";
connectAttr "walk_cool:Knee_R_rotateZ.o" "walk_cool:Knee_R.rz";
connectAttr "walk_cool:Knee_R.s" "walk_cool:Ankle_R.is";
connectAttr "walk_cool:Ankle_R_rotateX.o" "walk_cool:Ankle_R.rx";
connectAttr "walk_cool:Ankle_R_rotateY.o" "walk_cool:Ankle_R.ry";
connectAttr "walk_cool:Ankle_R_rotateZ.o" "walk_cool:Ankle_R.rz";
connectAttr "walk_cool:Ankle_R.s" "walk_cool:Toes_R.is";
connectAttr "walk_cool:Toes_R_rotateZ.o" "walk_cool:Toes_R.rz";
connectAttr "walk_cool:Toes_R.s" "walk_cool:MiddleToe2_R.is";
connectAttr "walk_cool:MiddleToe2_R_rotateX.o" "walk_cool:MiddleToe2_R.rx";
connectAttr "walk_cool:MiddleToe2_R_rotateY.o" "walk_cool:MiddleToe2_R.ry";
connectAttr "walk_cool:MiddleToe2_R_rotateZ.o" "walk_cool:MiddleToe2_R.rz";
connectAttr "walk_cool:Root_M.s" "walk_cool:Hip_L.is";
connectAttr "walk_cool:Hip_L_rotateX.o" "walk_cool:Hip_L.rx";
connectAttr "walk_cool:Hip_L_rotateY.o" "walk_cool:Hip_L.ry";
connectAttr "walk_cool:Hip_L_rotateZ.o" "walk_cool:Hip_L.rz";
connectAttr "walk_cool:Hip_L.s" "walk_cool:Knee_L.is";
connectAttr "walk_cool:Knee_L_rotateX.o" "walk_cool:Knee_L.rx";
connectAttr "walk_cool:Knee_L_rotateY.o" "walk_cool:Knee_L.ry";
connectAttr "walk_cool:Knee_L_rotateZ.o" "walk_cool:Knee_L.rz";
connectAttr "walk_cool:Knee_L.s" "walk_cool:Ankle_L.is";
connectAttr "walk_cool:Ankle_L_rotateX.o" "walk_cool:Ankle_L.rx";
connectAttr "walk_cool:Ankle_L_rotateY.o" "walk_cool:Ankle_L.ry";
connectAttr "walk_cool:Ankle_L_rotateZ.o" "walk_cool:Ankle_L.rz";
connectAttr "walk_cool:Ankle_L.s" "walk_cool:Toes_L.is";
connectAttr "walk_cool:Toes_L_rotateZ.o" "walk_cool:Toes_L.rz";
connectAttr "walk_cool:Toes_L.s" "walk_cool:MiddleToe2_L.is";
connectAttr "walk_cool:MiddleToe2_L_rotateX.o" "walk_cool:MiddleToe2_L.rx";
connectAttr "walk_cool:MiddleToe2_L_rotateY.o" "walk_cool:MiddleToe2_L.ry";
connectAttr "walk_cool:MiddleToe2_L_rotateZ.o" "walk_cool:MiddleToe2_L.rz";
connectAttr "walk_cute:Root_M_translateX.o" "walk_cute:Root_M.tx";
connectAttr "walk_cute:Root_M_translateY.o" "walk_cute:Root_M.ty";
connectAttr "walk_cute:Root_M_translateZ.o" "walk_cute:Root_M.tz";
connectAttr "walk_cute:Root_M_rotateX.o" "walk_cute:Root_M.rx";
connectAttr "walk_cute:Root_M_rotateY.o" "walk_cute:Root_M.ry";
connectAttr "walk_cute:Root_M_rotateZ.o" "walk_cute:Root_M.rz";
connectAttr "walk_cute:Root_M.s" "walk_cute:Spine1_M.is";
connectAttr "walk_cute:Spine1_M_rotateX.o" "walk_cute:Spine1_M.rx";
connectAttr "walk_cute:Spine1_M_rotateY.o" "walk_cute:Spine1_M.ry";
connectAttr "walk_cute:Spine1_M_rotateZ.o" "walk_cute:Spine1_M.rz";
connectAttr "walk_cute:Spine1_M.s" "walk_cute:Spine2_M.is";
connectAttr "walk_cute:Spine2_M_rotateX.o" "walk_cute:Spine2_M.rx";
connectAttr "walk_cute:Spine2_M_rotateY.o" "walk_cute:Spine2_M.ry";
connectAttr "walk_cute:Spine2_M_rotateZ.o" "walk_cute:Spine2_M.rz";
connectAttr "walk_cute:Spine2_M.s" "walk_cute:Chest_M.is";
connectAttr "walk_cute:Chest_M_rotateX.o" "walk_cute:Chest_M.rx";
connectAttr "walk_cute:Chest_M_rotateY.o" "walk_cute:Chest_M.ry";
connectAttr "walk_cute:Chest_M_rotateZ.o" "walk_cute:Chest_M.rz";
connectAttr "walk_cute:Chest_M.s" "walk_cute:Scapula_R.is";
connectAttr "walk_cute:Scapula_R_rotateX.o" "walk_cute:Scapula_R.rx";
connectAttr "walk_cute:Scapula_R_rotateY.o" "walk_cute:Scapula_R.ry";
connectAttr "walk_cute:Scapula_R_rotateZ.o" "walk_cute:Scapula_R.rz";
connectAttr "walk_cute:Scapula_R.s" "walk_cute:Shoulder_R.is";
connectAttr "walk_cute:Shoulder_R_rotateX.o" "walk_cute:Shoulder_R.rx";
connectAttr "walk_cute:Shoulder_R_rotateY.o" "walk_cute:Shoulder_R.ry";
connectAttr "walk_cute:Shoulder_R_rotateZ.o" "walk_cute:Shoulder_R.rz";
connectAttr "walk_cute:Shoulder_R.s" "walk_cute:Elbow_R.is";
connectAttr "walk_cute:Elbow_R_rotateX.o" "walk_cute:Elbow_R.rx";
connectAttr "walk_cute:Elbow_R_rotateY.o" "walk_cute:Elbow_R.ry";
connectAttr "walk_cute:Elbow_R_rotateZ.o" "walk_cute:Elbow_R.rz";
connectAttr "walk_cute:Elbow_R.s" "walk_cute:Wrist_R.is";
connectAttr "walk_cute:Wrist_R_rotateX.o" "walk_cute:Wrist_R.rx";
connectAttr "walk_cute:Wrist_R_rotateY.o" "walk_cute:Wrist_R.ry";
connectAttr "walk_cute:Wrist_R_rotateZ.o" "walk_cute:Wrist_R.rz";
connectAttr "walk_cute:WristENd_R_rotateX.o" "walk_cute:WristENd_R.rx";
connectAttr "walk_cute:WristENd_R_rotateY.o" "walk_cute:WristENd_R.ry";
connectAttr "walk_cute:WristENd_R_rotateZ.o" "walk_cute:WristENd_R.rz";
connectAttr "walk_cute:Chest_M.s" "walk_cute:Neck_M.is";
connectAttr "walk_cute:Neck_M_rotateX.o" "walk_cute:Neck_M.rx";
connectAttr "walk_cute:Neck_M_rotateY.o" "walk_cute:Neck_M.ry";
connectAttr "walk_cute:Neck_M_rotateZ.o" "walk_cute:Neck_M.rz";
connectAttr "walk_cute:Neck_M.s" "walk_cute:Head_M.is";
connectAttr "walk_cute:Head_M_rotateX.o" "walk_cute:Head_M.rx";
connectAttr "walk_cute:Head_M_rotateY.o" "walk_cute:Head_M.ry";
connectAttr "walk_cute:Head_M_rotateZ.o" "walk_cute:Head_M.rz";
connectAttr "walk_cute:Hair_M_rotateX.o" "walk_cute:Hair_M.rx";
connectAttr "walk_cute:Hair_M_rotateY.o" "walk_cute:Hair_M.ry";
connectAttr "walk_cute:Hair_M_rotateZ.o" "walk_cute:Hair_M.rz";
connectAttr "walk_cute:Chest_M.s" "walk_cute:Scapula_L.is";
connectAttr "walk_cute:Scapula_L_rotateX.o" "walk_cute:Scapula_L.rx";
connectAttr "walk_cute:Scapula_L_rotateY.o" "walk_cute:Scapula_L.ry";
connectAttr "walk_cute:Scapula_L_rotateZ.o" "walk_cute:Scapula_L.rz";
connectAttr "walk_cute:Scapula_L.s" "walk_cute:Shoulder_L.is";
connectAttr "walk_cute:Shoulder_L_rotateX.o" "walk_cute:Shoulder_L.rx";
connectAttr "walk_cute:Shoulder_L_rotateY.o" "walk_cute:Shoulder_L.ry";
connectAttr "walk_cute:Shoulder_L_rotateZ.o" "walk_cute:Shoulder_L.rz";
connectAttr "walk_cute:Shoulder_L.s" "walk_cute:Elbow_L.is";
connectAttr "walk_cute:Elbow_L_rotateX.o" "walk_cute:Elbow_L.rx";
connectAttr "walk_cute:Elbow_L_rotateY.o" "walk_cute:Elbow_L.ry";
connectAttr "walk_cute:Elbow_L_rotateZ.o" "walk_cute:Elbow_L.rz";
connectAttr "walk_cute:Elbow_L.s" "walk_cute:Wrist_L.is";
connectAttr "walk_cute:Wrist_L_rotateX.o" "walk_cute:Wrist_L.rx";
connectAttr "walk_cute:Wrist_L_rotateY.o" "walk_cute:Wrist_L.ry";
connectAttr "walk_cute:Wrist_L_rotateZ.o" "walk_cute:Wrist_L.rz";
connectAttr "walk_cute:WristENd_L_rotateX.o" "walk_cute:WristENd_L.rx";
connectAttr "walk_cute:WristENd_L_rotateY.o" "walk_cute:WristENd_L.ry";
connectAttr "walk_cute:WristENd_L_rotateZ.o" "walk_cute:WristENd_L.rz";
connectAttr "walk_cute:Root_M.s" "walk_cute:Hip_R.is";
connectAttr "walk_cute:Hip_R_rotateX.o" "walk_cute:Hip_R.rx";
connectAttr "walk_cute:Hip_R_rotateY.o" "walk_cute:Hip_R.ry";
connectAttr "walk_cute:Hip_R_rotateZ.o" "walk_cute:Hip_R.rz";
connectAttr "walk_cute:Hip_R.s" "walk_cute:Knee_R.is";
connectAttr "walk_cute:Knee_R_rotateX.o" "walk_cute:Knee_R.rx";
connectAttr "walk_cute:Knee_R_rotateY.o" "walk_cute:Knee_R.ry";
connectAttr "walk_cute:Knee_R_rotateZ.o" "walk_cute:Knee_R.rz";
connectAttr "walk_cute:Knee_R.s" "walk_cute:Ankle_R.is";
connectAttr "walk_cute:Ankle_R_rotateX.o" "walk_cute:Ankle_R.rx";
connectAttr "walk_cute:Ankle_R_rotateY.o" "walk_cute:Ankle_R.ry";
connectAttr "walk_cute:Ankle_R_rotateZ.o" "walk_cute:Ankle_R.rz";
connectAttr "walk_cute:Ankle_R.s" "walk_cute:Toes_R.is";
connectAttr "walk_cute:Toes_R_rotateZ.o" "walk_cute:Toes_R.rz";
connectAttr "walk_cute:Toes_R.s" "walk_cute:MiddleToe2_R.is";
connectAttr "walk_cute:MiddleToe2_R_rotateX.o" "walk_cute:MiddleToe2_R.rx";
connectAttr "walk_cute:MiddleToe2_R_rotateY.o" "walk_cute:MiddleToe2_R.ry";
connectAttr "walk_cute:MiddleToe2_R_rotateZ.o" "walk_cute:MiddleToe2_R.rz";
connectAttr "walk_cute:Root_M.s" "walk_cute:Hip_L.is";
connectAttr "walk_cute:Hip_L_rotateX.o" "walk_cute:Hip_L.rx";
connectAttr "walk_cute:Hip_L_rotateY.o" "walk_cute:Hip_L.ry";
connectAttr "walk_cute:Hip_L_rotateZ.o" "walk_cute:Hip_L.rz";
connectAttr "walk_cute:Hip_L.s" "walk_cute:Knee_L.is";
connectAttr "walk_cute:Knee_L_rotateX.o" "walk_cute:Knee_L.rx";
connectAttr "walk_cute:Knee_L_rotateY.o" "walk_cute:Knee_L.ry";
connectAttr "walk_cute:Knee_L_rotateZ.o" "walk_cute:Knee_L.rz";
connectAttr "walk_cute:Knee_L.s" "walk_cute:Ankle_L.is";
connectAttr "walk_cute:Ankle_L_rotateX.o" "walk_cute:Ankle_L.rx";
connectAttr "walk_cute:Ankle_L_rotateY.o" "walk_cute:Ankle_L.ry";
connectAttr "walk_cute:Ankle_L_rotateZ.o" "walk_cute:Ankle_L.rz";
connectAttr "walk_cute:Ankle_L.s" "walk_cute:Toes_L.is";
connectAttr "walk_cute:Toes_L_rotateZ.o" "walk_cute:Toes_L.rz";
connectAttr "walk_cute:Toes_L.s" "walk_cute:MiddleToe2_L.is";
connectAttr "walk_cute:MiddleToe2_L_rotateX.o" "walk_cute:MiddleToe2_L.rx";
connectAttr "walk_cute:MiddleToe2_L_rotateY.o" "walk_cute:MiddleToe2_L.ry";
connectAttr "walk_cute:MiddleToe2_L_rotateZ.o" "walk_cute:MiddleToe2_L.rz";
connectAttr "walk_female:Root_M_translateX.o" "walk_female:Root_M.tx";
connectAttr "walk_female:Root_M_translateY.o" "walk_female:Root_M.ty";
connectAttr "walk_female:Root_M_translateZ.o" "walk_female:Root_M.tz";
connectAttr "walk_female:Root_M_rotateX.o" "walk_female:Root_M.rx";
connectAttr "walk_female:Root_M_rotateY.o" "walk_female:Root_M.ry";
connectAttr "walk_female:Root_M_rotateZ.o" "walk_female:Root_M.rz";
connectAttr "walk_female:Root_M.s" "walk_female:Spine1_M.is";
connectAttr "walk_female:Spine1_M_rotateX.o" "walk_female:Spine1_M.rx";
connectAttr "walk_female:Spine1_M_rotateY.o" "walk_female:Spine1_M.ry";
connectAttr "walk_female:Spine1_M_rotateZ.o" "walk_female:Spine1_M.rz";
connectAttr "walk_female:Spine1_M.s" "walk_female:Spine2_M.is";
connectAttr "walk_female:Spine2_M_rotateX.o" "walk_female:Spine2_M.rx";
connectAttr "walk_female:Spine2_M_rotateY.o" "walk_female:Spine2_M.ry";
connectAttr "walk_female:Spine2_M_rotateZ.o" "walk_female:Spine2_M.rz";
connectAttr "walk_female:Spine2_M.s" "walk_female:Chest_M.is";
connectAttr "walk_female:Chest_M_rotateX.o" "walk_female:Chest_M.rx";
connectAttr "walk_female:Chest_M_rotateY.o" "walk_female:Chest_M.ry";
connectAttr "walk_female:Chest_M_rotateZ.o" "walk_female:Chest_M.rz";
connectAttr "walk_female:Chest_M.s" "walk_female:Scapula_R.is";
connectAttr "walk_female:Scapula_R_rotateX.o" "walk_female:Scapula_R.rx";
connectAttr "walk_female:Scapula_R_rotateY.o" "walk_female:Scapula_R.ry";
connectAttr "walk_female:Scapula_R_rotateZ.o" "walk_female:Scapula_R.rz";
connectAttr "walk_female:Scapula_R.s" "walk_female:Shoulder_R.is";
connectAttr "walk_female:Shoulder_R_rotateX.o" "walk_female:Shoulder_R.rx";
connectAttr "walk_female:Shoulder_R_rotateY.o" "walk_female:Shoulder_R.ry";
connectAttr "walk_female:Shoulder_R_rotateZ.o" "walk_female:Shoulder_R.rz";
connectAttr "walk_female:Shoulder_R.s" "walk_female:Elbow_R.is";
connectAttr "walk_female:Elbow_R_rotateX.o" "walk_female:Elbow_R.rx";
connectAttr "walk_female:Elbow_R_rotateY.o" "walk_female:Elbow_R.ry";
connectAttr "walk_female:Elbow_R_rotateZ.o" "walk_female:Elbow_R.rz";
connectAttr "walk_female:Elbow_R.s" "walk_female:Wrist_R.is";
connectAttr "walk_female:Wrist_R_rotateX.o" "walk_female:Wrist_R.rx";
connectAttr "walk_female:Wrist_R_rotateY.o" "walk_female:Wrist_R.ry";
connectAttr "walk_female:Wrist_R_rotateZ.o" "walk_female:Wrist_R.rz";
connectAttr "walk_female:WristENd_R_rotateX.o" "walk_female:WristENd_R.rx";
connectAttr "walk_female:WristENd_R_rotateY.o" "walk_female:WristENd_R.ry";
connectAttr "walk_female:WristENd_R_rotateZ.o" "walk_female:WristENd_R.rz";
connectAttr "walk_female:Chest_M.s" "walk_female:Neck_M.is";
connectAttr "walk_female:Neck_M_rotateX.o" "walk_female:Neck_M.rx";
connectAttr "walk_female:Neck_M_rotateY.o" "walk_female:Neck_M.ry";
connectAttr "walk_female:Neck_M_rotateZ.o" "walk_female:Neck_M.rz";
connectAttr "walk_female:Neck_M.s" "walk_female:Head_M.is";
connectAttr "walk_female:Head_M_rotateX.o" "walk_female:Head_M.rx";
connectAttr "walk_female:Head_M_rotateY.o" "walk_female:Head_M.ry";
connectAttr "walk_female:Head_M_rotateZ.o" "walk_female:Head_M.rz";
connectAttr "walk_female:Hair_M_rotateX.o" "walk_female:Hair_M.rx";
connectAttr "walk_female:Hair_M_rotateY.o" "walk_female:Hair_M.ry";
connectAttr "walk_female:Hair_M_rotateZ.o" "walk_female:Hair_M.rz";
connectAttr "walk_female:Chest_M.s" "walk_female:Scapula_L.is";
connectAttr "walk_female:Scapula_L_rotateX.o" "walk_female:Scapula_L.rx";
connectAttr "walk_female:Scapula_L_rotateY.o" "walk_female:Scapula_L.ry";
connectAttr "walk_female:Scapula_L_rotateZ.o" "walk_female:Scapula_L.rz";
connectAttr "walk_female:Scapula_L.s" "walk_female:Shoulder_L.is";
connectAttr "walk_female:Shoulder_L_rotateX.o" "walk_female:Shoulder_L.rx";
connectAttr "walk_female:Shoulder_L_rotateY.o" "walk_female:Shoulder_L.ry";
connectAttr "walk_female:Shoulder_L_rotateZ.o" "walk_female:Shoulder_L.rz";
connectAttr "walk_female:Shoulder_L.s" "walk_female:Elbow_L.is";
connectAttr "walk_female:Elbow_L_rotateX.o" "walk_female:Elbow_L.rx";
connectAttr "walk_female:Elbow_L_rotateY.o" "walk_female:Elbow_L.ry";
connectAttr "walk_female:Elbow_L_rotateZ.o" "walk_female:Elbow_L.rz";
connectAttr "walk_female:Elbow_L.s" "walk_female:Wrist_L.is";
connectAttr "walk_female:Wrist_L_rotateX.o" "walk_female:Wrist_L.rx";
connectAttr "walk_female:Wrist_L_rotateY.o" "walk_female:Wrist_L.ry";
connectAttr "walk_female:Wrist_L_rotateZ.o" "walk_female:Wrist_L.rz";
connectAttr "walk_female:WristENd_L_rotateX.o" "walk_female:WristENd_L.rx";
connectAttr "walk_female:WristENd_L_rotateY.o" "walk_female:WristENd_L.ry";
connectAttr "walk_female:WristENd_L_rotateZ.o" "walk_female:WristENd_L.rz";
connectAttr "walk_female:Root_M.s" "walk_female:Hip_R.is";
connectAttr "walk_female:Hip_R_rotateX.o" "walk_female:Hip_R.rx";
connectAttr "walk_female:Hip_R_rotateY.o" "walk_female:Hip_R.ry";
connectAttr "walk_female:Hip_R_rotateZ.o" "walk_female:Hip_R.rz";
connectAttr "walk_female:Hip_R.s" "walk_female:Knee_R.is";
connectAttr "walk_female:Knee_R_rotateX.o" "walk_female:Knee_R.rx";
connectAttr "walk_female:Knee_R_rotateY.o" "walk_female:Knee_R.ry";
connectAttr "walk_female:Knee_R_rotateZ.o" "walk_female:Knee_R.rz";
connectAttr "walk_female:Knee_R.s" "walk_female:Ankle_R.is";
connectAttr "walk_female:Ankle_R_rotateX.o" "walk_female:Ankle_R.rx";
connectAttr "walk_female:Ankle_R_rotateY.o" "walk_female:Ankle_R.ry";
connectAttr "walk_female:Ankle_R_rotateZ.o" "walk_female:Ankle_R.rz";
connectAttr "walk_female:Ankle_R.s" "walk_female:Toes_R.is";
connectAttr "walk_female:Toes_R_rotateX.o" "walk_female:Toes_R.rx";
connectAttr "walk_female:Toes_R_rotateY.o" "walk_female:Toes_R.ry";
connectAttr "walk_female:Toes_R_rotateZ.o" "walk_female:Toes_R.rz";
connectAttr "walk_female:Toes_R.s" "walk_female:MiddleToe2_R.is";
connectAttr "walk_female:MiddleToe2_R_rotateX.o" "walk_female:MiddleToe2_R.rx";
connectAttr "walk_female:MiddleToe2_R_rotateY.o" "walk_female:MiddleToe2_R.ry";
connectAttr "walk_female:MiddleToe2_R_rotateZ.o" "walk_female:MiddleToe2_R.rz";
connectAttr "walk_female:Root_M.s" "walk_female:Hip_L.is";
connectAttr "walk_female:Hip_L_rotateX.o" "walk_female:Hip_L.rx";
connectAttr "walk_female:Hip_L_rotateY.o" "walk_female:Hip_L.ry";
connectAttr "walk_female:Hip_L_rotateZ.o" "walk_female:Hip_L.rz";
connectAttr "walk_female:Hip_L.s" "walk_female:Knee_L.is";
connectAttr "walk_female:Knee_L_rotateX.o" "walk_female:Knee_L.rx";
connectAttr "walk_female:Knee_L_rotateY.o" "walk_female:Knee_L.ry";
connectAttr "walk_female:Knee_L_rotateZ.o" "walk_female:Knee_L.rz";
connectAttr "walk_female:Knee_L.s" "walk_female:Ankle_L.is";
connectAttr "walk_female:Ankle_L_rotateX.o" "walk_female:Ankle_L.rx";
connectAttr "walk_female:Ankle_L_rotateY.o" "walk_female:Ankle_L.ry";
connectAttr "walk_female:Ankle_L_rotateZ.o" "walk_female:Ankle_L.rz";
connectAttr "walk_female:Ankle_L.s" "walk_female:Toes_L.is";
connectAttr "walk_female:Toes_L_rotateX.o" "walk_female:Toes_L.rx";
connectAttr "walk_female:Toes_L_rotateY.o" "walk_female:Toes_L.ry";
connectAttr "walk_female:Toes_L_rotateZ.o" "walk_female:Toes_L.rz";
connectAttr "walk_female:Toes_L.s" "walk_female:MiddleToe2_L.is";
connectAttr "walk_female:MiddleToe2_L_rotateX.o" "walk_female:MiddleToe2_L.rx";
connectAttr "walk_female:MiddleToe2_L_rotateY.o" "walk_female:MiddleToe2_L.ry";
connectAttr "walk_female:MiddleToe2_L_rotateZ.o" "walk_female:MiddleToe2_L.rz";
connectAttr "walk_macho:Root_M_translateX.o" "walk_macho:Root_M.tx";
connectAttr "walk_macho:Root_M_translateY.o" "walk_macho:Root_M.ty";
connectAttr "walk_macho:Root_M_translateZ.o" "walk_macho:Root_M.tz";
connectAttr "walk_macho:Root_M_rotateX.o" "walk_macho:Root_M.rx";
connectAttr "walk_macho:Root_M_rotateY.o" "walk_macho:Root_M.ry";
connectAttr "walk_macho:Root_M_rotateZ.o" "walk_macho:Root_M.rz";
connectAttr "walk_macho:Root_M.s" "walk_macho:Spine1_M.is";
connectAttr "walk_macho:Spine1_M_rotateX.o" "walk_macho:Spine1_M.rx";
connectAttr "walk_macho:Spine1_M_rotateY.o" "walk_macho:Spine1_M.ry";
connectAttr "walk_macho:Spine1_M_rotateZ.o" "walk_macho:Spine1_M.rz";
connectAttr "walk_macho:Spine1_M.s" "walk_macho:Spine2_M.is";
connectAttr "walk_macho:Spine2_M_rotateX.o" "walk_macho:Spine2_M.rx";
connectAttr "walk_macho:Spine2_M_rotateY.o" "walk_macho:Spine2_M.ry";
connectAttr "walk_macho:Spine2_M_rotateZ.o" "walk_macho:Spine2_M.rz";
connectAttr "walk_macho:Spine2_M.s" "walk_macho:Chest_M.is";
connectAttr "walk_macho:Chest_M_rotateX.o" "walk_macho:Chest_M.rx";
connectAttr "walk_macho:Chest_M_rotateY.o" "walk_macho:Chest_M.ry";
connectAttr "walk_macho:Chest_M_rotateZ.o" "walk_macho:Chest_M.rz";
connectAttr "walk_macho:Chest_M.s" "walk_macho:Scapula_R.is";
connectAttr "walk_macho:Scapula_R_rotateX.o" "walk_macho:Scapula_R.rx";
connectAttr "walk_macho:Scapula_R_rotateY.o" "walk_macho:Scapula_R.ry";
connectAttr "walk_macho:Scapula_R_rotateZ.o" "walk_macho:Scapula_R.rz";
connectAttr "walk_macho:Scapula_R.s" "walk_macho:Shoulder_R.is";
connectAttr "walk_macho:Shoulder_R_rotateX.o" "walk_macho:Shoulder_R.rx";
connectAttr "walk_macho:Shoulder_R_rotateY.o" "walk_macho:Shoulder_R.ry";
connectAttr "walk_macho:Shoulder_R_rotateZ.o" "walk_macho:Shoulder_R.rz";
connectAttr "walk_macho:Shoulder_R.s" "walk_macho:Elbow_R.is";
connectAttr "walk_macho:Elbow_R_rotateX.o" "walk_macho:Elbow_R.rx";
connectAttr "walk_macho:Elbow_R_rotateY.o" "walk_macho:Elbow_R.ry";
connectAttr "walk_macho:Elbow_R_rotateZ.o" "walk_macho:Elbow_R.rz";
connectAttr "walk_macho:Elbow_R.s" "walk_macho:Wrist_R.is";
connectAttr "walk_macho:Wrist_R_rotateX.o" "walk_macho:Wrist_R.rx";
connectAttr "walk_macho:Wrist_R_rotateY.o" "walk_macho:Wrist_R.ry";
connectAttr "walk_macho:Wrist_R_rotateZ.o" "walk_macho:Wrist_R.rz";
connectAttr "walk_macho:WristENd_R_rotateX.o" "walk_macho:WristENd_R.rx";
connectAttr "walk_macho:WristENd_R_rotateY.o" "walk_macho:WristENd_R.ry";
connectAttr "walk_macho:WristENd_R_rotateZ.o" "walk_macho:WristENd_R.rz";
connectAttr "walk_macho:Chest_M.s" "walk_macho:Neck_M.is";
connectAttr "walk_macho:Neck_M_rotateX.o" "walk_macho:Neck_M.rx";
connectAttr "walk_macho:Neck_M_rotateY.o" "walk_macho:Neck_M.ry";
connectAttr "walk_macho:Neck_M_rotateZ.o" "walk_macho:Neck_M.rz";
connectAttr "walk_macho:Neck_M.s" "walk_macho:Head_M.is";
connectAttr "walk_macho:Head_M_rotateX.o" "walk_macho:Head_M.rx";
connectAttr "walk_macho:Head_M_rotateY.o" "walk_macho:Head_M.ry";
connectAttr "walk_macho:Head_M_rotateZ.o" "walk_macho:Head_M.rz";
connectAttr "walk_macho:Hair_M_rotateX.o" "walk_macho:Hair_M.rx";
connectAttr "walk_macho:Hair_M_rotateY.o" "walk_macho:Hair_M.ry";
connectAttr "walk_macho:Hair_M_rotateZ.o" "walk_macho:Hair_M.rz";
connectAttr "walk_macho:Chest_M.s" "walk_macho:Scapula_L.is";
connectAttr "walk_macho:Scapula_L_rotateX.o" "walk_macho:Scapula_L.rx";
connectAttr "walk_macho:Scapula_L_rotateY.o" "walk_macho:Scapula_L.ry";
connectAttr "walk_macho:Scapula_L_rotateZ.o" "walk_macho:Scapula_L.rz";
connectAttr "walk_macho:Scapula_L.s" "walk_macho:Shoulder_L.is";
connectAttr "walk_macho:Shoulder_L_rotateX.o" "walk_macho:Shoulder_L.rx";
connectAttr "walk_macho:Shoulder_L_rotateY.o" "walk_macho:Shoulder_L.ry";
connectAttr "walk_macho:Shoulder_L_rotateZ.o" "walk_macho:Shoulder_L.rz";
connectAttr "walk_macho:Shoulder_L.s" "walk_macho:Elbow_L.is";
connectAttr "walk_macho:Elbow_L_rotateX.o" "walk_macho:Elbow_L.rx";
connectAttr "walk_macho:Elbow_L_rotateY.o" "walk_macho:Elbow_L.ry";
connectAttr "walk_macho:Elbow_L_rotateZ.o" "walk_macho:Elbow_L.rz";
connectAttr "walk_macho:Elbow_L.s" "walk_macho:Wrist_L.is";
connectAttr "walk_macho:Wrist_L_rotateX.o" "walk_macho:Wrist_L.rx";
connectAttr "walk_macho:Wrist_L_rotateY.o" "walk_macho:Wrist_L.ry";
connectAttr "walk_macho:Wrist_L_rotateZ.o" "walk_macho:Wrist_L.rz";
connectAttr "walk_macho:WristENd_L_rotateX.o" "walk_macho:WristENd_L.rx";
connectAttr "walk_macho:WristENd_L_rotateY.o" "walk_macho:WristENd_L.ry";
connectAttr "walk_macho:WristENd_L_rotateZ.o" "walk_macho:WristENd_L.rz";
connectAttr "walk_macho:Root_M.s" "walk_macho:Hip_R.is";
connectAttr "walk_macho:Hip_R_rotateX.o" "walk_macho:Hip_R.rx";
connectAttr "walk_macho:Hip_R_rotateY.o" "walk_macho:Hip_R.ry";
connectAttr "walk_macho:Hip_R_rotateZ.o" "walk_macho:Hip_R.rz";
connectAttr "walk_macho:Hip_R.s" "walk_macho:Knee_R.is";
connectAttr "walk_macho:Knee_R_rotateX.o" "walk_macho:Knee_R.rx";
connectAttr "walk_macho:Knee_R_rotateY.o" "walk_macho:Knee_R.ry";
connectAttr "walk_macho:Knee_R_rotateZ.o" "walk_macho:Knee_R.rz";
connectAttr "walk_macho:Knee_R.s" "walk_macho:Ankle_R.is";
connectAttr "walk_macho:Ankle_R_rotateX.o" "walk_macho:Ankle_R.rx";
connectAttr "walk_macho:Ankle_R_rotateY.o" "walk_macho:Ankle_R.ry";
connectAttr "walk_macho:Ankle_R_rotateZ.o" "walk_macho:Ankle_R.rz";
connectAttr "walk_macho:Ankle_R.s" "walk_macho:Toes_R.is";
connectAttr "walk_macho:Toes_R_rotateX.o" "walk_macho:Toes_R.rx";
connectAttr "walk_macho:Toes_R_rotateY.o" "walk_macho:Toes_R.ry";
connectAttr "walk_macho:Toes_R_rotateZ.o" "walk_macho:Toes_R.rz";
connectAttr "walk_macho:Toes_R.s" "walk_macho:MiddleToe2_R.is";
connectAttr "walk_macho:MiddleToe2_R_rotateX.o" "walk_macho:MiddleToe2_R.rx";
connectAttr "walk_macho:MiddleToe2_R_rotateY.o" "walk_macho:MiddleToe2_R.ry";
connectAttr "walk_macho:MiddleToe2_R_rotateZ.o" "walk_macho:MiddleToe2_R.rz";
connectAttr "walk_macho:Root_M.s" "walk_macho:Hip_L.is";
connectAttr "walk_macho:Hip_L_rotateX.o" "walk_macho:Hip_L.rx";
connectAttr "walk_macho:Hip_L_rotateY.o" "walk_macho:Hip_L.ry";
connectAttr "walk_macho:Hip_L_rotateZ.o" "walk_macho:Hip_L.rz";
connectAttr "walk_macho:Hip_L.s" "walk_macho:Knee_L.is";
connectAttr "walk_macho:Knee_L_rotateX.o" "walk_macho:Knee_L.rx";
connectAttr "walk_macho:Knee_L_rotateY.o" "walk_macho:Knee_L.ry";
connectAttr "walk_macho:Knee_L_rotateZ.o" "walk_macho:Knee_L.rz";
connectAttr "walk_macho:Knee_L.s" "walk_macho:Ankle_L.is";
connectAttr "walk_macho:Ankle_L_rotateX.o" "walk_macho:Ankle_L.rx";
connectAttr "walk_macho:Ankle_L_rotateY.o" "walk_macho:Ankle_L.ry";
connectAttr "walk_macho:Ankle_L_rotateZ.o" "walk_macho:Ankle_L.rz";
connectAttr "walk_macho:Ankle_L.s" "walk_macho:Toes_L.is";
connectAttr "walk_macho:Toes_L_rotateX.o" "walk_macho:Toes_L.rx";
connectAttr "walk_macho:Toes_L_rotateY.o" "walk_macho:Toes_L.ry";
connectAttr "walk_macho:Toes_L_rotateZ.o" "walk_macho:Toes_L.rz";
connectAttr "walk_macho:Toes_L.s" "walk_macho:MiddleToe2_L.is";
connectAttr "walk_macho:MiddleToe2_L_rotateX.o" "walk_macho:MiddleToe2_L.rx";
connectAttr "walk_macho:MiddleToe2_L_rotateY.o" "walk_macho:MiddleToe2_L.ry";
connectAttr "walk_macho:MiddleToe2_L_rotateZ.o" "walk_macho:MiddleToe2_L.rz";
connectAttr "walk_male:Root_M_translateX.o" "walk_male:Root_M.tx";
connectAttr "walk_male:Root_M_translateY.o" "walk_male:Root_M.ty";
connectAttr "walk_male:Root_M_translateZ.o" "walk_male:Root_M.tz";
connectAttr "walk_male:Root_M_rotateX.o" "walk_male:Root_M.rx";
connectAttr "walk_male:Root_M_rotateY.o" "walk_male:Root_M.ry";
connectAttr "walk_male:Root_M_rotateZ.o" "walk_male:Root_M.rz";
connectAttr "walk_male:Root_M.s" "walk_male:Spine1_M.is";
connectAttr "walk_male:Spine1_M_rotateX.o" "walk_male:Spine1_M.rx";
connectAttr "walk_male:Spine1_M_rotateY.o" "walk_male:Spine1_M.ry";
connectAttr "walk_male:Spine1_M_rotateZ.o" "walk_male:Spine1_M.rz";
connectAttr "walk_male:Spine1_M.s" "walk_male:Spine2_M.is";
connectAttr "walk_male:Spine2_M_rotateX.o" "walk_male:Spine2_M.rx";
connectAttr "walk_male:Spine2_M_rotateY.o" "walk_male:Spine2_M.ry";
connectAttr "walk_male:Spine2_M_rotateZ.o" "walk_male:Spine2_M.rz";
connectAttr "walk_male:Spine2_M.s" "walk_male:Chest_M.is";
connectAttr "walk_male:Chest_M_rotateX.o" "walk_male:Chest_M.rx";
connectAttr "walk_male:Chest_M_rotateY.o" "walk_male:Chest_M.ry";
connectAttr "walk_male:Chest_M_rotateZ.o" "walk_male:Chest_M.rz";
connectAttr "walk_male:Scapula_R_rotateX.o" "walk_male:Scapula_R.rx";
connectAttr "walk_male:Scapula_R_rotateY.o" "walk_male:Scapula_R.ry";
connectAttr "walk_male:Scapula_R_rotateZ.o" "walk_male:Scapula_R.rz";
connectAttr "walk_male:Chest_M.s" "walk_male:Scapula_R.is";
connectAttr "walk_male:Scapula_R.s" "walk_male:Shoulder_R.is";
connectAttr "walk_male:Shoulder_R_rotateX.o" "walk_male:Shoulder_R.rx";
connectAttr "walk_male:Shoulder_R_rotateY.o" "walk_male:Shoulder_R.ry";
connectAttr "walk_male:Shoulder_R_rotateZ.o" "walk_male:Shoulder_R.rz";
connectAttr "walk_male:Shoulder_R.s" "walk_male:Elbow_R.is";
connectAttr "walk_male:Elbow_R_rotateX.o" "walk_male:Elbow_R.rx";
connectAttr "walk_male:Elbow_R_rotateY.o" "walk_male:Elbow_R.ry";
connectAttr "walk_male:Elbow_R_rotateZ.o" "walk_male:Elbow_R.rz";
connectAttr "walk_male:Elbow_R.s" "walk_male:Wrist_R.is";
connectAttr "walk_male:Wrist_R_rotateX.o" "walk_male:Wrist_R.rx";
connectAttr "walk_male:Wrist_R_rotateY.o" "walk_male:Wrist_R.ry";
connectAttr "walk_male:Wrist_R_rotateZ.o" "walk_male:Wrist_R.rz";
connectAttr "walk_male:WristENd_R_rotateX.o" "walk_male:WristENd_R.rx";
connectAttr "walk_male:WristENd_R_rotateY.o" "walk_male:WristENd_R.ry";
connectAttr "walk_male:WristENd_R_rotateZ.o" "walk_male:WristENd_R.rz";
connectAttr "walk_male:Chest_M.s" "walk_male:Neck_M.is";
connectAttr "walk_male:Neck_M_rotateX.o" "walk_male:Neck_M.rx";
connectAttr "walk_male:Neck_M_rotateY.o" "walk_male:Neck_M.ry";
connectAttr "walk_male:Neck_M_rotateZ.o" "walk_male:Neck_M.rz";
connectAttr "walk_male:Neck_M.s" "walk_male:Head_M.is";
connectAttr "walk_male:Head_M_rotateX.o" "walk_male:Head_M.rx";
connectAttr "walk_male:Head_M_rotateY.o" "walk_male:Head_M.ry";
connectAttr "walk_male:Head_M_rotateZ.o" "walk_male:Head_M.rz";
connectAttr "walk_male:Hair_M_rotateX.o" "walk_male:Hair_M.rx";
connectAttr "walk_male:Hair_M_rotateY.o" "walk_male:Hair_M.ry";
connectAttr "walk_male:Hair_M_rotateZ.o" "walk_male:Hair_M.rz";
connectAttr "walk_male:Scapula_L_rotateX.o" "walk_male:Scapula_L.rx";
connectAttr "walk_male:Scapula_L_rotateY.o" "walk_male:Scapula_L.ry";
connectAttr "walk_male:Scapula_L_rotateZ.o" "walk_male:Scapula_L.rz";
connectAttr "walk_male:Chest_M.s" "walk_male:Scapula_L.is";
connectAttr "walk_male:Scapula_L.s" "walk_male:Shoulder_L.is";
connectAttr "walk_male:Shoulder_L_rotateX.o" "walk_male:Shoulder_L.rx";
connectAttr "walk_male:Shoulder_L_rotateY.o" "walk_male:Shoulder_L.ry";
connectAttr "walk_male:Shoulder_L_rotateZ.o" "walk_male:Shoulder_L.rz";
connectAttr "walk_male:Shoulder_L.s" "walk_male:Elbow_L.is";
connectAttr "walk_male:Elbow_L_rotateX.o" "walk_male:Elbow_L.rx";
connectAttr "walk_male:Elbow_L_rotateY.o" "walk_male:Elbow_L.ry";
connectAttr "walk_male:Elbow_L_rotateZ.o" "walk_male:Elbow_L.rz";
connectAttr "walk_male:Elbow_L.s" "walk_male:Wrist_L.is";
connectAttr "walk_male:Wrist_L_rotateX.o" "walk_male:Wrist_L.rx";
connectAttr "walk_male:Wrist_L_rotateY.o" "walk_male:Wrist_L.ry";
connectAttr "walk_male:Wrist_L_rotateZ.o" "walk_male:Wrist_L.rz";
connectAttr "walk_male:WristENd_L_rotateX.o" "walk_male:WristENd_L.rx";
connectAttr "walk_male:WristENd_L_rotateY.o" "walk_male:WristENd_L.ry";
connectAttr "walk_male:WristENd_L_rotateZ.o" "walk_male:WristENd_L.rz";
connectAttr "walk_male:Root_M.s" "walk_male:Hip_R.is";
connectAttr "walk_male:Hip_R_rotateX.o" "walk_male:Hip_R.rx";
connectAttr "walk_male:Hip_R_rotateY.o" "walk_male:Hip_R.ry";
connectAttr "walk_male:Hip_R_rotateZ.o" "walk_male:Hip_R.rz";
connectAttr "walk_male:Hip_R.s" "walk_male:Knee_R.is";
connectAttr "walk_male:Knee_R_rotateX.o" "walk_male:Knee_R.rx";
connectAttr "walk_male:Knee_R_rotateY.o" "walk_male:Knee_R.ry";
connectAttr "walk_male:Knee_R_rotateZ.o" "walk_male:Knee_R.rz";
connectAttr "walk_male:Knee_R.s" "walk_male:Ankle_R.is";
connectAttr "walk_male:Ankle_R_rotateX.o" "walk_male:Ankle_R.rx";
connectAttr "walk_male:Ankle_R_rotateY.o" "walk_male:Ankle_R.ry";
connectAttr "walk_male:Ankle_R_rotateZ.o" "walk_male:Ankle_R.rz";
connectAttr "walk_male:Ankle_R.s" "walk_male:Toes_R.is";
connectAttr "walk_male:Toes_R_rotateX.o" "walk_male:Toes_R.rx";
connectAttr "walk_male:Toes_R_rotateY.o" "walk_male:Toes_R.ry";
connectAttr "walk_male:Toes_R_rotateZ.o" "walk_male:Toes_R.rz";
connectAttr "walk_male:Toes_R.s" "walk_male:MiddleToe2_R.is";
connectAttr "walk_male:MiddleToe2_R_rotateX.o" "walk_male:MiddleToe2_R.rx";
connectAttr "walk_male:MiddleToe2_R_rotateY.o" "walk_male:MiddleToe2_R.ry";
connectAttr "walk_male:MiddleToe2_R_rotateZ.o" "walk_male:MiddleToe2_R.rz";
connectAttr "walk_male:Root_M.s" "walk_male:Hip_L.is";
connectAttr "walk_male:Hip_L_rotateX.o" "walk_male:Hip_L.rx";
connectAttr "walk_male:Hip_L_rotateY.o" "walk_male:Hip_L.ry";
connectAttr "walk_male:Hip_L_rotateZ.o" "walk_male:Hip_L.rz";
connectAttr "walk_male:Hip_L.s" "walk_male:Knee_L.is";
connectAttr "walk_male:Knee_L_rotateX.o" "walk_male:Knee_L.rx";
connectAttr "walk_male:Knee_L_rotateY.o" "walk_male:Knee_L.ry";
connectAttr "walk_male:Knee_L_rotateZ.o" "walk_male:Knee_L.rz";
connectAttr "walk_male:Knee_L.s" "walk_male:Ankle_L.is";
connectAttr "walk_male:Ankle_L_rotateX.o" "walk_male:Ankle_L.rx";
connectAttr "walk_male:Ankle_L_rotateY.o" "walk_male:Ankle_L.ry";
connectAttr "walk_male:Ankle_L_rotateZ.o" "walk_male:Ankle_L.rz";
connectAttr "walk_male:Ankle_L.s" "walk_male:Toes_L.is";
connectAttr "walk_male:Toes_L_rotateX.o" "walk_male:Toes_L.rx";
connectAttr "walk_male:Toes_L_rotateY.o" "walk_male:Toes_L.ry";
connectAttr "walk_male:Toes_L_rotateZ.o" "walk_male:Toes_L.rz";
connectAttr "walk_male:Toes_L.s" "walk_male:MiddleToe2_L.is";
connectAttr "walk_male:MiddleToe2_L_rotateX.o" "walk_male:MiddleToe2_L.rx";
connectAttr "walk_male:MiddleToe2_L_rotateY.o" "walk_male:MiddleToe2_L.ry";
connectAttr "walk_male:MiddleToe2_L_rotateZ.o" "walk_male:MiddleToe2_L.rz";
connectAttr "walk_proud:Root_M_translateX.o" "walk_proud:Root_M.tx";
connectAttr "walk_proud:Root_M_translateY.o" "walk_proud:Root_M.ty";
connectAttr "walk_proud:Root_M_translateZ.o" "walk_proud:Root_M.tz";
connectAttr "walk_proud:Root_M_rotateX.o" "walk_proud:Root_M.rx";
connectAttr "walk_proud:Root_M_rotateY.o" "walk_proud:Root_M.ry";
connectAttr "walk_proud:Root_M_rotateZ.o" "walk_proud:Root_M.rz";
connectAttr "walk_proud:Root_M.s" "walk_proud:Spine1_M.is";
connectAttr "walk_proud:Spine1_M_rotateX.o" "walk_proud:Spine1_M.rx";
connectAttr "walk_proud:Spine1_M_rotateY.o" "walk_proud:Spine1_M.ry";
connectAttr "walk_proud:Spine1_M_rotateZ.o" "walk_proud:Spine1_M.rz";
connectAttr "walk_proud:Spine1_M.s" "walk_proud:Spine2_M.is";
connectAttr "walk_proud:Spine2_M_rotateX.o" "walk_proud:Spine2_M.rx";
connectAttr "walk_proud:Spine2_M_rotateY.o" "walk_proud:Spine2_M.ry";
connectAttr "walk_proud:Spine2_M_rotateZ.o" "walk_proud:Spine2_M.rz";
connectAttr "walk_proud:Spine2_M.s" "walk_proud:Chest_M.is";
connectAttr "walk_proud:Chest_M_rotateX.o" "walk_proud:Chest_M.rx";
connectAttr "walk_proud:Chest_M_rotateY.o" "walk_proud:Chest_M.ry";
connectAttr "walk_proud:Chest_M_rotateZ.o" "walk_proud:Chest_M.rz";
connectAttr "walk_proud:Chest_M.s" "walk_proud:Scapula_R.is";
connectAttr "walk_proud:Scapula_R_rotateX.o" "walk_proud:Scapula_R.rx";
connectAttr "walk_proud:Scapula_R_rotateY.o" "walk_proud:Scapula_R.ry";
connectAttr "walk_proud:Scapula_R_rotateZ.o" "walk_proud:Scapula_R.rz";
connectAttr "walk_proud:Scapula_R.s" "walk_proud:Shoulder_R.is";
connectAttr "walk_proud:Shoulder_R_rotateX.o" "walk_proud:Shoulder_R.rx";
connectAttr "walk_proud:Shoulder_R_rotateY.o" "walk_proud:Shoulder_R.ry";
connectAttr "walk_proud:Shoulder_R_rotateZ.o" "walk_proud:Shoulder_R.rz";
connectAttr "walk_proud:Shoulder_R.s" "walk_proud:Elbow_R.is";
connectAttr "walk_proud:Elbow_R_rotateX.o" "walk_proud:Elbow_R.rx";
connectAttr "walk_proud:Elbow_R_rotateY.o" "walk_proud:Elbow_R.ry";
connectAttr "walk_proud:Elbow_R_rotateZ.o" "walk_proud:Elbow_R.rz";
connectAttr "walk_proud:Elbow_R.s" "walk_proud:Wrist_R.is";
connectAttr "walk_proud:Wrist_R_rotateX.o" "walk_proud:Wrist_R.rx";
connectAttr "walk_proud:Wrist_R_rotateY.o" "walk_proud:Wrist_R.ry";
connectAttr "walk_proud:Wrist_R_rotateZ.o" "walk_proud:Wrist_R.rz";
connectAttr "walk_proud:WristENd_R_rotateX.o" "walk_proud:WristENd_R.rx";
connectAttr "walk_proud:WristENd_R_rotateY.o" "walk_proud:WristENd_R.ry";
connectAttr "walk_proud:WristENd_R_rotateZ.o" "walk_proud:WristENd_R.rz";
connectAttr "walk_proud:Chest_M.s" "walk_proud:Neck_M.is";
connectAttr "walk_proud:Neck_M_rotateX.o" "walk_proud:Neck_M.rx";
connectAttr "walk_proud:Neck_M_rotateY.o" "walk_proud:Neck_M.ry";
connectAttr "walk_proud:Neck_M_rotateZ.o" "walk_proud:Neck_M.rz";
connectAttr "walk_proud:Neck_M.s" "walk_proud:Head_M.is";
connectAttr "walk_proud:Head_M_rotateX.o" "walk_proud:Head_M.rx";
connectAttr "walk_proud:Head_M_rotateY.o" "walk_proud:Head_M.ry";
connectAttr "walk_proud:Head_M_rotateZ.o" "walk_proud:Head_M.rz";
connectAttr "walk_proud:Hair_M_rotateX.o" "walk_proud:Hair_M.rx";
connectAttr "walk_proud:Hair_M_rotateY.o" "walk_proud:Hair_M.ry";
connectAttr "walk_proud:Hair_M_rotateZ.o" "walk_proud:Hair_M.rz";
connectAttr "walk_proud:Chest_M.s" "walk_proud:Scapula_L.is";
connectAttr "walk_proud:Scapula_L_rotateX.o" "walk_proud:Scapula_L.rx";
connectAttr "walk_proud:Scapula_L_rotateY.o" "walk_proud:Scapula_L.ry";
connectAttr "walk_proud:Scapula_L_rotateZ.o" "walk_proud:Scapula_L.rz";
connectAttr "walk_proud:Scapula_L.s" "walk_proud:Shoulder_L.is";
connectAttr "walk_proud:Shoulder_L_rotateX.o" "walk_proud:Shoulder_L.rx";
connectAttr "walk_proud:Shoulder_L_rotateY.o" "walk_proud:Shoulder_L.ry";
connectAttr "walk_proud:Shoulder_L_rotateZ.o" "walk_proud:Shoulder_L.rz";
connectAttr "walk_proud:Shoulder_L.s" "walk_proud:Elbow_L.is";
connectAttr "walk_proud:Elbow_L_rotateX.o" "walk_proud:Elbow_L.rx";
connectAttr "walk_proud:Elbow_L_rotateY.o" "walk_proud:Elbow_L.ry";
connectAttr "walk_proud:Elbow_L_rotateZ.o" "walk_proud:Elbow_L.rz";
connectAttr "walk_proud:Elbow_L.s" "walk_proud:Wrist_L.is";
connectAttr "walk_proud:Wrist_L_rotateX.o" "walk_proud:Wrist_L.rx";
connectAttr "walk_proud:Wrist_L_rotateY.o" "walk_proud:Wrist_L.ry";
connectAttr "walk_proud:Wrist_L_rotateZ.o" "walk_proud:Wrist_L.rz";
connectAttr "walk_proud:WristENd_L_rotateX.o" "walk_proud:WristENd_L.rx";
connectAttr "walk_proud:WristENd_L_rotateY.o" "walk_proud:WristENd_L.ry";
connectAttr "walk_proud:WristENd_L_rotateZ.o" "walk_proud:WristENd_L.rz";
connectAttr "walk_proud:Root_M.s" "walk_proud:Hip_R.is";
connectAttr "walk_proud:Hip_R_rotateX.o" "walk_proud:Hip_R.rx";
connectAttr "walk_proud:Hip_R_rotateY.o" "walk_proud:Hip_R.ry";
connectAttr "walk_proud:Hip_R_rotateZ.o" "walk_proud:Hip_R.rz";
connectAttr "walk_proud:Hip_R.s" "walk_proud:Knee_R.is";
connectAttr "walk_proud:Knee_R_rotateX.o" "walk_proud:Knee_R.rx";
connectAttr "walk_proud:Knee_R_rotateY.o" "walk_proud:Knee_R.ry";
connectAttr "walk_proud:Knee_R_rotateZ.o" "walk_proud:Knee_R.rz";
connectAttr "walk_proud:Knee_R.s" "walk_proud:Ankle_R.is";
connectAttr "walk_proud:Ankle_R_rotateX.o" "walk_proud:Ankle_R.rx";
connectAttr "walk_proud:Ankle_R_rotateY.o" "walk_proud:Ankle_R.ry";
connectAttr "walk_proud:Ankle_R_rotateZ.o" "walk_proud:Ankle_R.rz";
connectAttr "walk_proud:Ankle_R.s" "walk_proud:Toes_R.is";
connectAttr "walk_proud:Toes_R_rotateX.o" "walk_proud:Toes_R.rx";
connectAttr "walk_proud:Toes_R_rotateY.o" "walk_proud:Toes_R.ry";
connectAttr "walk_proud:Toes_R_rotateZ.o" "walk_proud:Toes_R.rz";
connectAttr "walk_proud:Toes_R.s" "walk_proud:MiddleToe2_R.is";
connectAttr "walk_proud:MiddleToe2_R_rotateX.o" "walk_proud:MiddleToe2_R.rx";
connectAttr "walk_proud:MiddleToe2_R_rotateY.o" "walk_proud:MiddleToe2_R.ry";
connectAttr "walk_proud:MiddleToe2_R_rotateZ.o" "walk_proud:MiddleToe2_R.rz";
connectAttr "walk_proud:Root_M.s" "walk_proud:Hip_L.is";
connectAttr "walk_proud:Hip_L_rotateX.o" "walk_proud:Hip_L.rx";
connectAttr "walk_proud:Hip_L_rotateY.o" "walk_proud:Hip_L.ry";
connectAttr "walk_proud:Hip_L_rotateZ.o" "walk_proud:Hip_L.rz";
connectAttr "walk_proud:Hip_L.s" "walk_proud:Knee_L.is";
connectAttr "walk_proud:Knee_L_rotateX.o" "walk_proud:Knee_L.rx";
connectAttr "walk_proud:Knee_L_rotateY.o" "walk_proud:Knee_L.ry";
connectAttr "walk_proud:Knee_L_rotateZ.o" "walk_proud:Knee_L.rz";
connectAttr "walk_proud:Knee_L.s" "walk_proud:Ankle_L.is";
connectAttr "walk_proud:Ankle_L_rotateX.o" "walk_proud:Ankle_L.rx";
connectAttr "walk_proud:Ankle_L_rotateY.o" "walk_proud:Ankle_L.ry";
connectAttr "walk_proud:Ankle_L_rotateZ.o" "walk_proud:Ankle_L.rz";
connectAttr "walk_proud:Ankle_L.s" "walk_proud:Toes_L.is";
connectAttr "walk_proud:Toes_L_rotateX.o" "walk_proud:Toes_L.rx";
connectAttr "walk_proud:Toes_L_rotateY.o" "walk_proud:Toes_L.ry";
connectAttr "walk_proud:Toes_L_rotateZ.o" "walk_proud:Toes_L.rz";
connectAttr "walk_proud:Toes_L.s" "walk_proud:MiddleToe2_L.is";
connectAttr "walk_proud:MiddleToe2_L_rotateX.o" "walk_proud:MiddleToe2_L.rx";
connectAttr "walk_proud:MiddleToe2_L_rotateY.o" "walk_proud:MiddleToe2_L.ry";
connectAttr "walk_proud:MiddleToe2_L_rotateZ.o" "walk_proud:MiddleToe2_L.rz";
connectAttr "walk_sad:Root_M_translateX.o" "walk_sad:Root_M.tx";
connectAttr "walk_sad:Root_M_translateY.o" "walk_sad:Root_M.ty";
connectAttr "walk_sad:Root_M_translateZ.o" "walk_sad:Root_M.tz";
connectAttr "walk_sad:Root_M_rotateX.o" "walk_sad:Root_M.rx";
connectAttr "walk_sad:Root_M_rotateY.o" "walk_sad:Root_M.ry";
connectAttr "walk_sad:Root_M_rotateZ.o" "walk_sad:Root_M.rz";
connectAttr "walk_sad:Root_M.s" "walk_sad:Spine1_M.is";
connectAttr "walk_sad:Spine1_M_rotateX.o" "walk_sad:Spine1_M.rx";
connectAttr "walk_sad:Spine1_M_rotateY.o" "walk_sad:Spine1_M.ry";
connectAttr "walk_sad:Spine1_M_rotateZ.o" "walk_sad:Spine1_M.rz";
connectAttr "walk_sad:Spine1_M.s" "walk_sad:Spine2_M.is";
connectAttr "walk_sad:Spine2_M_rotateX.o" "walk_sad:Spine2_M.rx";
connectAttr "walk_sad:Spine2_M_rotateY.o" "walk_sad:Spine2_M.ry";
connectAttr "walk_sad:Spine2_M_rotateZ.o" "walk_sad:Spine2_M.rz";
connectAttr "walk_sad:Spine2_M.s" "walk_sad:Chest_M.is";
connectAttr "walk_sad:Chest_M_rotateX.o" "walk_sad:Chest_M.rx";
connectAttr "walk_sad:Chest_M_rotateY.o" "walk_sad:Chest_M.ry";
connectAttr "walk_sad:Chest_M_rotateZ.o" "walk_sad:Chest_M.rz";
connectAttr "walk_sad:Chest_M.s" "walk_sad:Scapula_R.is";
connectAttr "walk_sad:Scapula_R_rotateX.o" "walk_sad:Scapula_R.rx";
connectAttr "walk_sad:Scapula_R_rotateY.o" "walk_sad:Scapula_R.ry";
connectAttr "walk_sad:Scapula_R_rotateZ.o" "walk_sad:Scapula_R.rz";
connectAttr "walk_sad:Scapula_R.s" "walk_sad:Shoulder_R.is";
connectAttr "walk_sad:Shoulder_R_rotateX.o" "walk_sad:Shoulder_R.rx";
connectAttr "walk_sad:Shoulder_R_rotateY.o" "walk_sad:Shoulder_R.ry";
connectAttr "walk_sad:Shoulder_R_rotateZ.o" "walk_sad:Shoulder_R.rz";
connectAttr "walk_sad:Shoulder_R.s" "walk_sad:Elbow_R.is";
connectAttr "walk_sad:Elbow_R_rotateX.o" "walk_sad:Elbow_R.rx";
connectAttr "walk_sad:Elbow_R_rotateY.o" "walk_sad:Elbow_R.ry";
connectAttr "walk_sad:Elbow_R_rotateZ.o" "walk_sad:Elbow_R.rz";
connectAttr "walk_sad:Elbow_R.s" "walk_sad:Wrist_R.is";
connectAttr "walk_sad:Wrist_R_rotateX.o" "walk_sad:Wrist_R.rx";
connectAttr "walk_sad:Wrist_R_rotateY.o" "walk_sad:Wrist_R.ry";
connectAttr "walk_sad:Wrist_R_rotateZ.o" "walk_sad:Wrist_R.rz";
connectAttr "walk_sad:WristENd_R_rotateX.o" "walk_sad:WristENd_R.rx";
connectAttr "walk_sad:WristENd_R_rotateY.o" "walk_sad:WristENd_R.ry";
connectAttr "walk_sad:WristENd_R_rotateZ.o" "walk_sad:WristENd_R.rz";
connectAttr "walk_sad:Chest_M.s" "walk_sad:Neck_M.is";
connectAttr "walk_sad:Neck_M_rotateX.o" "walk_sad:Neck_M.rx";
connectAttr "walk_sad:Neck_M_rotateY.o" "walk_sad:Neck_M.ry";
connectAttr "walk_sad:Neck_M_rotateZ.o" "walk_sad:Neck_M.rz";
connectAttr "walk_sad:Neck_M.s" "walk_sad:Head_M.is";
connectAttr "walk_sad:Head_M_rotateX.o" "walk_sad:Head_M.rx";
connectAttr "walk_sad:Head_M_rotateY.o" "walk_sad:Head_M.ry";
connectAttr "walk_sad:Head_M_rotateZ.o" "walk_sad:Head_M.rz";
connectAttr "walk_sad:Hair_M_rotateX.o" "walk_sad:Hair_M.rx";
connectAttr "walk_sad:Hair_M_rotateY.o" "walk_sad:Hair_M.ry";
connectAttr "walk_sad:Hair_M_rotateZ.o" "walk_sad:Hair_M.rz";
connectAttr "walk_sad:Chest_M.s" "walk_sad:Scapula_L.is";
connectAttr "walk_sad:Scapula_L_rotateX.o" "walk_sad:Scapula_L.rx";
connectAttr "walk_sad:Scapula_L_rotateY.o" "walk_sad:Scapula_L.ry";
connectAttr "walk_sad:Scapula_L_rotateZ.o" "walk_sad:Scapula_L.rz";
connectAttr "walk_sad:Scapula_L.s" "walk_sad:Shoulder_L.is";
connectAttr "walk_sad:Shoulder_L_rotateX.o" "walk_sad:Shoulder_L.rx";
connectAttr "walk_sad:Shoulder_L_rotateY.o" "walk_sad:Shoulder_L.ry";
connectAttr "walk_sad:Shoulder_L_rotateZ.o" "walk_sad:Shoulder_L.rz";
connectAttr "walk_sad:Shoulder_L.s" "walk_sad:Elbow_L.is";
connectAttr "walk_sad:Elbow_L_rotateX.o" "walk_sad:Elbow_L.rx";
connectAttr "walk_sad:Elbow_L_rotateY.o" "walk_sad:Elbow_L.ry";
connectAttr "walk_sad:Elbow_L_rotateZ.o" "walk_sad:Elbow_L.rz";
connectAttr "walk_sad:Elbow_L.s" "walk_sad:Wrist_L.is";
connectAttr "walk_sad:Wrist_L_rotateX.o" "walk_sad:Wrist_L.rx";
connectAttr "walk_sad:Wrist_L_rotateY.o" "walk_sad:Wrist_L.ry";
connectAttr "walk_sad:Wrist_L_rotateZ.o" "walk_sad:Wrist_L.rz";
connectAttr "walk_sad:WristENd_L_rotateX.o" "walk_sad:WristENd_L.rx";
connectAttr "walk_sad:WristENd_L_rotateY.o" "walk_sad:WristENd_L.ry";
connectAttr "walk_sad:WristENd_L_rotateZ.o" "walk_sad:WristENd_L.rz";
connectAttr "walk_sad:Root_M.s" "walk_sad:Hip_R.is";
connectAttr "walk_sad:Hip_R_rotateX.o" "walk_sad:Hip_R.rx";
connectAttr "walk_sad:Hip_R_rotateY.o" "walk_sad:Hip_R.ry";
connectAttr "walk_sad:Hip_R_rotateZ.o" "walk_sad:Hip_R.rz";
connectAttr "walk_sad:Hip_R.s" "walk_sad:Knee_R.is";
connectAttr "walk_sad:Knee_R_rotateX.o" "walk_sad:Knee_R.rx";
connectAttr "walk_sad:Knee_R_rotateY.o" "walk_sad:Knee_R.ry";
connectAttr "walk_sad:Knee_R_rotateZ.o" "walk_sad:Knee_R.rz";
connectAttr "walk_sad:Knee_R.s" "walk_sad:Ankle_R.is";
connectAttr "walk_sad:Ankle_R_rotateX.o" "walk_sad:Ankle_R.rx";
connectAttr "walk_sad:Ankle_R_rotateY.o" "walk_sad:Ankle_R.ry";
connectAttr "walk_sad:Ankle_R_rotateZ.o" "walk_sad:Ankle_R.rz";
connectAttr "walk_sad:Ankle_R.s" "walk_sad:Toes_R.is";
connectAttr "walk_sad:Toes_R_rotateX.o" "walk_sad:Toes_R.rx";
connectAttr "walk_sad:Toes_R_rotateY.o" "walk_sad:Toes_R.ry";
connectAttr "walk_sad:Toes_R_rotateZ.o" "walk_sad:Toes_R.rz";
connectAttr "walk_sad:Toes_R.s" "walk_sad:MiddleToe2_R.is";
connectAttr "walk_sad:MiddleToe2_R_rotateX.o" "walk_sad:MiddleToe2_R.rx";
connectAttr "walk_sad:MiddleToe2_R_rotateY.o" "walk_sad:MiddleToe2_R.ry";
connectAttr "walk_sad:MiddleToe2_R_rotateZ.o" "walk_sad:MiddleToe2_R.rz";
connectAttr "walk_sad:Root_M.s" "walk_sad:Hip_L.is";
connectAttr "walk_sad:Hip_L_rotateX.o" "walk_sad:Hip_L.rx";
connectAttr "walk_sad:Hip_L_rotateY.o" "walk_sad:Hip_L.ry";
connectAttr "walk_sad:Hip_L_rotateZ.o" "walk_sad:Hip_L.rz";
connectAttr "walk_sad:Hip_L.s" "walk_sad:Knee_L.is";
connectAttr "walk_sad:Knee_L_rotateX.o" "walk_sad:Knee_L.rx";
connectAttr "walk_sad:Knee_L_rotateY.o" "walk_sad:Knee_L.ry";
connectAttr "walk_sad:Knee_L_rotateZ.o" "walk_sad:Knee_L.rz";
connectAttr "walk_sad:Knee_L.s" "walk_sad:Ankle_L.is";
connectAttr "walk_sad:Ankle_L_rotateX.o" "walk_sad:Ankle_L.rx";
connectAttr "walk_sad:Ankle_L_rotateY.o" "walk_sad:Ankle_L.ry";
connectAttr "walk_sad:Ankle_L_rotateZ.o" "walk_sad:Ankle_L.rz";
connectAttr "walk_sad:Ankle_L.s" "walk_sad:Toes_L.is";
connectAttr "walk_sad:Toes_L_rotateX.o" "walk_sad:Toes_L.rx";
connectAttr "walk_sad:Toes_L_rotateY.o" "walk_sad:Toes_L.ry";
connectAttr "walk_sad:Toes_L_rotateZ.o" "walk_sad:Toes_L.rz";
connectAttr "walk_sad:Toes_L.s" "walk_sad:MiddleToe2_L.is";
connectAttr "walk_sad:MiddleToe2_L_rotateX.o" "walk_sad:MiddleToe2_L.rx";
connectAttr "walk_sad:MiddleToe2_L_rotateY.o" "walk_sad:MiddleToe2_L.ry";
connectAttr "walk_sad:MiddleToe2_L_rotateZ.o" "walk_sad:MiddleToe2_L.rz";
connectAttr "walk_sneak:Root_M_translateX.o" "walk_sneak:Root_M.tx";
connectAttr "walk_sneak:Root_M_translateY.o" "walk_sneak:Root_M.ty";
connectAttr "walk_sneak:Root_M_translateZ.o" "walk_sneak:Root_M.tz";
connectAttr "walk_sneak:Root_M_rotateX.o" "walk_sneak:Root_M.rx";
connectAttr "walk_sneak:Root_M_rotateY.o" "walk_sneak:Root_M.ry";
connectAttr "walk_sneak:Root_M_rotateZ.o" "walk_sneak:Root_M.rz";
connectAttr "walk_sneak:Root_M.s" "walk_sneak:Spine1_M.is";
connectAttr "walk_sneak:Spine1_M_rotateX.o" "walk_sneak:Spine1_M.rx";
connectAttr "walk_sneak:Spine1_M_rotateY.o" "walk_sneak:Spine1_M.ry";
connectAttr "walk_sneak:Spine1_M_rotateZ.o" "walk_sneak:Spine1_M.rz";
connectAttr "walk_sneak:Spine1_M.s" "walk_sneak:Spine2_M.is";
connectAttr "walk_sneak:Spine2_M_rotateX.o" "walk_sneak:Spine2_M.rx";
connectAttr "walk_sneak:Spine2_M_rotateY.o" "walk_sneak:Spine2_M.ry";
connectAttr "walk_sneak:Spine2_M_rotateZ.o" "walk_sneak:Spine2_M.rz";
connectAttr "walk_sneak:Spine2_M.s" "walk_sneak:Chest_M.is";
connectAttr "walk_sneak:Chest_M_rotateX.o" "walk_sneak:Chest_M.rx";
connectAttr "walk_sneak:Chest_M_rotateY.o" "walk_sneak:Chest_M.ry";
connectAttr "walk_sneak:Chest_M_rotateZ.o" "walk_sneak:Chest_M.rz";
connectAttr "walk_sneak:Chest_M.s" "walk_sneak:Scapula_R.is";
connectAttr "walk_sneak:Scapula_R_rotateX.o" "walk_sneak:Scapula_R.rx";
connectAttr "walk_sneak:Scapula_R_rotateY.o" "walk_sneak:Scapula_R.ry";
connectAttr "walk_sneak:Scapula_R_rotateZ.o" "walk_sneak:Scapula_R.rz";
connectAttr "walk_sneak:Scapula_R.s" "walk_sneak:Shoulder_R.is";
connectAttr "walk_sneak:Shoulder_R_rotateX.o" "walk_sneak:Shoulder_R.rx";
connectAttr "walk_sneak:Shoulder_R_rotateY.o" "walk_sneak:Shoulder_R.ry";
connectAttr "walk_sneak:Shoulder_R_rotateZ.o" "walk_sneak:Shoulder_R.rz";
connectAttr "walk_sneak:Shoulder_R.s" "walk_sneak:Elbow_R.is";
connectAttr "walk_sneak:Elbow_R_rotateX.o" "walk_sneak:Elbow_R.rx";
connectAttr "walk_sneak:Elbow_R_rotateY.o" "walk_sneak:Elbow_R.ry";
connectAttr "walk_sneak:Elbow_R_rotateZ.o" "walk_sneak:Elbow_R.rz";
connectAttr "walk_sneak:Elbow_R.s" "walk_sneak:Wrist_R.is";
connectAttr "walk_sneak:Wrist_R_rotateX.o" "walk_sneak:Wrist_R.rx";
connectAttr "walk_sneak:Wrist_R_rotateY.o" "walk_sneak:Wrist_R.ry";
connectAttr "walk_sneak:Wrist_R_rotateZ.o" "walk_sneak:Wrist_R.rz";
connectAttr "walk_sneak:WristENd_R_rotateX.o" "walk_sneak:WristENd_R.rx";
connectAttr "walk_sneak:WristENd_R_rotateY.o" "walk_sneak:WristENd_R.ry";
connectAttr "walk_sneak:WristENd_R_rotateZ.o" "walk_sneak:WristENd_R.rz";
connectAttr "walk_sneak:Chest_M.s" "walk_sneak:Neck_M.is";
connectAttr "walk_sneak:Neck_M_rotateX.o" "walk_sneak:Neck_M.rx";
connectAttr "walk_sneak:Neck_M_rotateY.o" "walk_sneak:Neck_M.ry";
connectAttr "walk_sneak:Neck_M_rotateZ.o" "walk_sneak:Neck_M.rz";
connectAttr "walk_sneak:Neck_M.s" "walk_sneak:Head_M.is";
connectAttr "walk_sneak:Head_M_rotateX.o" "walk_sneak:Head_M.rx";
connectAttr "walk_sneak:Head_M_rotateY.o" "walk_sneak:Head_M.ry";
connectAttr "walk_sneak:Head_M_rotateZ.o" "walk_sneak:Head_M.rz";
connectAttr "walk_sneak:Hair_M_rotateX.o" "walk_sneak:Hair_M.rx";
connectAttr "walk_sneak:Hair_M_rotateY.o" "walk_sneak:Hair_M.ry";
connectAttr "walk_sneak:Hair_M_rotateZ.o" "walk_sneak:Hair_M.rz";
connectAttr "walk_sneak:Chest_M.s" "walk_sneak:Scapula_L.is";
connectAttr "walk_sneak:Scapula_L_rotateX.o" "walk_sneak:Scapula_L.rx";
connectAttr "walk_sneak:Scapula_L_rotateY.o" "walk_sneak:Scapula_L.ry";
connectAttr "walk_sneak:Scapula_L_rotateZ.o" "walk_sneak:Scapula_L.rz";
connectAttr "walk_sneak:Scapula_L.s" "walk_sneak:Shoulder_L.is";
connectAttr "walk_sneak:Shoulder_L_rotateX.o" "walk_sneak:Shoulder_L.rx";
connectAttr "walk_sneak:Shoulder_L_rotateY.o" "walk_sneak:Shoulder_L.ry";
connectAttr "walk_sneak:Shoulder_L_rotateZ.o" "walk_sneak:Shoulder_L.rz";
connectAttr "walk_sneak:Shoulder_L.s" "walk_sneak:Elbow_L.is";
connectAttr "walk_sneak:Elbow_L_rotateX.o" "walk_sneak:Elbow_L.rx";
connectAttr "walk_sneak:Elbow_L_rotateY.o" "walk_sneak:Elbow_L.ry";
connectAttr "walk_sneak:Elbow_L_rotateZ.o" "walk_sneak:Elbow_L.rz";
connectAttr "walk_sneak:Elbow_L.s" "walk_sneak:Wrist_L.is";
connectAttr "walk_sneak:Wrist_L_rotateX.o" "walk_sneak:Wrist_L.rx";
connectAttr "walk_sneak:Wrist_L_rotateY.o" "walk_sneak:Wrist_L.ry";
connectAttr "walk_sneak:Wrist_L_rotateZ.o" "walk_sneak:Wrist_L.rz";
connectAttr "walk_sneak:WristENd_L_rotateX.o" "walk_sneak:WristENd_L.rx";
connectAttr "walk_sneak:WristENd_L_rotateY.o" "walk_sneak:WristENd_L.ry";
connectAttr "walk_sneak:WristENd_L_rotateZ.o" "walk_sneak:WristENd_L.rz";
connectAttr "walk_sneak:Root_M.s" "walk_sneak:Hip_R.is";
connectAttr "walk_sneak:Hip_R_rotateX.o" "walk_sneak:Hip_R.rx";
connectAttr "walk_sneak:Hip_R_rotateY.o" "walk_sneak:Hip_R.ry";
connectAttr "walk_sneak:Hip_R_rotateZ.o" "walk_sneak:Hip_R.rz";
connectAttr "walk_sneak:Hip_R.s" "walk_sneak:Knee_R.is";
connectAttr "walk_sneak:Knee_R_rotateX.o" "walk_sneak:Knee_R.rx";
connectAttr "walk_sneak:Knee_R_rotateY.o" "walk_sneak:Knee_R.ry";
connectAttr "walk_sneak:Knee_R_rotateZ.o" "walk_sneak:Knee_R.rz";
connectAttr "walk_sneak:Knee_R.s" "walk_sneak:Ankle_R.is";
connectAttr "walk_sneak:Ankle_R_rotateX.o" "walk_sneak:Ankle_R.rx";
connectAttr "walk_sneak:Ankle_R_rotateY.o" "walk_sneak:Ankle_R.ry";
connectAttr "walk_sneak:Ankle_R_rotateZ.o" "walk_sneak:Ankle_R.rz";
connectAttr "walk_sneak:Ankle_R.s" "walk_sneak:Toes_R.is";
connectAttr "walk_sneak:Toes_R_rotateX.o" "walk_sneak:Toes_R.rx";
connectAttr "walk_sneak:Toes_R_rotateY.o" "walk_sneak:Toes_R.ry";
connectAttr "walk_sneak:Toes_R_rotateZ.o" "walk_sneak:Toes_R.rz";
connectAttr "walk_sneak:Toes_R.s" "walk_sneak:MiddleToe2_R.is";
connectAttr "walk_sneak:MiddleToe2_R_rotateX.o" "walk_sneak:MiddleToe2_R.rx";
connectAttr "walk_sneak:MiddleToe2_R_rotateY.o" "walk_sneak:MiddleToe2_R.ry";
connectAttr "walk_sneak:MiddleToe2_R_rotateZ.o" "walk_sneak:MiddleToe2_R.rz";
connectAttr "walk_sneak:Root_M.s" "walk_sneak:Hip_L.is";
connectAttr "walk_sneak:Hip_L_rotateX.o" "walk_sneak:Hip_L.rx";
connectAttr "walk_sneak:Hip_L_rotateY.o" "walk_sneak:Hip_L.ry";
connectAttr "walk_sneak:Hip_L_rotateZ.o" "walk_sneak:Hip_L.rz";
connectAttr "walk_sneak:Hip_L.s" "walk_sneak:Knee_L.is";
connectAttr "walk_sneak:Knee_L_rotateX.o" "walk_sneak:Knee_L.rx";
connectAttr "walk_sneak:Knee_L_rotateY.o" "walk_sneak:Knee_L.ry";
connectAttr "walk_sneak:Knee_L_rotateZ.o" "walk_sneak:Knee_L.rz";
connectAttr "walk_sneak:Knee_L.s" "walk_sneak:Ankle_L.is";
connectAttr "walk_sneak:Ankle_L_rotateX.o" "walk_sneak:Ankle_L.rx";
connectAttr "walk_sneak:Ankle_L_rotateY.o" "walk_sneak:Ankle_L.ry";
connectAttr "walk_sneak:Ankle_L_rotateZ.o" "walk_sneak:Ankle_L.rz";
connectAttr "walk_sneak:Ankle_L.s" "walk_sneak:Toes_L.is";
connectAttr "walk_sneak:Toes_L_rotateX.o" "walk_sneak:Toes_L.rx";
connectAttr "walk_sneak:Toes_L_rotateY.o" "walk_sneak:Toes_L.ry";
connectAttr "walk_sneak:Toes_L_rotateZ.o" "walk_sneak:Toes_L.rz";
connectAttr "walk_sneak:Toes_L.s" "walk_sneak:MiddleToe2_L.is";
connectAttr "walk_sneak:MiddleToe2_L_rotateX.o" "walk_sneak:MiddleToe2_L.rx";
connectAttr "walk_sneak:MiddleToe2_L_rotateY.o" "walk_sneak:MiddleToe2_L.ry";
connectAttr "walk_sneak:MiddleToe2_L_rotateZ.o" "walk_sneak:MiddleToe2_L.rz";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of asMotion.ma
