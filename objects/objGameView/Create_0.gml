//State machine
viewStateMachine = instance_create_depth(x, y, depth, objStateMachine);
viewStateMachine.core = self;
viewStateMachine.coreType = "view";

targetObject = objGlobalManager.currentPlayer;
movePos = {x:0, y:0};
camSpeed = 2;

scrInitCamera();

with(viewStateMachine)
{
	fncStateChange(objViewStateFollow);
}

function fncLimitHCamByLimitZone()
{
	if (!position_meeting(movePos.x, movePos.y, objLimitCamHZone))
	{
		var listLimHCamZone = ds_list_create();
		collision_rectangle_list(VIEW_X, VIEW_Y, VIEW_X + VIEW_W, VIEW_Y + VIEW_H, objLimitCamHZone, false, true, listLimHCamZone, false);
	
		if (ds_list_size(listLimHCamZone) == 1)
		{
			if (abs(movePos.x - ds_list_find_value(listLimHCamZone, 0).x) < ((VIEW_W) / 2))
			{
				movePos.x = ds_list_find_value(listLimHCamZone, 0).x - (((VIEW_W) / 2) * sign(ds_list_find_value(listLimHCamZone, 0).x - movePos.x));
			}
		}
		else if (ds_list_size(listLimHCamZone) == 2)
		{
			var objLimCam1 = ds_list_find_value(listLimHCamZone, 0);
			var objLimCam2 = ds_list_find_value(listLimHCamZone, 1);
			
			if (abs(((objLimCam1.x + objLimCam2.x) / 2) - movePos.x) < (abs(objLimCam1.x - objLimCam2.x) / 2))
			{
				if ((abs(objLimCam1.x - objLimCam2.x) / 2) > VIEW_W)
				{
					var maxX = objLimCam1.x;
					var minX = objLimCam2.x;
					
					if (minX > maxX)
					{
						minX = objLimCam1.x;
						maxX = objLimCam2.x;
					}
					
					maxX -= VIEW_W / 2;
					minX += VIEW_W / 2;
					
					movePos.x = clamp(movePos.x, minX, maxX);
				}
				else
				{
					movePos.x = (objLimCam1.x + objLimCam2.x) / 2;
				}
			}
		}
		else if (ds_list_size(listLimHCamZone) > 2)
		{
			show_debug_message("limit cam zone number is greater than 2. Game auto exit!");
		}
		
		ds_list_destroy(listLimHCamZone);
		listLimHCamZone = -1;
	}
}