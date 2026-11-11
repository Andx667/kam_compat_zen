#include "..\script_component.hpp"
/*
 * Author: Andx
 * Clears a unit's skin contamination (mustard, VX) through KAM's own decontamination
 * function, the same one KAM's Decontaminate treatment calls, and tells the Zeus.
 *
 * KAM's function only writes global variables, so it can run on the Zeus machine.
 * It does not touch injuries already caused by the contamination.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_hoveredEntity] call FUNC(decontaminate);
 *
 * Public: No
 */
params ["_unit"];

[objNull, _unit] call KATFUNC(chemical,clearContamination);

[objNull, LLSTRING(Decontaminate_Done)] call BIS_fnc_showCuratorFeedbackMessage;
