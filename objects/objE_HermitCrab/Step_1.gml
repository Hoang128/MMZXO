/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (sprite_index)
{
	case sprHermitCrabInShell:
	case sprHermitCrabOpenShell:
	case sprHermitCrabCloseShell:
		mask_index = sprHermitCrabInShell;	
		break;
	default:
		mask_index = sprHermitCrabIdle;
		break;
}

