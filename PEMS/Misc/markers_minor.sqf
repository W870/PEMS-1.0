if(!isServer) exitWith {};
private ["_dot","_coords","_Marker","_name"];
_coords = _this select 0;
_name = _this select 1;

_Marker = "";
_dot = "";
markerready = false;
while {missionminorrunning} do {
	_Marker = createMarker ["Mission", _coords];
	_Marker setMarkerColor "ColorRed";
	_Marker setMarkerShape "ELLIPSE";
	_Marker setMarkerBrush "Solid";
	_Marker setMarkerSize [300,300];
	_Marker setMarkerText _name;
	_dot = createMarker ["dot", _coords];
	_dot setMarkerColor "ColorBlack";
	_dot setMarkerType "mil_dot";
	_dot setMarkerText _name;
	sleep 30;
	deleteMarker _Marker;
	deleteMarker _dot;
};
if (_Marker == "Mission") then {
	deleteMarker _Marker;
	deleteMarker _dot;
};
markerready = true;