/// @description Insert description here
// You can write your code in this editor
event_inherited();

if (instance_exists(core))
{
	x = core.x;
	y = core.y;
	
	if (waitTime <= 0)
	{
		objShadow = instance_create_depth(x, y, depth + 1, objPlayerShadow);
		objShadow.sprite_index = core.sprite_index;
		objShadow.image_index = core.image_index;
		objShadow.image_xscale = core.image_xscale;
		objShadow.image_speed = 0;
		waitTime = waitTimeMax;
	}
	else
	{
		waitTime -= TIME_SCALE;
	}
}
else
{
	instance_destroy();
}