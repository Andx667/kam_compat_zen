# KAM Compat ZEN

A compatibility patch between [KAT - Advanced Medical (KAM)](https://github.com/Tomcat-SG/KAM) and [Zeus Enhanced (ZEN)](https://github.com/zen-mod/ZEN) for Arma 3.

## Status

Addons that add ZEN right-click context menu actions are named after the KAM component they bridge to, and nest their entries under a shared "KAM" category (defined once in `addons/main`).

- `addons/chemical` — bridges to KAM's `kat_chemical`. Currently implements: **Create Gas Cloud** (radius/gas type/sealable dialog, wired to KAM's gas source system).
- `addons/circulation` — bridges to KAM's `kat_circulation`. Currently implements: **Change Blood Type / Volume** and **Set Cardiac State** (combo/slider dialogs, right-click a unit).
- `addons/misc` — bridges to KAM's `kat_misc`. Currently implements: **Enable/Disable AI Death Prevention** (explicit-state actions, right-click an AI unit).
- `addons/breathing` — bridges to KAM's `kat_breathing`. Currently implements: **Set Pneumothorax Severity** (slider dialog, right-click a unit).
- `addons/airway` — bridges to KAM's `kat_airway`. Currently implements: **Manage Airway** (obstruction/occlusion checkboxes, right-click a unit).

Each of these addons has its own CBA setting (`Enable ZEN ... Action`) to hide its context menu entry.

## Dependencies

- [CBA_A3](https://github.com/CBATeam/CBA_A3)
- [ACE3](https://github.com/acemod/ACE3)
- [KAT - Advanced Medical (KAM)](https://github.com/Tomcat-SG/KAM)
- [Zeus Enhanced (ZEN)](https://github.com/zen-mod/ZEN)

## Project layout

- `addons/main` — mod metadata, versioning, shared macro includes (`KATFUNC`/`KATGVAR`-style macros for referencing KAM's functions and variables), and the shared ZEN context menu "KAM" category
- `addons/common` — shared functions used by other components
- `addons/<kam_component>` (e.g. `addons/chemical`) — ZEN context menu actions that bridge to the matching KAM component, named to match it 1:1

## Building

Requires [HEMTT](https://hemtt.dev/).

```
hemtt check   # lint/validate without a full build
hemtt build   # local dev build
hemtt release # release build
```

## License

See [LICENSE](LICENSE).
