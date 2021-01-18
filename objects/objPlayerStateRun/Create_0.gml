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
		if (!physic.onGround)
		{
			jumpTime--;
			with(other.stateMachine)
			{
				fncStateChange(objPlayerStateJump);
				return;
			}
		}
		
		if (keyboard_check_pressed(global.keyJump))
		{
			if (keyboard_check(global.keyDown))
			{
				if (fncIsOnBlockThin(1))
				{
					if (!fncIsOnBlock(1))
					{
						y+=2;
						jumpTime--;
						physic.onGround = false;
						fncIgnoreThinBlockFor(physic.thinBlockIgnoreTime);
						with(other.stateMachine)
						{
							fncStateChange(objPlayerStateJump);
							return;
						}
					}
				}
			}
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
		}
		
		if (keyboard_check_pressed(global.keyDash))
		{
			with(other.stateMachine)
			{
				fncStateChange(objPlayerStateDash);
				return;
			}
		}
	}
}