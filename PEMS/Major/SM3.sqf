/*Original script by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
Modified by Firefly 12/2013 for DayZ Epoch (1.0.3) Panthera
Spawns a static location mission at the town in the mountains north of Vogel. 19 guards positioned
at various areas, loot and walled compound. Meant to be a difficult but rewarding mission. */

private ["_coords","_MainMarker","_base","_wait"];
[] execVM "\z\addons\dayz_server\PEMS\SMGoMajor.sqf";
WaitUntil {MissionGo == 1};

_coords = [5545.2026, 3599.9949];

/*
_ai1 = [5524.957, 3592.2095, 1.5258789e-005];
_ai2 = [5528.9414, 3569.4529, 7.6293945e-006];
_ai3 = [5553.6929, 3581.6108, 7.6293945e-006];
_ai4 = [5557.5923, 3600.8865, -7.6293945e-006];
_ai5 = [5541.7935, 3606.3689, 13.434854];
*/

[nil,nil,rTitleText,"Bandits have fortified a town near Vogel. Take them out and take their supplies!", "PLAIN",10] call RE;

Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

//DECO

_fort1 = createVehicle ["Land_fort_bagfence_long",[5519.1494, 3601.3049, 4.5776367e-005],[], 0,"CAN_COLLIDE"];
_fort1 setDir -51.477959;
_fort1 setVariable ["DZAI",1,true];

_fort3 = createVehicle ["Base_WarfareBBarrier10x",[5567.126, 3600.7725, -0.34887609],[], 0,"CAN_COLLIDE"];
_fort3 setDir 89.209251;
_fort3 setVariable ["DZAI",1,true];

_fort4 = createVehicle ["Base_WarfareBBarrier10x",[5558.8965, 3611.8174, -0.57635742],[], 0,"CAN_COLLIDE"];
_fort4 setDir 0.98770994;
_fort4 setVariable ["DZAI",1,true];

_fort6 = createVehicle ["Base_WarfareBBarrier5x",[5528.293, 3609.2468, 7.6293945e-005],[], 0,"CAN_COLLIDE"];
_fort6 setDir -22.831429;
_fort6 setVariable ["DZAI",1,true];

_fort7 = createVehicle ["Base_WarfareBBarrier10x",[5507.3003, 3584.9946, -1.5258789e-005],[], 0,"CAN_COLLIDE"];
_fort7 setDir -69.043999;
_fort7 setVariable ["DZAI",1,true];

_fort8 = createVehicle ["Land_fort_bagfence_long",[5515.8813, 3597.8928, -9.1552734e-005],[], 0,"CAN_COLLIDE"];
_fort8 setDir -41.123302;
_fort8 setVariable ["DZAI",1,true];

_fort9 = createVehicle ["Land_fort_bagfence_long",[5512.1436, 3594.1763, -2.2888184e-005],[], 0,"CAN_COLLIDE"];
_fort9 setDir -49.62965;
_fort9 setVariable ["DZAI",1,true];

_fort12 = createVehicle ["Base_WarfareBBarrier10x",[5516.7124, 3568.9209, 0.15044276],[], 0,"CAN_COLLIDE"];
_fort12 setDir -160.7422;
_fort12 setVariable ["DZAI",1,true];

_fort13 = createVehicle ["Land_fort_bagfence_long",[5505.7939, 3574.3013, 5.3405762e-005],[], 0,"CAN_COLLIDE"];
_fort13 setDir -114.60342;
_fort13 setVariable ["DZAI",1,true];

_fort15 = createVehicle ["Base_WarfareBBarrier10x",[5549.3691, 3569.9431, 0.2277589],[], 0,"CAN_COLLIDE"];
_fort15 setDir 11.445724;
_fort15 setVariable ["DZAI",1,true];

_fort16 = createVehicle ["Land_fortified_nest_big", [5533.1768, 3567.6077, 7.6293945e-006],[], 0,"CAN_COLLIDE"];
_fort16 setDir -202.40221;
_fort16 setVariable ["DZAI",1,true];

_fort18 = createVehicle ["Land_Misc_deerstand",[5520.5659, 3595.9851, 7.6293945e-006],[], 0,"CAN_COLLIDE"];
_fort18 setDir 126.77746;
_fort18 setVariable ["DZAI",1,true];

_fort19 = createVehicle ["Land_Misc_deerstand",[5561.5586, 3603.7031, 0],[], 0,"CAN_COLLIDE"];
_fort19 setDir -126.402;
_fort19 setVariable ["DZAI",1,true];

_camonet = createVehicle ["Land_CamoNetVar_EAST",[5551.812, 3582.7229, 0.55370265],[], 0,"CAN_COLLIDE"];
_camonet setDir -89.952599;
_camonet setVariable ["DZAI",1,true];

_camonet2 = createVehicle ["Land_CamoNetVar_EAST",[5542.688, 3597.1296, 0.33686367],[], 0,"CAN_COLLIDE"];
_camonet2 setDir -2.5176811;
_camonet2 setVariable ["DZAI",1,true];

//VEHICLE SPAWN

_kamaz = createVehicle ["KamazOpen", [5534.9512, 3584.1609], [], 0, "CAN_COLLIDE"];
_kamaz setDir -220.76085;
_kamaz setVariable ["DZAI",1,true];

//LOOT!

_crate = createVehicle ["USVehicleBox",[5545.2026, 3599.9949, -7.6293945e-006],[], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\PEMS\misc\fillBoxesA.sqf";
_crate setVariable ["permaLoot",true];

_crate2 = createVehicle ["USLaunchersBox",[5555.2036, 3589.8796, -2.2888184e-005],[], 0, "CAN_COLLIDE"];
[_crate2] execVM "\z\addons\dayz_server\PEMS\misc\fillBoxesS.sqf";
_crate2 setVariable ["permaLoot",true];

_crate6 = createVehicle ["USLaunchersBox",[5555.6421, 3587.9329, 7.6293945e-006],[], 0, "CAN_COLLIDE"];
[_crate6] execVM "\z\addons\dayz_server\PEMS\misc\fillBoxesH2.sqf";
_crate6 setVariable ["permaLoot",true];

// CREATE AI GUARDS

_spawnPos = [5532.8887, 3573.9253, 0.20909785];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

_spawnPos = [5553.6929, 3581.6108, 7.6293945e-006];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

_spawnPos = [5558.1919, 3601.4597, -7.6293945e-006];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

_spawnPos = [5523.3145, 3594.4468, 1.5258789e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

_spawnPos = [5558.9077, 3587.8899, 4.581028];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,3] call DZAI_setup_AI;

//MISSION COMPLETION

waitUntil{{isPlayer _x && _x distance _crate < 10  } count playableunits > 0}; 

[nil,nil,rTitleText,"Survivors have taken control of the camp!", "PLAIN",6] call RE;

[] execVM "debug\remmarkers.sqf";
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\PEMS\major\SMfinder.sqf";