/// @description Insert description here
// You can write your code in this editor

if (stateMachine == noone)
{
	show_message("INVALID STATE MACHINE!");
	game_end();
}

if (stateType == noone)
{
	show_message("INVALID STATE TYPE!");
	game_end();
}
else
{
	x = core.x;
	y = core.y;
}