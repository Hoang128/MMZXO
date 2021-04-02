/// @description Insert description here
// You can write your code in this editor
switch (sprite_index)
{
	case sprGunJumperChangeDir:
	{
		sprite_index = sprGunJumperIdle;
		image_index = 0;
		image_xscale *= -1;
		waitTime = waitTimeMax.idle;
		lastActiveState = state;
		state = gunJumperState.IDLE;
	}	break;
	
	case sprGunJumperShot:
	{
		sprite_index = sprGunJumperIdle;
		image_index = 0;
		
		canShot = true;
		lastActiveState = state;
		state = gunJumperState.IDLE;
	}	break;
	
	case sprGunJumperJumpStart:
	{
		sprite_index = sprGunJumperJump;
		image_index = 0;
		vspd = -jumpSpd;
		hspd = image_xscale * moveSpd;
		physic.onGround = false;
	}	break;
}