/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (sprite_index)
{
	case sprPlayerZXIdleShot1:
	case sprPlayerZXIdleShot2:
	
	case sprPlayerZXDashShot1:
	case sprPlayerZXDashShot2:
	
	case sprPlayerZXDashStartShot1:
	case sprPlayerZXDashStartShot2:
	
	case sprPlayerZXDashEndShot1:
	case sprPlayerZXDashEndShot2:
	
	case sprPlayerZXJumpShot1:
	case sprPlayerZXJumpShot2:
	
	case sprPlayerZXJumpStartShot1:
	case sprPlayerZXJumpStartShot2:
	
	case sprPlayerZXFallShot1:
	case sprPlayerZXFallShot2:
	
	case sprPlayerZXFallStartShot1:
	case sprPlayerZXFallStartShot2:
	
	case sprPlayerZXClimbShot1:
	case sprPlayerZXClimbShot2:
	
	case sprPlayerZXSlideShot1:
	case sprPlayerZXSlideShot2:
	
	case sprPlayerZXSlideStartShot1:
	case sprPlayerZXSlideStartShot2:
	
	case sprPlayerZXLandShot1:
	case sprPlayerZXLandShot2:
	
	case sprPlayerZXWallKickShot1:
	case sprPlayerZXWallKickShot2:
		imgSpd = 0;	break;
		
	case sprPlayerZXSlashCombo1:
	case sprPlayerZXSlashCombo2:
	case sprPlayerZXSlashCombo3:
	{
		imgSpd = 1.2;
	}	break;
	case sprPlayerZXSlashJump:
	case sprPlayerZXSlashDash:
	{
		imgSpd = 1.5;
	}	break;
	
	case sprPlayerZXSlashSpin:
	{
		imgSpd = 1;
	}	break;
		
	case sprPlayerZXSlashSlide:
	{
		if (image_index < 4)
			imgSpd = 1;
		else	
		{
			imgSpd = 1.5;
		}
	}	break;
}