/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (sprite_index)
{
	case sprPlayerLDiveNorStart:
	{
		sprite_index = sprPlayerLDiveIdle;
		image_index = 0;
	}	break;
	
	case sprPlayerLDiveDashDown:
	case sprPlayerLDiveDashDownForward:
	case sprPlayerLDiveDashForward:
	case sprPlayerLDiveDashUpForward:
	case sprPlayerLDiveDashUp:
	{
		image_index = 1;
	}	break;
	
	case sprPlayerLSlashStand:
	case sprPlayerLSlashJump:
	case sprPlayerLSlashClimb:
	case sprPlayerLSlashSlide:
	{
		playerStateMachine.currentState.slashEnd = true;
	}	break;
	case sprPlayerLSpinDive:
	case sprPlayerLSlashGiga:
	{
		playerStateMachine.currentState.slashEnd = true;
		image_index = 11;
	}	break;
}