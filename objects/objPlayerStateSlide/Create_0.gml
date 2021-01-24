/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
slideEff = noone;

function fncStateStart()
{
	fncPlayerSlideStart();
}

function fncStateRun()
{
	fncStateInit();
	fncPlayerSlideRun();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerSlideEnd();
}

function fncPlayerSlideStart()
{
	audio_play_sound_on(global.emitterSFX.source, sfxFootCommon, false, false);
	
	with (core.id)
	{
		sprite_index = sprPlayer.sprSlideStart
		image_index = 0;
		
		hspd = 0;
		vspd = 0;
		physic.gravAffect = false;
		jumpTime = jumpTimeMax;
		airDashCount = airDashCountMax;
	}
}

function fncPlayerSlideRun()
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
		
		if (fncStaticHandleButton(KeyMap.JUMP, KeyAction.PRESSED))
		{
			with(other.stateMachine)
			{
				fncStateChange(objPlayerStateWallKick);
				currentState.dashJump = keyboard_check(global.keyDash);
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
	}
}

function fncPlayerSlideEnd()
{
	with(core.id)
		physic.gravAffect = true;
	
	instance_destroy(slideEff);
}

function fncChangeToZXStates()
{
	with (core.id)
	{
		if (fncStaticHandleButton(KeyMap.ATTACK2, KeyAction.PRESSED))
		{
			fncPerformWeapon2();
		}
		
		if (fncStaticHandleButton(KeyMap.ATTACK2, KeyAction.HELD))
		{
			fncChargeWeapon(2);
		}
		
		if (fncStaticHandleButton(KeyMap.ATTACK2, KeyAction.RELEASED))
		{
			fncReleaseWeapon(2);
		}
	}
}