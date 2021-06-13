/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
shot = false;
changeState = false;

function fncStateStart()
{
	with (core.id)
	{
		sprite_index = sprCInarabitta_SlashArrow;
		image_index = 0;
		
		audio_play_sound_on(global.emitterSFX.source, sfxCI_Slash, false, true);
	}
}

function fncStateRun()
{
	if (changeState)
		fncDoDequeueMove();
	if (!shot)
	{
		with (core.id)
		{
			if (image_index >= 10)
			{
				objCIArrow = instance_create_depth(x + 6 * image_xscale, y - 13, depth - 1, objCI_Arrow);
				objCIArrow.image_xscale = image_xscale;
				other.shot = true;
			}
		}
	}
}

function fncStateEnd()
{
}