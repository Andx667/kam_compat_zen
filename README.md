# KAM Compat ZEN

![KAM Compat ZEN Logo](https://github.com/Andx667/kam_compat_zen/blob/main/img/icon.png)

<p align="center">
    <a href="https://github.com/Andx667/kam_compat_zen/issues">
        <img src="https://img.shields.io/github/issues-raw/Andx667/kam_compat_zen.svg?style=flat-square&label=Issues" alt="KAM Compat ZEN Issues">
    </a>
    <a href="https://steamcommunity.com/sharedfiles/filedetails/?id=3790323793">
        <img src="https://img.shields.io/steam/downloads/3790323793.svg?style=flat-square&label=Downloads" alt="KAM Compat ZEN Downloads">
    </a>
    <a href="https://github.com/Andx667/kam_compat_zen/blob/main/LICENSE">
        <img src="https://img.shields.io/badge/License-MIT-blue?style=flat-square" alt="KAM Compat ZEN License">
    </a>
    <br>
    <img src="https://img.shields.io/github/actions/workflow/status/Andx667/kam_compat_zen/ci.yml?style=flat-square&label=CI" alt="CI">
</p>

__Requires__ [CBA_A3](https://github.com/CBATeam/CBA_A3), [ACE3](https://github.com/acemod/ACE3), [KAT - Advanced Medical (KAM)](https://github.com/Tomcat-SG/KAM), and [Zeus Enhanced (ZEN)](https://github.com/zen-mod/ZEN).

__KAM Compat ZEN__ (KCZ) bridges KAT - Advanced Medical into Zeus Enhanced, adding right-click context menu actions for KAM's medical systems.

The project is entirely __open-source__ and any contributions are welcome.

Steam Workshop: <https://steamcommunity.com/sharedfiles/filedetails/?id=3790323793>
Discord: <https://discord.gg/ag4v6kxYAa>

## Features

Addons that add ZEN right-click context menu actions are named after the KAM component they bridge to, and nest their entries under a shared "KAM" category (defined once in `addons/main`).

- `addons/chemical` — bridges to KAM's `kat_chemical`. Currently implements: **Create Gas Cloud** (radius/gas type/sealable dialog, wired to KAM's gas source system).
- `addons/circulation` — bridges to KAM's `kat_circulation`. Currently implements: **Change Blood Type / Volume** and **Set Cardiac State** (combo/slider dialogs, right-click a unit).
- `addons/misc` — bridges to KAM's `kat_misc`. Currently implements: **Enable/Disable AI Death Prevention** (explicit-state actions, right-click an AI unit).
- `addons/breathing` — bridges to KAM's `kat_breathing`. Currently implements: **Set Pneumothorax Severity** (slider dialog, right-click a unit).
- `addons/airway` — bridges to KAM's `kat_airway`. Currently implements: **Manage Airway** (obstruction/occlusion checkboxes, right-click a unit).

Each of these addons has its own CBA setting (`Enable ZEN ... Action`) to hide its context menu entry.

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

## Contributing

For new contributors, see the [Contributing Setup & Guidelines](./.github/CONTRIBUTING.md).

## License

KAM Compat ZEN is licensed under [MIT](./LICENSE).
