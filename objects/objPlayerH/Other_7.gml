/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (sprite_index)
{
	case sprPlayerHBoostUpStart:
	{
		sprite_index = sprPlayerHBoostUp;
		image_index = 0;
	}	break;
	
	case sprPlayerHHoverStart:
	{
		sprite_index = sprPlayerHHover;
		image_index = 0;
	}	break;
	
	case sprPlayerHSlash1:
	case sprPlayerHSlash2:
	case sprPlayerHSlashDouble:
	case sprPlayerHSlashJump:
	case sprPlayerHSlashDash:
	case sprPlayerHSlashDashAir:
	case sprPlayerHSlashClimb:
	case sprPlayerHSlashSlide:
	{
		with (playerStateMachine.currentState)
			slashEnd = true;
	}	break;
}