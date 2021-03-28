/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (phase)
{
	case 0:
	{
		if (image_index < 1)
		{
			hDir = -image_xscale;
		}
		else
		{
			hDir = image_xscale;
		}
		
		phase = 1;
		hspd = hDir * moveSpd;
	}	break;
	case 1:
	{
		if (waitTime > 0)
		{
			waitTime -= TIME_SCALE;
		}
		else
		{
			if (dropDown)
			{
				phase = 2;
			}
			else
			{
				instance_destroy();
			}
		}
	}
}