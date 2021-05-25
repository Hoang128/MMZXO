/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if (instance_exists(objUICharSelectMenu))
{
	objUICharSelectMenu.phase = 1;
}
else
{
	instance_create_depth(x, y, depth, objUIActionMenu);
}