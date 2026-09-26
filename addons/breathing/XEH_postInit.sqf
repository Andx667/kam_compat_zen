#include "script_component.hpp"

// Executed on the unit's owner, see FUNC(manageBreathing)
[QGVAR(applyBreathing), {_this call FUNC(applyBreathing)}] call CBA_fnc_addEventHandler;
