/// @description Insert description here
// You can write your code in this editor
waterInteract = true;
physic =
{
	enable : false,
	onGround : false,
	gravAffect : 0,
	thinBlockIgnore : false,
	thinBlockIgnoreTime : 0,
	thinBlockIgnoreTimeMax : 10,
	inWater : InWater.NONE,
	waterRatio : {x : 1, y : 1},
	inWind  : InWind.NONE,
	enviMoveRatio : {x : 1, y : 1}
}
physic.waterRatio.x = global.waterMoveRatio.x;
physic.waterRatio.y = global.waterMoveRatio.y;

objWaterEff = noone;
objWater = noone;

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
		
		if (fncIsOnGround(global.gravMax * physic.enviMoveRatio.y))
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
				if (vspd < global.gravMax * physic.enviMoveRatio.y)
					vspd += global.gravAcc * TIME_SCALE * physic.enviMoveRatio.y;
				else
					vspd = global.gravMax * physic.enviMoveRatio.y;
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

function fncIsWallAhead(dir, vDir)
{
	if (place_meeting(x + dir, y, objBlock))
	{
		if (!place_meeting(x + dir * maxDisDetectSlopeAbove * vDir, y, objSlope))
		{
			return true;
		}
	}
	
	return false;
}

function fncIsFloorAhead(dir, distance, vDir)
{
	if (fncIsBlockFloorAhead(dir, distance, vDir) || fncIsThinFloorAhead(dir, distance, vDir))
		return true;
	else
		return false;
}

function fncIsBlockFloorAhead(dir, distance, vDir)
{
	if (vDir == 1)
	{
		if (dir == 1)
		{
			if (!collision_rectangle(bbox_right, bbox_bottom, bbox_right + dir, bbox_bottom + distance, objBlock, false, true))
			{
				if (!collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom + distance, objSlope, true, true))
				{
					return false;
				}
			}
		}
		else if (dir == -1)
		{
			if (!collision_rectangle(bbox_left, bbox_bottom, bbox_left - dir, bbox_bottom + distance, objBlock, false, true))
			{
				if (!collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom + distance, objSlope, true, true))
				{
					return false;
				}
			}
		}
	}
	else if (vDir == -1)
	{
		if (dir == 1)
		{
			if (!collision_rectangle(bbox_right, bbox_top, bbox_right + dir, bbox_top - distance, objBlock, false, true))
			{
				if (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top - distance, objSlope, true, true))
				{
					return false;
				}
			}
		}
		else if (dir == -1)
		{
			if (!collision_rectangle(bbox_left, bbox_top, bbox_left - dir, bbox_top - distance, objBlock, false, true))
			{
				if (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top - distance, objSlope, true, true))
				{
					return false;
				}
			}
		}
	}
	
	return true;
}

function fncIsThinFloorAhead(dir, distance, vDir)
{
	if (vDir == 1)
	{
		if (dir == 1)
		{
			if (!collision_rectangle(bbox_right, bbox_bottom, bbox_right + dir, bbox_bottom + distance, objBlockThin, false, true))
			{
				if (!collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom + distance, objSlopeThin, true, true))
				{
					return false;
				}
			}
		}
		else if (dir == -1)
		{
			if (!collision_rectangle(bbox_left, bbox_bottom, bbox_left - dir, bbox_bottom + distance, objBlockThin, false, true))
			{
				if (!collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom + distance, objSlopeThin, true, true))
				{
					return false;
				}
			}
		}
	}
	else if (vDir == -1)
	{
		if (dir == 1)
		{
			if (!collision_rectangle(bbox_right, bbox_top, bbox_right + dir, bbox_top - distance, objBlockThin, false, true))
			{
				if (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top - distance, objSlopeThin, true, true))
				{
					return false;
				}
			}
		}
		else if (dir == -1)
		{
			if (!collision_rectangle(bbox_left, bbox_top, bbox_left - dir, bbox_top - distance, objBlockThin, false, true))
			{
				if (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top - distance, objSlopeThin, true, true))
				{
					return false;
				}
			}
		}
	}
	
	return true;
}

function fncDetectInWaterState()
{
	var colTopPart = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top + 1, objZoneWater, false, true);
	var colBotPart = collision_rectangle(bbox_left, bbox_top + 2, bbox_right, bbox_bottom, objZoneWater, false, true);
	if (colTopPart && colBotPart)
	{
		objWater = colBotPart;
		if (physic.inWater != InWater.FULL)
		{
			vspd = vspd/global.gravMax * physic.waterRatio.y;
			physic.enviMoveRatio.x *= physic.waterRatio.x;
			physic.enviMoveRatio.y *= physic.waterRatio.y;
			
			if ((objWaterEff != noone) && instance_exists(objWaterEff))
			{
				instance_destroy(objWaterEff);
				objWaterEff = noone;
			}
		}
		physic.inWater = InWater.FULL;
	}
	else if (colBotPart && !colTopPart)
	{
		var water = colBotPart;
		if(physic.inWater != InWater.HALF)
		{
			if (physic.inWater == InWater.FULL)
			{
				physic.enviMoveRatio.x /= physic.waterRatio.x;
				physic.enviMoveRatio.y /= physic.waterRatio.y;
			}
			
			if (physic.inWater == InWater.NONE)
				instance_create_depth(x, water.bbox_top, depth - 2, objWaterPulseEff);
			
			if (objWater == noone)
			{
				objWater = water;
			}
			
			if (objWaterEff == noone)
			{
				objWaterEff = instance_create_depth(x, water.bbox_top, depth - 1, objWaterHalfEff);
				objWaterEff.core = self;
				objWaterEff.waterObj = water;
			}
		}
		
		physic.inWater = InWater.HALF;
	}
	else
	{
		if (physic.inWater != InWater.NONE)
		{
			if (objWater != noone)
			{
				instance_create_depth(x, objWater.bbox_top, depth - 2, objWaterPulseEff);
				objWater = noone;
			}
			
			if ((objWaterEff != noone) && instance_exists(objWaterEff))
			{
				instance_destroy(objWaterEff);
				objWaterEff = noone;
			}
		}
		
		physic.inWater = InWater.NONE;
	}
}