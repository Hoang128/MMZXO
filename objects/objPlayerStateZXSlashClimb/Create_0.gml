/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
slashEnd = false;

function fncStateStart()
{
	fncPlayerZXSlashClimbStart();
}

function fncStateRun()
{
	fncPlayerZXSlashClimbRun();
}

function fncStateEnd()
{
	fncPlayerZXSlashClimbEnd();
}

function fncPlayerZXSlashClimbStart()
{
	with (core.id)
	{
		sprite_index = sprPlayerZXSlashClimb;
		image_index = 0;
		image_speed = 0;
		
		with (weaponMeleeMgr)
		{
			fncCreateMeleeWeapon(objZXDagger, sprZXSlashClimbHitbox);
		}
		vspd = 0;
		physic.gravAffect = false;
	}
}

function fncPlayerZXSlashClimbRun()
{
	if (slashEnd)
	{
		with(stateMachine)
		{
			fncStateChange(objPlayerStateClimb);
			currentState.lastState = "climb slash";
			return;
		}
	}
	else
	{
		with (core.id)
		{
			if (fncStaticHandleButton(KeyMap.JUMP, KeyAction.PRESSED))
			{
				vspd = 0;
				canClimb = -canClimbDelayTime;
				jumpTime--;
				if (instance_exists(weaponMeleeMgr.weaponSlash))
					weaponMeleeMgr.weaponSlash.playerStateChanged = true;
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateJump);
					return;
				}
			}
		}
	}
}

function fncPlayerZXSlashClimbEnd()
{
	with(core.id)
	{
		physic.gravAffect = true;
		with (weaponMeleeMgr)
		{
			if ((weaponSlash != noone) && instance_exists(weaponSlash))
			{
				if (weaponSlash.destroyWhenChangeState)
					fncDestroyMeleeWeapon();
			}
		}
	}
}