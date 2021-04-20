/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

inited = false;
spaceToEarth = 16;
waitTime = 60;
flySpd = 2;

function fncStateStart()
{
	show_debug_message("hell bat schilt enter fly down state");
	
	with(core.id)
	{
		sprite_index = sprHellBatFlyDownStart;
		image_index = 0;
	}
}

function fncStateRun()
{	
	with (core.id)
	{
		if (!place_meeting(x, y + other.spaceToEarth, objBlock))
		{
			y += other.flySpd * TIME_SCALE;
		}
		else
		{
			if (other.spaceToEarth == 0)
			{
				if (sprite_index == sprHellBatFly)
				{
					sprite_index = sprHellBatLand;
					image_index = 0;
				}
				else if (sprite_index == sprHellBatStand)
				{
					if (other.waitTime > 0)
					{
						other.waitTime -= TIME_SCALE;
					}
					else
					{
						fncDoDequeueMove();
					}
				}
			}
			else
			{
				sprite_index = sprHellBatFly;
				image_index = 0;
			}
			
			with (other)
			{
				fncDoDequeueMove();
			}
		}
	}
}

function fncStateEnd()
{
	
}