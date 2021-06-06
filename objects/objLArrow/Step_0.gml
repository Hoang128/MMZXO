/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

fncStaticDestroyOutScreen(self);
isGuardBreaker = true;

x += image_xscale * moveSpd;

if (existTime > 0)
{
	existTime -= TIME_SCALE;
}
else
{
	if (damage != 0)
		damage = 0;
	if (image_yscale > 0)
	{
		image_yscale -= yScaleSpd;
	}
	else
	{
		instance_destroy();
	}
}