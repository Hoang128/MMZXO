/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
slashEnd = false;
createIce = 0;

function fncStateStart()
{
	fncPlayerLSlashClimbStart();
}

function fncStateRun()
{
	fncPlayerLSlashClimbRun();
}

function fncStateEnd()
{
	fncPlayerLSlashClimbEnd();
}

function fncPlayerLSlashClimbStart()
{
	with (core.id)
	{
		sprite_index = sprPlayerLSlashClimb;
		image_index = 0;
		image_speed = 0;
		
		with (weaponMeleeMgr)
		{
			fncCreateMeleeWeapon(objLJavelin, sprLSlashClimbHitbox);
		}
		
		vspd = 0;
		physic.gravAffect = false;
	}
}

function fncPlayerLSlashClimbRun()
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
			
		with (core.id)
		{
			if (fncStaticHandleButton(KeyMap.JUMP, KeyAction.PRESSED))
			{
				vspd = 0;
				canClimb = -canClimbDelayTime;
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
	}
}

function fncPlayerLSlashClimbEnd()
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