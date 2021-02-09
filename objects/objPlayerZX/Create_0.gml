/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Parameters
waitShot = 3;
waitShotLong = 10;
rapidMax = 3;
shotAnimWaitMax = 20;
flareShotTimeMax = 0.5;

dashSlashAccUp = 2;

runSlashPhase = 0;
runSlashTime = 0;
runSlashPhase1TimeMax = 5;
runSlashPhase2Timemax = 10;

//Properties
canShot = 1;
shotAnimPhase = 0;
flareShotPhase = 0;	//phase 1: flare on, phase 2: flare off
flareShotTime = flareShotTimeMax;
shotAnimWait =shotAnimWaitMax;
rapidCount = rapidMax;
weaponMeleeMgr = instance_create_depth(x, y, depth, objPlayerWeaponMeleeMgr);
weaponMeleeMgr.core = self;

function fncSetupZXProperties()
{
	if ((canShot < 1) && (canShot >= -waitShotLong))
		canShot += TIME_SCALE;
	else if (canShot >= 1)
	{
		if (rapidCount == 0)	
			rapidCount = rapidMax;
		canShot = 1;
	}
	
	if (shotAnimPhase == 1)
	{
		if ((flareShotPhase > 0) && (flareShotPhase <= 2))
		{
			if (flareShotTime > 0)
			{
				flareShotTime -= TIME_SCALE;
			}
			else
			{
				flareShotPhase++;
				if (flareShotPhase == 2)
				{
					fncChangeMoveSpriteToShot(1);
				}
				flareShotTime = flareShotTimeMax;
			}
		}
		else if (flareShotPhase > 2)
		{
			shotAnimPhase = 2;
			shotAnimWait = shotAnimWaitMax;
			fncChangeMoveSpriteToShot(3);
		}
	}
	else if (shotAnimPhase == 2)
	{
		if (shotAnimWait > 0)
			shotAnimWait -= TIME_SCALE;
		else
		{
			shotAnimWait = 0;
			shotAnimPhase = 0;
			if (rapidCount < rapidMax)	rapidCount = rapidMax;
			fncChangeMoveSpriteToNormal();
		}
	}
	
	if (runSlashPhase > 0)
	{
		if (playerStateMachine.currentState.object_index != objPlayerStateRun)
		{
			sprPlayer.sprRun = sprPlayerZXRun;
			
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
					sprPlayer.sprRun = sprPlayerZXSlashRun2;
					sprite_index = sprPlayer.sprRun;
					
					with (weaponMeleeMgr)
					{
						fncCreateMeleeWeapon(objZXDagger, sprZXSlashRunHitbox);
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
					sprPlayer.sprRun = sprPlayerZXRun;
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
					fncStateChange(objPlayerStateZXSlashCombo1);	
					return;
			}	break;
		
			case objPlayerStateJump:
			case objPlayerStateWallKick:
			{
				with(playerStateMachine)
				{
					var currentDashJump = currentState.dashJump;
					fncStateChange(objPlayerStateZXSlashJump);	
					currentState.dashJump = currentDashJump;
					return;
				}
			}	break;
		
			case objPlayerStateDash:
			{
				with(playerStateMachine)
				{
					var currentAirDash = currentState.airDash;
					fncStateChange(objPlayerStateZXSlashDash);	
					currentState.airDash = currentAirDash;
					return;
				}
			}	break;
		
			case objPlayerStateSlide:
			{
				var startFrame = image_index;
				if (sprite_index == sprPlayer.sprSlide)
						startFrame = 4;
				with(playerStateMachine)
				{
					var currentDustEff = noone;
				
					if ((currentState.slideEff != noone) && instance_exists(currentState.slideEff))
						currentDustEff = currentState.slideEff;
				
					currentState.transToSlideState = true;
					fncStateChange(objPlayerStateZXSlashSlide);
					currentState.startFrame = startFrame;
					currentState.slideEff = currentDustEff;
					return;
				}
			}	break;
		
			case objPlayerStateClimb:
			{
				if (sprite_index == sprPlayer.sprClimb)
				{
					with(playerStateMachine)
					{
						fncStateChange(objPlayerStateZXSlashClimb);	
						return;
					}
				}
			}	break;
		
			case objPlayerStateRun:
			{
				if (runSlashPhase == 0)
				{
					runSlashPhase = 1;
					runSlashTime = runSlashPhase1TimeMax;
			
					sprPlayer.sprRun = sprPlayerZXSlashRun1;
					sprite_index = sprPlayer.sprRun;
				}
			}	break;
		}
	}
}

