/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

timeWaitMax = 60;
timeWait = timeWaitMax;
illusionIn = noone;
phase = 0;

function fncStateStart()
{
	show_debug_message("hell bat schilt enter tele after shot state");
	with (core.id)
	{
		visible = false;
		
		var illusion = instance_create_depth(x, y, depth, objE_HellBatSchiltDownIllusion);
		illusion.image_xscale = image_xscale;
		other.phase = 1;
	}
}

function fncStateRun()
{
	if (timeWait > 0)
	{
		with (core.id)
		{
			other.timeWait -= TIME_SCALE;
		}
	}
	else
	{
		if (!core.id.visible)
		{
			if (phase == 1)
			{
				fncCreateIllusionDown();
			}
			else if (phase == 2)
			{
				if (!instance_exists(illusionIn))
				{
					core.id.visible = true;
					isIllusion = false;
				}
			}
		}
		else
		{
			fncDoDequeueMove();
		}
	}
}

function fncStateEnd()
{
	
}

function fncCreateIllusionDown()
{
	phase = 2;
	
	with (core.id)
	{
		fncChangeDirToPlayer(objGlobalManager.currentPlayer);
	}

	core.id.x = irandom_range(core.id.teleZone.x_l, core.id.teleZone.x_r);
	core.id.y = irandom_range(core.id.teleZone.y_t, core.id.teleZone.y_b);

	var illusion = instance_create_depth(core.id.x, core.id.y, depth, objE_HellBatSchiltIllusionIn);
	illusion.image_xscale = core.id.image_xscale;
	illusionIn = illusion;
}