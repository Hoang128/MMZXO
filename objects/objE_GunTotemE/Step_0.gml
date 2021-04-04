/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (state)
{
	case gunTotemState.INIT:
	{
		if (collision_rectangle(VIEW_X, VIEW_Y, VIEW_X + VIEW_W, VIEW_Y + VIEW_H, self, false, false))
		{
			topBlock = instance_create_depth(x - 16 * image_xscale, y - 64, depth, objBlock);
			topBlock.image_xscale = 1 / 8 * 32;
			topBlock.image_yscale = 1 / 8 * 6;
			
			botBlock = instance_create_depth(x - 8 * image_xscale, y - 58, depth, objBlock);
			botBlock.image_xscale = 1 / 8 * 16;
			botBlock.image_yscale = 1 / 8 * 58;
			
			fncChangeDirToCam();
			waitTime = waitTimeMax.idle;
			state = gunTotemState.IDLE;
		}
	}	break;
	
	case gunTotemState.IDLE:
	{
		if (!fncIsPlayerAhead(objGlobalManager.currentPlayer))
		{
			sprite_index = sprGunTotemEChangeDir;
			image_index = 0;
			state = gunTotemState.CHANGE_DIR;
		}
		if (waitTime > 0)
		{
			waitTime -= TIME_SCALE;
		}
		else
		{
			if (waitToShot > 0)
			{
				waitToShot -= TIME_SCALE;
			}
			else
			{
				sprite_index = sprGunTotemEOpen;
				image_index = 0;
				state = gunTotemState.OPEN;
			}
		}
	}	break;
	
	case gunTotemState.OPEN:
	{
		
	}	break;
	
	case gunTotemState.CLOSE:
	{
		
	}	break;
	
	case gunTotemState.SHOT:
	{
		if (waitCreateSpark > 0)
		{
			waitCreateSpark -= TIME_SCALE;
		}
		else
		{
			spark.state = 1;
			spark = noone;
			
			waitToShot = waitTimeMax.shot; 
			sprite_index = sprGunTotemEClose;
			image_index = 0;
			state = gunTotemState.CLOSE;
		}
	}	break;
	
	case gunTotemState.CHANGE_DIR:
	{
		
	}	break;
}