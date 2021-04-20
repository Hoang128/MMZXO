event_inherited();

inited = false;
flyUpTime = 25;
waitTime = 60;
flySpd = 2;

function fncStateStart()
{
	show_debug_message("hell bat schilt enter fly down state");
	
	with(core.id)
	{
		sprite_index = sprHellBatFlyUpStart;
		image_index = 0;
	}
}

function fncStateRun()
{	
	with (core.id)
	{
		if (sprite_index == sprHellBatFlyDown)
		{
			if (other.flyUpTime > 0)
			{
				y -= other.flySpd * TIME_SCALE;
				other.flyUpTime -= TIME_SCALE;
			}
			else
			{
				sprite_index = sprHellBatFly;
				image_index = 0;
			}
		}
		else if (sprite_index == sprHellBatFly)
		{
			if (other.waitTime > 0)
			{
				other.waitTime -= TIME_SCALE;
			}
			else
			{
				with (other)
				{
					fncDoDequeueMove();
				}
			}
		}
	}
}

function fncStateEnd()
{
	
}