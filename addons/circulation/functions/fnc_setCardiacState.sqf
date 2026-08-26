#include "..\script_component.hpp"
/*
 * Author: Andx
 * Opens a ZEN dialog to set a unit's KAM cardiac arrest state.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_hoveredEntity] call FUNC(setCardiacState);
 *
 * Public: No
 */
params ["_unit"];

private _currentState = _unit getVariable [QKATGVAR(circulation,cardiacArrestType), 0];

[
    KATLLSTRING(zeus,CardiacState_Module_displayname),
    [
        ["COMBO", [LLSTRING(CardiacState_Label), LLSTRING(CardiacState_Tooltip)], [
            [0, 1, 2, 3, 4],
            [
                [LLSTRING(CardiacState_Normal)],
                [LLSTRING(CardiacState_Asystole)],
                [LLSTRING(CardiacState_PEA)],
                [LLSTRING(CardiacState_VF)],
                [LLSTRING(CardiacState_VT)]
            ],
            _currentState
        ]]
    ],
    {
        params ["_values", "_unit"];
        _values params ["_state"];

        private _currentState = _unit getVariable [QKATGVAR(circulation,cardiacArrestType), 0];
        _unit setVariable [QKATGVAR(circulation,cardiacArrestType), _state, true];

        // Matches KAM's own zeus cardiac state module: resuming normal rhythm signals
        // CPR success, while entering arrest from normal rhythm signals a new arrest.
        if (_state isEqualTo 0) then {
            [QACEGVAR(medical,CPRSucceeded), [_unit], _unit] call CBA_fnc_targetEvent;
        } else {
            if (_currentState isEqualTo 0) then {
                [QACEGVAR(medical,FatalVitals), [_unit], _unit] call CBA_fnc_targetEvent;
            };
        };
    },
    {},
    _unit
] call zen_dialog_fnc_create;
