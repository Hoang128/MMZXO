/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
slashEnd = false;
createIce = 0;

function fncStateStart()
{
	fncPlayerLSlashStandStart();
}

function fncStateRun()
{
	fncPlayerLSlashStandRun();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerLSlashStandEnd();
}

function fncPlayerLSlashStandStart()
{
	with(core.id)
	{
		sprite_index = sprPlayerLSlashStand;
		image_index = 0;
		
		with (weaponMeleeMgr)
		{
			fncCreateMeleeWeapon(objLJavelin, sprLSlashStandHitbox);
			weaponSlash.destroyWhenChangeState = true;
		}
		
		hspd = 0;
		vspd = 0;
	}
}

function fncPlayerLSlashStandRun()
{
	if (slashEnd)
	{
		with(stateMachine)
			fncStateChange(objPlayerStateIdle);
	}
	else
	{
		if (createIce > 0)
		{
			with (core.id)
			{
				if (image_index > 3)
				{
					if (other.createIce == 1)
					{
						var objIce = instance_create_depth(x + 24 * image_xscale, y - 24, depth,objLIce);
						objIce.image_xscale = image_xscale;
						objIce.firstSlash = weaponMeleeMgr.weaponSlash;
					}
					else if (other.createIce == 2)
					{
						var objIce = instance_create_depth(x, y - 16, depth, objLArrow);
						objIce.image_xscale = image_xscale;
					}
					
					other.createIce = 0;
				}
			}
		}
	}
}

function fncPlayerLSlashStandEnd()
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