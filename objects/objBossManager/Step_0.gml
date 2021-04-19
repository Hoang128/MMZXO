/// @description Insert description here
// You can write your code in this editor

switch (state)
{
	case bossFightState.INIT:
	{
		if (bossOpenCutsceneObj != noone)
		{
			instance_create_depth(x, y, depth, bossOpenCutsceneObj);
			state = bossFightState.OPEN_CUTSCENE;
		}
		else
		{
			fncChangeToBossFightState();
		}
	}	break;
	
	case bossFightState.OPEN_CUTSCENE:
	{
		if (!instance_exists(bossOpenCutsceneObj))
		{
			fncChangeToBossFightState();
		}
	}	break;
	
	case bossFightState.FIGHT:
	{
	}	break;
	
	case bossFightState.END_CUTSCENE:
	{
		if (!instance_exists(bossCloseCutsceneObj))
			instance_destroy();
	}	break;
}