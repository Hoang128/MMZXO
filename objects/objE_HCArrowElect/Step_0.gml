/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

fncStaticDestroyOutScreen(self);

switch(phase)
{
	case 0:
	{
		if (place_meeting(x, y, objBlock))
		{
			phase = 1;
			motion_set(0, 0);
		}	
		else
			motion_set(image_angle, moveSpd);
	}	break;
	
	case 1:
	{
		if (waitTime > 0)
			waitTime -= TIME_SCALE;
		else
			instance_destroy();
	}	break;
}