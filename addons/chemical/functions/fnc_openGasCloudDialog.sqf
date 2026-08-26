#include "..\script_component.hpp"
/*
 * Author: Andx
 * Opens a ZEN dialog to configure a KAM gas cloud, then creates it at the given
 * position or on the given entity via KAM's chemical gas source system.
 *
 * Arguments:
 * 0: Position (ASL) <ARRAY>
 * 1: Hovered Entity <OBJECT> (objNull if none)
 *
 * Return Value:
 * None
 *
 * Example:
 * [_position, _hoveredEntity] call FUNC(openGasCloudDialog);
 *
 * Public: No
 */
params ["_position", "_hoveredEntity"];

private _isObject = _hoveredEntity isEqualType objNull && {!isNull _hoveredEntity};
private _source = [_position, _hoveredEntity] select _isObject;
private _radiusCenter = if (_isObject) then {_hoveredEntity} else {ASLToAGL _position};

private _content = [
    ["SLIDER:RADIUS", [KATLLSTRING(chemical,UI_max_range), LLSTRING(GasCloud_Radius_Tooltip)], [1, 100, 20, 0, _radiusCenter, [1, 0.6, 0, 1]]],
    ["COMBO", [KATLLSTRING(chemical,UI_gasType), LLSTRING(GasCloud_GasType_Tooltip)], [
        [0, 1, 2, 3, 4, 5],
        [
            [KATLLSTRING(chemical,Lvl0_Gas)],
            [KATLLSTRING(chemical,Lvl1_Gas)],
            [KATLLSTRING(chemical,Lvl2_Gas)],
            [KATLLSTRING(chemical,Lvl3_Gas)],
            [KATLLSTRING(chemical,Lvl4_Gas)],
            [KATLLSTRING(chemical,Lvl5_Gas)]
        ],
        1
    ]]
];

// Sealing only makes sense when the gas source is attached to an object;
// there is nothing to seal when it's just anchored to an open position.
if (_isObject) then {
    _content pushBack ["CHECKBOX", [KATLLSTRING(chemical,UI_sealable), LLSTRING(GasCloud_Sealable_Tooltip)], false];
};

[
    KATLLSTRING(chemical,GasModule_Displayname),
    _content,
    {
        params ["_values", "_source"];
        _values params ["_radius", "_gasLevel", ["_isSealable", false]];

        [QKATGVAR(chemical,addGasSource), [
            _source,
            _radius,
            _gasLevel,
            _source,
            {
                params ["_endTime"];
                CBA_missionTime < _endTime
            },
            [CBA_missionTime + 1e10],
            _isSealable
        ]] call CBA_fnc_serverEvent;
    },
    {},
    _source
] call zen_dialog_fnc_create;
