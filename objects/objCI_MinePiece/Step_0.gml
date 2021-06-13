/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (place_meeting(x, y, objBlock))
{
	instance_destroy();
}

motion_set(moveDir, moveSpd * TIME_SCALE);