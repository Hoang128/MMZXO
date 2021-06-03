/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
slashEnd = false;
slashNext = false;
canDoubleSlash = false;

function fncStateStart()
{
	fncPlayerHSlashHStart();
}

function fncStateRun()
{
	fncPlayerHSlashHRun();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerHSlashHEnd();
}

function fncPlayerHSlashHStart()
{
	with(core.id)
	{
		sprite_index = sprPlayerHSlash2;
		image_index = 0;
		
		/*
		with (weaponMeleeMgr)
		{
			fncCreateMeleeWeapon(objZXDagger, sprZXSlashCombo1Hitbox);
			weaponSlash.destroyWhenChangeState = true;
		}
		*/
		
		hspd = 0;
		vspd = 0;
	}
}

function fncPlayerHSlashHRun()
{
	if (slashEnd)
	{
		with(stateMachine)
			fncStateChange(objPlayerStateIdle);
	}
}

function fncPlayerHSlashHEnd()
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

function fncChangeToHXStates()
{
	if (fncStaticHandleButton(KeyMap.ATTACK1, KeyAction.PRESSED))
	{
		if (canDoubleSlash)
		{
			if (slashNext == false)
			{
				slashNext = true;
			}
		}
	}
	
	if (slashNext)
	{
		with(core.id)
		{
			if (image_index > 7)
			{
				with(other.stateMachine)
					fncStateChange(objPlayerStateHSlashDouble);
			}
		}
	}
}