#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "cba_main",
            "kcz_main",
            "ace_main",
            "kat_main",
            "kat_airway",
            "zen_main",
            "zen_context_menu",
            "zen_dialog"
        };
        author = "Andx";
        authors[] = {"Andx"};
        url = "";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgContext.hpp"
