/*Original script by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
Modified by Firefly 12/2013 for DayZ Epoch (1.0.3) Panthera
Spawns a static location mission at Cave Del Predil. Story of the mission is bandits are looting
a small industrial site with two trucks. This is a difficult mission with around 20
AI Guards, including snipers in high places. It does award 3 large loot boxes and will make a
great building materials mission. */

private ["_coords","_MainMarker","_wait"];
[] execVM "\z\addons\dayz_server\PEMS\SMGoMajor.sqf";
WaitUntil {MissionGo == 1};

_coords = [3114.769, 5880.9937];

/*
_ai1 = [3123.8237, 5892.9585, -1.5258789e-005]; 	//OUTSIDE GUARD FRONT
_ai2 = [3164.4363, 5882.6094, 3.6021135];			//ENTRANCE GUARD
_ai3 = [3110.9485, 5868.7046, 1.5258789e-005]; 		//SHED LOOT GUARD
_ai4 = [3108.717, 5903.1377, 1.1444092e-005];		//TEC LOOT GUARD
_ai5 = [3116.0369, 5905.23, 3.1181297];				//TEC 2ND LEVEL GUARD INTERNAL
_ai6 = [3117.1213, 5898.186, 5.4414344];			//TEC 3RD LEVEL GUARD INTERNAL
_ai7 = [3113.0476, 5903.1953, 10.735963];			//TEC TOP COVER SNIPER
_ai8 = [3136.321, 5925.1108, 12.222241];			//INDY TOP COVER SNIPER
_ai9 = [3134.2927, 5937.7104, 0.0001335144];		//OUTSIDE REAR GUARD
_ai10 = [3140.8416, 5919.9897, -0.040150899];		//INDY LOOT GUARD
_ai11 = [3142.1521, 5923.6797, 5.9655161];			//INDY 2ND LEVEL GUARD
_ai12 = [3154.1199, 5919.0596, -3.4332275e-005];	//INDY SIDE DOOR GUARD
_ai13 = [3110.2615, 5892.1523, 5.6472368];			//TEC 2ND LEVEL SNIPER EXTERNAL
_ai14 = [3096.7749, 5865.7622, 6.0113373];			//GARGAGE TOP COVER SNIPER
*/

[nil,nil,rTitleText,"Bandits have looted an industrial unit and are preparing to leave, intercept them! Check your map for the location.", "PLAIN",10] call RE;

Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

//DECO

_Mi8Wreck = createVehicle ["Mi8Wreck",[3093.6951, 5887.5962, 0.1122704],[], 0, "CAN_COLLIDE"];
_Mi8Wreck setDir 140.47765;
_Mi8Wreck setVariable ["DZAI",1,true];

_uralwreck = createVehicle ["UralWreck",[3107.5232, 5860.292, 1.9073486e-005],[], 0, "CAN_COLLIDE"];
_uralwreck setDir -88.331932;
_uralwreck setVariable ["DZAI",1,true];

_uralwreck2 = createVehicle ["UralWreck",[3146.9597, 5890.7524, 1.5258789e-005],[], 0, "CAN_COLLIDE"];
_uralwreck2 setDir -42.895416;
_uralwreck2 setVariable ["DZAI",1,true];

//VEHICLE SPAWN

_v3sopen = createVehicle ["V3S_Open_TK_CIV_EP1",[3114.769, 5880.9937, -0.15442207],[], 0, "CAN_COLLIDE"];
_v3sopen setDir 78.742851;
_v3sopen setVariable ["DZAI",1,true];

_UralCivil2 = createVehicle ["UralCivil2_DZE",[3134.0825, 5904.2607, 7.6293945e-006],[], 0, "CAN_COLLIDE"];
_UralCivil2 setDir -168.37491;
_UralCivil2 setVariable ["DZAI",1,true];

//LOOT!

_crate = createVehicle ["USVehicleBox",[3108.3154, 5900.6963, 0.13157813],[], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\PEMS\misc\fillBoxesA.sqf";
_crate setVariable ["permaLoot",true];

_crate3 = createVehicle ["USVehicleBox",[3112.1917, 5865.6689, 1.1444092e-005],[], 0, "CAN_COLLIDE"];
[_crate3] execVM "\z\addons\dayz_server\PEMS\misc\fillBoxesA.sqf";
_crate3 setVariable ["permaLoot",true];

_crate2 = createVehicle ["USVehicleBox",[3139.177, 5922.6797, 3.8146973e-006],[], 0, "CAN_COLLIDE"];
[_crate2] execVM "\z\addons\dayz_server\PEMS\misc\fillBoxesS.sqf";
_crate2 setVariable ["permaLoot",true];

// CREATE AI GUARDS

//OUTSIDE GUARD FRONT
_spawnPos = [3123.8237, 5892.9585, -1.5258789e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [3,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//ENTRANCE GUARD
_spawnPos = [3164.4363, 5882.6094, 3.6021135];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [2,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//SHED LOOT GUARD
_spawnPos = [3110.9485, 5868.7046, 1.5258789e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [2,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//TEC LOOT GUARD
_spawnPos = [3108.717, 5903.1377, 1.1444092e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [2,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//TEC 2ND LEVEL GUARD INTERNAL
_spawnPos = [3116.0369, 5905.23, 3.1181297];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [1,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//TEC 3RD LEVEL GUARD INTERNAL
_spawnPos = [3117.1213, 5898.186, 5.4414344];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [1,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//TEC TOP COVER SNIPER
_spawnPos = [3113.0476, 5903.1953, 10.735963];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [2,grpNull,_spawnPos,objNull,3] call DZAI_setup_AI;

//INDY TOP COVER SNIPER
_spawnPos = [3136.321, 5925.1108, 12.222241];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [2,grpNull,_spawnPos,objNull,3] call DZAI_setup_AI;

//OUTSIDE REAR GUARD
_spawnPos = [3134.2927, 5937.7104, 0.0001335144];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [2,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//INDY LOOT GUARD
_spawnPos = [3140.8416, 5919.9897, -0.040150899];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [2,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//INDY 2ND LEVEL GUARD
_spawnPos = [3142.1521, 5923.6797, 5.9655161];	
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [1,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//INDY SIDE DOOR GUARD
_spawnPos = [3154.1199, 5919.0596, -3.4332275e-005];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [2,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;

//TEC 2ND LEVEL SNIPER EXTERNAL
_spawnPos = [3110.2615, 5892.1523, 5.6472368];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [1,grpNull,_spawnPos,objNull,3] call DZAI_setup_AI;

//GARGAGE TOP COVER SNIPER
_spawnPos = [3096.7749, 5865.7622, 6.0113373];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
Guards = [2,grpNull,_spawnPos,objNull,3] call DZAI_setup_AI;


//MISSION COMPLETION

waitUntil{{isPlayer _x && _x distance _crate3 < 10  } count playableunits > 0}; 

[nil,nil,rTitleText,"The supplies have been secured by survivors! Good job!", "PLAIN",6] call RE;


[] execVM "debug\remmarkers.sqf";
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";


SM1 = 5;
[0] execVM "\z\addons\dayz_server\PEMS\major\SMfinder.sqf";
