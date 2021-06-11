/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

switch (sprite_index)
{
	case sprCInarabitta_Jump:
		imgSpd = 0;
		break;
	default:	
		imgSpd = 0.5;
}

event_inherited();

switch (sprite_index)
{
	default:	mask_index = sprCInarabitta_Idle;
}