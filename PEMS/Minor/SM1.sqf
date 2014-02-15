//Bandit Convoy by Firefly(Full credit to TheSzerdi & TAW_Tonic lazyink  for the code)
private ["_coords","_wait","_MainMarker75"];

[] execVM "\z\addons\dayz_server\PEMS\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};


_coords = [5924.8403, 853.97931, 1.9073486e-006];

/*
_ai1 = [5927.2554, 865.17249, 1.9073486e-006];		//LEFT SIDE HOUSES
_ai2 = [5918.4365, 857.328, 5.7220459e-006];		//CONVOY
_ai3 = [5883.4624, 862.27155, 5.7220459e-006];		//REAR INDY
*/

[nil,nil,rTitleText,"A Bandit Convoy has been found! Check your map for the location!", "PLAIN",10] call RE;

MCoords = _coords;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

//VEHICLE SPAWN

_ground = ["HMMWV_M998_crows_MK19_DES_EP1","HMMWV_MK19_DES_EP1","HMMWV_M998_crows_M2_DES_EP1"] call BIS_fnc_selectRandom;

_ground = createVehicle [_ground,[5939.5664, 854.08813, -3.8146973e-006],[], 0,"CAN_COLLIDE"];
_ground setDir 89.484955;
_ground setVariable ["DZAI",1,true];
_ground setFuel 0.5;
_ground setVehicleAmmo 0.5;

//LOOT

_mtvr = createVehicle ["MtvrReammo_DES_EP1",[5924.8403, 853.97931, 1.9073486e-006],[], 0,"CAN_COLLIDE"];
_mtvr setDir 91.425674;
_mtvr setVariable ["DZAI",1,true];
_mtvr setFuel 0.1;
[_mtvr] execVM "\z\addons\dayz_server\PEMS\misc\fillBoxes.sqf";

_med = createVehicle ["HMMWV_Ambulance_CZ_DES_EP1", [5912.646, 853.97498, 1.9073486e-006], [], 0, "CAN_COLLIDE"];
_med setDir 108.6869;
_med setVariable ["DZAI",1,true];
_med setFuel 0.2;
[_med] execVM "\z\addons\dayz_server\PEMS\misc\fillBoxesM2.sqf";


// create Guards
_spawnPos = [5927.2554, 865.17249, 1.9073486e-006];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

sleep 5;

_spawnPos = [5918.4365, 857.328, 5.7220459e-006];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

sleep 5;

_spawnPos = [5883.4624, 862.27155, 5.7220459e-006];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

waitUntil{{isPlayer _x && _x distance _mtvr  < 10  } count playableunits > 0}; 

[nil,nil,rTitleText,"The bandits are dead!", "PLAIN",6] call RE;

[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\PEMS\minor\SMfinder.sqf";