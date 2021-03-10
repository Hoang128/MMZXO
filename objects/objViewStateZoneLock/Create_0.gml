/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
zoneLock = noone;
spaceRatio = 1/2;

function fncStateRun()
{
	with(core.id)
	{
		targetObject = objGlobalManager.currentPlayer;
		
		if (other.zoneLock != noone)
		{
			if (!collision_rectangle(targetObject.bbox_left, targetObject.bbox_top, targetObject.bbox_right, targetObject.bbox_bottom, other.zoneLock, false, true))
			{
				if (collision_rectangle(targetObject.bbox_left, targetObject.bbox_top, targetObject.bbox_right, targetObject.bbox_bottom, objLockCamZone, false, true))
				{
					other.zoneLock = collision_rectangle(targetObject.bbox_left, targetObject.bbox_top, targetObject.bbox_right, targetObject.bbox_bottom, objLockCamZone, false, true);
				}
				else
				{
					with(other.stateMachine)
					{
						fncStateChange(objViewStateFollow);
				
						return;
					}
				}
			}
			if (other.zoneLock.lockCam.horizontal)
			{
				if (abs(other.zoneLock.bbox_right - other.zoneLock.bbox_left) > VIEW_W)
					movePos.x = clamp(targetObject.x, other.zoneLock.bbox_left + VIEW_W * other.spaceRatio, other.zoneLock.bbox_right - VIEW_W * other.spaceRatio);
				else
					movePos.x = (other.zoneLock.bbox_right + other.zoneLock.bbox_left) / 2;
			}
			else
				movePos.x = targetObject.x;
			
			if (other.zoneLock.lockCam.vertical)
			{
				if (abs(other.zoneLock.bbox_top - other.zoneLock.bbox_bottom) > VIEW_H)
					movePos.y = clamp(targetObject.y, other.zoneLock.bbox_top + VIEW_H * other.spaceRatio, other.zoneLock.bbox_bottom - VIEW_H * other.spaceRatio);
				else
					movePos.y = (other.zoneLock.bbox_top + other.zoneLock.bbox_bottom) / 2;
			}
			else
				movePos.y = targetObject.y;
		}
	}
}