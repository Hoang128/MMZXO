/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

physic.enable = 0;

if (!instance_exists(objBlockThinManager))
{
	instance_create_depth(x, y, depth, objBlockThinManager);
}