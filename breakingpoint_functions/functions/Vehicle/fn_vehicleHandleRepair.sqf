/*
	Breaking Point Mod for Arma 3

	Released under Arma Public Share Like Licence (APL-SA)
	https://www.bistudio.com/community/licenses/arma-public-license-share-alike

	Alderon Games Pty Ltd
*/

params ["_vehicle","_hitpoint","_damage"];

["vehicleHandleRepair: Vehicle: %1 | Hitpoint: %2 | Damage: %3",_vehicle,_hitpoint,_damage] call BP_fnc_debugConsoleFormat;

// Valid Vehicle
if (isNull _vehicle) exitWith {};

// Repairing doesn't work on remote vehicles
if (!local _vehicle) exitWith {};

// Repair HitPoint
_vehicle setHitPointDamage [_hitpoint,_damage];

// Set Hit Points Damage Values Back
_hitpoints = _vehicle call BP_fnc_vehicleHitpointsDmg;
{ _vehicle setHitPointDamage [(_x select 0),(_x select 1)]; } count _hitpoints;

// Bump Vehicle to Sync It Over Network
_vehicle setVelocity [0,0,1];