/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
slashEnd = false;
dashJump = false;
shadowEffCreater = noone;
createIce = 0;

function fncStateStart()
{
	if (global.debug)
		show_debug_message("Entered Slash Jump State!");
	fncPlayerLSlashJumpStart();
}

function fncStateRun()
{
	fncPlayerLSlashJumpRun();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerLSlashJumpEnd();
}

function fncPlayerLSlashJumpStart()
{
	with(core.id)
	{
		sprite_index = sprPlayerLSlashJump;
		image_index = 0;
		
		with (weaponMeleeMgr)
		{
			fncCreateMeleeWeapon(objLJavelin, sprLSlashJumpHitbox);
		}
	}
}

function fncPlayerLSlashJumpRun()
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
		if (createIce > 0)
		{
			with (core.id)
			{
				if (image_index > 3)
				{
					/*
					var objIce = instance_create_depth(x, y - 16, depth, --------------);
					objCyIce.image_xscale = image_xscale;
					*/
					other.createIce = 0;
				}
			}
		}
		
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
							if (instance_exists(weaponMeleeMgr.weaponSlash))
								weaponMeleeMgr.weaponSlash.playerStateChanged = true;
							with(other.stateMachine)
							{
								fncStateChange(objPlayerStateSlide);
							}
							with (other)	return;
						}
					}
				}
			
				if (physic.onGround)
				{
					sprite_index = sprPlayer.sprLand;
					image_index = 0;
				
					runSFXPlayer = instance_create_depth(x, y, depth, objPlayerRunSFXCreater);
					runSFXPlayer.core = self.id;
					if (instance_exists(weaponMeleeMgr.weaponSlash))
						weaponMeleeMgr.weaponSlash.playerStateChanged = true;
				
					with(other.stateMachine)
					{
						fncStateChange(objPlayerStateIdle);
						currentState.lastState = "jump";
					}
					with (other)	return;
				}
			}
		}
	}
}

function fncPlayerLSlashJumpEnd()
{
	if (instance_exists(shadowEffCreater))
	{
		instance_destroy(shadowEffCreater);
	}
	
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