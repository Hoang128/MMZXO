/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

inited = false;
timeTele = 3;

timeWaitMax = 60;
timeWaitIdle = 10;
timeWait = timeWaitMax;
illusionIn = noone;
customTele = "no";
phase = 0;

function fncStateStart()
{
	show_debug_message("hell bat schilt enter tele state");
	core.id.isIllusion = true;
}

function fncCreateIllusion(isOut)
{
	if (isOut)
	{
		core.id.visible = 0;
		var illusion = instance_create_depth(core.id.x, core.id.y, depth, objE_HellBatSchiltIllusionOut);
		illusion.image_xscale = core.id.image_xscale;
		phase = 1;
		timeTele--;
		
		audio_play_sound_on(global.emitterSFX.source, sfxBossHBSSmile, false, true);
	}
	else
	{
		with (core.id)
		{
			fncChangeDirToPlayer(objGlobalManager.currentPlayer);
		}
		if (customTele == "release sonic")
		{
			var centerX = (core.id.teleZone.x_l + core.id.teleZone.x_r) / 2;
			var centerY = (core.id.teleZone.y_t + core.id.teleZone.y_b) / 2;
			core.id.x = irandom_range(centerX - 64, centerX + 64);
			core.id.y = irandom_range(centerY - 32, centerY + 32);
		}
		else if (customTele == "no")
		{
			core.id.x = irandom_range(core.id.teleZone.x_l, core.id.teleZone.x_r);
			core.id.y = irandom_range(core.id.teleZone.y_t, core.id.teleZone.y_b);
		}
		var illusion = instance_create_depth(core.id.x, core.id.y, depth, objE_HellBatSchiltIllusionIn);
		illusion.image_xscale = core.id.image_xscale;
		illusionIn = illusion;
	}
}

function fncStateRun()
{	
	if (!inited)
	{
		if (customTele == "release sonic" || customTele == "shot down")
		{
			timeTele = 1;
		}
		else
		{
			timeTele = irandom_range(1, 3);
		}
		
		with (core.id)
		{
			sprite_index = sprHellBatTele;
			image_index = 0;
		}
		
		inited = true;
	}
	else
	{
		if (phase == 1)
		{
			if (core.id.visible == 0)
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
					if (customTele != "shot down")
					{
						timeWait = timeWaitIdle;
						phase = 2;
						fncCreateIllusion(false);
					}
					else if (customTele == "shot down")
					{
						fncDoDequeueMove();
					}
				}
			}
		}
		else if (phase == 2)
		{
			if (core.id.visible == 0)
			{
				if (!instance_exists(illusionIn))
				{
					with (core.id)
					{
						sprite_index = sprHellBatFly;
						image_index = 0;
						visible = 1;
					}
				}
			}
			else
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
					if (timeTele > 0)
					{
						timeWait = timeWaitMax;
						phase = 0;
						
						with (core.id)
						{
							sprite_index = sprHellBatTele;
							image_index = 0;
						}
					}
					else
					{
						fncDoDequeueMove();
					}
				}
			}
		}
	}
}

function fncStateEnd()
{
	core.id.isIllusion = false;
}