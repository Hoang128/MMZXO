/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Parameters
waitShot = 10;
shotAnimWaitMax = 40;
flareShotTimeMax = 10;

//Properties
canShot = 1;
shotAnimPhase = 0;
flareShotPhase = 0;	//phase 1: flare on, phase 2: flare off
flareShotTime = flareShotTimeMax;
shotAnimWait =shotAnimWaitMax;

//Sprite struct
sprPlayerZX =
{
	sprIdleShot : sprPlayerZXIdleShotFlare,
	sprRunShot : sprPlayerZXRunShot1,
	sprJumpShot : sprPlayerZXJumpShotFlare,
	sprDashShot : sprPlayerZXDashShotFlare,
	sprDashStartShot : sprPlayerZXDashStartShot1,
	sprDashEndShot : sprPlayerZXDashEndShot1,
	sprSlideShot : sprPlayerZXSlideShotFlare,
	sprClimbShot : sprPlayerZXClimbShotFlare,
	sprLandShot : sprPlayerZXLandShot1
}

function fncSetupZXProperties()
{
	if ((canShot < 1) && (canShot >= -waitShot))
		canShot += TIME_SCALE;
	else if (canShot >= 1)
	{
		canShot = 1;
	}
}

function fncStartShot()
{
	flareShotPhase = 1;
	shotAnimPhase = 1;
}
