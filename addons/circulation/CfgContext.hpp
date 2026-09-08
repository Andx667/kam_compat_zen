class zen_context_menu_actions {
    class KAM_MENU_CATEGORY {
        class GVAR(bloodType) {
            displayName = KATCSTRING(zeus,bloodType_Module_displayname);
            icon = QACEPATHTOF(medical_feedback,data\bloodVolume_1.paa);
            condition = QUOTE(GVAR(enableZenActions) && {KAM_HOVERED_UNIT});
            statement = QUOTE([_hoveredEntity] call FUNC(changeBloodType));
        };
        class GVAR(cardiacState) {
            displayName = KATCSTRING(zeus,CardiacState_Module_displayname);
            icon = QACEPATHTOF(medical_gui,data\categories\advanced_treatment.paa);
            condition = QUOTE(GVAR(enableZenActions) && {KAM_HOVERED_UNIT});
            statement = QUOTE([_hoveredEntity] call FUNC(setCardiacState));
        };
    };
};
