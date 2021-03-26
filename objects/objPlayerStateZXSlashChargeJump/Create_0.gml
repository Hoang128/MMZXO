/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
slashEnd = false;
slashNext = false;
dashJump = false;
lastState = "default";
shadowEffCreater = noone;

function fncStateStart()
{
	if (global.debug)
		show_debug_message("Entered Slash Jump State!");
	fncPlayerZXSlashChargeJumpStart();
}

function fncStateRun()
{
	fncStateInit();
	fncPlayerZXSlashChargeJumpRun();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerZXSlashChargeJumpEnd();
}

function fncStateInit()
{
	if (!inited)
	{
		switch (lastState)
		{
			case "default":
			{
				with (core.id)
					image_index = 0;
			}	break;
			case "slash charge slide":
			{
				with (core.id)
				{
					if (image_index >= 5)
					{
						image_index -= 3;
					}
					else
						image_index = 0;
				}
			}	break;
			case "slash charge climb":
			{
				with (core.id)
				{
					image_index ++;
				}
			}	break;
		}
		inited = true;
	}
}

function fncPlayerZXSlashChargeJumpStart()
{
	with(core.id)
	{
		sprite_index = sprPlayerZXSlashChargeJump;
		
		with (weaponMeleeMgr)
		{
			fncCreateMeleeWeapon(objZXDagger, sprZXSlashChargeJumpHitbox);
			weaponSlash.destroyWhenChangeState = true;
		}
	}
}

function fncPlayerZXSlashChargeJumpRun()
{
	if (dashJump)
	{
		if (shadowEffCreater == noone)
		{
			shadowEffCreater = instance_create_depth(x, y, depth - 1, objPlayerShadowCreater);
			shadowEffCreater.core = self.core;
		}
	}
	
	if (slashEnd)
	{
		with(stateMachine)
		{
			var currentDashJump = currentState.dashJump;
			fncStateChange(objPlayerStateJump);
			currentState.dashJump = currentDashJump;
		}
		return;
	}
	else
	{	
		with (core.id)
		{
			if (hMove != 0)
			{
				charDir = hMove;
			}
		
			var moveSpd = runSpd;
			if (other.dashJump)
				moveSpd = dashSpd;
		
			hspd = moveSpd * hMove * jumpHspdRatio;
		
			if (!fncStaticHandleButton(KeyMap.JUMP, KeyAction.HELD))
			{
				if (vspd < 0) vspd = 0;
			}
	
			if (vspd >= 0)
			{
				if (place_meeting(x + charDir, y, objBlock))
				{
					if (!fncIsOnGround(distanceOffSlide))
					{
						if (hMove == charDir)
						{
							if (image_index < 8)
							{
								if (instance_exists(weaponMeleeMgr.weaponSlash))
								{
									weaponMeleeMgr.weaponSlash.playerStateChanged = true;
									weaponMeleeMgr.enableNextSFX = false;
								}
								with (other.stateMachine)
								{
									fncStateChange(objPlayerStateZXSlashChargeSlide);
									currentState.lastState = "slash charge jump";
									return;
								}
							}
							else
							{
								with (other.stateMachine)
								{
									fncStateChange(objPlayerStateSlide);
									return;
								}
							}
						}
					}
				}
			
				if (physic.onGround)
				{	
					runSFXPlayer = instance_create_depth(x, y, depth, objPlayerRunSFXCreater);
					runSFXPlayer.core = self.id;
					if (instance_exists(weaponMeleeMgr.weaponSlash))
					{
						weaponMeleeMgr.weaponSlash.playerStateChanged = true;
						weaponMeleeMgr.enableNextSFX = false;
					}
					
					with(other.stateMachine)
					{
						fncStateChange(objPlayerStateZXSlashChargeGround);
						currentState.lastState = "slash charge jump";
					}
					with (other)	return;
				}
			}
		}
	}
}

function fncPlayerZXSlashChargeJumpEnd()
{
	if (instance_exists(shadowEffCreater))
		instance_destroy(shadowEffCreater);
	
	with (core.id)
	{
		with (weaponMeleeMgr)
		{
			fncDestroyMeleeWeapon();
		}
	}
}

function fncChangeToZXStates()
{

}