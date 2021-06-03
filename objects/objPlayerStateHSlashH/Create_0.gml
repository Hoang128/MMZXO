/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
slashEnd = false;
slashNext = false;
createCyclone = 0;

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
		sprite_index = sprPlayerHSlash1;
		image_index = 0;
		
		with (weaponMeleeMgr)
		{
			fncCreateMeleeWeapon(objHDaggers, sprHSlash1Hitbox);
			weaponSlash.destroyWhenChangeState = true;
		}
		
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
	else
	{
		if (createCyclone > 0)
		{
			with (core.id)
			{
				if (image_index > 2)
				{
					var objCycloneC = instance_create_depth(x, y - 16, depth, objHCycloneCreater);
					objCycloneC.image_xscale = image_xscale;
					objCycloneC.pattern = other.createCyclone - 1;
					other.createCyclone = 0;
				}
			}
		}
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
	if (fncStaticHandleButton(KeyMap.ATTACK2, KeyAction.PRESSED))
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
			if (image_index > 7)
			{
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateHSlashV);
					currentState.canDoubleSlash = true;
				}
			}
		}
	}
}