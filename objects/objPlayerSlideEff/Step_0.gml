/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (instance_exists(core))
{
	image_xscale = core.charDir;
	x = core.x + core.charDir * 12;
	y = core.y + 4;
	
	if (waitTime <= 0)
	{
		waitTime = waitTimeMax;
		if (dustNumber < dustNumberMax)
		{
			var objDust = instance_create_depth(x, y, depth - 1, objCircleDust);
			objDust.image_xscale = image_xscale;
			objDust.imgSpd = imgSpdDefault;
			objDust.inPool = true;
			with(objDust)
			{
				if (!collision_rectangle(x - 2, y - 2, x + 2, y + 2, objBlock, false, false))
					visible = false;
			}
			ds_list_add(dustList, objDust);
		}
		else
		{
			var objDust = ds_list_find_value(dustList, ds_list_size(dustList));
			objDust.x = x;
			objDust.y = y;
			objDust.visible = 1;
			objDust.imgSpd = imgSpdDefault;
			with(objDust)
			{
				if (!collision_rectangle(x - 2, y - 2, x + 2, y + 2, objBlock, false, false))
					visible = false;
			}
		}
	}
	else
		waitTime -= TIME_SCALE;
}
else instance_destroy();