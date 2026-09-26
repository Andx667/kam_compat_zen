#include "..\script_component.hpp"
/*
 * Author: Andx
 * Removes the gas clouds created by this mod that contain the given position or are attached
 * to the given entity, and tells the Zeus how many were removed.
 *
 * Arguments:
 * 0: Position (ASL) <ARRAY>
 * 1: Hovered entity <OBJECT|ANY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_position, _hoveredEntity] call FUNC(removeGasCloudsAt);
 *
 * Public: No
 */
params ["_position", "_hoveredEntity"];

private _ids = [_position, _hoveredEntity] call FUNC(getGasCloudsAt);

if (_ids isEqualTo []) exitWith {};

[QGVAR(deleteClouds), [_ids]] call CBA_fnc_serverEvent;

[objNull, format [LLSTRING(RemoveGasCloud_Removed), count _ids]] call BIS_fnc_showCuratorFeedbackMessage;
