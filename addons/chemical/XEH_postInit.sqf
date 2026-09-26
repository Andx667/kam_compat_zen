#include "script_component.hpp"

if (!isServer) exitWith {};

// Gas clouds created from the Zeus context menu, as ID -> [source, radius]. See FUNC(createGasCloud)
GVAR(clouds) = createHashMap;
GVAR(cloudCount) = 0;

[QGVAR(createCloud), {_this call FUNC(createGasCloud)}] call CBA_fnc_addEventHandler;
[QGVAR(deleteClouds), {_this call FUNC(deleteGasClouds)}] call CBA_fnc_addEventHandler;

// KAM's seal action removes a gas source by its key, so a sealed cloud has to leave the registry too
[QKATGVAR(chemical,removeGasSource), {
    params ["_key"];

    if !(_key isEqualType "" && {_key in GVAR(clouds)}) exitWith {};

    GVAR(clouds) deleteAt _key;
    call FUNC(publishGasClouds);
}] call CBA_fnc_addEventHandler;
