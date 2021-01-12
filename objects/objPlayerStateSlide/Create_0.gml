/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
slideSide = 0;

function fncStateStart()
{
	with (core.id)
	{
		sprite_index = sprPlayer.sprSlideStart
		image_index = 0;
		
		hspd = 0;
		vspd = 0;
		jumpTime = jumpTimeMax;
		airDashCount = airDashCountMax;
	}
}

function fncStateRun()
{
	
}

function fncStateEnd()
{
	
}