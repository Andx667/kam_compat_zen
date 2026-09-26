# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.1.0] - 2026-09-26

### Added

- Chemical: **Remove Gas Cloud** action, shown when the cursor is inside a gas cloud created by this mod or on the object one is attached to
- Breathing: hemopneumothorax, tension pneumothorax, deterioration trigger and PaO2 controls, matching KAM's own Manage Airway Zeus module

### Changed

- Breathing: "Set Pneumothorax Severity" is now **Manage Breathing** (the ZEN action ID is now `kcz_breathing_manageBreathing`)
- Removed the "[Beta]" label from the mod name, the CBA settings category and the Steam description
- Airway, circulation and misc now list `kat_zeus` in `requiredAddons`, since they use its strings and icon
- Documentation links point to KAM's current repository, `KAT-Advanced-Medical/KAM`

### Fixed

- Breathing: pain was never applied when the target unit was not local to the Zeus, e.g. AI on the server or other players, because ACE's `adjustPainLevel` only works on local units. The breathing state is now applied on the unit's owner
- Breathing: setting the pneumothorax severity to 0 no longer clears the blood pressure effect of a unit that still has hemopneumothorax or tension pneumothorax
- Airway, breathing and circulation dialogs now show the target unit's current state instead of the values last confirmed for a different unit
- Chemical: gas clouds created from the context menu could never be removed and clouds attached to a deleted object were never cleaned up

## [1.0.0] - 2026-09-08

### Added

- Initial release: ZEN right-click context menu actions bridging to KAM, nested under a shared "KAM" category
  - Chemical: Create Gas Cloud (radius, gas type, sealable)
  - Circulation: Change Blood Type / Volume, Set Cardiac State
  - Misc: Enable / Disable AI Death Prevention
  - Breathing: Set Pneumothorax Severity
  - Airway: Manage Airway (obstruction / occlusion)

[Unreleased]: https://github.com/Andx667/kam_compat_zen/compare/v1.1.0...HEAD
[1.1.0]: https://github.com/Andx667/kam_compat_zen/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/Andx667/kam_compat_zen/releases/tag/v1.0.0
