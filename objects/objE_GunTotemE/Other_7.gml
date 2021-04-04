/// @description Insert description here
// You can write your code in this editor
switch (sprite_index)
{
	case sprGunTotemEOpen:
	{
		spark = instance_create_depth(x + 21 * image_xscale, y - 28, depth - 1, objE_GunTotemSpark);
		spark.image_xscale = image_xscale;
		waitCreateSpark = waitTimeMax.createSpark;
		
		sprite_index = sprGunTotemEShot;
		image_index = 0;
		state = gunTotemState.SHOT;
	}	break;
	
	case sprGunTotemEClose:
	{
		waitTime = waitTimeMax.idle;
		sprite_index = sprGunTotemEIdle;
		image_index = 0;
		state = gunTotemState.IDLE;
	}	break;
	
	case sprGunTotemEChangeDir:
	{
		waitTime = waitTimeMax.idle / 2;
		sprite_index = sprGunTotemEIdle;
		image_index = 0;
		image_xscale *= -1;
		state = gunTotemState.IDLE;
	}	break;
}