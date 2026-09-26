# breathing

Bridges to KAM's [`kat_breathing`](https://github.com/KAT-Advanced-Medical/KAM). Adds a **Manage Breathing** ZEN right-click dialog under the shared "KAM" category: pneumothorax severity (0–4), a trigger to start its deterioration, hemopneumothorax, tension pneumothorax, and PaO2. Together with the `airway` component's **Manage Airway** action this covers everything KAM's own Manage Airway Zeus module does.

Unlike `airway`, this isn't just variable writes: it has to reproduce the side effects of KAM's own pneumothorax progression, so it also calls KAM's `KATFUNC(circulation,updateBloodPressureChange)` for the blood-pressure penalty, `KATFUNC(circulation,updateInternalBleeding)` for hemopneumothorax bleeding, `KATFUNC(breathing,handlePneumothoraxDeterioration)`, and ACE's `ACEFUNC(medical_status,adjustPainLevel)` for pain — matching what KAM's own manage-airway/zeus dialog does internally.

The dialog only collects the values. They are applied by `FUNC(applyBreathing)` on the unit's owner (via `CBA_fnc_targetEvent`), because `adjustPainLevel` and the deterioration handler only work on local units, and so the blood gas array is updated from the unit's live value rather than a stale copy on the Zeus machine. Hemopneumothorax and tension pneumothorax force the severity to 4, as KAM does when a unit develops them.
