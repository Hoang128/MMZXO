/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (sprite_index)
{
	case sprPlayerZXSlashCombo1:
	case sprPlayerZXSlashCombo2:
	case sprPlayerZXSlashCombo3:
	case sprPlayerZXSlashJump:
	case sprPlayerZXSlashSpin:
	case sprPlayerZXSlashDash:
	case sprPlayerZXSlashSlide:
	case sprPlayerZXSlashClimb:
	case sprPlayerZXSlashChargeGround:
	case sprPlayerZXSlashChargeJump:
	case sprPlayerZXSlashChargeSlide:
	case sprPlayerZXSlashChargeClimb:
	{
		with (playerStateMachine.currentState)
			slashEnd = true;
	}	break;
}