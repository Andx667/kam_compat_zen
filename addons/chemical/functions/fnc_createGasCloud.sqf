#include "..\script_component.hpp"
/*
 * Author: Andx
 * Registers a gas cloud created from the Zeus context menu and hands it to KAM's gas source
 * system. Server only.
 *
 * KAM ties the lifetime of its own Zeus gas clouds to the module that placed them, so deleting
 * the module removes the cloud. There is no module here, so every cloud gets an ID that is
 * kept in a registry instead: the cloud lives until its ID is removed from the registry (see
 * FUNC(deleteGasClouds)) or, for a cloud attached to an object, until that object is deleted.
 *
 * Arguments:
 * 0: Source, position (ASL) or object <ARRAY|OBJECT>
 * 1: Radius <NUMBER>
 * 2: Gas level, KAM's gas type index <NUMBER>
 * 3: Sealable <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_position, 20, 1, false] call FUNC(createGasCloud);
 *
 * Public: No
 */
params ["_source", "_radius", "_gasLevel", "_isSealable"];

private _isObject = _source isEqualType objNull;

if (_isObject && {isNull _source}) exitWith {};

// One cloud per object, so using the action on the same object again replaces its cloud
private _id = if (_isObject) then {
    format ["kcz_%1", netId _source]
} else {
    GVAR(cloudCount) = GVAR(cloudCount) + 1;
    format ["kcz_position_%1", GVAR(cloudCount)]
};

[QKATGVAR(chemical,addGasSource), [
    _source,
    _radius,
    _gasLevel,
    _id,
    {
        params ["_id", "_source"];
        _id in GVAR(clouds) && {_source isEqualType [] || {!isNull _source}}
    },
    [_id, _source],
    _isSealable
]] call CBA_fnc_serverEvent;

// Registered after the call on purpose: replacing a cloud makes older KAM versions fire
// removeGasSource for its ID, which would drop the entry that was just added
GVAR(clouds) set [_id, [_source, _radius]];

call FUNC(publishGasClouds);
