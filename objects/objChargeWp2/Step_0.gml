/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if (instance_exists(core))
{
	if ((level == 1) && (core.chargeWp2.Current >= core.chargeWp2.Max))
		level = 2;
}