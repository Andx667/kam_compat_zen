#include "..\script_component.hpp"
/*
 * Author: Andx
 * Opens a ZEN dialog to change a unit's KAM blood type.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_hoveredEntity] call FUNC(changeBloodType);
 *
 * Public: No
 */
params ["_unit"];

private _bloodTypes = ["O", "O_N", "A", "A_N", "B", "B_N", "AB", "AB_N"];
private _currentIndex = _bloodTypes find (_unit getVariable [QKATGVAR(circulation,bloodtype), "O_N"]);
if (_currentIndex == -1) then {_currentIndex = 1};

[
    LLSTRING(BloodType_DisplayName),
    [
        ["COMBO", [LLSTRING(BloodType_Label), LLSTRING(BloodType_Tooltip)], [
            _bloodTypes,
            [["O+"], ["O-"], ["A+"], ["A-"], ["B+"], ["B-"], ["AB+"], ["AB-"]],
            _currentIndex
        ]]
    ],
    {
        params ["_values", "_unit"];
        _values params ["_bloodType"];

        _unit setVariable [QKATGVAR(circulation,bloodtype), _bloodType, true];
    },
    {},
    _unit
] call zen_dialog_fnc_create;
