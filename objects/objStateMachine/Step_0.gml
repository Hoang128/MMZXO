/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

function fncStateHandle()
{
	with (currentState.id)
		fncStateRun();
}

if (core == noone)
{
	show_message("INVALID STATE MACHINE TYPE!");
}