/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Parameters
jumpTimeMax = 1;
airDashCountMax = 1;
hoverSpd = 1;
mixAirDashJump = true;
airJumpWhenFastMove = true;

physic.waterRatio.x = 1;
diveSpd = 2;
dashDiveSpd = 4;
accDiveRatio = 20;
accDive = diveSpd/accDiveRatio;
accDiveDashRatio = 20;
accDiveDash = dashDiveSpd/accDiveDashRatio;

//Properties
weaponMeleeMgr = instance_create_depth(x, y, depth, objPlayerWeaponMeleeMgr);
weaponMeleeMgr.core = self;

sprPlayer =
{
	sprIdle : sprPlayerLIdle,
	sprRun : sprPlayerLRun,
	sprJumpStart : sprPlayerLJumpStart,
	sprJump : sprPlayerLJump,
	sprFallStart : sprPlayerLFallStart,
	sprFall : sprPlayerLFall,
	sprLand : sprPlayerLLand,
	sprDashStart : sprPlayerLDashStart,
	sprDash : sprPlayerLDash,
	sprDashEnd : sprPlayerLDashEnd,
	sprSlideStart : sprPlayerLSlideStart,
	sprSlide : sprPlayerLSlide,
	sprWallKick : sprPlayerLWallkick,
	sprClimbStart : sprPlayerLClimbStart,
	sprClimb : sprPlayerLClimb,
	sprClimbEnd : sprPlayerLClimbEnd,
	sprStunNor : sprPlayerLStun1,
	sprStunHard : sprPlayerLStun2,
	sprStand : sprPlayerLStand,
	sprStandStart : sprPlayerLStandStart,
	sprStandEnd : sprPlayerLStandEnd,
	sprAirDashStart : sprPlayerLDashStart,
	sprAirDash : sprPlayerLDash,
};

//Start State
with(playerStateMachine)
{
	fncStateChange(objPlayerStateTeleDown);
}

function fncPerformWeapon1()
{
	fncPerformSlash(true, false);
}

function fncPerformWeapon2()
{
	fncPerformSlash(false, false);
}

function fncPerformChargeWeapon1()
{
	if (wp >= mpCharge1)
	{
		wp -= mpCharge1;
		fncPerformSlash(true, true);
	}
}

function fncPerformChargeWeapon2()
{
	if (wp >= mpCharge2)
	{
		wp -= mpCharge2;
		fncPerformSlash(false, true);
	}
}

function fncPerformSlash(isAttack1, isCharged)
{
	if (weaponMeleeMgr.weaponSlash == noone)
	{
		switch (playerStateMachine.currentState.object_index)
		{
			case objPlayerStateIdle:
			case objPlayerStateRun:
			case objPlayerStateDash:
			{
				with(playerStateMachine)
				{
					fncStateChange(objPlayerStateLSlashStand);
					if (isCharged)
					{
						if (isAttack1)
						{
							currentState.createIce = 1;
						}
						else
						{
							currentState.createIce = 2;
						}
					}
				}
				return;
			}	break;
			
			case objPlayerStateJump:
			case objPlayerStateWallKick:
			{
				with(playerStateMachine)
				{
					var currentDashJump = currentState.dashJump;
					fncStateChange(objPlayerStateLSlashJump);	
					currentState.dashJump = currentDashJump;
					if (isCharged)
					{
						if (isAttack1)
						{
							currentState.createIce = 1;
						}
						else
						{
							currentState.createIce = 2;
						}
					}
				}
				return;
			}	break;
			
			case objPlayerStateSlide:
			{
				with(playerStateMachine)
				{
					fncStateChange(objPlayerStateLSlashSlide);	
					if (isCharged)
					{
						if (isAttack1)
						{
							currentState.createIce = 1;
						}
						else
						{
							currentState.createIce = 2;
						}
					}
				}
				return;
			}	break;
			
			case objPlayerStateClimb:
			{
				with(playerStateMachine)
				{
					fncStateChange(objPlayerStateLSlashClimb);	
					if (isCharged)
					{
						if (isAttack1)
						{
							currentState.createIce = 1;
						}
						else
						{
							currentState.createIce = 2;
						}
					}
				}
				return;
			}	break;
			
			case objPlayerStateLDiveIdle:
			case objPlayerStateLDiveDash:
			case objPlayerStateLDiveMove:
			{
				var lastAction = "dive";
				if (playerStateMachine.currentState.object_index == objPlayerStateLDiveDash)
					lastAction = "dive dash";
				else if (playerStateMachine.currentState.object_index == objPlayerStateLDiveMove)
					lastAction = "dive move";
				if (!isCharged)
				{
					with(playerStateMachine)
					{
						fncStateChange(objPlayerStateLSpinDive);
						currentState.lastAction = lastAction;
					}
				}
				else
				{
					if (isAttack1)
					{
						with(playerStateMachine)
						{
							fncStateChange(objPlayerStateLSpinDive);
							currentState.lastAction = lastAction;
							currentState.createIce = 1;
						}
					}
					else
					{
						with(playerStateMachine)
						{
							fncStateChange(objPlayerStateLSlashGiga);
							currentState.createIce = 2;
						}
					}
				}
				return;
			}	break;
		}
	}
}