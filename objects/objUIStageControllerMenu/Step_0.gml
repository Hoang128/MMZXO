/// @description Insert description here
// You can write your code in this editor
event_inherited();

switch (iconPhase)
{
	//Setup phase
	case 0:
	{
		for (var i = 0; i < 3; i++)
		{
			var createIcon = false;
			switch(i)
			{
				case 0:
				{
					createIcon = true;
				}	break;
				case 1:
				{
					if (objSaveDataManager.currentPlayerData.stageScore.stage_1.active)
						createIcon = true;
				}	break;
				case 2:
				{
					if (objSaveDataManager.currentPlayerData.stageScore.stage_2.active)
						createIcon = true;
				}	break;
			}
			if (createIcon)
			{
				var objIcon = instance_create_depth(x, y, depth, objUIStageIcon)
				with (objIcon)
				{
					menuParent = other;
					indexPoint.x = other.stageIconStart.x + i * (other.stageIconWidth + other.stageIconSpace);
					indexPoint.y = other.stageIconStart.y;
					x = other.startDrawPoint.x + indexPoint.x;
					y = other.startDrawPoint.y + indexPoint.y;
					startPoint.x = x;
					startPoint.y = y;
					stageBossId = i;
					if (i == 0)
						objIcon.cursorOn = 1;
				}
			
				ds_list_add(stageIconList, objIcon.id);
			}
		}
		iconPhase = 1;
	}	break;
	
	//move animation out phase
	case 1:
	{
		with (objUIStageIcon)
		{
			if (x < indexPoint.x) x += other.moveSpd;
			else x = indexPoint.x;
		}
		
		var iconStage = ds_list_find_value(stageIconList, 0);
		if (iconStage.x == iconStage.indexPoint.x)
		{
			iconPhase = 2;
		}
	}	break;
	
	//choose phase
	case 2:
	{
		fncUIChangeStage();
		if (fncStaticHandleButton(KeyMap.UI_CONFIRM,KeyAction.PRESSED))
		{
			fncUISelectStage();
		}
		fncUIExit();
	}	break;
	
	//move animation in phase
	case 3:
	{
		with (objUIStageIcon)
		{
			if (x > startPoint.x) x -= other.moveSpd;
			else x = startPoint.x;
		}
		
		var iconStage = ds_list_find_value(stageIconList, 0);
		if (iconStage.x == iconStage.startPoint.x)
		{
			iconPhase = 4;
			fncUICloseMenu();
		}
	}	break;
}