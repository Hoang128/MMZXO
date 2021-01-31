/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

function fncSetCreatePosition()
{
	if (instance_exists(core))
	{
		createPosition. depth = core.depth - 1;
		switch(core.sprite_index)
		{
			case sprPlayerZXIdleShot1:
			{
				createPosition.x = core.x + 25 * core.charDir;
				createPosition.y = core.y - 23;
			}	break;
		
			case sprPlayerZXJumpStartShot1:
			case sprPlayerZXJumpShot1:
			case sprPlayerZXFallStartShot1:
			case sprPlayerZXFallShot1:
			case sprPlayerZXWallKickShot1:
			{
				createPosition.x = core.x + 26 * core.charDir;
				createPosition.y = core.y - 20;
			}	break;
		
			case sprPlayerZXRunShot1:
			case sprPlayerZXDashStartShot1:
			case sprPlayerZXDashEndShot1:
			{
				createPosition.x = core.x + 28 * core.charDir;
				createPosition.y = core.y - 21;
			}	break;
		
			case sprPlayerZXDashShot1:
			{
				createPosition.x = core.x + 30 * core.charDir;
				createPosition.y = core.y - 14;
			}	break;
		
			case sprPlayerZXSlideStartShot1:
			case sprPlayerZXSlideShot1:
			{
				reserved = true;
				createPosition.x = core.x - 27 * core.charDir;
				createPosition.y = core.y - 17;
			}	break;
		
			case sprPlayerZXClimbShot1:
			{
				createPosition.x = core.x + 25 * core.charDir;
				createPosition.y = core.y - 23;	
			}	break;
		
			case sprPlayerZXLandShot1:
			{
				createPosition.x = core.x + 26 * core.charDir;
				createPosition.y = core.y - 25;
			}	break;
		}
	}
}