# airway

Bridges to KAM's [`kat_airway`](https://github.com/KAT-Advanced-Medical/KAM). Adds a **Manage Airway** ZEN right-click action (checkboxes for obstruction/occlusion) under the shared "KAM" category. The breathing half of KAM's Manage Airway Zeus module (pneumothorax, hemopneumothorax, tension pneumothorax, PaO2) lives in the `breathing` component's **Manage Breathing** action.

The dialog writes directly to KAM's own variables (`KATGVAR(airway,obstruction)`, `KATGVAR(airway,occluded)`) rather than going through a KAM function, since KAM's airway state is plain settable state with no side effects to replicate. The dialog title reuses KAM's own zeus-module string (`KATLLSTRING(zeus,manageAirway_Module_displayname)`) instead of duplicating the text in this mod's stringtable.
