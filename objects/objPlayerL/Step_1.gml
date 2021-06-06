/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (sprite_index)
{
	case sprPlayerLDiveIdle:
	case sprPlayerLDiveUp:
	case sprPlayerLDiveForward:
	case sprPlayerLDiveDown:
	case sprPlayerLDiveUpForward:
	case sprPlayerLDiveDownForward:
	{
		imgSpd = 0.1;
	}	break;
	
	case sprPlayerLSlashStand:
	case sprPlayerLSlashJump:
	case sprPlayerLSlashClimb:
	case sprPlayerLSlashSlide:
	case sprPlayerLSlashGiga:
	case sprPlayerLSpinDive:
	{
		imgSpd = 1;
	}	break;
}