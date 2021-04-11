/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

waitTime = 0;
waitTimeMax = 4;

inited = false;
spamTime = 120;

function fncStateStart()
{
	show_debug_message("hell bat schilt ente spam bat state");
	
	with(core.id)
	{
		sprite_index = sprHellBatSpamBatStart;
		image_index = 0;
	}
}

function fncStateRun()
{	
	with (core.id)
	{
		if (sprite_index == sprHellBatSpamBat)
		{
			if (other.spamTime > 0)
			{
				if (other.waitTime > 0)
				{
					other.waitTime -= TIME_SCALE;
				}
				else
				{
					instance_create_depth(x + 24 * image_xscale, y - 42, depth, objE_HBSBat);
					other.waitTime = other.waitTimeMax;
				}
			
				other.spamTime -= TIME_SCALE;
			}
			else
			{
				sprite_index = sprHellBatSpamBatEnd;
				image_index = 0;
			}
		}
	}
}

function fncStateEnd()
{
	
}