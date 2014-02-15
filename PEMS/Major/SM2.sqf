/*Original script by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
Modified by Firefly 12/2013 for DayZ Epoch (1.0.3) Panthera
Spawns a static location mission at North airfield with a crashed C-130 as the centrepiece.
AI are split each side of the plane behind fortifications. */

private ["_coords","_MainMarker","_wait"];
[] execVM "\z\addons\dayz_server\PEMS\SMGoMajor.sqf";
WaitUntil {MissionGo == 1};

_coords = [4112.6104, 7560.874, -9.5367432e-007];
/*
_ai1 = [4120.9595, 7546.2988, 9.059906e-006];
_ai2 = [4114.772, 7571.2988, 0.56868672];
*/
[nil,nil,rTitleText,"A crashed C-130 carrying supplies has been secured by bandits! Check your map for the location!", "PLAIN",10] call RE;

Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

//DECO

_c130wreck = createVehicle ["C130J_wreck_EP1",[4090.8057, 7559.3521, -9.5367432e-007],[], 0, "NONE"];
_c130wreck setDir 100.77502;
_c130wreck setVariable ["DZAI",1,true];

_sandbag1 = createVehicle ["Land_fort_bagfence_long",[4111.8364, 7543.3799, 4.196167e-005],[], 0, "NONE"];
_sandbag1 setDir 0.55778611;
_sandbag1 setVariable ["DZAI",1,true];

_sandbag2 = createVehicle ["Land_fort_bagfence_corner",[4111.8364, 7543.3799, 4.196167e-005],[], 0, "NONE"];
_sandbag2 setDir 0.55778611;
_sandbag2 setVariable ["DZAI",1,true];

_sandbag3 = createVehicle ["Land_fort_bagfence_round",[4129.7002, 7546.6636, 4.6730042e-005],[], 0, "NONE"];
_sandbag3 setDir 86.174072;
_sandbag3 setVariable ["DZAI",1,true];

_sandbag4 = createVehicle ["Land_fort_bagfence_corner",[4111.3452, 7548.6196, 2.0027161e-005],[], 0, "NONE"];
_sandbag4 setDir -269.91016;
_sandbag4 setVariable ["DZAI",1,true];

_sandbag5 = createVehicle ["Land_fort_bagfence_long",[4116.5884, 7549.7778, 4.7683716e-005],[], 0, "NONE"];
_sandbag5 setDir -0.12734735;
_sandbag5 setVariable ["DZAI",1,true];

_sandbag6 = createVehicle ["Land_fort_bagfence_long",[4121.0693, 7542.7935, 4.2915344e-005],[], 0, "NONE"];
_sandbag6 setDir 0.54194671;
_sandbag6 setVariable ["DZAI",1,true];

_sandbag7 = createVehicle ["Land_fort_bagfence_long",[4121.1367, 7549.728, 4.3869019e-005],[], 0, "NONE"];
_sandbag7 setDir 1.1408305;
_sandbag7 setVariable ["DZAI",1,true];

_sandbag8 = createVehicle ["Land_fort_bagfence_round",[4109.8818, 7571.5747, 3.8146973e-006],[], 0, "NONE"];
_sandbag8 setDir -81.175926;
_sandbag8 setVariable ["DZAI",1,true];

_sandbag9 = createVehicle ["Land_fort_bagfence_round",[4123.2051, 7570.3052, 2.3841858e-005],[], 0, "NONE"];
_sandbag9 setDir 83.123207;
_sandbag9 setVariable ["DZAI",1,true];

_sandbag10 = createVehicle ["Land_fort_bagfence_round",[4116.9653, 7575.5552, 1.2397766e-005],[], 0, "NONE"];
_sandbag10 setDir 9.6217527;
_sandbag10 setVariable ["DZAI",1,true];

_camonet = createVehicle ["Land_CamoNet_EAST",[4119.3081, 7546.2261, 0.71298516],[], 0, "NONE"];
_camonet setDir -183.76382;
_camonet setVariable ["DZAI",1,true];

//VEHICLE SPAWN

_uaz = createVehicle ["UAZ_INS",[4113.395, 7540.3721, -1.335144e-005],[], 0, "CAN_COLLIDE"];
_uaz setDir 91.317421;
_uaz setVariable ["DZAI",1,true];

//LOOT!

_crate = createVehicle ["USVehicleBox",[4113.7256, 7547.5669, 1.8119812e-005],[], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\PEMS\misc\fillBoxesA.sqf";
_crate setVariable ["permaLoot",true];

_crate2 = createVehicle ["USLaunchersBox",[4127.4238, 7547.2217, 4.7683716e-006],[], 0, "CAN_COLLIDE"];
[_crate2] execVM "\z\addons\dayz_server\PEMS\misc\fillBoxesS.sqf";
_crate2 setVariable ["permaLoot",true];

// CREATE AI GUARDS

_spawnPos = [4120.9595, 7546.2988, 9.059906e-006];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [8,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

_spawnPos = [4114.772, 7571.2988, 0.56868672];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [8,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//MISSION COMPLETION

waitUntil{{isPlayer _x && _x distance _crate < 5 } count playableunits > 0}; 

[] execVM "debug\remmarkers.sqf";
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";


[nil,nil,rTitleText,"The crash site has been secured by survivors!", "PLAIN",6] call RE;
SM1 = 1;


[0] execVM "\z\addons\dayz_server\PEMS\major\SMfinder.sqf";