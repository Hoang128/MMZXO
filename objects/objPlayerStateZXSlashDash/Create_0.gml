/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

airDash = false;
shadowEffCreater = noone;
slashEnd = false;

function fncStateStart()
{
	fncPlayerZXSlashDashStart();
}

function fncStateRun()
{
	fncStateInit();
	fncPlayerZXSlashDashRun();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerZXSlashDashEnd();
}

function fncPlayerZXSlashDashStart()
{
	with (core.id)
	{
		sprite_index = sprPlayerZXSlashDash;
		image_index = 0;
		audio_play_sound_on(global.emitterSFX.source, vfxVentSlash1, false, false);
		
		physic.gravAffect = false;
	}
}

function fncPlayerZXSlashDashRun()
{
	with (core.id)
	{
		if (image_index < 6)
		{
			if (abs(hspd) < abs(dashSpd))
				hspd += dashSlashAccUp * charDir;
		}
	}
	
	if (slashEnd)
	{
		if (airDash)
		{
			with(stateMachine)
			{
				fncStateChange(objPlayerStateJump);
			}
		}
		else
		{
			with(stateMachine)
			{
				fncStateChange(objPlayerStateIdle);
				currentState.lastState = "slash dash";
			}
		}
	}
}

function fncPlayerZXSlashDashEnd()
{
	instance_destroy(shadowEffCreater);
	with (core.id)
	{
		if (!physic.gravAffect)
			physic.gravAffect = true;
	}
}