/*Original script by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
Modified by Firefly 12/2013 for DayZ Epoch (1.0.3) Panthera
Spawns a static location mission at the island. Within a walled barracks area beside the main airfield.
AI loot the barracks onto a V3S with two UAZ cars providing road blocks at entrances. On hill above some
bandits have setup an overwatch position. */

private ["_coords","_MainMarker","_wait"];
[] execVM "\z\addons\dayz_server\PEMS\SMGoMajor.sqf";
WaitUntil {MissionGo == 1};

_coords = [381.89511, 9291.3984, 1.8119812e-005];
/*
_ai1 = [383.65732, 9287.0586, 8.5830688e-006]; 		//CRATE GUARDS
_ai2 = [407.59082, 9310.6914, 2.3841858e-005];		//ENTRANCE GUARD ROAD
_ai3 = [366.44226, 9290.6748, 2.0980835e-005]; 		//ENTRANCE GUARD BACK
_ai4 = [407.62503, 9270.4639, 6.6757202e-006];		//BARRACKS GUARD 1
_ai5 = [367.14099, 9321.1484, 2.8610229e-006];		//BARRACKS GUARD 2
_ai6 = [443.32272, 9177.5898, 3.0517578e-005];		//OVERWATCH TEAM
*/
[nil,nil,rTitleText,"Bandits have looted an military barracks and are preparing to leave, intercept them! Check your map for the location.", "PLAIN",10] call RE;

Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

//DECO


_fort1 = createVehicle ["Misc_Backpackheap_EP1",[381.89511, 9291.3984, 1.8119812e-005],[], 0,"CAN_COLLIDE"];
_fort1 setDir -51.477959;
_fort1 setVariable ["DZAI",1,true];

_fort2 = createVehicle ["Misc_Cargo1Bo_military",[392.96213, 9288.0381, 1.8119812e-005],[], 0,"CAN_COLLIDE"];
_fort2 setDir 79.57061;
_fort2 setVariable ["DZAI",1,true];

_fort3 = createVehicle ["Land_Misc_Cargo1Eo_EP1",[379.78729, 9285.4678, 9.5367432e-007],[], 0,"CAN_COLLIDE"];
_fort3 setDir 2.4831147;
_fort3 setVariable ["DZAI",1,true];

_fort4 = createVehicle ["Misc_cargo_cont_small_EP1", [390.10889, 9291.3613, 6.6757202e-006],[], 0,"CAN_COLLIDE"];
_fort4 setDir -13.847312;
_fort4 setVariable ["DZAI",1,true];

_fort5 = createVehicle ["AmmoCrates_NoInteractive_Large", [385.88522, 9298.8242, 2.8610229e-006],[], 0,"CAN_COLLIDE"];
_fort5 setDir -22.831429;
_fort5 setVariable ["DZAI",1,true];

_fort6 = createVehicle ["AmmoCrates_NoInteractive_Medium", [386.02859, 9301.293, 8.5830688e-006],[], 0,"CAN_COLLIDE"];
_fort6 setDir -69.043999;
_fort6 setVariable ["DZAI",1,true];

_fort7 = createVehicle ["Misc_Cargo1B_military", [386.04865, 9307.0449, 4.863739e-005],[], 0,"CAN_COLLIDE"];
_fort7 setDir 134.98442;
_fort7 setVariable ["DZAI",1,true];

_fort8 = createVehicle ["Misc_Cargo1B_military", [379.92249, 9304.3447, 1.9073486e-006],[], 0,"CAN_COLLIDE"];
_fort8 setDir 48.14053;
_fort8 setVariable ["DZAI",1,true];

_fort9 = createVehicle ["Misc_cargo_cont_small_EP1", [395.47202, 9285.1777, -8.5830688e-006],[], 0,"CAN_COLLIDE"];
_fort9 setDir -13.847312;
_fort9 setVariable ["DZAI",1,true];

_fort10 = createVehicle ["Land_Misc_Cargo1E_EP1", [384.01639, 9283.3828, -1.2397766e-005],[], 0,"CAN_COLLIDE"];
_fort10 setDir 92.561378;
_fort10 setVariable ["DZAI",1,true];

