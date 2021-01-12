/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

function fncStateStart()
{
	with(core.id)
	{
		if (sprite_index != sprPlayer.sprLand)
		{
			sprite_index = sprPlayer.sprIdle;
			image_index = 0;
		}
		
		hspd = 0;
		vspd = 0;
		jumpTime = jumpTimeMax;
		airDashCount = airDashCountMax;
	}
}

function fncStateRun()
{
	with(core.id)
	{
		var hMove = keyboard_check(global.keyRight) - keyboard_check(global.keyLeft);
		if (hMove != 0)
		{
			if (!(place_meeting(x + charDir, y, objBlock) && (hMove == charDir)))
			{
				charDir = hMove;
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateRun);
					return;
				}
			}
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
			if (!place_meeting(x + charDir, y, objBlock))
			{
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateDash);
					return;
				}
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