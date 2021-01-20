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

slideAcc = 0.5;
slideSpdMax = 1;
distanceOffSlide = 4;

wallKickSpd = 3;
wallKickTimeHMax = 6;
distanceCanWKick = 4;

climbDir = 0;
climbSpeed = 3;
climbEndDelayMax = 5;
climbDistance = 8;
canClimbDelayTime = 5;

//Properties
depth = 0;
physic.enable = true;
physic.gravAffect = true;
charDir = 1;
jumpTime = jumpTimeMax;
dashTime = dashTimeMax;
airDashCount = airDashCountMax;
climbEndDelay = 0;
hMove = 0;
vMove = 0;
canClimb = 1;

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
	sprSlide : sprPlayerZXSlide,
	sprWallKick : sprPlayerZXWallKick,
	sprClimbStart : sprPlayerZXClimbStart,
	sprClimb : sprPlayerZXClimb,
	sprClimbEnd : sprPlayerZXClimbEnd
};


//State machine
playerStateMachine = instance_create_depth(x, y, depth, objStateMachine);
playerStateMachine.core = self;
playerStateMachine.coreType = "player";

with(playerStateMachine)
{
	fncStateChange(objPlayerStateIdle);
}

function fncSetupProperties()
{
	hMove = fncStaticHandleButton(KeyMap.RIGHT, KeyAction.HELD) - fncStaticHandleButton(KeyMap.LEFT, KeyAction.HELD);
	vMove = fncStaticHandleButton(KeyMap.DOWN, KeyAction.HELD) - fncStaticHandleButton(KeyMap.UP, KeyAction.HELD);
	
	if (canClimb <= 1)
	{
		canClimb += TIME_SCALE;
	}
	else
		canClimb = 1;
}