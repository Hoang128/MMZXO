/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (phase == 3)
{
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