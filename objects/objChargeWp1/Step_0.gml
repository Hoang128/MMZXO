/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if ((level == 1) && (core.chargeWp1.Current >= core.chargeWp1.Max))
	level = 2;