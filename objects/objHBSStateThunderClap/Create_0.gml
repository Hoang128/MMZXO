/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

clapTime = 4;
rootPos = {x : 27, y : -35};
space = 10;
shot = false;

function fncStateStart()
{
	with (core.id)
	{
		sprite_index = sprHellBatThunderClap;
		image_index = 0;
	}
	
	clapTime--;
}

function fncStateRun()
{
	with (core.id)
	{
		if (sprite_index == sprHellBatThunderClap)
		{
			if (image_index > 5)
			{
				if (other.shot == false)
				{
					var objOrb = instance_create_depth(x + other.rootPos.x * image_xscale, y + other.rootPos.y + other.space * irandom(3), depth + 1, objE_HBSThunderClapOrb);
					objOrb.image_xscale = image_xscale;
					other.shot = true;
					
					audio_play_sound_on(global.emitterSFX.source, sfxBossHBSThunderClap, false, true);
				}
			}
		}
	}
}

function fncStateEnd()
{
}