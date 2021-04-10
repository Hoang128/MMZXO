/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

inited = false;
spamTime = 60;

function fncStateStart()
{
	show_debug_message("hell bat schilt ente spam sonic state");
	
	with(core.id)
	{
		sprite_index = sprHellBatSpamSonicStart;
		image_index = 0;
	}
}

function fncStateRun()
{	
	with (core.id)
	{
		if (other.spamTime > 0)
		{
			other.spamTime -= TIME_SCALE;
		}
		else
		{
			if (sprite_index != sprHellBatSpamSonicEnd)
			{
				sprite_index = sprHellBatSpamSonicEnd;
			}
		}
	}
}

function fncStateEnd()
{
	
}