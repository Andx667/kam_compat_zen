#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cba_main", "ace_main", "kat_main", "zen_main"};
        author = "Andx";
        authors[] = {"Andx"};
        url = "";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

class CfgMods {
    class PREFIX {
        dir = "@KAM_Compat_ZEN";
        name = COMPONENT_NAME;
        author = "Andx";
        authors[] = {"Andx"};
        actionName = "";
        action = "";
        overview = "Compatibility patch between KAT - Advanced Medical (KAM) and Zeus Enhanced (ZEN).";
        picture = "";
        logo = "";
        logoOver = "";
        tooltip = COMPONENT_NAME;
    };
};
