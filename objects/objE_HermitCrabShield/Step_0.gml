/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (core.sprite_index)
{
	case sprHermitCrabCloseShell:
		sprite_index = sprHermitCrabCloseShellShield;	
		break;
	case sprHermitCrabIdle:
		sprite_index = sprHermitCrabIdleShield;	
		break;
	case sprHermitCrabInShell:
		sprite_index = sprHermitCrabInShellShield;	
		break;
	case sprHermitCrabOpenShell:
		sprite_index = sprHermitCrabOpenShellShield;	
		break;
	case sprHermitCrabRun:
		sprite_index = sprHermitCrabRunShield;	
		break;
	case sprHermitCrabShot:
		sprite_index = sprHermitCrabShotShield;	
		break;
}

image_index = core.image_index;
image_xscale = core.image_xscale;
image_yscale = core.image_yscale;