function fncPerformChargeWeapon1()
{
	if (chargeWp1.Current >= chargeWp1.Max)
	{
		switch (playerStateMachine.currentState.object_index)
		{
			case objPlayerStateRun:
			case objPlayerStateIdle:
			{
				with(playerStateMachine)
				{
					fncStateChange(objPlayerStateZXSlashChargeGround);	
					return;
				}
			}	break;
			
			case objPlayerStateJump:
			{
				with(playerStateMachine)
				{
					var currentDashJump = currentState.dashJump;
					fncStateChange(objPlayerStateZXSlashChargeJump);	
					currentState.dashJump = currentDashJump;
					return;
				}
			}	break;
			
			case objPlayerStateDash:
			{
				with(playerStateMachine)
				{
					if (currentState.airDash)
						fncStateChange(objPlayerStateZXSlashChargeJump);	
					else
						fncStateChange(objPlayerStateZXSlashChargeGround);	
					return;
				}
			}	break;
			
			case objPlayerStateSlide:
			{
				var startFrame = image_index;
				if (sprite_index == sprPlayer.sprSlide)
						startFrame = 4;
				with(playerStateMachine)
				{
					var currentDustEff = noone;
				
					if ((currentState.slideEff != noone) && instance_exists(currentState.slideEff))
						currentDustEff = currentState.slideEff;
				
					currentState.transToSlideState = true;
					fncStateChange(objPlayerStateZXSlashChargeSlide);
					currentState.startFrame = startFrame;
					currentState.slideEff = currentDustEff;
					return;
				}
			}	break;
			
			case objPlayerStateClimb:
			{
				if (sprite_index == sprPlayer.sprClimb)
				{
					with(playerStateMachine)
					{
						fncStateChange(objPlayerStateZXSlashChargeClimb);	
						return;
					}
				}
			}	break;
		}
	}
}

function fncPerformWeapon2()
{
	if (weaponMeleeMgr.weaponSlash == noone)
	{
		if (canShot == 1)
		{
			flareShotPhase = 1;
			shotAnimPhase = 1;
			flareShotTime = flareShotTimeMax;
			fncChangeMoveSpriteToShot(1);
			var busterCreater = instance_create_depth(x, y, depth, objZXBusterCreater);
			busterCreater.buster = objZXBusterNor;
			busterCreater.core = self.id;
			if (rapidCount > 0)
				rapidCount--;
			if (rapidCount == 0)
				canShot = -waitShotLong;
			else
				canShot = -waitShot;
		}
	}
}

function fncPerformChargeWeapon2()
{
	if (weaponMeleeMgr.weaponSlash == noone)
	{
		if (canShot == 1)
		{
			flareShotPhase = 1;
			shotAnimPhase = 1;
			flareShotTime = flareShotTimeMax;
			fncChangeMoveSpriteToShot(1);
			if (chargeWp2.Current < chargeWp2.Max)
			{
				var busterCreater = instance_create_depth(x, y, depth, objZXBusterCreater);
				busterCreater.buster = objZXBusterC1;
				busterCreater.core = self.id;
			}
			else if (chargeWp2.Current >= chargeWp2.Max)
			{
				var busterCreater = instance_create_depth(x, y, depth, objZXBusterCreater);
				busterCreater.buster = objZXBusterC2;
				busterCreater.core = self.id;
			}
			canShot = -waitShotLong;
		}
		
	}
}

