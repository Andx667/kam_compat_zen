#include "..\script_component.hpp"
/*
 * Author: Andx
 * Sets whether the given AI unit can die instantly from a fatal injury,
 * via KAM's instant AI death prevention flag.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Prevent instant death <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_hoveredEntity, true] call FUNC(setAiDeathPrevention);
 *
 * Public: No
 */
params ["_unit", "_enable"];

_unit setVariable [QKATGVAR(misc,PreventInstantAIDeath), _enable, true];

[objNull, format [
    KATLLSTRING(zeus,toggleAIDeath_Module_Toggled),
    [ACELLSTRING(Common,Disabled), ACELLSTRING(Common,Enabled)] select _enable
]] call BIS_fnc_showCuratorFeedbackMessage;
