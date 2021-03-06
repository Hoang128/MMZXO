/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
slashEnd = false;
slashNext = false;

function fncStateStart()
{
	fncPlayerZXSlashCombo3Start();
}

function fncStateRun()
{
	fncPlayerZXSlashCombo3Run();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerZXSlashCombo3End();
}

function fncPlayerZXSlashCombo3Start()
{
	with(core.id)
	{
		sprite_index = sprPlayerZXSlashCombo3;
		image_index = 0;
		
		with (weaponMeleeMgr)
		{
			fncCreateMeleeWeapon(objZXDagger, sprZXSlashCombo3Hitbox);
			weaponSlash.destroyWhenChangeState = true;
		}
	}
}

function fncPlayerZXSlashCombo3Run()
{
	if (slashEnd)
	{
		with(stateMachine)
			fncStateChange(objPlayerStateIdle);
	}
}

function fncPlayerZXSlashCombo3End()
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