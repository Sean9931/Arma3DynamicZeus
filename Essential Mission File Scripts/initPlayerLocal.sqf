// Do after Loading into game fully
onPreloadFinished 
{

	// Saving Loadout on initial spawn
	[player, [localNamespace, "respawn_Loadout"]] call BIS_fnc_saveInventory;

	// Welcome message when opening vanilla Arsenal
	[missionnamespace,"arsenalOpened", {
		cuttext [format ["Welcome %1, your role is: %2.",profileNameSteam ,getText(configFile >> "CfgVehicles" >> (typeOf player) >> "displayName")],"PLAIN", 3];
	}] call bis_fnc_addScriptedEventhandler;

	// Welcome message when opening ace Arsenal
	["ace_arsenal_displayOpened", {
		cuttext [format ["Welcome %1, your role is: %2.",profileNameSteam ,getText(configFile >> "CfgVehicles" >> (typeOf player) >> "displayName")],"PLAIN", 3];
	}] call CBA_fnc_addEventHandler;

	// Saving Loadout on vanilla arsenal exit
	[missionnamespace, "arsenalClosed", {
		waitUntil {time > 0.2};
		[player, [missionNamespace, "respawn_Loadout"]] call BIS_fnc_saveInventory;
		titletext ["Arsenal loadout saved.", "PLAIN DOWN"];
	}] call bis_fnc_addScriptedEventhandler;

	// Saving Loadout on ace arsenal exit
	["ace_arsenal_displayClosed", {
		waitUntil {time > 0.2};
		[player, [missionNamespace, "respawn_Loadout"]] call BIS_fnc_saveInventory;
		titletext ["Arsenal loadout saved.", "PLAIN DOWN"];
	}] call CBA_fnc_addEventHandler;
};