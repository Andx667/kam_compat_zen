# KAM Compat ZEN

A compatibility patch between [KAT - Advanced Medical (KAM)](https://github.com/Tomcat-SG/KAM) and [Zeus Enhanced (ZEN)](https://github.com/zen-mod/ZEN) for Arma 3.

## Status

Addons that add ZEN right-click context menu actions are named after the KAM component they bridge to, and nest their entries under a shared "KAM" category (defined once in `addons/main`).

- `addons/chemical` — bridges to KAM's `kat_chemical`. Currently implements: **Create Gas Cloud** (radius/gas type/sealable dialog, wired to KAM's gas source system).

## Dependencies

- [CBA_A3](https://github.com/CBATeam/CBA_A3)
- [ACE3](https://github.com/acemod/ACE3)
- [KAT - Advanced Medical (KAM)](https://github.com/Tomcat-SG/KAM)
- [Zeus Enhanced (ZEN)](https://github.com/zen-mod/ZEN)

## Project layout

- `addons/main` — mod metadata, versioning, shared macro includes (`KATFUNC`/`KATGVAR`-style macros for referencing KAM's functions and variables), and the shared ZEN context menu "KAM" category
- `addons/common` — shared functions used by other components
- `addons/<kam_component>` (e.g. `addons/chemical`) — ZEN context menu actions that bridge to the matching KAM component, named to match it 1:1
- `include/x/cba` — vendored copies of CBA's public macro headers (`script_macros_common.hpp`, `script_xeh.hpp`), so the project builds without a live CBA checkout linked into the P: drive
- `include/z/ace` — vendored copy of ACE3's `medical_engine` macro header (`script_macros_medical.hpp`), needed since KAM extends ACE's medical system with the same macro/variable conventions

## Building

Requires [HEMTT](https://hemtt.dev/).

```
hemtt check   # lint/validate without a full build
hemtt build   # local dev build
hemtt release # release build
```

## License

See [LICENSE](LICENSE).
