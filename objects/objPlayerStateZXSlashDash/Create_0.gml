/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

airDash = false;
shadowEffCreater = noone;
slashEnd = false;

function fncStateStart()
{
	fncPlayerZXSlashDashStart();
}

function fncStateRun()
{
	fncStateInit();
	fncPlayerZXSlashDashRun();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerZXSlashDashEnd();
}

function fncPlayerZXSlashDashStart()
{
	with (core.id)
	{
		sprite_index = sprPlayerZXSlashDash;
		image_index = 0;
		
		with (weaponMeleeMgr)
		{
			fncCreateMeleeWeapon(objZXDagger, sprZXSlashDashHitbox);
		}
	}
}

function fncPlayerZXSlashDashRun()
{
	if (slashEnd)
	{
		if (airDash)
		{
			with(stateMachine)
			{
				fncStateChange(objPlayerStateJump);
				return;
			}
		}
		else
		{
			with(stateMachine)
			{
				fncStateChange(objPlayerStateIdle);
				currentState.lastState = "slash dash";
				return;
			}
		}
	}
	else
	{
		with (core.id)
		{
			if (other.airDash)
			{
				if (fncIsOnGround(2))
				{
					other.airDash = false;
					physic.gravAffect = true;
				}
			}
			else
			{
				if (!physic.onGround)
				{
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
		
			if (image_index < 6)
			{
				if (abs(hspd) < abs(dashSpd))
					hspd += dashSlashAccUp * charDir;
			}
		}
	}
}

function fncStateInit()
{
	if (!inited)
	{
		if (airDash)
		{
			with (core.id)
			{
				vspd = 0;
				physic.gravAffect = false;
			}
		}
		inited = true;
	}
}

function fncPlayerZXSlashDashEnd()
{
	instance_destroy(shadowEffCreater);
	with (core.id)
	{
		if (!physic.gravAffect)
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