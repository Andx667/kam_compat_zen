#include "..\script_component.hpp"
/*
 * Author: Andx
 * Drops registry entries whose object no longer exists, then publishes the remaining clouds
 * so Zeus clients can tell which of them are near the cursor. Server only.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call FUNC(publishGasClouds);
 *
 * Public: No
 */
private _cloudList = [];

{
    _y params ["_source", "_radius"];

    if (_source isEqualType objNull && {isNull _source}) then {
        GVAR(clouds) deleteAt _x;
    } else {
        _cloudList pushBack [_x, _source, _radius];
    };
} forEach +GVAR(clouds);

GVAR(cloudList) = _cloudList;
publicVariable QGVAR(cloudList);
