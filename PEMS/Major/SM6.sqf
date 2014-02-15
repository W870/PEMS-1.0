/*Original script by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
Modified by Firefly 12/2013 for DayZ Epoch (1.0.3) Panthera
A large mission spread across 4 unique locations. */

private ["_coords","_MainMarker","_wait"];
[] execVM "\z\addons\dayz_server\PEMS\SMGoMajor.sqf";
WaitUntil {MissionGo == 1};

_coords = [2103.7893, 8548.0068];

/*
AI 3rd Base
_ai1 = [2171.6072, 7704.2642, 3.2424927e-005]; 		//GATE GUARD
_ai2 = [2157.9653, 7722.9956, 1.1444092e-005];		//LOOT GUARD GARAGES
_ai3 = [2152.5378, 7667.4805, 3.0517578e-005]; 		//LOOT GUARD ARTY DITCH
_ai4 = [2130.9995, 7698.46, 3.8146973e-006];		//BUNKER GUARD
_ai5 = [2148.9648, 7700.7739, 2.4795532e-005];		//MIDDLE OF COMPOUND

AI HILL BASE
_ai6 = [2103.7893, 8548.0068, 1.5258789e-005];			
_ai7 = [2121.4724, 8535.6807, 1.5258789e-005];			
_ai8 = [2126.3911, 8553.0332, 1.5258789e-005];			
_ai9 = [2118.6045, 8563.2139, 1.5258789e-005];			
_ai10 = [2118.1274, 8545.7305, 1.5258789e-005];			

RESTAURANT 
_ai11 = [2256.7878, 8534.2344, 1.5258789e-005];		//INSIDE WALL	
_ai12 = [2252.4773, 8521.5225];						//ROAD GUARD
_ai13 = [2267.1226, 8576.3242, 4.5776367e-005];		//ROAD GUARD NORTH	
_ai14 = [2297.0139, 8553.3818, 7.6293945e-006];		//UMBREALL GUARD
_ai15 = [2280.9648, 8522.0732, 4.5776367e-005];		//BACK GUARD
_ai16 = [2267.9988, 8553.0928, -0.021439943];		//INSIDE_
_ai17 = [2270.7991, 8564.8232, -7.6293945e-006];	//WELL GUARD
_ai18 = [2272.0181, 8535.6982, 7.6293945e-006];		//LOOT GUARD

HILL BUNKERS AI
_ai19 = [2150.2896, 8168.0215, 0];					//HILL BUNKERS

HILL ROCK BUNKER
_ai20 = [2022.8547, 8168.6138, -0.0001373291];		//SNIPER

2ND HILL BASE

_ai21 = [2068.522, 8124.4424];						//GARAGES 
_ai22 = [2062.3606, 8083.3584, 7.6293945e-006];		//SHED
_ai23 = [2083.1826, 8079.0991, 1.5258789e-005];		//GUARD HOUSE
_ai24 = [2105.843, 8096.0005, 2.2888184e-005];		//TEMT GUARD
_ai25 = [2125.8594, 8120.7637, 0];					//TREE GUARD
_ai26 = [2120.8799, 8143.4272, 0];					//HOUSE
_ai27 = [2064.6453, 8103.0166, 0];					//BTR

MISC GUARDS
_ai28 = [2189.2537, 7883.335, 2.6702881e-005];		//FLATS
_ai29 = [2334.1128, 8275.5371, 1.5258789e-005];		//LOWER GUARD HOUSE
_ai30 = [2263.9048, 8685.2256, -0.00011444092];		//NORTH HILL
*/

[nil,nil,rTitleText,"Bandits have set up a series of bases!", "PLAIN",10] call RE;


Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

//DECO
//LOWER COASTAL BASE

_military1 = createVehicle ["MAP_Ind_IlluminantTower",[2132.7659, 7665.8208, -1.9073486e-006],[], 0, "CAN_COLLIDE"];
_military1 setDir 0.86582083;
_military1 setVariable ["DZAI",1,true];

_military2 = createVehicle ["MAP_fortified_nest_big", [2132.2607, 7693.3667],[], 0, "CAN_COLLIDE"];
_military2 setDir 92.262329;
_military2 setVariable ["DZAI",1,true];

_military3 = createVehicle ["MAP_dragonTeeth", [2177.0361, 7713.3784, 1.9073486e-006],[], 0, "CAN_COLLIDE"];
_military3 setDir -86.365875;
_military3 setVariable ["DZAI",1,true];

_military4 = createVehicle ["MAP_fort_artillery_nest", [2149.0798, 7673.6001, 3.8146973e-006],[], 0, "CAN_COLLIDE"];
_military4 setDir -1.1490371;
_military4 setVariable ["DZAI",1,true];

