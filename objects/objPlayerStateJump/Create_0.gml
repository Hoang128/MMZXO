/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

function fncStateRun()
{
	with (core.id)
	{
		var hMove = keyboard_check(global.keyRight) - keyboard_check(global.keyLeft);
		if (hMove != 0)
		{
			charDir = hMove;
		}
	
		hspd = runSpd * hMove;
	
		if (keyboard_check_released(global.keyJump))
		{
			if (vspd < 0) vspd = 0;
		}
	
		if (vspd >= 0)
		{
			if (place_meeting(x, y + 1, objBlock))
			{
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateIdle);
				}
				return;
			}
		}
	}
}