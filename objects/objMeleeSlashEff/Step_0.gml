/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (image_alpha > 0)
{
	image_alpha -= fadeSpd * TIME_SCALE;
	image_xscale += scaleUpSpd * TIME_SCALE;
}
else
	instance_destroy();