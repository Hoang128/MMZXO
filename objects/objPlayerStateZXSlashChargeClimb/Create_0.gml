/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
slashEnd = false;

function fncStateStart()
{
	fncPlayerZXSlashChargeClimbStart();
}

function fncStateRun()
{
	fncStateInit();
	fncPlayerZXSlashChargeClimbRun();
}

function fncStateEnd()
{
	fncPlayerZXSlashChargeClimbEnd();
}

function fncPlayerZXSlashChargeClimbStart()
{
	with (core.id)
	{
		sprite_index = sprPlayerZXSlashChargeClimb;
		image_index = 0;
		image_speed = 0;
		
		with (weaponMeleeMgr)
		{
			fncCreateMeleeWeapon(objZXDagger, sprZXSlashChargeClimbHitbox);
			weaponSlash.destroyWhenChangeState = true;
		}
		vspd = 0;
		physic.gravAffect = false;
	}
}

function fncPlayerZXSlashChargeClimbRun()
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
				if (image_index < 7)
				{
					if (instance_exists(weaponMeleeMgr.weaponSlash))
					{
						weaponMeleeMgr.weaponSlash.playerStateChanged = true;
						weaponMeleeMgr.enableNextSFX = false;
					}
					with (other.stateMachine)
					{
						fncStateChange(objPlayerStateZXSlashChargeJump);
						currentState.lastState = "slash charge climb";
						return;
					}
				}
				else
				{
					with (other.stateMachine)
					{
						fncStateChange(objPlayerStateJump);
						return;
					}
				}
			}
		}
	}
}

function fncPlayerZXSlashChargeClimbEnd()
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