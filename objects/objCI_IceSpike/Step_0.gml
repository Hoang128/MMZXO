/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
fncStaticDestroyOutScreen(self);
if (destroyColWallTime > 0)
{
	destroyColWallTime -= TIME_SCALE;
}
else
{
	if (place_meeting(x, y, objBlock))
		instance_destroy();
}
motion_set(90 - image_xscale * (90 - moveDir), moveSpd * TIME_SCALE);