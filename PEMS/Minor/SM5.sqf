
private ["_coords","_wait","_playerPresent","_cleanmission","_currenttime","_starttime","_missiontimeout","_vehname","_hmmwv","_vehdir","_objPosition","_spawnPos","_guards"];
[] execVM "\z\addons\dayz_server\PEMS\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};

diag_log format["PEMS: Mission SM5 Crashed HMMWV Started At %1",_coords];

_positionarray = [[8005.7324, 1420.7739, -1.2636185e-005],[8485.8242, 4594.4146, 5.2928925e-005],[7834.7021, 5020.6636, -1.6212463e-005],[4565.5928, 2594.0469, -7.1525574e-006],
				 [5047.5566, 6420.314, 3.8146973e-006],[4584.5078, 8050.0444, -1.2397766e-005],[3475.6807, 7968.2725, 7.6293945e-006],[5964.3716, 3847.9849, 1.8119812e-005],
				 [3464.1619, 5407.8066, 1.9073486e-005],[2232.0466, 7893.0547, 0],[2102.9517, 9088.1895, 0],[1612.98, 8817.2373, 3.6716461e-005],[906.71307, 9448.8398, -1.9073486e-006]];
_coords = _positionarray call BIS_fnc_selectRandom;

diag_log "PEMS: CREATE VEHICLE";

//CREATE VEHICLE 

_ground = ["HMMWV_DES_EP1","HMMWV_DZ","HMMWV_M1035_DES_EP1"] call BIS_fnc_selectRandom;

_hmmwv = createVehicle [_ground,_coords,[], 0,"CAN_COLLIDE"];
_vehdir = round(random 360);
_hmmwv setDir _vehdir;
_hmmwv  setFuel 0.1;
_hmmwv 	setDamage 0.75;
_hmmwv sethit ["wheel_1_1_steering", 1];
_hmmwv sethit ["wheel_1_2_steering", 1];
_hmmwv  setVariable ["DZAI",1,true];
[_hmmwv] execVM "\z\addons\dayz_server\PEMS\misc\hmmwv_cargo.sqf";
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_hmmwv];
diag_log format["WAI: Mission SM5 Crashed HMMWV spawned a %1",_ground];

_objPosition = getPosATL _hmmwv;

//CREATE GUARDS
_spawnPos = [(_coords select 0) + 10, (_coords select 1) - 20,0];
_spawnPos set [2,0]; //Forces z coordinate (height) to zero
_guards = [8,grpNull,_spawnPos,objNull,2] call DZAI_setup_AI;
	
_guards setVariable ["missionclean", "ground"];
	


diag_log format["WAI: Mission SM5 Crashed HMMWV Guards spawned a %1",_spawnPos];

[_coords,"Crashed HMMWV"] execVM "\z\addons\dayz_server\PEMS\Misc\markers_minor.sqf";
[nil,nil,rTitleText,"A bandit HMMWV scavenging party has crashed. Investigate for supplies!", "PLAIN",10] call RE;

diag_log "PEMS: MISSION CREATION SUCCESSFUL";

_missiontimeout = true;
_cleanmission = false;
_playerPresent = false;
_starttime = floor(time);
while {_missiontimeout} do {
	sleep 5;
	_currenttime = floor(time);
	{if((isPlayer _x) AND (_x distance _position <= 150)) then {_playerPresent = true};}forEach playableUnits;
	if (_currenttime - _starttime >= wai_mission_timeout) then {_cleanmission = true;};
	if ((_playerPresent) OR (_cleanmission)) then {_missiontimeout = false;};
};
if (_playerPresent) then {
	[_hmmwv,[_vehdir,_objPosition],_ground,true,"0"] call custom_publish;
	waitUntil
	{
		sleep 5;
		_playerPresent = false;
		{if((isPlayer _x) AND (_x distance _position <= 30)) then {_playerPresent = true};}forEach playableUnits;
		(_playerPresent)
	};
	diag_log format["PEMS: Mission SM5 Crashed HMMWV Ended At %1",_coords];
	[nil,nil,rTitleText,"Survivors have secured the crash site!", "PLAIN",10] call RE;
} else {
	clean_running_mission = True;
	deleteVehicle _hmmwv;
	{_cleanunits = _x getVariable "missionclean";
	if (!isNil "_cleanunits") then {
		switch (_cleanunits) do {
			case "ground" : {ai_ground_units = (ai_ground_units -1);};
			case "air" : {ai_air_units = (ai_air_units -1);};
			case "vehicle" : {ai_vehicle_units = (ai_vehicle_units -1);};
			case "static" : {ai_emplacement_units = (ai_emplacement_units -1);};
		};
		deleteVehicle _x;
		sleep 0.05;
	};	
	} forEach allUnits;
	
	diag_log format["PEMS: Mission SM5 Crashed HMMWV timed out At %1",_position];
	[nil,nil,rTitleText,"Survivors did not secure the crash site in time!", "PLAIN",10] call RE;
};

missionminorrunning = false;

SM1 = 5;
[0] execVM "\z\addons\dayz_server\PEMS\minor\SMfinder.sqf";
