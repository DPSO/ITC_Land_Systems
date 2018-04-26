/*
 * Author: Yax
 * Fired event for ITC Howitzers with fuzed shells
 */
params ["", "", "", "", "_ammo", "_magazine", "_projectile", "_gunner"];
if (!local _gunner) exitWith {};

_fuzeType = (vehicle _gunner) getVariable "fuzeType";
_fuzeValue = (vehicle _gunner) getVariable "fuzeSetting";

if(_fuzeType == "pd") exitWith {};

_fuzeMethods = [
  ["delay",itc_land_veh_weapons_fnc_fuzeDelay],
  ["time",itc_land_veh_weapons_fnc_fuzeTime],
  ["prox",itc_land_veh_weapons_fnc_fuzeProx]
];

_fuzeMethod = _fuzeMethods # (_fuzeMethods findIf {(_x # 0) == _fuzeType}) # 1;
[_fuzeMethod, 0, [_projectile, _magazine, getPosATL _projectile, _fuzeType, _fuzeValue, time,[0,0,0]]] call CBA_fnc_addPerFrameHandler;