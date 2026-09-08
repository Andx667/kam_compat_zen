# circulation

Bridges to KAM's [`kat_circulation`](https://github.com/Tomcat-SG/KAM). Adds two ZEN right-click actions under the shared "KAM" category:

- **Change Blood Type / Volume** — combo + slider. Changing volume manually reproduces KAM's `REDUCE_TOTAL_BLOOD_VOLUME` macro behavior (splitting the delta between the ECB/ECP compartments) since that logic isn't exposed as a callable KAM function.
- **Set Cardiac State** — combo over KAM's arrest types (normal/asystole/PEA/VF/VT). Transitioning to/from normal rhythm fires ACE's `CPRSucceeded`/`FatalVitals` target events, matching what KAM's own zeus cardiac-state module does so ACE's medical state stays in sync.
