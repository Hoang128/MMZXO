/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

waitTime = 0;
waitTimeMax = 4;
vspdBatArr = array_create(6, 0);
vspdBatArr[0] = 0.4;
vspdBatArr[1] = 1.2;
vspdBatArr[2] = 0.6;
vspdBatArr[3] = 1;
vspdBatArr[4] = 0.8;
vspdBatArr[5] = 1.4;
count = 0;

inited = false;
spamTime = 180;

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
					var bat = instance_create_depth(x + 24 * image_xscale, y - 36 + other.count * 2, depth - 1, objE_HBSBat);
					other.waitTime = other.waitTimeMax;
					bat.vMoveSpd = other.vspdBatArr[other.count];
					
					if (other.count < (array_length(other.vspdBatArr) - 1))
					{
						other.count++;
					}
					else
						other.count = 0;
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