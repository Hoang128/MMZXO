/// @description Insert description here
// You can write your code in this editor

physic =
{
	enable : false,
	onGround : false,
	gravAffect : 0,
	thinBlockIgnore : false,
	thinBlockIgnoreTime : 0,
	thinBlockIgnoreTimeMax : 10
}

timeScale = 1;
destroyOutScreen = false;
imgSpd = 0.5;

hspd = 0;
vspd = 0;

maxDisDetectSlopeAbove = 6;

function fncGravityCalculate()
{
	if (physic.gravAffect == true)
	{
		
		if (fncIsOnGround(global.gravMax))
		{
			if (vspd >= 0)
			{
				physic.onGround = true;
			}
		}
		else
		{
			if (!physic.onGround)
			{
				if (vspd < global.gravMax)
					vspd += global.gravAcc * TIME_SCALE;
				else
					vspd = global.gravMax;
			}
			else
			{
				physic.onGround = false;
			}
		}
	}
}

function fncIsOnBlock(distance)
{
	if (!place_meeting(x, y + distance, objBlock))
		return false;
	else
		return true;
}

function fncIsOnLadderTop(distance)
{
	if (physic.thinBlockIgnore == 0)
	{
		var objCol = collision_rectangle(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + distance, objLadderTop, true, true);
		if (objCol != noone)
		{
			var colWithSelf = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, objCol.id, true, true);
			if (!colWithSelf && (objCol.bbox_bottom > self.bbox_bottom))
				return true;
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}
	}
	else
		return false;
}

function fncIsOnBlockThin(distance)
{
	if (physic.thinBlockIgnore == 0)
	{
		var objColList = ds_list_create();
		collision_rectangle_list(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + distance, objBlockThin, true, true, objColList, true);
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
			if (!colWithSelf && (objCol.bbox_bottom > self.bbox_bottom))
				return true;
			else
			{
				return false;
			}
		}
		else
		{
			ds_list_clear(objColList);
			ds_list_destroy(objColList);
			return false;
		}
	}
	else
		return false;
}

function fncIsOnGround(distance)
{
	if (fncIsOnBlock(distance) || fncIsOnBlockThin(distance) || fncIsOnLadderTop(distance))
		return true;
	else
		return false;
}

function fncIgnoreThinBlockFor(seconds)
{
	physic.thinBlockIgnore = true;
	physic.thinBlockIgnoreTime = seconds;
}

function fncIsInActiveZone()
{
	if (collision_rectangle(ACTIVE_X, ACTIVE_Y, ACTIVE_X + ACTIVE_W, ACTIVE_Y + ACTIVE_H, self, false, false))
		return true;
	else
		return false;
}