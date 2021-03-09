/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

function fncStateRun()
{
	with(core.id)
	{
		targetObject = objGlobalManager.currentPlayer;
		
		movePos.x = targetObject.x;
		movePos.y = targetObject.y;
		
		if (collision_rectangle(targetObject.bbox_left, targetObject.bbox_top, targetObject.bbox_right, targetObject.bbox_bottom, objLockCamZone, false, true))
		{
			var zone = collision_rectangle(targetObject.bbox_left, targetObject.bbox_top, targetObject.bbox_right, targetObject.bbox_bottom, objLockCamZone, false, true);
			with(other.stateMachine)
			{
				fncStateChange(objViewStateZoneLock);
				
				currentState.zoneLock = zone;
				
				return;
			}
		}
	}
}