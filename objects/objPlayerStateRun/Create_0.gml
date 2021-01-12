/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

function fncStateStart()
{
	with(core.id)
	{
		sprite_index = sprPlayer.sprRun;
		image_index = 0;
	}
}

function fncStateRun()
{
	with(core.id)
	{
		hspd = runSpd * charDir;
		var hMove = keyboard_check(global.keyRight) - keyboard_check(global.keyLeft);
		if (hMove == 0)
		{
			with(other.stateMachine)
			{
				fncStateChange(objPlayerStateIdle);
				return;
			}
		}
		else
		{
			if (charDir != hMove)
				charDir = hMove;
			if (place_meeting(x + charDir, y, objBlock))
			{
				if (!place_meeting(x + charDir * maxDisDetectSlopeAbove, y, objSlope))
				{
					with(other.stateMachine)
					{
						fncStateChange(objPlayerStateIdle);
						return;
					}
				}
			}
			fncMoveSlopdeDownYPos();
		}
	
		if (keyboard_check_pressed(global.keyJump))
		{
			if (jumpTime > 0)
			{
				vspd = -jumpSpd;
				jumpTime--;
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateJump);
					return;
				}
			}
		}
		
		if (keyboard_check_pressed(global.keyDash))
		{
			with(other.stateMachine)
			{
				fncStateChange(objPlayerStateDash);
				return;
			}
		}
	
		if (!place_meeting(x, y + jumpSpd, objBlock))
		{
			jumpTime--;
			with(other.stateMachine)
			{
				fncStateChange(objPlayerStateJump);
				return;
			}
		}
	}
}