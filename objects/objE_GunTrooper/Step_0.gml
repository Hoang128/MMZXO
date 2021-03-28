/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if (waitToShot > 0)
{
	waitToShot -= TIME_SCALE;
}
else
	waitToShot = 0;

switch (state)
{
	case gunTrooperState.INIT:
	{
		//move_contact_solid(270, 0);
		physic.onGround = true;
		runRange = activeRange/2;
		fncChangeDirToCam();
		state = gunTrooperState.STAND;
	}	break;
	
	case gunTrooperState.STAND:
	{
		if (waitTime > 0)
		{
			waitTime -= TIME_SCALE;
		}
		else
		{
			waitTime = waitTimeMax;
			state = gunTrooperState.RUN;
			sprite_index = sprTrooperRun;
			hspd = runSpeed * image_xscale;
		}
		
		if (fncIsReadyToAttack(objGlobalManager.currentPlayer))
		{
			if (waitToShot == 0)
			{
				state = gunTrooperState.SHOT;
				canShot = 1;
				sprite_index = sprTrooperShoot;
			}
		}
	}	break;
	
	case gunTrooperState.RUN:
	{
		runRange += abs(hspd * TIME_SCALE);
		if ((runRange > activeRange) || fncIsWallAhead(image_xscale, image_yscale) || !fncIsFloorAhead(image_xscale, maxDisDetectSlopeAbove, image_yscale))
		{
			runRange = 0;
			state = gunTrooperState.STAND;
			sprite_index = sprTrooperIdle;
			hspd = 0;
			image_xscale *= -1;
		}
		
		if (fncIsReadyToAttack(objGlobalManager.currentPlayer))
		{
			if (waitToShot == 0)
			{
				hspd = 0;
				state = gunTrooperState.SHOT;
				canShot = 1;
				sprite_index = sprTrooperShoot;
			}
		}
	}	break;
	
	case gunTrooperState.SHOT:
	{
		if (canShot == 1)
		{
			if (image_index > 1)
			{
				var objBullet = instance_create_depth(x + 20 * image_xscale, y - 25, depth - 1, objE_TrooperBullet);
				objBullet.dir = image_xscale;
				shotTime++;
				canShot = 0;
			}
		}
	}	break;
}

event_inherited();