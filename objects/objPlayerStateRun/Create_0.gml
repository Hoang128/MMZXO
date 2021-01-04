/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

function fncStateRun()
{
	with(core.id)
	{
		hspd = runSpd * charDir;
		var hMove = keyboard_check(global.keyRight) - keyboard_check(global.keyLeft);
		if (hMove == 0)
		{
			with(other.stateMachine)
				fncStateChange(objPlayerStateIdle);
			return;
		}
	
		if (keyboard_check_pressed(global.keyJump))
		{
			vspd = -jumpSpd;
		
			with(other.stateMachine)
				fncStateChange(objPlayerStateJump);
			return;
		}
	
		if (!place_meeting(x, y + 1, objBlock))
		{
			with(other.stateMachine)
				fncStateChange(objPlayerStateJump);
			return;
		}
	}
}