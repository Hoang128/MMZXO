/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
slideEff = noone;
transToSlideState = false;
lastState = "default";

function fncStateStart()
{
	if (global.debug)
		show_debug_message("Entered Slide State!");
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

function fncStateInit()
{
	if (!inited)
	{
		switch (lastState)
		{
			case "slide slash":
			{
				with (core.id)
				{
					sprite_index = sprPlayer.sprSlide;
					image_index = 0;
				}
			}	break;
		
			default:
			{
				with (core.id)
				{
					sprite_index = sprPlayer.sprSlideStart;
					image_index = 0;
					vspd = 0;
				}
			}
		}
		
		inited = true;
	}
}

function fncPlayerSlideStart()
{
	audio_play_sound_on(global.emitterSFX.source, sfxFootCommon, false, false);
	
	with (core.id)
	{	
		hspd = 0;
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
			charDir *= -1;
			with(other.stateMachine)
			{
				fncStateChange(objPlayerStateJump);
				return;
			}
		}
		
		if (fncStaticHandleButton(KeyMap.JUMP, KeyAction.PRESSED))
		{
			jumpTime = jumpTimeMax - 1;
			with(other.stateMachine)
			{
				fncStateChange(objPlayerStateWallKick);
				currentState.dashJump = keyboard_check(global.keyDash);
			}
			return;
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
	
	if (!transToSlideState)
		instance_destroy(slideEff);
}

function fncChangeToZXStates()
{

}