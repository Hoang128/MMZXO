/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

phase = 0;
shotTime = 3;
shot = false;
shotTimeMax = shotTime;
illusionNumber = 3;
illusionSpace = 56;
rearSpace = 24;
waitTime = 0;
waitIllusion = 60;
xPos = 0;
yPos = 0;
illusionArr = array_create(illusionNumber, noone);

function fncStateStart()
{
	show_debug_message("hell bat schilt enter shot down state");
	
	
	audio_play_sound_on(global.emitterSFX.source, sfxBossHBSShotBeamDownStart, false, true);
	fncStartIllusion(objGlobalManager.currentPlayer);
}

function fncStateRun()
{
	if (!core.id.visible)
	{
		if (waitTime > 0)
		{
			with (core.id)
			{
				other.waitTime -= TIME_SCALE;
			}
		}
		else
		{
			fncEndIllusion();
		}
	}
	else
	{
		with (core.id)
		{
			if (sprite_index == sprHellBatShotDown)
			{
				if (image_index > 3)
				{
					if (!other.shot)
					{
						instance_create_depth(x, y + 54, depth - 1, objE_HBSThunderBeam);
						other.shot = true;
					}
				}
			}
		}
	}
}

function fncStateEnd()
{
}

function fncStartIllusion(player)
{
	shotTime--;
	if (!instance_exists(player))
	{
		xPos = VIEW_X + VIEW_W / 2;
	}
	else
	{
		xPos = player.x;
	}
	phase = 1;
	with(core.id)
	{
		visible = 0;
		isIllusion = true;
		
		other.yPos = bossFightZone.bbox_top;
		illusionSpace = 4;
		other.xPos = clamp(other.xPos, 
					bossFightZone.bbox_left + other.illusionSpace * (other.illusionNumber - 1) / 2 + other.rearSpace, 
					bossFightZone.bbox_right - other.illusionSpace * (other.illusionNumber - 1) / 2 - other.rearSpace);		
	}
	
	waitTime = waitIllusion;
	if (shotTime == shotTimeMax)
		fncCreateIllusion(true);
	else
		fncCreateIllusion(false);
}

function fncCreateIllusion(isFirstTime)
{
	var startPos = xPos - (illusionSpace * (illusionNumber - 1) / 2);
	for (var i = 0; i < array_length(illusionArr); i++)
	{
		illusionArr[i] = instance_create_depth(startPos + illusionSpace * i, yPos, core.id.depth, objE_HellBatSchiltTopIllusion);
		if (!isFirstTime)
		{
			illusionArr[i].sprite_index = sprHellBatShotDown;
			illusionArr[i].image_index = 0;
			illusionArr[i].image_xscale = core.id.image_xscale;
		}
	}
}

function fncEndIllusion()
{
	with(core.id)
	{
		var illusionChoose = irandom(other.illusionNumber - 1);
		
		isIllusion = false;
		sprite_index = sprHellBatShotDown;
		image_index = 0;
		x = other.illusionArr[illusionChoose].x;
		y = other.illusionArr[illusionChoose].y;
		visible = 1;
		audio_play_sound_on(global.emitterSFX.source, sfxBossHBSShotBeamDown, false, true);
		
		for (var i = 0; i < array_length(other.illusionArr); i++)
		{
			instance_destroy(other.illusionArr[i]);
			other.illusionArr[i] = noone;
		}
	}
}