function fncChangeMoveSpriteToShot(flareShotPhase)
{
	switch (flareShotPhase)
	{
		case 1:
		{
			sprPlayer.sprIdle = sprPlayerZXIdleShot1;
			sprPlayer.sprRun = sprPlayerZXRunShot1;
			sprPlayer.sprDashStart = sprPlayerZXDashStartShot1;
			sprPlayer.sprDash = sprPlayerZXDashShot1;
			sprPlayer.sprDashEnd = sprPlayerZXDashEndShot1;
			sprPlayer.sprJump = sprPlayerZXJumpShot1;
			sprPlayer.sprFall = sprPlayerZXFallShot1;
			sprPlayer.sprJumpStart = sprPlayerZXJumpStartShot1;
			sprPlayer.sprFallStart = sprPlayerZXFallStartShot1;
			sprPlayer.sprLand = sprPlayerZXLandShot1;
			sprPlayer.sprSlideStart = sprPlayerZXSlideStartShot1;
			sprPlayer.sprSlide = sprPlayerZXSlideShot1;
			sprPlayer.sprWallKick = sprPlayerZXWallKickShot1;
			sprPlayer.sprClimb = sprPlayerZXClimbShot1;
		}	break;
		case 2:
		{
			sprPlayer.sprIdle = sprPlayerZXIdleShot2;
			sprPlayer.sprRun = sprPlayerZXRunShot2;
			sprPlayer.sprDashStart = sprPlayerZXDashStartShot2;
			sprPlayer.sprDash = sprPlayerZXDashShot2;
			sprPlayer.sprDashEnd = sprPlayerZXDashEndShot2;
			sprPlayer.sprJump = sprPlayerZXJumpShot2;
			sprPlayer.sprFall = sprPlayerZXFallShot2;
			sprPlayer.sprJumpStart = sprPlayerZXJumpStartShot2;
			sprPlayer.sprFallStart = sprPlayerZXFallStartShot2;
			sprPlayer.sprLand = sprPlayerZXLandShot2;
			sprPlayer.sprSlideStart = sprPlayerZXSlideStartShot2;
			sprPlayer.sprSlide = sprPlayerZXSlideShot2;
			sprPlayer.sprWallKick = sprPlayerZXWallKickShot2;
			sprPlayer.sprClimb = sprPlayerZXClimbShot2;
		}	break;
		case 3:
		{
			sprPlayer.sprIdle = sprPlayerZXIdleShot3;
			sprPlayer.sprRun = sprPlayerZXRunShot3;
			sprPlayer.sprDashStart = sprPlayerZXDashStartShot3;
			sprPlayer.sprDash = sprPlayerZXDashShot3;
			sprPlayer.sprDashEnd = sprPlayerZXDashEndShot3;
			sprPlayer.sprJump = sprPlayerZXJumpShot3;
			sprPlayer.sprFall = sprPlayerZXFallShot3;
			sprPlayer.sprJumpStart = sprPlayerZXJumpStartShot3;
			sprPlayer.sprFallStart = sprPlayerZXFallStartShot3;
			sprPlayer.sprLand = sprPlayerZXLandShot3;
			sprPlayer.sprSlideStart = sprPlayerZXSlideStartShot3;
			sprPlayer.sprSlide = sprPlayerZXSlideShot3;
			sprPlayer.sprWallKick = sprPlayerZXWallKickShot3;
			sprPlayer.sprClimb = sprPlayerZXClimbShot3;
		}	break;
	}
	
	fncChangeMoveSprite();
}

function fncChangeMoveSpriteToNormal()
{
	sprPlayer.sprIdle = sprPlayerZXIdle;
	sprPlayer.sprRun = sprPlayerZXRun;
	sprPlayer.sprDashStart = sprPlayerZXDashStart;
	sprPlayer.sprDash = sprPlayerZXDash;
	sprPlayer.sprDashEnd = sprPlayerZXDashEnd;
	sprPlayer.sprJump = sprPlayerZXJump;
	sprPlayer.sprFall = sprPlayerZXFall;
	sprPlayer.sprJumpStart = sprPlayerZXJumpStart;
	sprPlayer.sprFallStart = sprPlayerZXFallStart;
	sprPlayer.sprLand = sprPlayerZXLand;
	sprPlayer.sprSlideStart = sprPlayerZXSlideStart;
	sprPlayer.sprSlide = sprPlayerZXSlide;
	sprPlayer.sprWallKick = sprPlayerZXWallKick;
	sprPlayer.sprClimb = sprPlayerZXClimb;
	
	fncChangeMoveSprite();
}

