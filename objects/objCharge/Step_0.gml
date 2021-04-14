/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (instance_exists(core))
{
	x = core.x;
	y = core.y - 16;
	depth = core.depth - 10;
	switch (weapon)
	{
		case 1:
		{
			if (core.chargeWp1.Current < core.chargeWp1.Mid)
				instance_destroy();
		}	break;
		case 2:
		{
			if (core.chargeWp2.Current < core.chargeWp2.Mid)
				instance_destroy();
		}	break;
	}
}
else	instance_destroy();