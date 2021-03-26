/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
phase = 0;

event_inherited();

function fncStateStart()
{
	with(core.id)
	{
		if (physic.onGround)
		{
			sprite_index = sprPlayer.sprRun;
			image_index = 0;
		}
		
		else
		{
			sprite_index = sprPlayer.sprFallStart;
			image_index = 0;
		}
		
		hspd = 0;
		vspd = 0;
		physic.gravAffect = false;
		
		with (weaponMeleeMgr)
		{
			if ((weaponSlash != noone) && instance_exists(weaponSlash))
			{
					fncDestroyMeleeWeapon();
			}
		}
	}
}

function fncStateInit()
{
}

function fncStateRun()
{
	with (core.id)
	{
		if (!place_meeting(x, y, objGate))
		{
			physic.gravAffect = true;
			if (physic.onGround)
			{
				with (playerStateMachine)
					fncStateChange(objPlayerStateIdle);
			}
			else
			{
				with (playerStateMachine)
					fncStateChange(objPlayerStateJump);
			}
		}
		else
		{
			if (!place_meeting(x + 2 * charDir, y, objBlock))
			{
				x += charDir;
			}
		}
	}
}

function fncStateEnd()
{
	
}