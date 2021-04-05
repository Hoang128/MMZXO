/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (sprite_index)
{
	case sprEvilBatDrill:
	{
		if (state == evilBatState.IDLE)
			imgSpd = 0;
		else
			imgSpd = 2;
	}
	break;
	case sprEvilBatFly:
		imgSpd = 1;
	break;
}
