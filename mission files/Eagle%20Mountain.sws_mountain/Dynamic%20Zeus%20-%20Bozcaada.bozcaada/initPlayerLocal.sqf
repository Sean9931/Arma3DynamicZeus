// Do after Loading into game fully
onPreloadFinished 
{

	// Saving Loadout on initial spawn
	[player, [localNamespace, "respawn_Loadout"]] call BIS_fnc_saveInventory;

	// Saving Loadout on vanilla arsenal exit
	[missionNamespace, "arsenalClosed", {
		[player, [localNamespace, "respawn_Loadout"]] call BIS_fnc_saveInventory;
	}] call BIS_fnc_addScriptedEventHandler;

	// Saving Loadout on ace arsenal exit
	["ace_arsenal_displayClosed", {
		[player, [localNamespace, "respawn_Loadout"]] call BIS_fnc_saveInventory;
	}] call CBA_fnc_addEventHandler;
};