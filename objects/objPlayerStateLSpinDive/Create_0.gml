/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
slashEnd = false;
slashNext = false;
createIce = 0;
lastAction = "dive";
accSlow = 0;

function fncStateStart()
{
	fncPlayerLSpinDiveStart();
}

function fncStateRun()
{
	fncStateInit();
	fncPlayerLSpinDiveRun();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerLSpinDiveEnd();
}

function fncPlayerLSpinDiveStart()
{
	with (core.id)
	{
		physic.gravAffect = false;
	}
}

function fncStateInit()
{
	if (!inited)
	{
		core.id.sprite_index = sprPlayerLSpinDive;
		switch (lastAction)
		{
			case "spin":
			{
				core.id.image_index = 2;
			}	break;
			
			case "dive move":
			{
				core.id.image_index = 0;
				accSlow = core.id.accDive;
			}
			
			case "dive dash":
			{
				core.id.image_index = 0;
				accSlow = core.id.accDiveDash;
			}
			
			case "dive":
			{
				core.id.image_index = 0;
				accSlow = core.id.accDive;
			}
		}
		
		with (core.id)
		{
			with (weaponMeleeMgr)
			{
				fncCreateMeleeWeapon(objLJavelin, sprLSpinDiveHitbox);
				weaponSlash.destroyWhenChangeState = true;
			}
		}
		
		inited = true;
	}
}

function fncPlayerLSpinDiveRun()
{
	if (slashEnd)
	{
		with(stateMachine)
		{
			fncStateChange(objPlayerStateLDiveIdle);
			currentState.lastAction = "spin";
		}
	}
	else
	{
		with (core.id)
		{
			if (vspd < 0)
			{
				if (!collision_rectangle(bbox_left, bbox_top - 1, bbox_right, bbox_top, objZoneWater, false, false))
				{
					vspd = 0;
				}
			}
			else if (vspd > 0)
			{
				if (!collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom + 1, objZoneWater, false, false))
				{
					vspd = 0;
				}
			}
		
			if (abs(vspd) >= other.accSlow)
			{
				vspd -= sign(vspd) * other.accSlow;
			}
			else
				vspd = 0;
			
			if (abs(hspd) >= other.accSlow)
			{
				hspd -= sign(hspd) * other.accSlow;
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
		
		if (fncStaticHandleButton(KeyMap.ATTACK1, KeyAction.PRESSED)
		|| fncStaticHandleButton(KeyMap.ATTACK2, KeyAction.PRESSED))
		{
			if (core.id.image_index > 2)
			{
				if (!slashNext)
					slashNext = true;
			}
		}
	}
}

function fncPlayerLSpinDiveEnd()
{
	with (core.id)
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

function fncChangeToLXStates()
{
	with (core.id)
	{
		if (image_index >= 6)
		{
			if (other.slashNext)
			{
				with (other.stateMachine)
				{
					var accSlowCurrent = currentState.accSlow;
					fncStateChange(objPlayerStateLSpinDive);
					currentState.lastAction = "spin";
					currentState.accSlow = accSlowCurrent;
					return;
				}
			}
		}
	}
}