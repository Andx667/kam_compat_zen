#include "..\script_component.hpp"
/*
 * Author: Andx
 * Removes gas clouds created by FUNC(createGasCloud). Server only.
 *
 * Arguments:
 * 0: Cloud IDs <ARRAY of STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [["kcz_position_1"]] call FUNC(deleteGasClouds);
 *
 * Public: No
 */
params ["_ids"];

{
    if (_x in GVAR(clouds)) then {
        // Removed from the registry first, so the removeGasSource listener ignores it
        GVAR(clouds) deleteAt _x;
        [QKATGVAR(chemical,removeGasSource), _x] call CBA_fnc_serverEvent;
    };
} forEach _ids;

call FUNC(publishGasClouds);
