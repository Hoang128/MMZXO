/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (sprite_index)
{
	case sprPlayerHSlash1:
	case sprPlayerHSlash2:
	case sprPlayerHSlashDouble:
	case sprPlayerHSlashDash:
	case sprPlayerHSlashDashAir:
	case sprPlayerHSlashClimb:
	case sprPlayerHSlashSlide:
		imgSpd = 1;
		break;
		
	case sprPlayerHSlashJump:
		imgSpd = 1;
		break;
}