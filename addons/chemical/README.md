# chemical

Bridges to KAM's [`kat_chemical`](https://github.com/KAT-Advanced-Medical/KAM). Adds two ZEN right-click actions under the shared "KAM" category:

- **Create Gas Cloud** — radius/gas-type/sealable dialog, available on empty positions and on non-unit objects.
- **Remove Gas Cloud** — appears when the cursor is inside a cloud created by this mod, or on the object one is attached to, and removes those clouds.

Creation goes through KAM's own networked gas source system (`KATGVAR(chemical,addGasSource)` via `CBA_fnc_serverEvent`), not a locally set variable, since gas sources are server-authoritative in KAM. The **Sealable** checkbox only appears when the source is attached to an object — sealing has no meaning for a gas cloud anchored to open terrain.

KAM ties the lifetime of its own Zeus gas clouds to the module that placed them, so a Zeus removes one by deleting the module. There is no module here, so the server keeps a small registry of the clouds this mod created (`FUNC(createGasCloud)`), keyed by an ID that is also the KAM gas source key. A cloud ends when it is removed from that registry, when its object is deleted, or when KAM's seal action removes it. The registry is published to clients so the context menu can tell which clouds are under the cursor. Only clouds created by this mod are tracked: clouds from KAM's own module or from mortars, grenades and other munitions are not affected by **Remove Gas Cloud**.

Using **Create Gas Cloud** again on the same object replaces that object's cloud; positions always create a new one.
