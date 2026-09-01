# misc

Bridges to KAM's [`kat_misc`](https://github.com/Tomcat-SG/KAM). Adds **Enable/Disable AI Death Prevention** ZEN right-click actions (on non-player, alive units) under the shared "KAM" category, toggling KAM's `KATGVAR(misc,PreventInstantAIDeath)` flag.

Enable and disable are two separate menu entries rather than one toggle — each one's ZEN `condition` checks the unit's current flag state, so only the applicable action ever shows up in the context menu.
