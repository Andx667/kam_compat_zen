#include "..\script_component.hpp"
/*
 * Author: Andx
 * Opens a ZEN dialog to manage a unit's KAM breathing state: pneumothorax severity,
 * hemopneumothorax, tension pneumothorax and PaO2. Together with the airway component's
 * Manage Airway action this covers everything KAM's own Manage Airway Zeus module does.
 * The chosen values are applied on the unit's owner, see FUNC(applyBreathing).
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_hoveredEntity] call FUNC(manageBreathing);
 *
 * Public: No
 */
params ["_unit"];

// [PaCO2, PaO2, O2Sat, HCO3, pH, EtCO2] - matches KAM's kat_main DEFAULT_BLOOD_GAS
private _defaultBloodGas = [40, 90, 0.96, 24, 7.4, 37];
private _paO2 = round ((_unit getVariable [QKATGVAR(circulation,bloodGas), _defaultBloodGas]) select 1);

// The trailing "true" on each row forces the unit's current state as the default. Without it ZEN
// restores the values last confirmed for an identical dialog, which can belong to a different unit.
[
    LLSTRING(ManageBreathing_DialogTitle),
    [
        ["SLIDER", [LLSTRING(Pneumothorax_Label), LLSTRING(Pneumothorax_Tooltip)], [0, 4, _unit getVariable [QKATGVAR(breathing,pneumothorax), 0], 0], true],
        ["CHECKBOX", [LLSTRING(Deteriorate_Label), LLSTRING(Deteriorate_Tooltip)], false, true],
        ["CHECKBOX", [LLSTRING(Hemopneumothorax_Label), LLSTRING(Hemopneumothorax_Tooltip)], _unit getVariable [QKATGVAR(breathing,hemopneumothorax), false], true],
        ["CHECKBOX", [LLSTRING(TensionPneumothorax_Label), LLSTRING(TensionPneumothorax_Tooltip)], _unit getVariable [QKATGVAR(breathing,tensionpneumothorax), false], true],
        ["SLIDER", [LLSTRING(PaO2_Label), LLSTRING(PaO2_Tooltip)], [0, 100 max _paO2, _paO2, 0], true]
    ],
    {
        params ["_values", "_unit"];
        _values params ["_severity", "_deteriorate", "_hemopneumothorax", "_tensionPneumothorax", "_paO2"];

        [QGVAR(applyBreathing), [_unit, round _severity, _deteriorate, _hemopneumothorax, _tensionPneumothorax, round _paO2], _unit] call CBA_fnc_targetEvent;
    },
    {},
    _unit
] call zen_dialog_fnc_create;
