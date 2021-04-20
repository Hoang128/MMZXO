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
			hDir = -image_xscale * hMove;
		}
		else
		{
			hDir = 0;
		}
		
		phase = 1;
		hspd = hDir * moveSpd;
		vspd = vMove;
	}	break;
	case 1:
	{
		if (moveTime > 0)
		{
			moveTime -= TIME_SCALE;
		}
		else
		{
			moveTime = 0;
			hspd = 0;
			vspd = 0;
		}
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