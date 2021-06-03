/// @description Insert description here
// You can write your code in this editor
event_inherited();

if (!inited)
{
	switch (core.object_index)
	{
		case objPlayerZX:
			color = c_red;		break;
		case objPlayerH:
			color = c_green;	break;
		case objPlayerL:
			color = c_blue;		break;
		case objPlayerP:
			color = c_purple;	break;
		case objPlayerF:
			color = c_orange;	break;
	}
}

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
		objShadow.color = color;
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