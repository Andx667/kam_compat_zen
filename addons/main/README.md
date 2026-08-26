# main

Mod metadata, versioning, and the shared macro/include layer the other addons build on. No gameplay logic of its own.

Provides:
- `KATFUNC`/`KATGVAR`/`KATLSTRING` macros ([script_macros.hpp](script_macros.hpp)) for referencing [KAM](https://github.com/Tomcat-SG/KAM)'s functions, variables, and stringtable entries without duplicating them, plus the equivalent `ACEFUNC`/`ACEGVAR` macros for ACE3.
- `KAM_MENU_CATEGORY` — the single ZEN context-menu category every other addon nests its actions under, so they all appear grouped as one "KAM" entry.

**Important:** `KAM_MENU_CATEGORY` must resolve to the exact same class name in every addon's `CfgContext.hpp` (it's not component-derived like the other macros) — otherwise ZEN creates a separate category per addon instead of merging them.
