class zen_context_menu_actions {
    class KAM_MENU_CATEGORY {
        class GVAR(bloodType) {
            displayName = CSTRING(BloodType_DisplayName);
            icon = QACEPATHTOF(medical_feedback,data\bloodVolume_1.paa);
            condition = QUOTE(GVAR(enableZenActions) && {_hoveredEntity isEqualType objNull} && {_hoveredEntity isKindOf 'CAManBase'});
            statement = QUOTE([_hoveredEntity] call FUNC(changeBloodType));
        };
    };
};
