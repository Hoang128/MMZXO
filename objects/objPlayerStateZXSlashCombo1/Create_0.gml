/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
slashEnd = false;
slashNext = false;

function fncStateStart()
{
	fncPlayerZXSlashCombo1Start();
}

function fncStateRun()
{
	fncPlayerZXSlashCombo1Run();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerZXSlashCombo1End();
}

function fncPlayerZXSlashCombo1Start()
{
	with(core.id)
	{
		sprite_index = sprPlayerZXSlashCombo1;
		image_index = 0;
		
		with (weaponMeleeMgr)
		{
			fncCreateMeleeWeapon(objZXDagger, sprZXSlashCombo1Hitbox);
			weaponSlash.destroyWhenChangeState = true;
		}
		hspd = 0;
		vspd = 0;
	}
}

function fncPlayerZXSlashCombo1Run()
{
	if (slashEnd)
	{
		with(stateMachine)
			fncStateChange(objPlayerStateIdle);
	}
}

function fncPlayerZXSlashCombo1End()
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

function fncChangeToZXStates()
{
	if (fncStaticHandleButton(KeyMap.ATTACK1, KeyAction.PRESSED))
	{
		if (slashNext == false)
		{
			slashNext = true;
		}
	}
	
	if (slashNext)
	{
		with(core.id)
		{
			if (image_index > 5)
			{
				with(other.stateMachine)
					fncStateChange(objPlayerStateZXSlashCombo2);
			}
		}
	}
}