_military5 = createVehicle ["Land_fort_bagfence_round", [2171.1296, 7707.585, 2.2888184e-005],[], 0, "CAN_COLLIDE"];
_military5 setDir -6.4251885;
_military5 setVariable ["DZAI",1,true];

//2ND HILL BASE

_military6 = createVehicle ["Land_CamoNetB_NATO", [2058.7932, 8102.0562, -0.45653409],[], 0, "NONE"];
_military6 setDir 264.6936;
_military6 setVariable ["DZAI",1,true];

_military7 = createVehicle ["MAP_Stan_east", [2101.3884, 8085.8755, 7.6293945e-006],[], 0, "CAN_COLLIDE"];
_military7 setDir 88.690773;
_military7 setVariable ["DZAI",1,true];

_military8 = createVehicle ["MAP_Stan_east", [2100.624, 8104.5786],[], 0, "CAN_COLLIDE"];
_military8 setDir 88.690773;
_military8 setVariable ["DZAI",1,true];

_military9 = createVehicle ["MAP_Stan_east", [2115.8225, 8095.21],[], 0, "CAN_COLLIDE"];
_military9 setDir 177.97409;
_military9 setVariable ["DZAI",1,true];

_military10 = createVehicle ["MAP_MASH", [2100.905, 8124.5776, 7.6293945e-006],[], 0, "CAN_COLLIDE"];
_military10 setDir -178.2529;
_military10 setVariable ["DZAI",1,true];

//HILL BUNKERS

_military11 = createVehicle ["MAP_fortified_nest_small", [2156.6956, 8161.853, 7.6293945e-006],[], 0, "CAN_COLLIDE"];
_military11 setDir -75.20771;
_military11 setVariable ["DZAI",1,true];

_military12 = createVehicle ["MAP_fortified_nest_small", [2146.0911, 8176.9751],[], 0, "CAN_COLLIDE"];
_military12 setDir -165.98665;
_military12 setVariable ["DZAI",1,true];

_fort1 = createVehicle ["Land_CamoNetVar_NATO", [2156.9121, 8162.2241, 0.46187657],[], 0, "CAN_COLLIDE"];
_fort1 setDir -77.188896;
_fort1 setVariable ["DZAI",1,true];

_fort2 = createVehicle ["Land_CamoNetVar_NATO", [2146.3953, 8176.832, 7.6293945e-006],[], 0, "CAN_COLLIDE"];
_fort2 setDir -167.61006;
_fort2 setVariable ["DZAI",1,true];

_fort3 = createVehicle ["Land_fort_bagfence_round", [2156.0188, 8173.8345],[], 0, "CAN_COLLIDE"];
_fort3 setDir 52.271503;
_fort3 setVariable ["DZAI",1,true];

//HILLTOP BASE

_fort4 = createVehicle ["Land_fort_bagfence_round", [2121.991, 8533.3262],[], 0, "CAN_COLLIDE"];
_fort4 setDir 166.44693;
_fort4 setVariable ["DZAI",1,true];

_fort5 = createVehicle ["Land_fort_bagfence_round", [2119.8052, 8564.0605],[], 0, "CAN_COLLIDE"];
_fort5 setDir 291.23248;
_fort5 setVariable ["DZAI",1,true];

_fort6 = createVehicle ["Land_fort_bagfence_round", [2119.8052, 8564.0605],[], 0, "CAN_COLLIDE"];
_fort6 setDir 8.4883871;
_fort6 setVariable ["DZAI",1,true];

_fort7 = createVehicle ["Land_fort_bagfence_round", [2129.1477, 8552.6426, -4.5776367e-005],[], 0, "CAN_COLLIDE"];
_fort7 setDir 80.253853;
_fort7 setVariable ["DZAI",1,true];

_fort8 = createVehicle ["Land_CamoNet_EAST", [2120.0176, 8546.2334, 1.5258789e-005],[], 0, "CAN_COLLIDE"];
_fort8 setDir 1.1598988;
_fort8 setVariable ["DZAI",1,true];

//AI RESTAURANT

_fort9 = createVehicle ["Land_CamoNet_EAST", [2272.9756, 8532.4619],[], 0, "CAN_COLLIDE"];
_fort9 setDir 102.70497;
_fort9 setVariable ["DZAI",1,true];

_fort10 = createVehicle ["Land_fort_bagfence_round", [2250.1094, 8522.959, -2.2888184e-005],[], 0, "CAN_COLLIDE"];
_fort10 setDir -77.230507;
_fort10 setVariable ["DZAI",1,true];

