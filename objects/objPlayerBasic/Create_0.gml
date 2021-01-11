/// @description Insert description here
// You can write your code in this editor

event_inherited();

//General Parameters
runSpd = 2;
jumpSpd = 4;
jumpTimeMax = 2;
dashSpd = 4;
dashAccUp = 0.8;
dashAccDown = 0.4;
dashTimeMax = 20;

//Properties
physic = 1;
gravAffect = 1;
charDir = 1;
jumpTime = jumpTimeMax;
dashTime = dashTimeMax;

//State machine
playerStateMachine = instance_create_depth(x, y, depth, objStateMachine);
playerStateMachine.core = self;
playerStateMachine.coreType = "player";

//Sprite struct
sprPlayer =
{
	sprIdle : sprPlayerZXIdle,
	sprRun : sprPlayerZXRun,
	sprJumpStart : sprPlayerZXJumpStart,
	sprJump : sprPlayerZXJump,
	sprFallStart : sprPlayerZXFallStart,
	sprFall : sprPlayerZXFall,
	sprLand : sprPlayerZXLand,
	sprDashStart : sprPlayerZXDashStart,
	sprDash : sprPlayerZXDash,
	sprDashEnd : sprPlayerZXDashEnd
};

with(playerStateMachine)
{
	fncStateChange(objPlayerStateIdle);
}