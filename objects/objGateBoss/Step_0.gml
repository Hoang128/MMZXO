/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!inited)
{
	if (place_meeting(x, y, objLockCamZoneBoss))
	{
		bossZone = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, objLockCamZoneBoss, false, false);
	}
	inited = true;
}