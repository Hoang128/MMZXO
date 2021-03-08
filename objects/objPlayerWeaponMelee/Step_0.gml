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
	
	if (!inited)
	{
		fncSetupResources();
		if (core.enableNextSFX)
			audio_play_sound_on(global.emitterSFX.source, sfx, false, false);
		else
			core.enableNextSFX = true;
		inited = true;
	}
	
	if (playerStateChanged)
	{
		if (imgSpd == 0)
		{
			fncChangeImgSpd();
		}
	}
	
	
	
	if (image_index > (image_number - 1))
		instance_destroy();
	
	x = core.x;
	y = core.y;
	image_xscale = core.image_xscale;
	image_yscale = core.image_yscale;
	depth = core.core.depth - 1;
	if (!playerStateChanged)
		image_index = core.core.image_index;
}