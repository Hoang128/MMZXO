/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

function fncStateStart()
{
	with(core.id)
	{
		sprite_index = sprPlayer.sprDashStart;
		image_index = 0;
		
		dashTime = dashTimeMax;
	}
}

function fncStateRun()
{
	with(core.id)
	{
		if (dashTime > 0)
		{
			if (keyboard_check_pressed(global.keyJump))
			{
				if (jumpTime > 0)
				{
					vspd = -jumpSpd;
					jumpTime--;
					with(other.stateMachine)
					{
						fncStateChange(objPlayerStateJump);
						currentState.dashJump = true;
						return;
					}
				}
			}
			
			if (abs(hspd) < dashSpd)
			{
				hspd += charDir * dashAccUp
			}
			else
				hspd = charDir * dashSpd;
			if (keyboard_check_released(global.keyDash))
			{
				dashTime = 0;
			}
			dashTime -= TIME_SCALE;
		}
		else
		{
			if (sprite_index != sprPlayer.sprDashEnd)
			{
				dashTime = 0;
				sprite_index = sprPlayer.sprDashEnd;
				image_index = 0;
				
				var hMove = keyboard_check(global.keyRight) - keyboard_check(global.keyLeft);
				if (hMove != 0)
				{
					charDir = hMove;
					with(other.stateMachine)
					{
						fncStateChange(objPlayerStateRun);
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
			
			if (abs(hspd) > 0)
			{
				hspd -= charDir * dashAccDown;
			}
			else
			{
				hspd = 0;
				
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateIdle);
					return;
				}
			}	
		}
		
		if (!place_meeting(x, y + jumpSpd, objBlock))
		{
			with(other.stateMachine)
			{
				fncStateChange(objPlayerStateJump);
				return;
			}
		}
	}
}