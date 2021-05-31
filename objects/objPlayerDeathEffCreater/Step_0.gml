/// @description Insert description here
// You can write your code in this editor

switch (phase)
{
	case 0:
	{
		if (createEffTime < createEffTimeMax)
		{
			if (waitTime > 0)
			{
				waitTime -= TIME_SCALE;
			}
			else
			{
				for (var i = 0; i < 8; i++)
				{
					var objDeathFlare = instance_create_depth(x, y, depth, objPlayerDeathFlare);
					objDeathFlare.direction = 45 * i;
				}
				waitTime = waitTimeMax;
				createEffTime++;
			}
		}	else phase = 1;
	}	break;
	case 1:
	{
		if (waitToFadeScene > 0)
		{
			waitToFadeScene -= TIME_SCALE;
		}
		else
		{
			instance_create_depth(x, y, depth, objUIEndStageMenu);
			phase = 2;
		}
	}	break;
}