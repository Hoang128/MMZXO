/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (instance_exists(core))
{
	x = core.x;
	y = core.y;
}
else
	instance_destroy();