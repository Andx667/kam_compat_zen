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
        url = "https://github.com/Andx667/kam_compat_zen";
        VERSION_CONFIG;
    };
};

#include "CfgContext.hpp"

class CfgMods {
    class PREFIX {
        dir = "@KAM_Compat_ZEN";
        name = "KAM Compat ZEN [Beta]";
        picture = "A3\Ui_f\data\Logos\arma3_expansion_alpha_ca";
        hidePicture = "true";
        hideName = "true";
        actionName = "Website";
        action = "https://github.com/Andx667/kam_compat_zen";
        description = "Compatibility patch between KAT - Advanced Medical (KAM) and Zeus Enhanced (ZEN).";
    };
};
