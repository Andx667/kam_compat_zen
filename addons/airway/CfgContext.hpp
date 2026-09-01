class zen_context_menu_actions {
    class KAM_MENU_CATEGORY {
        class GVAR(manageAirway) {
            displayName = KATCSTRING(zeus,manageAirway_Module_displayname);
            icon = QACEPATHTOF(medical_gui,data\categories\airway_management.paa);
            condition = QUOTE(GVAR(enableZenActions) && {KAM_HOVERED_UNIT});
            statement = QUOTE([_hoveredEntity] call FUNC(manageAirway));
        };
    };
};
