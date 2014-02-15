//FRIGATE by FIREFLY (Full credit for code to TheSzerdi & TAW_Tonic)

private ["_coords","_wait","_MainMarker75"];
[] execVM "\z\addons\dayz_server\PEMS\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};


_coords =  [7147.9351, 7307.5215, 4.7683716e-007];

/*
_ai1 = [7030.5625, 7142.8672, -3.8146973e-006]; 		//COMPOUND GUARD
_ai2 = [7045.8213, 7125.9917, -2.0980835e-005];		//COMPOUND GUARD
_ai3 = [7052.457, 7156.373, 9.5367432e-007]; 	//COMPOUND GUARD
_ai4 = [7060.1802, 7197.8438, -5.7220459e-006]; 	//COMPOUND GUARD
_ai5 = [7136.2241, 7313.0684, 1.0490417e-005];		//SHORE GUARD
_ai6 = [7137.8574, 7285.7354, 0.00020503998]; 	//SHORE GUARD
_ai7 = [6957.4058, 7086.8091, 8.7738037e-005]; 	//HILL GUARD
*/


[nil,nil,rTitleText,"A miliary ship has drifted to the coast and been looted by bandits! Check your map for the location!", "PLAIN",10] call RE;

MCoords = _coords;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

//DECO

_frigate = createVehicle ["Land_Fregata", [7443.4468, 7592.1548, 28.154], [], 0, "CAN_COLLIDE"];
_frigate setDir -203.20985;
_frigate setVariable ["DZAI",1,true];

_camonet = createVehicle ["Land_CamoNet_EAST", [7146.6523, 7304.5117, 6.4373016e-005], [], 0, "CAN_COLLIDE"];
_camonet setDir -77.552422;
_camonet setVariable ["DZAI",1,true];

_frigate = createVehicle ["ACamp_EP1", [7147.9351, 7307.5215, 4.7683716e-007], [], 0, "CAN_COLLIDE"];
_frigate setDir 62.876652;
_frigate setVariable ["DZAI",1,true];

//VEHICLE SPAWN

_ground = ["BTR40_TK_GUE_EP1","BTR40_TK_INS_EP1","GAZ_Vodnik_MedEvac","HMMWV_Ambulance","HMMWV_DZ","BAF_Offroad_W","SUV_Camo"] call BIS_fnc_selectRandom;
_hummer= createVehicle [_ground,[7140.5845, 7315.481, -0.00015687943],[], 0,"CAN_COLLIDE"];
_hummer setDir 175.3925;
_hummer setVariable ["DZAI",1,true];

_ground2 = ["MTVR","Ural_CDF","V3S_RA_TK_GUE_EP1_DZE","V3S_TK_EP1_DZE"] call BIS_fnc_selectRandom;
_cargo= createVehicle [_ground2,[7039.6196, 7144.6577],[], 0,"CAN_COLLIDE"];
_cargo setDir -93.204666;
_cargo setVariable ["DZAI",1,true];

_water = ["RHIB2Turret","Fishing_Boat","RHIB"] call BIS_fnc_selectRandom;
_boat= createVehicle [_water,[7182.0083, 7337.1431, -0.1880998],[], 0,"CAN_COLLIDE"];
_boat setDir 144.49783;
_boat setVariable ["DZAI",1,true];

//LOOT
_crate = createVehicle ["USVehicleBox", [7034.0342, 7126.625, 0.36181843], [], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\PEMS\misc\fillBoxesM.sqf";
_crate setVariable ["permaLoot",true];

_crate4 = createVehicle ["USVehicleBox", [7129.72, 7343.59, 0.001], [], 0, "CAN_COLLIDE"];
[_crate4] execVM "\z\addons\dayz_server\PEMS\misc\fillBoxes2.sqf";
_crate4 setVariable ["permaLoot",true];

//AI
_spawnPos = [7030.5625, 7142.8672, -3.8146973e-006];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [3,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

sleep 5;

_spawnPos = [7045.8213, 7125.9917, -2.0980835e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [2,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

sleep 5;

_spawnPos = [7052.457, 7156.373, 9.5367432e-007];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [3,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

sleep 5;

_spawnPos = [7060.1802, 7197.8438, -5.7220459e-006];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [2,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

sleep 5;

_spawnPos = [7136.2241, 7313.0684, 1.0490417e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

sleep 5;

_spawnPos = [7137.8574, 7285.7354, 0.00020503998];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

sleep 5;

_spawnPos = [6957.4058, 7086.8091, 8.7738037e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [2,grpNull,_spawnPos,objNull,3] call DZAI_setup_AI;



waitUntil{{isPlayer _x && _x distance _hummer < 10  } count playableunits > 0}; 

[nil,nil,rTitleText,"The Frigate is under survivor control!", "PLAIN",6] call RE;

[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";



SM1 = 1;
[0] execVM "\z\addons\dayz_server\PEMS\minor\SMfinder.sqf";
