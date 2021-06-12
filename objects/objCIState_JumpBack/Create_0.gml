/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
jumpSpd = 3;
moveSpd = 3;

function fncStateStart()
{
	with (core.id)
	{
		physic.enable = true;
		physic.gravAffect = true;
		sprite_index = sprCInarabitta_JumpSpinBack;
		image_index = 0;
		
		physic.onGround = false;
		vspd = -other.jumpSpd;
		hspd = -image_xscale * other.moveSpd;
	}
}

function fncStateRun()
{
	with (core.id)
	{
		if (physic.onGround)
		{
			vspd = 0;
			hspd = 0;
			
			sprite_index = sprCInarabitta_Idle;
			image_index = 0;
			
			with (other)
			{
				fncDoDequeueMove();
			}
		}
	}
}

function fncStateEnd()
{
	
}