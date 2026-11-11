class zen_context_menu_actions {
    class KAM_MENU_CATEGORY {
        class GVAR(gasCloud) {
            displayName = KATCSTRING(chemical,GasModule_Displayname);
            icon = QKATPATHTOF(chemical,ui\Gasmask_icon.paa);
            condition = QUOTE(GVAR(enableZenActions) && {!(KAM_HOVERED_UNIT)});
            statement = QUOTE([ARR_2(_position,_hoveredEntity)] call FUNC(openGasCloudDialog));
        };
        class GVAR(removeGasCloud) {
            displayName = CSTRING(RemoveGasCloud_DisplayName);
            icon = QKATPATHTOF(chemical,ui\Gasmask_icon.paa);
            condition = QUOTE(GVAR(enableZenActions) && {([ARR_2(_position,_hoveredEntity)] call FUNC(getGasCloudsAt)) isNotEqualTo []});
            statement = QUOTE([ARR_2(_position,_hoveredEntity)] call FUNC(removeGasCloudsAt));
        };
        class GVAR(decontaminate) {
            displayName = KATCSTRING(chemical,UseDecon);
            icon = QKATPATHTOF(chemical,ui\icon_deconkit.paa);
            condition = QUOTE(GVAR(enableZenActions) && {KAM_HOVERED_UNIT} && {alive _hoveredEntity} && {(_hoveredEntity getVariable [ARR_2('KATGVAR(chemical,chemicalContamination)','')]) != ''});
            statement = QUOTE([_hoveredEntity] call FUNC(decontaminate));
        };
    };
};
