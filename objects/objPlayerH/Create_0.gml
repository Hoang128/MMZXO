/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Parameters
jumpTimeMax = 2;
airDashCountMax = 1;
hoverSpd = 1;
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

dashSlashAccUp = 2;

runSlashPhase = 0;
runSlashTime = 0;
runSlashPhase1TimeMax = 5;
runSlashPhase2Timemax = 10;

//Properties
weaponMeleeMgr = instance_create_depth(x, y, depth, objPlayerWeaponMeleeMgr);
weaponMeleeMgr.core = self;

function fncPerformWeapon1()
{
	if (weaponMeleeMgr.weaponSlash == noone)
	{
		switch (playerStateMachine.currentState.object_index)
		{
			case objPlayerStateIdle:
			{
				with(playerStateMachine)
					fncStateChange(objPlayerStateHSlashH);	
					return;
			}	break;
			
			case objPlayerStateDash:
			{
				with(playerStateMachine)
					fncStateChange(objPlayerStateHSlashDash);	
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
					return;
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
					fncStateChange(objPlayerStateHSlashV);	
				return;
			}	break;
			
			case objPlayerStateDash:
			{
				with(playerStateMachine)
					fncStateChange(objPlayerStateHSlashDash);	
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
					return;
				}
			}	break;
		}
	}
}