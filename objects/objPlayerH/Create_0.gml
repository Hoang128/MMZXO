/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Parameters
jumpTimeMax = 2;
airDashCountMax = 1;
hoverSpd = 0.5;
mixAirDashJump = true;
airJumpWhenFastMove = true;

sprPlayer =
{
	sprIdle : sprPlayerHIdle,
	sprRun : sprPlayerHRun,
	sprJumpStart : sprPlayerHJumpStart,
	sprJump : sprPlayerHJump,
	sprFallStart : sprPlayerHFallStart,
	sprFall : sprPlayerHFall,
	sprLand : sprPlayerHLand,
	sprDashStart : sprPlayerHDashStart,
	sprDash : sprPlayerHDash,
	sprDashEnd : sprPlayerHDashEnd,
	sprSlideStart : sprPlayerHSlideStart,
	sprSlide : sprPlayerHSlide,
	sprWallKick : sprPlayerHWallKick,
	sprClimbStart : sprPlayerHClimbStart,
	sprClimb : sprPlayerHClimb,
	sprClimbEnd : sprPlayerHClimbEnd,
	sprStunNor : sprPlayerHStun1,
	sprStunHard : sprPlayerHStun2,
	sprStand : sprPlayerHStand,
	sprStandStart : sprPlayerHStandStart,
	sprStandEnd : sprPlayerHStandEnd,
	sprAirDashStart : sprPlayerHAirDashStart,
	sprAirDash : sprPlayerHAirDash,
};

sfxPlayer.sfxDash = sfxDashEff;
sfxPlayer.sfxAirDash = sfxModelHAirDash;

dashSlashAccUp = 2;

runSlashPhase = 0;
runSlashTime = 0;
runSlashPhase1TimeMax = 5;
runSlashPhase2Timemax = 10;

//Properties
weaponMeleeMgr = instance_create_depth(x, y, depth, objPlayerWeaponMeleeMgr);
weaponMeleeMgr.core = self;

//Start State
with(playerStateMachine)
{
	fncStateChange(objPlayerStateTeleDown);
}

function fncSetupHProperties()
{
	if (runSlashPhase > 0)
	{
		if (playerStateMachine.currentState.object_index != objPlayerStateRun)
		{
			sprPlayer.sprRun = sprPlayerHRun;
			
			runSlashPhase = 0;
			runSlashTime = 0;
		}
		else
		{
			if (runSlashPhase == 1)
			{
				if (runSlashTime > 0)
					runSlashTime -= TIME_SCALE;
				else
				{
					sprPlayer.sprRun = sprPlayerHSlashRun2;
					sprite_index = sprPlayer.sprRun;
					
					with (weaponMeleeMgr)
					{
						fncCreateMeleeWeapon(objHDaggers, sprHSlashRunHitbox);
						weaponSlash.playerStateChanged = true;
					}
					
					runSlashPhase = 2;
					runSlashTime = runSlashPhase2Timemax;
				}
			}
			else if (runSlashPhase == 2)
			{
				if (runSlashTime > 0)
					runSlashTime -= TIME_SCALE;
				else
				{
					sprPlayer.sprRun = sprPlayerHRun;
					sprite_index = sprPlayer.sprRun;
			
					runSlashPhase = 0;
				}
			}
		}
	}
}

function fncPerformWeapon1()
{
	if (weaponMeleeMgr.weaponSlash == noone)
	{
		switch (playerStateMachine.currentState.object_index)
		{
			case objPlayerStateIdle:
			{
				with(playerStateMachine)
				{
					fncStateChange(objPlayerStateHSlashH);	
				}
				return;
			}	break;
			
			case objPlayerStateDash:
			{
				with(playerStateMachine)
				{
					fncStateChange(objPlayerStateHSlashDash);	
				}
				return;
			}	break;
			
			case objPlayerStateJump:
			case objPlayerStateWallKick:
			{
				with(playerStateMachine)
				{
					var currentDashJump = currentState.dashJump;
					fncStateChange(objPlayerStateHSlashJump);	
					currentState.dashJump = currentDashJump;
				}
				return;
			}	break;
			
			case objPlayerStateHBoostUp:
			{
				with(playerStateMachine)
				{
					fncStateChange(objPlayerStateHSlashBoostUp);	
				}
				return;
			}	break;
			
			case objPlayerStateSlide:
			{
				with(playerStateMachine)
				{
					fncStateChange(objPlayerStateHSlashSlide);	
				}
				return;
			}	break;
			
			case objPlayerStateClimb:
			{
				with(playerStateMachine)
				{
					fncStateChange(objPlayerStateHSlashClimb);	
				}
				return;
			}	break;
			
			case objPlayerStateHHover:
			{
				with(playerStateMachine)
				{
					fncStateChange(objPlayerStateHSlashHover);	
				}
				return;
			}	break;
			
			case objPlayerStateRun:
			{
				if (runSlashPhase == 0)
				{
					runSlashPhase = 1;
					runSlashTime = runSlashPhase1TimeMax;
			
					sprPlayer.sprRun = sprPlayerHSlashRun1;
					sprite_index = sprPlayer.sprRun;
				}
			}	break;
		}
	}
}

