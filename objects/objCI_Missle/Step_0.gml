/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (existTime > 0)
{
	existTime -= TIME_SCALE;
}
else
{
	instance_destroy();
}

if (!place_meeting(x, y, objZoneWater))
	instance_destroy();

switch (phase)
{
	case 0:
	{
		if (changeDirTime > 0)
		{
			changeDirTime -= TIME_SCALE;
		}
		else
		{
			if (defaultChangeDirTime == 0)
			{
				phase = 1;
			}
			changeDirTime = changeDirTimeMax;
			defaultChangeDirTime--;
			direction -= hDir * 45;
			image_angle = direction;
		}
	}	break;
	case 1:
	{
		var playerAngle = noone;
		if (instance_exists(objGlobalManager.currentPlayer))
		{
			var playerCenterPoint =
			{
				x : (objGlobalManager.currentPlayer.bbox_left + objGlobalManager.currentPlayer.bbox_right) / 2,
				y : (objGlobalManager.currentPlayer.bbox_top + objGlobalManager.currentPlayer.bbox_bottom) / 2
			}
			playerAngle = point_direction(x, y, playerCenterPoint.x, playerCenterPoint.y);
		}
			
		if (playerAngle != noone)
		{
			var angleDiff = angle_difference(playerAngle, image_angle);
			if (abs(angleDiff) > 45)
			{
				direction += sign(angleDiff) * 45;
				image_angle = direction;
			}
		}
	}	break;
}

motion_set(direction, moveSpd * TIME_SCALE);

if (place_meeting(x, y, objBlock))
	instance_destroy();
	
if (place_meeting(x, y, objPlayerBasic))
{
	hp = 0;
}