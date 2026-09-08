#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cba_main", "ace_main", "kat_main", "zen_main", "zen_context_menu"};
        author = "Andx";
        authors[] = {"Andx"};
        url = "";
        VERSION_CONFIG;
    };
};

#include "CfgContext.hpp"

class CfgMods {
    class PREFIX {
        dir = "@KAM_Compat_ZEN";
        name = COMPONENT_NAME;
        author = "Andx";
        authors[] = {"Andx"};
        actionName = "";
        action = "";
        overview = "Compatibility patch between KAT - Advanced Medical (KAM) and Zeus Enhanced (ZEN).";
        picture = "\z\kcz\addons\main\data\logo_ca.paa";
        logo = "\z\kcz\addons\main\data\logo_ca.paa";
        logoOver = "\z\kcz\addons\main\data\logo_ca.paa";
        tooltip = COMPONENT_NAME;
    };
};
