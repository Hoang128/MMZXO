/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

fncChangeImgDir();

if (existTime > 0)
{
	existTime -= TIME_SCALE;
}
else
{
	instance_destroy();
}

if (waitToCreateTrail > 0)
{
	waitToCreateTrail -= TIME_SCALE;
}
else
{
	var objTrail = instance_create_depth(x, y, depth + 1, objE_HBSSonicTrail);
	objTrail.image_xscale = image_xscale;
	objTrail.image_yscale = image_yscale;
	objTrail.image_angle = image_angle;
	waitToCreateTrail = waitToCreateMax;
}

if (waitTime > 0)
{
	waitTime -= TIME_SCALE;
}
else
{
	waitTime = 0;
	canBounce = true;
}

motion_set(direction, moveSpd * TIME_SCALE);

if (place_meeting(x, y, objBlock))
{
	if (canBounce)
	{
		move_bounce_solid(true);
		
		waitTime = waitToBounce;
		canBounce = false;
	}
}