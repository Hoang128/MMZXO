/// @description Insert description here
// You can write your code in this editor
switch (sprite_index)
{
	case sprGunJumperBulletStartL:
	{
		sprite_index = sprGunJumperBulletMidL;
		image_index = 0;
	}	break;
	
	case sprGunJumperBulletEndL:
	{
		instance_destroy();
	}	break;
}