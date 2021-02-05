/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (core == noone)
{
	show_message("core of melee weapon can't be NO ONE!");
	game_end();
}
else
{
	if (!instance_exists(core))
	{
		instance_destroy();
	}
	
	x = core.x;
	y = core.y;
	image_xscale = core.image_xscale;
	image_yscale = core.image_yscale;
	depth = core.depth;
	image_index = core.image_index;
}