/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (phase == 3)
{
	if (keyboard_check_pressed(vk_anykey) || device_mouse_check_button_released(0, mb_any))
	{
		if (scoreDisplayState < 4)
		{
			ds_list_find_value(childMenuNodeList, 0).contextVisible = true;
			with (timeElapsedContext)
			{
				UIContext.isVisible = true;
				fncUIUpdateContext(other.resultData.timeElapsed);
			}
			ds_list_find_value(childMenuNodeList, 1).contextVisible = true;
			with (dmgGotContext)
			{
				UIContext.isVisible = true;
				fncUIUpdateContext(other.resultData.damageGot);
			}
			ds_list_find_value(childMenuNodeList, 2).contextVisible = true;
			with (enemiesDestroyedContext)
			{
				UIContext.isVisible = true;
				fncUIUpdateContext(other.resultData.enemiesDestroyed);
			}
			ds_list_find_value(childMenuNodeList, 3).contextVisible = true;
			with (totalScoreContext)
			{
				UIContext.isVisible = true;
				fncUIUpdateContext(other.resultData.totalScore);
			}
			
			scoreDisplayState = 4;
			scoreDisplayStateSub = 0;
			switch (objRoomManager.lastStage)
			{
				case RoomStartStage:
				{
					if (objSaveDataManager.currentPlayerData.stageScore.stage_0.highestScore == 0)
						ds_list_find_value(childMenuNodeList, 4).contextVisible = true;
				}	break;
		
				case RoomElecStage:
				{
					if (objSaveDataManager.currentPlayerData.stageScore.stage_0.highestScore == 1)
						ds_list_find_value(childMenuNodeList, 4).contextVisible = true;
				}	break;
		
				case RoomIceStage:
				{
					if (objSaveDataManager.currentPlayerData.stageScore.stage_0.highestScore == 2)
						ds_list_find_value(childMenuNodeList, 4).contextVisible = true;
				}	break;
			}
			ds_list_find_value(childMenuNodeList, 5).context = "Press any key or click to go to main menu";
		}
	}
	switch (scoreDisplayState)
	{
		case 0:
		{
			if (scoreDisplayStateSub == 0)
			{
				ds_list_find_value(childMenuNodeList, 0).contextVisible = true;
				timeElapsedContext.UIContext.isVisible = true;
				scoreDisplayStateSub = 1;
			}
			else if (scoreDisplayStateSub == 1)
			{
				if (timeElapsedContext.numValue < resultData.timeElapsed)
				{
					with (timeElapsedContext)
					{
						fncUIUpdateContext(numValue + 1);
					}
				}
				else
				{
					with (timeElapsedContext)
					{
						fncUIUpdateContext(other.resultData.timeElapsed);
					}
					scoreDisplayState = 1;
					scoreDisplayStateSub = 0;
				}
			}
		}
		break;
		case 1:
		{
			if (scoreDisplayStateSub == 0)
			{
				ds_list_find_value(childMenuNodeList, 1).contextVisible = true;
				dmgGotContext.UIContext.isVisible = true;
				scoreDisplayStateSub = 1;
			}
			else if (scoreDisplayStateSub == 1)
			{
				if (dmgGotContext.numValue < resultData.damageGot)
				{
					with (dmgGotContext)
					{
						fncUIUpdateContext(numValue + 1);
					}
				}
				else
				{
					with (dmgGotContext)
					{
						fncUIUpdateContext(other.resultData.damageGot);
					}
					scoreDisplayState = 2;
					scoreDisplayStateSub = 0;
				}
			}
		}
		break;
		case 2:
		{
			if (scoreDisplayStateSub == 0)
			{
				ds_list_find_value(childMenuNodeList, 2).contextVisible = true;
				enemiesDestroyedContext.UIContext.isVisible = true;
				scoreDisplayStateSub = 1;
			}
			else if (scoreDisplayStateSub == 1)
			{
				if (enemiesDestroyedContext.numValue < resultData.enemiesDestroyed)
				{
					with (enemiesDestroyedContext)
					{
						fncUIUpdateContext(numValue + 1);
					}
				}
				else
				{
					with (enemiesDestroyedContext)
					{
						fncUIUpdateContext(other.resultData.enemiesDestroyed);
					}
					scoreDisplayState = 3;
					scoreDisplayStateSub = 0;
				}
			}
		}
		break;
		case 3:
		{
			if (scoreDisplayStateSub == 0)
			{
				ds_list_find_value(childMenuNodeList, 3).contextVisible = true;
				totalScoreContext.UIContext.isVisible = true;
				scoreDisplayStateSub = 1;
			}
			else if (scoreDisplayStateSub == 1)
			{
				if (totalScoreContext.numValue < resultData.totalScore)
				{
					with (totalScoreContext)
					{
						fncUIUpdateContext(numValue + 100);
					}
				}
				else
				{
					with (totalScoreContext)
					{
						fncUIUpdateContext(other.resultData.totalScore);
					}
					scoreDisplayState = 4;
					scoreDisplayStateSub = 0;
				}
			}
		}
		break;
	}
}