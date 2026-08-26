#include "..\script_component.hpp"
/*
 * Author: Andx
 * Registers a component's "Enable ZEN ... Actions" CBA checkbox setting.
 * Shared so every kcz_* component doesn't duplicate the same CBA_fnc_addSetting
 * call shape with only the strings/setting name differing.
 *
 * Arguments:
 * 0: Setting name <STRING> (e.g. QGVAR(enableZenActions) from the calling component)
 * 1: Display name <STRING>
 * 2: Description <STRING>
 * 3: Component name <STRING> (e.g. COMPONENT_NAME from the calling component)
 *
 * Return Value:
 * None
 *
 * Example:
 * [QGVAR(enableZenActions), LLSTRING(Setting_EnableZenActions_DisplayName), LLSTRING(Setting_EnableZenActions_Description), COMPONENT_NAME] call EFUNC(common,addEnableZenActionsSetting);
 *
 * Public: Yes
 */
params ["_settingName", "_displayName", "_description", "_componentName"];

[
    _settingName,
    "CHECKBOX",
    [_displayName, _description],
    _componentName,
    [true],
    false
] call CBA_fnc_addSetting;
