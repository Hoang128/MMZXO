/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
slashEnd = false;
shotSonic = false;

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
		sprite_index = sprPlayerHSlashDouble;
		image_index = 0;
		
		with (weaponMeleeMgr)
		{
			fncCreateMeleeWeapon(objHDaggers, sprHSlashDoubleHitbox);
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
		with (core.id)
		{
			if (image_index > 3)
			{
				if (!other.shotSonic)
				{
					var objSonic = instance_create_depth(x + image_xscale * 16, y - 16, depth, objHSonicBeam);
					objSonic.image_xscale = image_xscale;
					
					other.shotSonic = true;
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