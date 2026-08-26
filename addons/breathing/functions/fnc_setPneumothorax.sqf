#include "..\script_component.hpp"
/*
 * Author: Andx
 * Opens a ZEN dialog to set a unit's KAM pneumothorax severity.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_hoveredEntity] call FUNC(setPneumothorax);
 *
 * Public: No
 */
params ["_unit"];

private _current = _unit getVariable [QKATGVAR(breathing,pneumothorax), 0];

[
    LLSTRING(Pneumothorax_DialogTitle),
    [
        ["SLIDER", [LLSTRING(Pneumothorax_Label), LLSTRING(Pneumothorax_Tooltip)], [0, 4, _current, 0]]
    ],
    {
        params ["_values", "_unit"];
        _values params ["_severity"];
        _severity = round _severity;

        _unit setVariable [QKATGVAR(breathing,pneumothorax), _severity, true];

        // Matches KAM's own manage-airway dialog: pneumothorax severity drives a
        // blood pressure penalty and pain via KAM's/ACE's own functions.
        if (_severity isEqualTo 0) then {
            [_unit, 0, 0, "ptx_tension", true] call KATFUNC(circulation,updateBloodPressureChange);
        } else {
            [_unit, -12 * _severity, -12 * _severity, "ptx_tension", true] call KATFUNC(circulation,updateBloodPressureChange);
            [_unit, 0.5 * (_severity / 4)] call ACEFUNC(medical_status,adjustPainLevel);
        };
    },
    {},
    _unit
] call zen_dialog_fnc_create;
