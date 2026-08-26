# KAM Compat ZEN

A compatibility patch between [KAT - Advanced Medical (KAM)](https://github.com/Tomcat-SG/KAM) and [Zeus Enhanced (ZEN)](https://github.com/zen-mod/ZEN) for Arma 3.

## Status

Scaffolding only — no gameplay changes yet.

## Dependencies

- [CBA_A3](https://github.com/CBATeam/CBA_A3)
- [ACE3](https://github.com/acemod/ACE3)
- [KAT - Advanced Medical (KAM)](https://github.com/Tomcat-SG/KAM)
- [Zeus Enhanced (ZEN)](https://github.com/zen-mod/ZEN)

## Project layout

- `addons/main` — mod metadata, versioning, and shared macro includes
- `addons/common` — shared functions used by other components
- `include/x/cba` — vendored copies of CBA's public macro headers (`script_macros_common.hpp`, `script_xeh.hpp`), so the project builds without a live CBA checkout linked into the P: drive

## Building

Requires [HEMTT](https://hemtt.dev/).

```
hemtt check   # lint/validate without a full build
hemtt build   # local dev build
hemtt release # release build
```

## License

See [LICENSE](LICENSE).
