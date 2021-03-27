/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

switch (sprite_index)
{
	case sprTrooperRun:	imgSpd = 0.25;	break;
	default: imgSpd = 0.5;	break;
}

event_inherited();

