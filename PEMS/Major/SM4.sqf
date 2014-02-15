/*Original script by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
Modified by Firefly 12/2013 for DayZ Epoch (1.0.3) Panthera
Spawns a static location mission at the military base across the river from the grove.
AI are split into 3 locations with sandbags on North and South Sides. */
//TODO: Add second mission SM4A with a different chopper location.

private ["_coords","_MainMarker","_chopper","_wait"];
[] execVM "\z\addons\dayz_server\PEMS\SMGoMajor.sqf";
WaitUntil {MissionGo == 1};

[nil,nil,rTitleText,"A bandit helicopter has ran out of fuel and has been forced to land. Check your map for the location!", "PLAIN",10] call RE;

_coords = [5013.9219, 2026.1768, -3.5762787e-005];

/*
_ai1 = [5022.7197, 2009.627, 6.2465668e-005];
_ai2 = [5014.9395, 2051.0894, -6.6757202e-006];
_ai3 = [5037.564, 2021.0361, 0.60676354];
*/

Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

//DECO

_sandbag1 = createVehicle ["Land_fort_bagfence_round",[5023.1938, 2008.7352, -1.3828278e-005],[], 0,"CAN_COLLIDE"];
_sandbag1 setDir -175.41273;
_sandbag1 setVariable ["DZAI",1,true];

_sandbag2 = createVehicle ["Land_fort_bagfence_round",[5014.8701, 2054.8262, -9.059906e-006],[], 0,"CAN_COLLIDE"];
_sandbag2 setDir -21.668095;
_sandbag2 setVariable ["DZAI",1,true];

//VEHICLE SPAWN

_chopper = ["UH1H_DZE","CH_47F_EP1_DZE","Mi17_DZE","UH60M_EP1_DZE","pook_H13_gunship","pook_H13_transport"] call BIS_fnc_selectRandom;

_hueychop = createVehicle [_chopper,[5013.9219, 2026.1768, -3.5762787e-005],[], 0,"CAN_COLLIDE"];
_hueychop setDir 1.5160338;
_hueychop setVariable ["DZAI",1,true];
_hueychop setFuel 0.0;
_hueychop setVehicleAmmo 0.5;

//LOOT!

_crate2 = createVehicle ["USVehicleBox",[5018.6338, 2022.6287, -1.4305115e-005],[], 0, "CAN_COLLIDE"];
[_crate2] execVM "\z\addons\dayz_server\PEMS\misc\fillBoxesS.sqf";
_crate2 setVariable ["permaLoot",true];


// CREATE AI GUARDS

_spawnPos = [5022.7197, 2009.627, 6.2465668e-005]; 
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

_spawnPos = [5014.9395, 2051.0894, -6.6757202e-006];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

_spawnPos = [5037.564, 2021.0361, 0.60676354];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,3] call DZAI_setup_AI;

//MISSION COMPLETION

waitUntil{{isPlayer _x && _x distance _hueychop < 10  } count playableunits > 0}; 

[nil,nil,rTitleText,"The helicopter has been taken by survivors!", "PLAIN",6] call RE;


[] execVM "debug\remmarkers.sqf";
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";


SM1 = 5;
[0] execVM "\z\addons\dayz_server\PEMS\major\SMfinder.sqf";
