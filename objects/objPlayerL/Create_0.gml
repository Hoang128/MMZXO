/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Parameters
jumpTimeMax = 1;
airDashCountMax = 0;
hoverSpd = 1;
mixAirDashJump = true;
airJumpWhenFastMove = true;

diveSpd = 2;
dashDiveSpd = 4;
accDiveRatio = 20;
accDive = diveSpd/accDiveRatio;


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