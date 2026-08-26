class zen_context_menu_actions {
    class KAM_MENU_CATEGORY {
        class GVAR(gasCloud) {
            displayName = KATCSTRING(chemical,GasModule_Displayname);
            icon = QKATPATHTOF(chemical,ui\Gasmask_icon.paa);
            condition = QUOTE(GVAR(enableZenActions));
            statement = QUOTE([ARR_2(_position,_hoveredEntity)] call FUNC(openGasCloudDialog));
        };
    };
};
