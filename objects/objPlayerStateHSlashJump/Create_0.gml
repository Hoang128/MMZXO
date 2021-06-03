/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
slashEnd = false;
dashJump = false;
shadowEffCreater = noone;
createCyclone = 0;

function fncStateStart()
{
	if (global.debug)
		show_debug_message("Entered Slash Jump State!");
	fncPlayerHSlashJumpStart();
}

function fncStateRun()
{
	fncPlayerHSlashJumpRun();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerHSlashJumpEnd();
}

function fncPlayerHSlashJumpStart()
{
	with(core.id)
	{
		sprite_index = sprPlayerHSlashJump;
		image_index = 0;
		
		with (weaponMeleeMgr)
		{
			fncCreateMeleeWeapon(objHDaggers, sprHSlashJumpHitbox);
		}
	}
}

function fncPlayerHSlashJumpRun()
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

function fncPlayerHSlashJumpEnd()
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