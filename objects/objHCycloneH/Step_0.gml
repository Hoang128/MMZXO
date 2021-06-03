/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

fncStaticDestroyOutScreen(self);

if (!inited)
{
	if (direction == 0)
		image_angle = 270;
	else if (direction == 180)
		image_angle = 90;
	inited = true;
}

motion_set(direction, moveSpd * TIME_SCALE);
accSpd*=1.1;
moveSpd += accSpd;