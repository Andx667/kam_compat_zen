#include "..\script_component.hpp"
/*
 * Author: Andx
 * Opens a ZEN dialog to set a unit's KAM airway obstruction/occlusion state.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_hoveredEntity] call FUNC(manageAirway);
 *
 * Public: No
 */
params ["_unit"];

[
    KATLLSTRING(zeus,manageAirway_Module_displayname),
    [
        ["CHECKBOX", [LLSTRING(Obstruction_Label), LLSTRING(Obstruction_Tooltip)], _unit getVariable [QKATGVAR(airway,obstruction), false]],
        ["CHECKBOX", [LLSTRING(Occluded_Label), LLSTRING(Occluded_Tooltip)], _unit getVariable [QKATGVAR(airway,occluded), false]]
    ],
    {
        params ["_values", "_unit"];
        _values params ["_obstruction", "_occluded"];

        _unit setVariable [QKATGVAR(airway,obstruction), _obstruction, true];
        _unit setVariable [QKATGVAR(airway,occluded), _occluded, true];
    },
    {},
    _unit
] call zen_dialog_fnc_create;
