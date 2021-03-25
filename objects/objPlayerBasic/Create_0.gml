/// @description Insert description here
// You can write your code in this editor

event_inherited();

//General Parameters
hp = global.hpMax;

runSpd = 2;

airJumpWhenFastMove = false;
jumpSpd = 4;
jumpTimeMax = 3;
jumpHspdRatio = 0.9;


airDashWhenFastMove = true;
airDashCountMax = 3;
dashSpd = 4;
dashAccUp = 2;
dashAccDown = 1;
dashTimeMax = 25;

mixAirDashJump = false;

slideAcc = 0.5;
slideSpdMax = 1;
distanceOffSlide = 4;

wallKickSpd = 3;
wallKickTimeHMax = 6;
distanceCanWKick = 4;

climbDir = 0;
climbSpeed = 2;
climbEndDelayMax = 5;
climbDistance = 8;
canClimbDelayTime = 5;

inviAfterStunMax = 180;
inviTime = 0;
blinkTime = 0;
blinkTimeMax = 20;

chargeWp1 = {
	Max : 90,
	Mid : 30,
	Current : 0
}

chargeWp2 = {
	Max : 90,
	Mid : 30,
	Current : 0
}

//Properties
runSFXPlayer = noone;
depth = 0;
mask_index = sprPlayerHitbox;
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
weaponMeleeMgr = noone;

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
	sprClimbEnd : sprPlayerZXClimbEnd,
	sprStunNor : sprPlayerZXStun1,
	sprStunHard : sprPlayerZXStun2,
	sprStand : sprPlayerZXStand,
	sprStandStart : sprPlayerZXStandStart,
	sprStandEnd : sprPlayerZXStandEnd
};

vfxPlayer =
{
	vfxHurt : vfxVentHurt
};

//State machine
playerStateMachine = instance_create_depth(x, y, depth, objStateMachine);
playerStateMachine.core = self;
playerStateMachine.coreType = "player";

with(playerStateMachine)
{
	fncStateChange(objPlayerStateTeleDown);
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
		
	if (inviTime > 0)
	{
		if (blinkTime > 0)
			blinkTime -= TIME_SCALE;
		else
			blinkTime = blinkTimeMax;
		inviTime -= TIME_SCALE;
	}
	else
	{
		blinkTime = 0;
		inviTime = 0;
	}
}

function fncChargeWeapon(weaponNumber)
{
	switch (weaponNumber)
	{
		case 1:
		{
			if (chargeWp1.Current < chargeWp1.Max)
			{
				if (chargeWp1.Current >= chargeWp1.Mid)
				{
					if (!instance_exists(objChargeWp1))
					{
						var chargeEff = instance_create_depth(x, y - 12, depth - 10, objChargeWp1);
						chargeEff.image_xscale = charDir;
						chargeEff.core = self.id;
						chargeEff.weapon = 1;
					}
				}
				chargeWp1.Current += TIME_SCALE;
			}
			else
				chargeWp1.Current = chargeWp1.Max;
		}	break;
		case 2:
		{
			if (chargeWp2.Current < chargeWp2.Max)
			{
				if (chargeWp2.Current >= chargeWp2.Mid)
				{
					if (!instance_exists(objChargeWp2))
					{
						var chargeEff = instance_create_depth(x, y - 12, depth - 10, objChargeWp2);
						chargeEff.image_xscale = charDir;
						chargeEff.core = self.id;
						chargeEff.weapon = 2;
					}
				}
				chargeWp2.Current += TIME_SCALE;
			}
			else
				chargeWp2.Current = chargeWp2.Max;
		}	break;
	}
}

function fncReleaseWeapon(weaponNumber)
{
	switch (weaponNumber)
	{
		case 1:
		{
			if (chargeWp1.Current > chargeWp1.Mid)
				fncPerformChargeWeapon1();
			chargeWp1.Current = 0;
		}	break;
		case 2:
		{
			if (chargeWp2.Current > chargeWp2.Mid)
				fncPerformChargeWeapon2();
			chargeWp2.Current = 0;
		}	break;
	}
}

function fncPerformChargeWeapon1()
{
}

function fncPerformChargeWeapon2()
{
}

function fncPerformWeapon1()
{
}

function fncPerformWeapon2()
{
}