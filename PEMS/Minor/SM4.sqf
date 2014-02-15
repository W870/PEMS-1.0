//Bandit Heli Down! by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
private ["_coords","_wait","_MainMarker75"];

[] execVM "\z\addons\dayz_server\PEMS\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};

_coords =  [8044.8203, 1405.0231, -1.1445121];

/*
_ai1 = [7974.5757, 1416.7572, 1.5974045e-005]; 		//HOSPITAL GUARD
_ai2 = [8029.7935, 1410.3652, 6.4730644e-005];		//SHORE GUARD
_ai3 = [8034.6519, 1366.9315, 6.6518784e-005]; 	//REAR GUARD
*/

[nil,nil,rTitleText,"A bandit helicopter has crashed! Check your map for the location!", "PLAIN",10] call RE;

MCoords = _coords;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

//DECO
_chopcrash = createVehicle ["Mi8Wreck", [8044.8203, 1405.0231, -1.1445121], [], 0, "CAN_COLLIDE"];
_chopcrash setVariable ["DZAI",1,true];

//LOOT
_crate4 = createVehicle ["USVehicleBox_EP1", [8021.7725, 1403.7164, -0.011691851], [], 0, "CAN_COLLIDE"];
[_crate4] execVM "\z\addons\dayz_server\PEMS\misc\fillBoxes2.sqf";
_crate4 setVariable ["permaLoot",true];

//AI
_spawnPos = [7974.5757, 1416.7572, 1.5974045e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

sleep 5;

_spawnPos = [8019.1855, 1405.5833, 6.4730644e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

sleep 5;

_spawnPos = [8034.6519, 1366.9315, 6.6518784e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [4,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

waitUntil{{isPlayer _x && _x distance _crate4 < 10  } count playableunits > 0}; 

[nil,nil,rTitleText,"The crash site has been secured by survivors!", "PLAIN",6] call RE;

[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";

SM1 = 5;
[0] execVM "\z\addons\dayz_server\PEMS\minor\SMfinder.sqf";