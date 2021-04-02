/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (state)
{
	case gunJumperState.INIT:
	{
		fncChangeDirToCam();
		
		lastActiveState = state;
		state = gunJumperState.IDLE;
		waitTime = waitTimeMax.idle;
	}	break;
	
	case gunJumperState.IDLE:
	{
		if (waitTime > 0)
			waitTime -= TIME_SCALE;
		else
		{
			waitTime = 0;
			if (lastActiveState == gunJumperState.CHANGE_DIR)
			{
				sprite_index = sprGunJumperShot;
				image_index = 0;
				state = gunJumperState.SHOT;
			}
			else
			{
				if (fncHavePlayerAhead())
				{
					sprite_index = sprGunJumperJumpStart;
					image_index = 0;
					state = gunJumperState.JUMP;
				}
				else
				{
					sprite_index = sprGunJumperChangeDir;
					image_index = 0;
					state = gunJumperState.CHANGE_DIR;
				}
			}
		}
	}	break;
	
	case gunJumperState.CHANGE_DIR:
	{
		
	}	break;
	
	case gunJumperState.SHOT:
	{
		if (canShot)
		{
			if (image_index > 3)
			{
				var objBullet = instance_create_depth(x + 10 * image_xscale, y - 8, depth, objE_GunJumperBullet);
				objBullet.image_xscale = image_xscale;
				canShot = false;
			}
		}
	}	break;
	
	case gunJumperState.JUMP:
	{
		if (sprite_index == sprGunJumperJump)
		{
			if (vspd > 0)
			{
				sprite_index = sprGunJumperFall;
				image_index = 0;
				state = gunJumperState.FALL;
			}
		}
	}	break;
	
	case gunJumperState.FALL:
	{
		if (fncIsOnBlock(1))
		{
			hspd = 0;
			physic.onGround = true;
			sprite_index = sprGunJumperIdle;
			image_index = 0;
			
			waitTime = waitTimeMax.idle;
			lastActiveState = state;
			state = gunJumperState.IDLE;
		}
	}	break;
}