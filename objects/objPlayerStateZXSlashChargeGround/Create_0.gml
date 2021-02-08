/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
slashEnd = false;

function fncStateStart()
{
	fncPlayerZXSlashChargeStart();
}

function fncStateRun()
{
	fncStateInit();
	fncPlayerZXSlashChargeRun();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerZXSlashChargeEnd();
}

function fncStateInit()
{
	if (!inited)
	{
		inited = true;
	}
}

function fncPlayerZXSlashChargeStart()
{
	with(core.id)
	{
		sprite_index = sprPlayerZXSlashChargeGround;
		image_index = 0;
		
		with (weaponMeleeMgr)
		{
			fncCreateMeleeWeapon(objZXDagger, sprZXSlashChargeGroundHitbox);
			weaponSlash.destroyWhenChangeState = true;
		}
		hspd = 0;
		vspd = 0;
	}
}

function fncPlayerZXSlashChargeRun()
{
	if (slashEnd)
	{
		with(stateMachine)
			fncStateChange(objPlayerStateIdle);
	}
}

function fncPlayerZXSlashChargeEnd()
{
	with (core.id)
	{
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

