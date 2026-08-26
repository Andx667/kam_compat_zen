# common

Shared functions used by other addons in this mod, called via CBA's `EFUNC(common,...)` cross-component macro.

- `addEnableZenActionsSetting` — registers a component's "Enable ZEN ... Actions" CBA checkbox setting. Every bridge addon (`airway`, `breathing`, `chemical`, `circulation`, `misc`) had an identical `CBA_fnc_addSetting` block differing only in the setting name and strings, so it was factored out here.

Addons calling into `common` must depend on `kcz_common` (and list it before their own preInit runs) so the shared function is compiled before it's called.