_fort11 = createVehicle ["Land_fort_bagfence_round", [2265.7942, 8578.6914, -2.2888184e-005],[], 0, "CAN_COLLIDE"];
_fort11 setDir -13.195669;
_fort11 setVariable ["DZAI",1,true];

_fort12 = createVehicle ["Hedgehog_EP1", [2259.5615, 8578.6748, 4.5776367e-005],[], 0, "CAN_COLLIDE"];
_fort12 setDir -282.88672;
_fort12 setVariable ["DZAI",1,true];

_fort13 = createVehicle ["Hedgehog_EP1", [2256.5146, 8576.5635, 2.2888184e-005],[], 0, "CAN_COLLIDE"];
_fort13 setDir -340.06714;
_fort13 setVariable ["DZAI",1,true];

_fort14 = createVehicle ["Hedgehog_EP1", [2254.7676, 8581.7295, 3.8146973e-005],[], 0, "CAN_COLLIDE"];
_fort14 setDir -160.23929;
_fort14 setVariable ["DZAI",1,true];

_fort15 = createVehicle ["Hedgehog_EP1", [2253.5876, 8577.2197, 7.6293945e-006],[], 0, "CAN_COLLIDE"];
_fort15 setDir -159.78691;
_fort15 setVariable ["DZAI",1,true];

_fort16 = createVehicle ["Hedgehog_EP1", [2248.1772, 8533.2871, 3.0517578e-005],[], 0, "CAN_COLLIDE"];
_fort16 setDir -160.23929;
_fort16 setVariable ["DZAI",1,true];

_fort17 = createVehicle ["Hedgehog_EP1", [2245.1304, 8531.1758, 0.032180786],[], 0, "CAN_COLLIDE"];
_fort17 setDir -139.29158;
_fort17 setVariable ["DZAI",1,true];

_fort18 = createVehicle ["Hedgehog_EP1", [2243.3833, 8536.3418, -0.30593109],[], 0, "CAN_COLLIDE"];
_fort18 setDir -69.956856;
_fort18 setVariable ["DZAI",1,true];

_fort20 = createVehicle ["Hedgehog_EP1", [2242.2034, 8531.832, 0.017616272],[], 0, "CAN_COLLIDE"];
_fort20 setDir -249.17328;
_fort20 setVariable ["DZAI",1,true];

//VEHICLE SPAWN

_BTR = ["BTR90_HQ","BMP2_HQ_CDF","BRDM2_HQ_TK_GUE_EP1","LAV25_HQ"] call BIS_fnc_selectRandom;

_hueychop = createVehicle [_BTR,[2058.5671, 8101.6333, 7.6293945e-006],[], 0, "NONE"];
_hueychop setDir 67.672638;
_hueychop setFuel 1.0;
_hueychop setVehicleAmmo 0.5;
_hueychop setVariable ["DZAI",1,true];

