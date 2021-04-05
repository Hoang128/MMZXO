/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (state)
{
	case evilBatState.INIT:
	{
		state = evilBatState.IDLE;
		sprite_index = sprEvilBatDrill;
		image_index = 0;
		move_contact_solid(90, 0);
	}	break;
	
	case evilBatState.IDLE:
	{
		if (waitToFly > 0)
		{
			waitToFly -= TIME_SCALE;
		}
		else
		{
			if (fncIsPlayerInRange(objGlobalManager.currentPlayer))
			{
				state = evilBatState.FLY_TO_PLAYER;
				sprite_index = sprEvilBatFly;
				image_index = 0;
			}
		}
	}	break;
	
	case evilBatState.FLY_TO_PLAYER:
	{
		fncHandleFlyToPlayerState(objGlobalManager.currentPlayer);
	}	break;
	
	case evilBatState.DRILL_DOWN:
	{
		if (waitToDrill > 0)
		{
			waitToDrill -= TIME_SCALE;
		}
		else
		{
			if (!place_meeting(x, y + drillSpd, objBlock))
			{
				vspd = drillSpd;
			}
			else
			{
				vspd = 0;
				state = evilBatState.FLY_UP;
				sprite_index = sprEvilBatFly;
				image_index = 0;
			}
		}
	}	break;
	
	case evilBatState.FLY_UP:
	{
		if (!place_meeting(x, y - flySpd, objBlock))
		{
			vspd = -flySpd;
		}
		else
		{
			vspd = 0;
			move_contact_solid(90, 0);
			state = evilBatState.IDLE;
			sprite_index = sprEvilBatDrill;
			image_index = 0;
			waitToFly = waitTimeMax;
		}
	}	break;
}