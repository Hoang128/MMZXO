/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

core = noone;
dir = {x : 0, y : 0};

function fncCanBlockWeapon(weapon)
{
	if (weapon.x <= core.bbox_left)
	{
		if (weapon.x <= bbox_left)
		{
			if ((core.bbox_right >= bbox_right) && (core.bbox_left > bbox_left))
				return true;
		}
	}
	
	if (weapon.x >= core.bbox_right)
	{
		if (weapon.x >= bbox_right)
		{
			if ((core.bbox_left <= bbox_left) && (core.bbox_right < bbox_right))
				return true;
		}
	}
	
	if (weapon.y >= core.bbox_bottom)
	{
		if (weapon.y >= bbox_bottom)
		{
			if ((core.bbox_top <= bbox_top) && (core.bbox_bottom < bbox_bottom))
				return true;
		}
	}
	
	if (weapon.y <= core.bbox_top)
	{
		if (weapon.y <= bbox_top)
		{
			if ((core.bbox_bottom >= bbox_bottom) && (core.bbox_top > bbox_top))
				return true;
		}
	}
	
	return false;
}