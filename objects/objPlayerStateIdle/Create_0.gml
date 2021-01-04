/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

function fncStateStart()
{
	with(core.id)
	{
		hspd = 0;
		vspd = 0;
	}
}

function fncStateRun()
{
	with(core.id)
	{
		var hMove = keyboard_check(global.keyRight) - keyboard_check(global.keyLeft);
		if (hMove != 0)
		{
			charDir = hMove;
			with(other.stateMachine)
			{
				fncStateChange(objPlayerStateRun);
			}
			return;
		}
	
		if (keyboard_check_pressed(global.keyJump))
		{
			vspd = -jumpSpd;
			with(other.stateMachine)
			{
				fncStateChange(objPlayerStateJump);
			}
			return;
		}
	
		if (!place_meeting(x, y + 1, objBlock))
		{
			with(other.stateMachine)
			{
				fncStateChange(objPlayerStateJump);
			}
			return;
		}
	}
}