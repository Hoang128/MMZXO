/// @description Insert description here
// You can write your code in this editor

event_inherited();

//General Parameters
runSpd = 2;

airJumpWhenFastMove = false;
jumpSpd = 4;
jumpTimeMax = 3;
dashSpd = 4;

airDashWhenFastMove = true;
airDashCountMax = 3;
dashAccUp = 0.8;
dashAccDown = 0.4;
dashTimeMax = 25;

mixAirDashJump = false;

distanceCanSlide = 2;
distanceCanWKick = 4;
distanceOffSlide = 4;

//Properties
physic = 1;
gravAffect = 1;
charDir = 1;
jumpTime = jumpTimeMax;
dashTime = dashTimeMax;
airDashCount = airDashCountMax;

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
	sprDashEnd : sprPlayerZXDashEnd,
	sprSlideStart : sprPlayerZXSlideStart,
	sprSlide : sprPlayerZXSlide
};


//State machine
playerStateMachine = instance_create_depth(x, y, depth, objStateMachine);
playerStateMachine.core = self;
playerStateMachine.coreType = "player";

with(playerStateMachine)
{
	fncStateChange(objPlayerStateIdle);
}