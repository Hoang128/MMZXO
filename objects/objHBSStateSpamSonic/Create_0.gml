/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

inited = false;

spamTimeMax = 90;
spamTime = spamTimeMax;

skillUsed = false;

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
			if (other.spamTime <= (other.spamTimeMax * 0.6))
			{
				if (!other.skillUsed)
				{
					var sonic = array_create(6, noone);
					sonic[0] = instance_create_depth(x + 13 * image_xscale, y - 51, depth - 1, objE_HBSSonicMove);
					sonic[1] = instance_create_depth(x + 13 * image_xscale, y - 35, depth - 1, objE_HBSSonicMove);
					
					sonic[2] = instance_create_depth(x - 35 * image_xscale, y - 51, depth - 1, objE_HBSSonicMove);
					sonic[3] = instance_create_depth(x - 35 * image_xscale, y - 35, depth - 1, objE_HBSSonicMove);
					
					sonic[4] = instance_create_depth(x - 3 * image_xscale, y - 67, depth - 1, objE_HBSSonicMove);
					sonic[5] = instance_create_depth(x - 19 * image_xscale, y - 67, depth - 1, objE_HBSSonicMove);
					
					if (image_xscale == 1)
					{
						sonic[0].direction = 20;
						sonic[1].direction = -20;
					
						sonic[2].direction = 160;
						sonic[3].direction = -160;
						
						sonic[4].direction = 110;
						sonic[5].direction = 70;
					}
					else
					{
						sonic[0].direction = 160;
						sonic[1].direction = -160;
					
						sonic[2].direction = 20;
						sonic[3].direction = -20;
						
						sonic[4].direction = 70;
						sonic[5].direction = 110;
					}
					
					sonic[4].direction = 70;
					sonic[5].direction = 110;
					
					other.skillUsed = true;
				}
			}
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