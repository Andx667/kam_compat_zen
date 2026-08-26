#include "..\script_component.hpp"
/*
 * Author: Andx
 * Opens a ZEN dialog to change a unit's KAM blood type and total blood volume.
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

// [ECB, ECP, SRBC, ISP, totalBloodVolumeML] - matches KAM's kat_circulation DEFAULT_BODY_FLUID
private _defaultBodyFluid = [2700, 3300, 500, 10000, 6000];
private _currentVolumeL = ((_unit getVariable [QKATGVAR(circulation,bodyFluid), _defaultBodyFluid]) select 4) / 1000;

[
    KATLLSTRING(zeus,bloodType_Module_displayname),
    [
        ["COMBO", [LLSTRING(BloodType_Label), LLSTRING(BloodType_Tooltip)], [
            _bloodTypes,
            [["O+"], ["O-"], ["A+"], ["A-"], ["B+"], ["B-"], ["AB+"], ["AB-"]],
            _currentIndex
        ]],
        ["SLIDER", [LLSTRING(BloodVolume_Label), LLSTRING(BloodVolume_Tooltip)], [0, 6, _currentVolumeL, 2]]
    ],
    {
        params ["_values", "_unit"];
        _values params ["_bloodType", "_targetVolumeL"];

        _unit setVariable [QKATGVAR(circulation,bloodtype), _bloodType, true];

        // Mirrors KAM's kat_circulation REDUCE_TOTAL_BLOOD_VOLUME macro: changing the
        // total blood volume also shifts the ECB/ECP compartments by half the delta each.
        private _defaultBodyFluid = [2700, 3300, 500, 10000, 6000];
        private _bodyFluid = _unit getVariable [QKATGVAR(circulation,bodyFluid), _defaultBodyFluid];
        private _deltaML = ((_bodyFluid select 4) / 1000 - _targetVolumeL) * 1000;

        _unit setVariable [QKATGVAR(circulation,bodyFluid), [
            (_bodyFluid select 0) - (_deltaML / 2),
            (_bodyFluid select 1) - (_deltaML / 2),
            _bodyFluid select 2,
            _bodyFluid select 3,
            (_bodyFluid select 4) - _deltaML
        ], true];
    },
    {},
    _unit
] call zen_dialog_fnc_create;
