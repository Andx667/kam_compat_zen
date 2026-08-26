class zen_context_menu_actions {
    class KAM_MENU_CATEGORY {
        class GVAR(pneumothorax) {
            displayName = CSTRING(Pneumothorax_DisplayName);
            icon = QACEPATHTOF(medical_gui,data\categories\advanced_treatment.paa);
            condition = QUOTE(GVAR(enableZenActions) && {_hoveredEntity isEqualType objNull} && {_hoveredEntity isKindOf 'CAManBase'});
            statement = QUOTE([_hoveredEntity] call FUNC(setPneumothorax));
        };
    };
};
