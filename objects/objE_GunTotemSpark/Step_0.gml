/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

fncStaticDestroyOutScreen(self);

switch (state)
{
	case 0:
	{
	}	break;
	case 1:
	{
		vspd = vMoveSpd;
		state = 2;
	}	break;
	case 2:
	{
		if (place_meeting(x, y + vspd, objBlock))
		{
			hspd = image_xscale * hMoveSpd;
			vspd = 0;
			state = 3;
		}
	}	break;
	case 3:
	{
		if (!place_meeting(x, y + vMoveSpd, objBlock))
		{
			vspd = vMoveSpd;
			hspd = 0;
			state = 2;
		}
		if (place_meeting(x + hspd, y, objBlock))
		{
			instance_destroy();
		}
	}	break;
}