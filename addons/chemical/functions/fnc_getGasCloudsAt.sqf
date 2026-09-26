#include "..\script_component.hpp"
/*
 * Author: Andx
 * Returns the IDs of the gas clouds created by this mod that contain the given position or
 * are attached to the given entity.
 *
 * Arguments:
 * 0: Position (ASL) <ARRAY>
 * 1: Hovered entity <OBJECT|ANY>
 *
 * Return Value:
 * Cloud IDs <ARRAY of STRING>
 *
 * Example:
 * [_position, _hoveredEntity] call FUNC(getGasCloudsAt);
 *
 * Public: No
 */
params ["_position", "_hoveredEntity"];

private _ids = [];

{
    _x params ["_id", "_source", "_radius"];

    private _isObject = _source isEqualType objNull;

    if (_isObject && {isNull _source}) then {continue};

    private _center = if (_isObject) then {getPosASL _source} else {_source};

    if (_source isEqualTo _hoveredEntity || {_position distance2D _center <= _radius}) then {
        _ids pushBack _id;
    };
} forEach (missionNamespace getVariable [QGVAR(cloudList), []]);

_ids
