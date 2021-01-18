/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

function fncStateStart()
{
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

function fncStateRun()
{
	with (core.id)
	{
		if (vspd < slideSpdMax)
			vspd += slideAcc;
		else
			vspd = slideSpdMax;
		
		var hMove = keyboard_check(global.keyRight) - keyboard_check(global.keyLeft);
		if (hMove != charDir)
		{
			with(other.stateMachine)
			{
				fncStateChange(objPlayerStateJump);
				return;
			}
		}
		
		if (keyboard_check_pressed(global.keyJump))
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

function fncStateEnd()
{
	with(core.id)
		physic.gravAffect = true;
}