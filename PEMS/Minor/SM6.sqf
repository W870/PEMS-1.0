//Construction & Weapon Truck Crash by Firefly based on mission by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
private ["_coords","_wait","_MainMarker75"];

[] execVM "\z\addons\dayz_server\PEMS\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};

_coords = [3390.0305, 6635.4844, 6.1035156e-005];

/*
_ai1 = [3404.605, 6623.752, 3.8146973e-006]; 		//BRIDGE GUARD 1
_ai2 = [3375.1572, 6596.8604, -3.8146973e-006];		//BRIDGE GUARD 2
_ai3 = [3385.9268, 6617.7358, 3.6239624e-005]; 		//BRIDGE GUARD 3
_ai4 = [3366.1575, 6643.2749, 3.8146973e-006]; 		//ROAD GUARD 1
_ai5 = [3385.4207, 6662.0435]; 						//ROAD GUARD 2
*/

[nil,nil,rTitleText,"A bandit construction supply truck has crashed! Check your map for the location!", "PLAIN",10] call RE;

MCoords = _coords;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

//DECO

_uralcrash = createVehicle ["UralWreck", [3390.0305, 6635.4844, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
_uralcrash setVariable ["DZAI",1,true];

//LOOT

_crate = createVehicle ["USVehicleBox", [3384.2175, 6632.2202, 7.6293945e-005], [], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\PEMS\misc\fillBoxesA.sqf";
_crate setVariable ["permaLoot",true];



//AI
_spawnPos = [3404.605, 6623.752, 3.8146973e-006];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [3,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

sleep 5;

_spawnPos = [3375.1572, 6596.8604, -3.8146973e-006];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [3,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

sleep 5;

_spawnPos = [3385.9268, 6617.7358, 3.6239624e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [3,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

sleep 5;

_spawnPos = [3366.1575, 6643.2749, 3.8146973e-006];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [3,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

sleep 5;

_spawnPos = [3385.4207, 6662.0435];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [3,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

waitUntil{{isPlayer _x && _x distance _crate < 10  } count playableunits > 0}; 


[nil,nil,rTitleText,"The crash site has been secured by survivors!", "PLAIN",6] call RE;


[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";

SM1 = 5;
[0] execVM "\z\addons\dayz_server\PEMS\Minor\SMfinder.sqf";