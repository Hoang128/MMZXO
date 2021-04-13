/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
imgSpd = 0.5;

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