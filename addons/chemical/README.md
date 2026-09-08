# chemical

Bridges to KAM's [`kat_chemical`](https://github.com/Tomcat-SG/KAM). Adds a **Create Gas Cloud** ZEN right-click action (radius/gas-type/sealable dialog) under the shared "KAM" category, available on both units and empty positions/objects.

Creation goes through KAM's own networked gas source system (`KATGVAR(chemical,addGasSource)` via `CBA_fnc_serverEvent`), not a locally set variable, since gas sources are server-authoritative in KAM. The **Sealable** checkbox only appears when the source is attached to an object — sealing has no meaning for a gas cloud anchored to open terrain.
