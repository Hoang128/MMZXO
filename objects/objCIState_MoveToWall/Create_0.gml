/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
jumpSpd = 3;
moveSpd = 3;
changeState = false;

function fncStateStart()
{
	with (core.id)
	{
		physic.enable = true;
		physic.gravAffect = true;
		physic.onGround = true;
		
		sprite_index = sprCInarabitta_JumpToWall;
		image_index = 0;
		physic.onGround = false;
		vspd = -other.jumpSpd;
		hspd = image_xscale * other.moveSpd;
	}
}

function fncStateRun()
{
	if (changeState)
	{
		with (core.id)
		{
			vspd = 0;
			hspd = 0;
			physic.onGround = false;
			physic.enable = false;
			physic.gravAffect = false;
		}
		fncDoDequeueMove();
	}
}

function fncStateEnd()
{
}