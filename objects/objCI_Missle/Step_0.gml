/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (phase)
{
	case 0:
	{
	}	break;
	case 1:
	{
		if (changeDirTime > 0)
		{
			changeDirTime -= TIME_SCALE;
		}
		else
		{
			changeDirTime = changeDirTimeMax;
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
		}
		
		motion_set(direction, moveSpd * TIME_SCALE);
	}	break;
}

if (place_meeting(x, y, objBlock))
	instance_destroy();
	
if (place_meeting(x, y, objPlayerBasic))
{
	hp = 0;
}