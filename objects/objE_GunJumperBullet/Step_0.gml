/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
 
fncStaticDestroyOutScreen(self);

if (time > 0)
{
	x += moveSpd * image_xscale;
	time -= TIME_SCALE;
}
else
{
	if (sprite_index != sprGunJumperBulletEndL)
	{
		sprite_index = sprGunJumperBulletEndL;
		image_index = 0;
	}
}