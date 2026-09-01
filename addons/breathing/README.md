# breathing

Bridges to KAM's [`kat_breathing`](https://github.com/Tomcat-SG/KAM). Adds a **Set Pneumothorax Severity** ZEN right-click slider (0–4) under the shared "KAM" category.

Unlike `airway`, setting severity here isn't just a variable write: it has to reproduce the side effects of KAM's own pneumothorax progression, so it also calls KAM's `KATFUNC(circulation,updateBloodPressureChange)` for the blood-pressure penalty and ACE's `ACEFUNC(medical_status,adjustPainLevel)` for pain — matching what KAM's own manage-airway/zeus dialog does internally.
