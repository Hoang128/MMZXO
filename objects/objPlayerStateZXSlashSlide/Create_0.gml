/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
slideEff = noone;
transToSlideState = false;
startFrame = 0;
slashEnd = false;

function fncStateStart()
{
	fncPlayerZXSlashSlideStart();
}

function fncStateRun()
{
	fncStateInit();
	fncPlayerZXSlashSlideRun();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerZXSlashSlideEnd();
}

function fncStateInit()
{
	if (!inited)
	{
		with (core.id)
		{
			image_index = other.startFrame;
		}
		inited = true;
	}
}

function fncPlayerZXSlashSlideStart()
{
	with (core.id)
	{
		sprite_index = sprPlayerZXSlashSlide;
		image_index = 0;
		audio_play_sound_on(global.emitterSFX.source, vfxVentSlash1, false, false);
	
		physic.gravAffect = false;
	}
}

function fncPlayerZXSlashSlideRun()
{
	with (core.id)
	{
		if (vspd < slideSpdMax)
			vspd += slideAcc;
		else
			vspd = slideSpdMax;
		
		if (hMove != charDir)
		{
			with(other.stateMachine)
			{
				fncStateChange(objPlayerStateJump);
				return;
			}
		}
		
		if (!place_meeting(x + charDir, y, objBlock) || fncIsOnGround(distanceOffSlide))
		{
			if (jumpTime > 0)
				jumpTime--;
			with(other.stateMachine)
			{
				fncStateChange(objPlayerStateJump);
				return;
			}
		}
		
		if (other.slashEnd)
		{
			with(other.stateMachine)
			{
				var currentDustEff = noone;
				
				if (instance_exists(currentState.slideEff))
					currentDustEff = currentState.slideEff.id;
				transToSlideState = true;
				
				fncStateChange(objPlayerStateSlide);
				currentState.lastState = "slide slash";
				currentState.slideEff = currentDustEff;
				return;
			}
		}
	}
}

function fncPlayerZXSlashSlideEnd()
{
	with(core.id)
		physic.gravAffect = true;
	
	if (!transToSlideState)
		instance_destroy(slideEff);
}