function fncChangeMoveSprite()
{
	switch (sprite_index)
	{
		case sprPlayerZXIdle:
		case sprPlayerZXIdleShot1:
		case sprPlayerZXIdleShot2:
		case sprPlayerZXIdleShot3:			sprite_index = sprPlayer.sprIdle;		break;
		
		case sprPlayerZXRun:
		case sprPlayerZXSlashRun1:
		case sprPlayerZXSlashRun2:
		case sprPlayerZXRunShot1:
		case sprPlayerZXRunShot2:
		case sprPlayerZXRunShot3:			sprite_index = sprPlayer.sprRun;		break;
		
		case sprPlayerZXJump:
		case sprPlayerZXJumpShot1:
		case sprPlayerZXJumpShot2:
		case sprPlayerZXJumpShot3:			sprite_index = sprPlayer.sprJump;		break;
		
		case sprPlayerZXJumpStart:
		case sprPlayerZXJumpStartShot1:
		case sprPlayerZXJumpStartShot2:
		case sprPlayerZXJumpStartShot3:		sprite_index = sprPlayer.sprJumpStart;	break;
		
		case sprPlayerZXFall:
		case sprPlayerZXFallShot1:
		case sprPlayerZXFallShot2:
		case sprPlayerZXFallShot3:			sprite_index = sprPlayer.sprJump;		break;
		
		case sprPlayerZXFallStart:
		case sprPlayerZXFallStartShot1:
		case sprPlayerZXFallStartShot2:
		case sprPlayerZXFallStartShot3:		sprite_index = sprPlayer.sprJumpStart;	break;
		
		case sprPlayerZXDashStart:
		case sprPlayerZXDashStartShot1:
		case sprPlayerZXDashStartShot2:
		case sprPlayerZXDashStartShot3:		sprite_index = sprPlayer.sprDashStart;	break;
		
		case sprPlayerZXDash:
		case sprPlayerZXDashShot1:
		case sprPlayerZXDashShot2:
		case sprPlayerZXDashShot3:			sprite_index = sprPlayer.sprDash;		break;
		
		case sprPlayerZXDashEnd:
		case sprPlayerZXDashEndShot1:
		case sprPlayerZXDashEndShot2:
		case sprPlayerZXDashEndShot3:		sprite_index = sprPlayer.sprDashEnd;	break;
		
		case sprPlayerZXSlideStart:
		case sprPlayerZXSlideStartShot1:
		case sprPlayerZXSlideStartShot2:
		case sprPlayerZXSlideStartShot3:	sprite_index = sprPlayer.sprSlideStart;	break;
		
		case sprPlayerZXSlide:
		case sprPlayerZXSlideShot1:
		case sprPlayerZXSlideShot2:
		case sprPlayerZXSlideShot3:			sprite_index = sprPlayer.sprSlide;		break;
		
		case sprPlayerZXLand:
		case sprPlayerZXLandShot1:
		case sprPlayerZXLandShot2:
		case sprPlayerZXLandShot3:			sprite_index = sprPlayer.sprLand;		break;
		
		case sprPlayerZXWallKick:
		case sprPlayerZXWallKickShot1:
		case sprPlayerZXWallKickShot2:
		case sprPlayerZXWallKickShot3:		sprite_index = sprPlayer.sprWallKick;	break;
		
		case sprPlayerZXClimb:
		case sprPlayerZXClimbShot1:
		case sprPlayerZXClimbShot2:
		case sprPlayerZXClimbShot3:			sprite_index = sprPlayer.sprClimb;		break;
	}
}
