/// @description Insert description here
// You can write your code in this editor
switch (sprite_index)
{
	case sprGate.sprClosing:
	{
		fncGateClose();
	}	break;
	case sprGate.sprOpening:
	{
		sprite_index = sprGate.sprOpen;
		image_index = 0;
		instance_destroy(gateBlock);
		gateBlock = noone;
		state = 3;
	}	break;
}