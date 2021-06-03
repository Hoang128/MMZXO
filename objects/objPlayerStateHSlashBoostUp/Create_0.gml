/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

airDash = true;
shadowEffCreater = noone;
slashEnd = false;
createCyclone = 0;

function fncStateStart()
{
	fncPlayerHSlashDashStart();
}

function fncStateRun()
{
	fncStateInit();
	fncPlayerHSlashDashRun();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerHSlashDashEnd();
}

function fncPlayerHSlashDashStart()
{
	with (core.id)
	{
		sprite_index = sprPlayerHSlashJump;
		image_index = 0;
		
		with (weaponMeleeMgr)
		{
			fncCreateMeleeWeapon(objHDaggers, sprHSlashJumpHitbox);
		}
	}
}

function fncPlayerHSlashDashRun()
{
	if (slashEnd)
	{
		with(stateMachine)
		{
			fncStateChange(objPlayerStateJump);
			currentState.lastState = "slash dash";
			return;
		}
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

			if (dashTime > 0)
			{
				dashTime -= TIME_SCALE;
				
				if (image_index < 6)
				{
					if (vspd > -dashSpd)
						vspd -= dashSlashAccUp;
				}
			}
			else
			{
				if (!physic.gravAffect)
				{
					vspd = 0;
					physic.gravAffect = true;
				}
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

function fncPlayerHSlashDashEnd()
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