/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
dashJump = false;

function fncStateStart()
{
	with (core.id)
	{
		if (vspd < 0)
		{
			sprite_index = sprPlayer.sprJumpStart;
			image_index = 0;
		}
		else
		{
			sprite_index = sprPlayer.sprFallStart;
			image_index = 0;
		}
	}
}

function fncStateRun()
{
	with (core.id)
	{
		var hMove = keyboard_check(global.keyRight) - keyboard_check(global.keyLeft);
		if (hMove != 0)
		{
			charDir = hMove;
		}
		
		var moveSpd = runSpd;
		if (other.dashJump)
			moveSpd = dashSpd;
		
		hspd = moveSpd * hMove;
		
		if (keyboard_check_released(global.keyJump))
		{
			if (vspd < 0) vspd = 0;
		}
	
		if (vspd >= 0)
		{
			if ((sprite_index == sprPlayer.sprJumpStart)
			|| (sprite_index == sprPlayer.sprJump))
			{
				sprite_index = sprPlayer.sprFallStart;
				image_index = 0;
			}
			
			if (keyboard_check_pressed(global.keyJump))
			{
				if (jumpTime > 0)
				{
					vspd = -jumpSpd;
					jumpTime--;
					
					with(other.stateMachine)
					{
						var currentDashJump = currentState.dashJump;
						fncStateChange(objPlayerStateJump);
						if (currentDashJump)
							currentState.dashJump = true;
						return;
					}
				}
			}
			
			if (place_meeting(x, y + global.gravMax, objBlock))
			{
				sprite_index = sprPlayer.sprLand;
				image_index = 0;
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateIdle);
					return;
				}
			}
		}
	}
}