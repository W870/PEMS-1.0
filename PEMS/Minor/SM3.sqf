//Bandit Stash House by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
private ["_coords","_wait","_MainMarker75"];
[] execVM "\z\addons\dayz_server\PEMS\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};
publicVariable "MissionGoMinor";

_coords =  [3568.0464, 7761.6484, 1.7166138e-005];

/*
_ai1 = [3572.5322, 7733.3452, -3.0517578e-005]; 		//GATE GUARD
_ai2 = [3603.4114, 7735.3989, 1.1444092e-005];		//SUPPLY GUARD
_ai3 = [3596.4678, 7793.229, 5.7220459e-006]; 	//GATE GUARD
_ai4 = [3578.1348, 7780.6548, 1.9073486e-006]; 		//BARN GUARD
_ai5 = [3549.0376, 7786.4912, 1.1444092e-005];		//ORCHARD GUARD
_ai6 = [3561.5164, 7753.3994, -5.7220459e-006]; 	//HOUSE GUARD
*/


[nil,nil,rTitleText,"A group of bandits have set up a stash house! Check your map for the location!", "PLAIN",10] call RE;

MCoords = _coords;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

//VEHICLE SPAWN

_ground = ["BTR40_TK_GUE_EP1","BTR40_TK_INS_EP1","GAZ_Vodnik_MedEvac","HMMWV_Ambulance","HMMWV_DZ","BAF_Offroad_W","SUV_Camo"] call BIS_fnc_selectRandom;
_hummer= createVehicle [_ground,[3568.0464, 7761.6484, 1.7166138e-005],[], 0,"CAN_COLLIDE"];
_hummer setDir 144.49783;
_hummer setVariable ["DZAI",1,true];

_ground1 = ["V3S_Refuel_TK_GUE_EP1_DZ","UralRefuel_TK_EP1_DZ","MtvrRefuel_DZ","KamazRefuel_DZ"] call BIS_fnc_selectRandom;
_fuel= createVehicle [_ground1,[3587.3381, 7736.9766],[], 0,"CAN_COLLIDE"];
_fuel setDir 0.25972438;
_fuel setVariable ["DZAI",1,true];

_ground2 = ["MTVR","Ural_CDF","V3S_RA_TK_GUE_EP1_DZE","V3S_TK_EP1_DZE"] call BIS_fnc_selectRandom;
_cargo= createVehicle [_ground2,[3600.864, 7763.2876, 9.5367432e-006],[], 0,"CAN_COLLIDE"];
_cargo setDir -93.204666;
_cargo setVariable ["DZAI",1,true];

//LOOT

_crate1 = createVehicle ["USVehicleBox", [3587.739, 7782.7979, 3.8146973e-005], [], 0, "CAN_COLLIDE"];
[_crate1] execVM "\z\addons\dayz_server\PEMS\misc\fillBoxesA.sqf";
_crate1 setVariable ["permaLoot",true];

_crate = createVehicle ["USBasicAmmunitionBox_EP1", [3564.832, 7748.1387, 0.25459799], [], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\PEMS\misc\fillBoxes.sqf";
_crate setVariable ["permaLoot",true];

_crate2 = createVehicle ["USVehicleBox_EP1", [3601.1106, 7732.5762, -3.8146973e-006], [], 0, "CAN_COLLIDE"];
[_crate2] execVM "\z\addons\dayz_server\PEMS\misc\fillBoxesS.sqf";
_crate2 setVariable ["permaLoot",true];

// AI

_spawnPos = [3572.5322, 7733.3452, -3.0517578e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

sleep 5;

_spawnPos = [3603.4114, 7735.3989, 1.1444092e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [3,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

sleep 5;

_spawnPos = [3596.4678, 7793.229, 5.7220459e-006];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

sleep 5;

_spawnPos = [3578.1348, 7780.6548, 1.9073486e-006];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [2,grpNull,_spawnPos,objNull,3] call DZAI_setup_AI;

sleep 5;

_spawnPos = [3549.0376, 7786.4912, 1.1444092e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [3,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

sleep 5;

_spawnPos = [3561.5164, 7753.3994, -5.7220459e-006];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [2,grpNull,_spawnPos,objNull,3] call DZAI_setup_AI;


waitUntil{{isPlayer _x && _x distance _crate1 < 10  } count playableunits > 0}; 

[nil,nil,rTitleText,"The stash house is under survivor control!", "PLAIN",6] call RE;

[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
publicVariable "MissionGoMinor";
MCoords = 0;
publicVariable "MCoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\PEMS\minor\SMfinder.sqf";
