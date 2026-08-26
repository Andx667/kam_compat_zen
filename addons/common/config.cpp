#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cba_main", "ace_main", "kcz_main", "zen_main"};
        author = "Andx";
        authors[] = {"Andx"};
        url = "";
        VERSION_CONFIG;
    };
};
