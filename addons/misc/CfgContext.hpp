class zen_context_menu_actions {
    class KAM_MENU_CATEGORY {
        class GVAR(enableAiDeathPrevention) {
            displayName = CSTRING(EnableAiDeathPrevention_DisplayName);
            icon = QKATPATHTOF(zeus,ui\Icon_Module_Zeus_Prevent_AI_Death.paa);
            condition = QUOTE(GVAR(enableZenActions) && {_hoveredEntity isEqualType objNull} && {_hoveredEntity isKindOf 'CAManBase'} && {alive _hoveredEntity} && {!isPlayer _hoveredEntity} && {!(_hoveredEntity getVariable [ARR_2('KATGVAR(misc,PreventInstantAIDeath)',false)])});
            statement = QUOTE([ARR_2(_hoveredEntity,true)] call FUNC(setAiDeathPrevention));
        };
        class GVAR(disableAiDeathPrevention) {
            displayName = CSTRING(DisableAiDeathPrevention_DisplayName);
            icon = QKATPATHTOF(zeus,ui\Icon_Module_Zeus_Prevent_AI_Death.paa);
            condition = QUOTE(GVAR(enableZenActions) && {_hoveredEntity isEqualType objNull} && {_hoveredEntity isKindOf 'CAManBase'} && {alive _hoveredEntity} && {!isPlayer _hoveredEntity} && {_hoveredEntity getVariable [ARR_2('KATGVAR(misc,PreventInstantAIDeath)',false)]});
            statement = QUOTE([ARR_2(_hoveredEntity,false)] call FUNC(setAiDeathPrevention));
        };
    };
};
