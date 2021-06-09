/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

fncStaticDestroyOutScreen(self);

if (!inited)
{
	direction = 90 - (90 - moveDir) * image_xscale;
	image_angle = moveDir * image_xscale;
	inited = true;
}

motion_set(direction, moveSpd * TIME_SCALE);