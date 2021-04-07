/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (state)
{
	case processorState.INIT:
	{
		fncChangeDirToCam();
		flyRange =  activeRange/2;
		state = processorState.FLY;
		hspd = moveSpd * image_xscale;
	}	break;
	
	case processorState.FLY:
	{
		if (guardDir != (90 - 90 * image_xscale))
		{
			guardDir = (90 - 90 * image_xscale);
		}
		
		flyRange += abs(hspd * TIME_SCALE);
		if ((flyRange > activeRange) || fncIsWallAhead(image_xscale, image_yscale))
		{
			flyRange = 0;
			state = processorState.CHANGE_DIR;
			sprite_index = sprProcessorChangeDir;
			hspd = 0;
		}
	}	break;
	
	case processorState.BURST_BACK:
	{
		flyRange -= abs(hspd * TIME_SCALE);
		if (waitTime > 0)
			waitTime -= TIME_SCALE;
		else
		{
			state = processorState.FLY;
			hspd = moveSpd * image_xscale;
		}
	}	break;
	
	case processorState.CHANGE_DIR:
	{
	}	break;
}