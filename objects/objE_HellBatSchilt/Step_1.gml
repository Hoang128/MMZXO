/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
switch (sprite_index)
{
	case sprHellBatThunderClap:
	{
		imgSpd = 0.25;
	}	break;
	default:
	{
		imgSpd = 0.5;
	}	break;
}

event_inherited();

switch (sprite_index)
{
	case sprHellBatShotDown:
	case sprHellBatShotDownEnd:
	case sprHellBatShotDownStart:
	{
		mask_index = sprHellBatShotDown;
	}	break;
	default:
	{
		mask_index = sprHellBatStand;
	}	break;
}