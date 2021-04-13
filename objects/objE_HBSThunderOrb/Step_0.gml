/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (place_meeting(x + moveSpd * TIME_SCALE * image_xscale, y, objBlock))
{
	instance_destroy();
}
else
{
	x += moveSpd * TIME_SCALE * image_xscale;
}