//LOOT!
//LOWER COASTAL BASE
_crate = createVehicle ["USVehicleBox",[2147.8457, 7722.6401, 1.9073486e-006],[], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\PEMS\misc\fillBoxesA.sqf";
_crate setVariable ["permaLoot",true];

_crate2 = createVehicle ["USLaunchersBox",[2148.7839, 7667.2456, 1.1444092e-005],[], 0, "CAN_COLLIDE"];
[_crate2] execVM "\z\addons\dayz_server\PEMS\misc\fillBoxes.sqf";
_crate2 setVariable ["permaLoot",true];

//2ND HILL BASE
_crate6 = createVehicle ["USVehicleBox",[2081.7271, 8124.8193],[], 0, "CAN_COLLIDE"];
[_crate6] execVM "\z\addons\dayz_server\PEMS\misc\fillBoxesM.sqf";
_crate6 setVariable ["permaLoot",true];

//HILL BASE
_crate8 = createVehicle ["USVehicleBox",[2116.0066, 8546.7793, 3.0517578e-005],[], 0, "CAN_COLLIDE"];
[_crate8] execVM "\z\addons\dayz_server\PEMS\misc\fillBoxesH.sqf";
_crate8 setVariable ["permaLoot",true];

_crate3 = createVehicle ["USLaunchersBox",[2121.7942, 8546.4736, 1.5258789e-005],[], 0, "CAN_COLLIDE"];
[_crate3] execVM "\z\addons\dayz_server\PEMS\misc\fillBoxesH2.sqf";
_crate3 setVariable ["permaLoot",true];

//RESTAURANT
_crate8 = createVehicle ["USVehicleBox",[2271.637, 8530.1504, 7.6293945e-006],[], 0, "CAN_COLLIDE"];
[_crate8] execVM "\z\addons\dayz_server\PEMS\misc\fillBoxesA3.sqf";
_crate8 setVariable ["permaLoot",true];

_crate3 = createVehicle ["USLaunchersBox",[2267.3748, 8553.6836, 3.3985929],[], 0, "CAN_COLLIDE"];
[_crate3] execVM "\z\addons\dayz_server\PEMS\misc\fillBoxesS.sqf";
_crate3 setVariable ["permaLoot",true];

// CREATE AI GUARDS

//GATE GUARD
_spawnPos = [2171.6072, 7704.2642, 3.2424927e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [3,grpNull,_spawnPos,objNull,3] call DZAI_setup_AI;

//LOOT GUARD GARAGES
_spawnPos = [2157.9653, 7722.9956, 1.1444092e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//LOOT GUARD ARTY DITCH
_spawnPos = [2152.5378, 7667.4805, 3.0517578e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//BUNKER GUARD
_spawnPos = [2130.9995, 7698.46, 3.8146973e-006];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [3,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//MIDDLE OF COMPOUND
_spawnPos = [2148.9648, 7700.7739, 2.4795532e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,3] call DZAI_setup_AI;

//HILL BASE
_spawnPos = [2103.7893, 8548.0068, 1.5258789e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [2,grpNull,_spawnPos,objNull,3] call DZAI_setup_AI;

_spawnPos = [2121.4724, 8535.6807, 1.5258789e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [2,grpNull,_spawnPos,objNull,3] call DZAI_setup_AI;

_spawnPos = [2126.3911, 8553.0332, 1.5258789e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [2,grpNull,_spawnPos,objNull,3] call DZAI_setup_AI;

_spawnPos = [2118.6045, 8563.2139, 1.5258789e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [2,grpNull,_spawnPos,objNull,3] call DZAI_setup_AI;

_spawnPos = [2118.1274, 8545.7305, 1.5258789e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [2,grpNull,_spawnPos,objNull,3] call DZAI_setup_AI;

//INSIDE WALL
_spawnPos = [2256.7878, 8534.2344, 1.5258789e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [3,grpNull,_spawnPos,objNull,3] call DZAI_setup_AI;

//ROAD GUARD
_spawnPos = [2252.4773, 8521.5225];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//ROAD GUARD NORTH	
_spawnPos = [2267.1226, 8576.3242, 4.5776367e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//UMBRELLA GUARD
_spawnPos = [2297.0139, 8553.3818, 7.6293945e-006];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [3,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//BACK GUARD
_spawnPos = [2280.9648, 8522.0732, 4.5776367e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,3] call DZAI_setup_AI;

//INSIDE
_spawnPos = [2267.9988, 8553.0928, -0.021439943];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [3,grpNull,_spawnPos,objNull,3] call DZAI_setup_AI;

//WELL GUARD
_spawnPos = [2270.7991, 8564.8232, -7.6293945e-006];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//LOOT GUARD
_spawnPos = [2272.0181, 8535.6982, 7.6293945e-006];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//HILL BUNKERS
_spawnPos = [2150.2896, 8168.0215, 0];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//SNIPER
_spawnPos = [2022.8547, 8168.6138, -0.0001373291];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [2,grpNull,_spawnPos,objNull,3] call DZAI_setup_AI;

//GARAGES 
_spawnPos = [2068.522, 8124.4424];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [3,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//SHED
_spawnPos = [2062.3606, 8083.3584, 7.6293945e-006];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,3] call DZAI_setup_AI;

//GUARD HOUSE
_spawnPos = [2083.1826, 8079.0991, 1.5258789e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [3,grpNull,_spawnPos,objNull,3] call DZAI_setup_AI;

//TEMT GUARD
_spawnPos = [2105.843, 8096.0005, 2.2888184e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//TREE GUARD
_spawnPos = [2125.8594, 8120.7637, 0];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//HOUSE
_spawnPos = [2120.8799, 8143.4272, 0];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [3,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//BTR
_spawnPos = [2064.6453, 8103.0166, 0];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,3] call DZAI_setup_AI;

//FLATS
_spawnPos = [2189.2537, 7883.335, 2.6702881e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//LOWER GUARD HOUSE
_spawnPos = [2334.1128, 8275.5371, 1.5258789e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [3,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//NORTH HILL
_spawnPos = [2263.9048, 8685.2256, -0.00011444092];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [2,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

waitUntil{{isPlayer _x && _x distance _military7 < 10  } count playableunits > 0}; 

[nil,nil,rTitleText,"The location is under survivor control!", "PLAIN",6] call RE;


[] execVM "debug\remmarkers.sqf";
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";



SM1 = 5;
[0] execVM "\z\addons\dayz_server\PEMS\major\SMfinder.sqf";