function fncPerformWeapon2()
{
	if (weaponMeleeMgr.weaponSlash == noone)
	{
		switch (playerStateMachine.currentState.object_index)
		{
			case objPlayerStateIdle:
			{
				with(playerStateMachine)
				{
					fncStateChange(objPlayerStateHSlashV);	
				}
				return;
			}	break;
			
			case objPlayerStateDash:
			{
				with(playerStateMachine)
				{
					fncStateChange(objPlayerStateHSlashDash);	
				}
				return;
			}	break;
			
			case objPlayerStateJump:
			case objPlayerStateWallKick:
			{
				with(playerStateMachine)
				{
					var currentDashJump = currentState.dashJump;
					fncStateChange(objPlayerStateHSlashJump);	
					currentState.dashJump = currentDashJump;
				}
				return;
			}	break;
			
			case objPlayerStateHBoostUp:
			{
				with(playerStateMachine)
				{
					fncStateChange(objPlayerStateHSlashBoostUp);	
				}
				return;
			}	break;
			
			case objPlayerStateSlide:
			{
				with(playerStateMachine)
				{
					fncStateChange(objPlayerStateHSlashSlide);	
				}
				return;
			}	break;
			
			case objPlayerStateClimb:
			{
				with(playerStateMachine)
				{
					fncStateChange(objPlayerStateHSlashClimb);	
				}
				return;
			}	break;
			
			case objPlayerStateHHover:
			{
				with(playerStateMachine)
				{
					fncStateChange(objPlayerStateHSlashHover);	
				}
				return;
			}	break;
			
			case objPlayerStateRun:
			{
				if (runSlashPhase == 0)
				{
					runSlashPhase = 1;
					runSlashTime = runSlashPhase1TimeMax;
			
					sprPlayer.sprRun = sprPlayerHSlashRun1;
					sprite_index = sprPlayer.sprRun;
				}
			}	break;
		}
	}
}

function fncPerformChargeWeapon1()
{
	if (wp >= mpCharge1)
	{
		wp -= mpCharge1;
		if (chargeWp1.Current >= chargeWp1.Max)
		{
			switch (playerStateMachine.currentState.object_index)
			{
				case objPlayerStateRun:
				case objPlayerStateIdle:
				{
					with(playerStateMachine)
					{
						fncStateChange(objPlayerStateHSlashH);	
						currentState.createCyclone = 1;
					}
					return;
				}	break;
			
				case objPlayerStateDash:
				{
					with(playerStateMachine)
					{
						if (currentState.airDash)
							fncStateChange(objPlayerStateHSlashJump);	
						else
							fncStateChange(objPlayerStateHSlashH);	
						currentState.createCyclone = 1;
					}
					return;
				}	break;
			
				case objPlayerStateJump:
				case objPlayerStateWallKick:
				{
					with(playerStateMachine)
					{
						var currentDashJump = currentState.dashJump;
						fncStateChange(objPlayerStateHSlashJump);	
						currentState.dashJump = currentDashJump;
						currentState.createCyclone = 1;
					}
					return;
				}	break;
			
				case objPlayerStateHBoostUp:
				{
					with(playerStateMachine)
					{
						fncStateChange(objPlayerStateHSlashBoostUp);	
						currentState.createCyclone = 1;
					}
					return;
				}	break;
			
				case objPlayerStateSlide:
				{
					with(playerStateMachine)
					{
						fncStateChange(objPlayerStateHSlashSlide);	
						currentState.createCyclone = 1;
					}
					return;
				}	break;
			
				case objPlayerStateClimb:
				{
					with(playerStateMachine)
					{
						fncStateChange(objPlayerStateHSlashClimb);	
						currentState.createCyclone = 1;
					}
					return;
				}	break;
			
				case objPlayerStateHHover:
				{
					with(playerStateMachine)
					{
						fncStateChange(objPlayerStateHSlashHover);	
						currentState.createCyclone = 1;
					}
					return;
				}	break;
			}
		}
	}
}

function fncPerformChargeWeapon2()
{
	if (wp >= mpCharge2)
	{
		wp -= mpCharge2;
		if (weaponMeleeMgr.weaponSlash == noone)
		{
			switch (playerStateMachine.currentState.object_index)
			{
				case objPlayerStateRun:
				case objPlayerStateIdle:
				{
					with(playerStateMachine)
					{
						fncStateChange(objPlayerStateHSlashV);	
						currentState.createCyclone = 2;
					}
					return;
				}	break;
			
				case objPlayerStateDash:
				{
					with(playerStateMachine)
					{
						if (currentState.airDash)
							fncStateChange(objPlayerStateHSlashJump);	
						else
							fncStateChange(objPlayerStateHSlashV);	
						
						currentState.createCyclone = 2;
					}
					return;
				}	break;
			
				case objPlayerStateJump:
				case objPlayerStateWallKick:
				{
					with(playerStateMachine)
					{
						var currentDashJump = currentState.dashJump;
						fncStateChange(objPlayerStateHSlashJump);	
						currentState.dashJump = currentDashJump;
						currentState.createCyclone = 2;
					}
					return;
				}	break;
			
				case objPlayerStateHBoostUp:
				{
					with(playerStateMachine)
					{
						fncStateChange(objPlayerStateHSlashBoostUp);	
						currentState.createCyclone = 2;
					}
					return;
				}	break;
			
				case objPlayerStateSlide:
				{
					with(playerStateMachine)
					{
						fncStateChange(objPlayerStateHSlashSlide);	
						currentState.createCyclone = 2;
					}
					return;
				}	break;
			
				case objPlayerStateClimb:
				{
					with(playerStateMachine)
					{
						fncStateChange(objPlayerStateHSlashClimb);	
						currentState.createCyclone = 2;
					}
					return;
				}	break;
			
				case objPlayerStateHHover:
				{
					with(playerStateMachine)
					{
						fncStateChange(objPlayerStateHSlashHover);	
						currentState.createCyclone = 2;
					}
					return;
				}	break;
			}
		}
	}
}