/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
slashEnd = false;
createIce = 0;

function fncStateStart()
{
	fncPlayerLSlashGigaStart();
}

function fncStateRun()
{
	fncPlayerLSlashGigaRun();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerLSlashGigaEnd();
}

function fncPlayerLSlashGigaStart()
{
	with(core.id)
	{
		sprite_index = sprPlayerLSlashGiga;
		image_index = 0;
		
		with (weaponMeleeMgr)
		{
			fncCreateMeleeWeapon(objLJavelin, sprLSlashGigaHitbox);
			weaponSlash.destroyWhenChangeState = true;
		}
		
		hspd = 0;
		vspd = 0;
	}
}

function fncPlayerLSlashGigaRun()
{
	if (slashEnd)
	{
		with(stateMachine)
			fncStateChange(objPlayerStateLDiveIdle);
	}
	else
	{
		with (core.id)
		{
			if (abs(vspd) >= accDive)
			{
				vspd -= sign(vspd) * accDive;
			}
			else
				vspd = 0;
			
			if (abs(hspd) >= accDive)
			{
				hspd -= sign(hspd) * accDive;
			}
			else
				hspd = 0;
		}
		
		if (createIce > 0)
		{
			with (core.id)
			{
				if (image_index > 3)
				{
					var objIce = instance_create_depth(x, y - 16, depth, objLArrow);
					objIce.image_xscale = image_xscale;
					
					other.createIce = 0;
				}
			}
		}
	}
}

function fncPlayerLSlashGigaEnd()
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