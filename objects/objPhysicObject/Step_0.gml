/// @description Insert description here
// You can write your code in this editor

if (physic.enable)
{	
	fncGravityCalculate();
	
	if (physic.thinBlockIgnore)
	{
		if (physic.thinBlockIgnoreTime > 0)
		{
			physic.thinBlockIgnoreTime -= TIME_SCALE;
		}
		else
		{
			var objColList = ds_list_create();
			collision_rectangle_list(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + vspd, objBlockThin, true, true, objColList, true);
			if (ds_list_empty(objColList))
			{
				physic.thinBlockIgnore = false;
				physic.thinBlockIgnoreTime = 0;
			}
			ds_list_clear(objColList);
			ds_list_destroy(objColList);	
		}
	}
	
	//Horizontal handle
	if(place_meeting(x + hspd, y, objBlock))
	{
		while(!place_meeting(x + sign(hspd), y, objBlock))
		{
			x += sign(hspd);
		}
		if (!place_meeting(x + hspd, y - maxDisDetectSlopeAbove, objBlock))
		{
			while (place_meeting(x + hspd, y, objBlock)) y--;
		}
		else
			hspd = 0;
	}
	
	//Vertical handle
	if(place_meeting(x, y + vspd, objBlock))
	{
		while(!place_meeting(x, y + sign(vspd), objBlock))
		{
			y += sign(vspd);
		}
		vspd = 0;
	}
	
	//Vertical thin block handle
	if (vspd > 0)
	{
		if (!physic.thinBlockIgnore)
		{
			var objColList = ds_list_create();
			collision_rectangle_list(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + vspd, objBlockThin, true, true, objColList, true);
			var objCol = ds_list_find_value(objColList, 0);
			if (!ds_list_empty(objColList))
			{
				var i = 0;
				for (i = 0; i < ds_list_size(objColList); i++)
				{
					if ((ds_list_find_value(objColList, i).bbox_top - bbox_bottom) < (objCol.bbox_top - bbox_bottom))
					objCol = ds_list_find_value(objColList, i);
				}
				var colWithSelf = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, objCol.id, true, true);
				ds_list_clear(objColList);
				ds_list_destroy(objColList);
				if (!colWithSelf)
				{
					while(!place_meeting(x, y + sign(vspd), objCol))
					{
						y += sign(vspd);
					}
					vspd = 0;
				}
			}
		}
	}
	
	//Vertical ladder top handle
	if (vspd > 0)
	{
		if (!physic.thinBlockIgnore)
		{
			var objCol = collision_rectangle(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + vspd, objLadderTop, true, true);
			if (objCol != noone)
			{
				var colWithSelf = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, objCol.id, true, true);
				if (!colWithSelf)
				{
					while(!place_meeting(x, y + sign(vspd), objCol))
					{
						y += sign(vspd);
					}
					vspd = 0;
				}
			}
		}
	}
}

x += hspd * TIME_SCALE;
y += vspd * TIME_SCALE;

if (physic.enable && physic.onGround)
{
	if (collision_rectangle(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + maxDisDetectSlopeAbove, objBlockThin, true, false)
	|| collision_rectangle(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + maxDisDetectSlopeAbove, objBlock, true, false))
	{
		while (!collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom + 1, objBlockThin, true, false)
		&& !collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom + 1, objBlock, true, false))
			y++;
	}
	while (collision_rectangle(bbox_left, bbox_bottom - 1, bbox_right, bbox_bottom, objBlockThin, true, false))
	{
		y--;
	}
}