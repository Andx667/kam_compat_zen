#include "..\script_component.hpp"
/*
 * Author: Andx
 * Applies a breathing state chosen in the Manage Breathing dialog to a unit. Mirrors the
 * breathing half of KAM's Manage Airway Zeus module, but runs on the unit's owner: ACE's
 * adjustPainLevel and KAM's pneumothorax deterioration only work on local units, and the
 * blood gas array is read-modify-written here rather than from a possibly stale copy on the
 * Zeus machine.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Pneumothorax severity (0-4) <NUMBER>
 * 2: Start pneumothorax deterioration <BOOL>
 * 3: Hemopneumothorax <BOOL>
 * 4: Tension pneumothorax <BOOL>
 * 5: PaO2 <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit, 2, false, false, false, 90] call kcz_breathing_fnc_applyBreathing;
 *
 * Public: No
 */
params ["_unit", "_severity", "_deteriorate", "_hemopneumothorax", "_tensionPneumothorax", "_paO2"];

private _advanced = _hemopneumothorax || {_tensionPneumothorax};

// Advanced pneumothorax always presents as severity 4, the way KAM's own
// inflictAdvancedPneumothorax sets it. This also keeps severity 0 from ever clearing the
// blood pressure effect of a unit that still has one of the advanced flags set.
if (_advanced) then {
    _severity = 4;
};

_unit setVariable [QKATGVAR(breathing,pneumothorax), _severity, true];
_unit setVariable [QKATGVAR(breathing,hemopneumothorax), _hemopneumothorax, true];
_unit setVariable [QKATGVAR(breathing,tensionpneumothorax), _tensionPneumothorax, true];

// Blood pressure penalty and pain scale with severity, same as KAM's pneumothorax progression
if (_severity == 0) then {
    [_unit, 0, 0, "ptx_tension", true] call KATFUNC(circulation,updateBloodPressureChange);
} else {
    [_unit, -12 * _severity, -12 * _severity, "ptx_tension", true] call KATFUNC(circulation,updateBloodPressureChange);
    [_unit, 0.5 * (_severity / 4)] call ACEFUNC(medical_status,adjustPainLevel);
};

// Only write the blood gas back when the value was actually changed, so that confirming the
// dialog doesn't round the unit's live PaO2 to a whole number
// [PaCO2, PaO2, O2Sat, HCO3, pH, EtCO2] - matches KAM's kat_main DEFAULT_BLOOD_GAS
private _bloodGas = +(_unit getVariable [QKATGVAR(circulation,bloodGas), [40, 90, 0.96, 24, 7.4, 37]]);

if (round (_bloodGas select 1) != _paO2) then {
    _bloodGas set [1, _paO2];
    _unit setVariable [QKATGVAR(circulation,bloodGas), _bloodGas, true];
};

// Deterioration only applies to a plain pneumothorax that hasn't advanced yet
if (_deteriorate && {_severity > 0} && {!_advanced}) then {
    [_unit, 0] call KATFUNC(breathing,handlePneumothoraxDeterioration);
};

// Hemopneumothorax causes internal bleeding
[_unit] call KATFUNC(circulation,updateInternalBleeding);