_fort11 = createVehicle ["Land_CamoNetB_EAST_EP1", [443.05771, 9177.5918, 0.65096152],[], 0,"CAN_COLLIDE"];
_fort11 setDir -72.477341;
_fort11 setVariable ["DZAI",1,true];

_fort12 = createVehicle ["Land_fort_bagfence_round", [444.24579, 9185.7246, -0.11671016],[], 0,"CAN_COLLIDE"];
_fort12 setDir 2.7537673;
_fort12 setVariable ["DZAI",1,true];

_fort13 = createVehicle ["Land_fort_bagfence_round", [448.85916, 9177.4189, -0.16288093],[], 0,"CAN_COLLIDE"];
_fort13 setDir 106.1691;
_fort13 setVariable ["DZAI",1,true];

_fort14 = createVehicle ["Land_fort_bagfence_round", [443.08731, 9172.625, -0.10719827],[], 0,"CAN_COLLIDE"];
_fort14 setDir 172.86388;
_fort14 setVariable ["DZAI",1,true];

//VEHICLE SPAWN

_uazciv = createVehicle ["UAZ_Unarmed_TK_CIV_EP1", [364.4418, 9289.9736, -9.5367432e-007],[], 0, "CAN_COLLIDE"];
_uazciv setDir -6.8972182;
_uazciv setVariable ["DZAI",1,true];

_uazins = createVehicle ["UAZ_INS", [409.37631, 9309.2031, 4.7683716e-006],[], 0, "CAN_COLLIDE"];
_uazins setDir 45.981609;
_uazins setVariable ["DZAI",1,true];

_v3s = createVehicle ["V3S_Open_TK_EP1", [387.29315, 9294.9551, -2.7656555e-005],[], 0, "CAN_COLLIDE"];
_v3s setDir 56.963707;
_v3s setVariable ["DZAI",1,true];

//LOOT!

_crate1 = createVehicle ["USVehicleBox",[378.90469, 9295.873, 2.0027161e-005],[], 0, "CAN_COLLIDE"];
[_crate1] execVM "\z\addons\dayz_server\PEMS\misc\fillBoxes.sqf";
_crate1 setVariable ["permaLoot",true];

_crate3 = createVehicle ["USLaunchersBox",[440.12045, 9174.7998, 1.9073486e-005],[], 0, "CAN_COLLIDE"];
[_crate3] execVM "\z\addons\dayz_server\PEMS\misc\fillBoxesH.sqf";
_crate3 setVariable ["permaLoot",true];

_crate2 = createVehicle ["USLaunchersBox",[387.38937, 9299.3838, 2.8610229e-006],[], 0, "CAN_COLLIDE"];
[_crate2] execVM "\z\addons\dayz_server\PEMS\misc\fillBoxesS.sqf";
_crate2 setVariable ["permaLoot",true];

// CREATE AI GUARDS

//CRATE GUARDS
_spawnPos = [383.65732, 9287.0586, 8.5830688e-006];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//ENTRANCE GUARD ROAD
_spawnPos = [407.59082, 9310.6914, 2.3841858e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//ENTRANCE GUARD BACK
_spawnPos = [366.44226, 9290.6748, 2.0980835e-005]; 
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [3,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//BARRACKS GUARD 1
_spawnPos = [407.62503, 9270.4639, 6.6757202e-006];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [1,grpNull,_spawnPos,objNull,3] call DZAI_setup_AI;

//BARRACKS GUARD 2
_spawnPos = [367.14099, 9321.1484, 2.8610229e-006];	
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [1,grpNull,_spawnPos,objNull,3] call DZAI_setup_AI;

//OVERWATCH TEAM
_spawnPos = [443.32272, 9177.5898, 3.0517578e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,3] call DZAI_setup_AI;


//MISSION COMPLETION

waitUntil{{isPlayer _x && _x distance _fort1 < 5  } count playableunits > 0}; 

[nil,nil,rTitleText,"The supplies have been secured by survivors! Good job!", "PLAIN",6] call RE;


[] execVM "debug\remmarkers.sqf";
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";


SM1 = 5;
[0] execVM "\z\addons\dayz_server\PEMS\major\SMfinder.sqf";
