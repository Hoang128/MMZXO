/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
slideEff = noone;
transToSlideState = false;
startFrame = 0;
slashEnd = false;

function fncStateStart()
{
	if (global.debug)
		show_debug_message("Entered Slash Slide State!");
	fncPlayerZXSlashChargeSlideStart();
}

function fncStateRun()
{
	fncStateInit();
	fncPlayerZXSlashChargeSlideRun();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerZXSlashChargeSlideEnd();
}

function fncStateInit()
{
	if (!inited)
	{
		with (core.id)
		{
			image_index = other.startFrame;
		}
		inited = true;
	}
}

function fncPlayerZXSlashChargeSlideStart()
{
	with (core.id)
	{
		sprite_index = sprPlayerZXSlashChargeSlide;
		image_index = 0;
		
		with (weaponMeleeMgr)
		{
			fncCreateMeleeWeapon(objZXDagger, sprZXSlashChargeSlideHitbox);
			weaponSlash.destroyWhenChangeState = true;
		}
	
		physic.gravAffect = false;
	}
}

function fncPlayerZXSlashChargeSlideRun()
{
	with (core.id)
	{
		if (other.slashEnd)
		{
			with(playerStateMachine)
			{
				var currentDustEff = noone;
				
				if ((currentState.slideEff != noone) && instance_exists(currentState.slideEff))
					currentDustEff = currentState.slideEff;
				currentState.transToSlideState = true;
				
				fncStateChange(objPlayerStateSlide);
				currentState.lastState = "slide slash";
				currentState.slideEff = currentDustEff;
			}
			
			return;
		}
		else
		{
			if (image_index > 4)
			{
				if (other.slideEff == noone)
				{
					other.slideEff = instance_create_depth(x + charDir * 12, y + 4, depth - 1, objPlayerSlideEff);
					other.slideEff.core = self.id;
				}
			}
		
			if (vspd < slideSpdMax)
				vspd += slideAcc;
			else
				vspd = slideSpdMax;
		
			if (hMove != charDir)
			{
				weaponMeleeMgr.weaponSlash.playerStateChanged = true;
				charDir *= -1;
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateJump);
				}
				with (other)	return;
			}
		
			if (fncStaticHandleButton(KeyMap.JUMP, KeyAction.PRESSED))
			{
				weaponMeleeMgr.weaponSlash.playerStateChanged = true;
				with (other.stateMachine)
				{
					fncStateChange(objPlayerStateWallKick);
					currentState.dashJump = keyboard_check(global.keyDash);
				}
				with (other)	return;
			}
		
			if (!place_meeting(x + charDir, y, objBlock) || fncIsOnGround(distanceOffSlide))
			{
				if (jumpTime > 0)
					jumpTime--;
				weaponMeleeMgr.weaponSlash.playerStateChanged = true;
				with (other.stateMachine)
				{
					fncStateChange(objPlayerStateJump);
					return;
				}
			
				with (other)	return;
			}
		}
	}
}

function fncPlayerZXSlashChargeSlideEnd()
{
	with(core.id)
	{
		physic.gravAffect = true;
		
		with (weaponMeleeMgr)
		{
			if ((weaponSlash != noone) && instance_exists(weaponSlash))
			{
				if (weaponSlash.destroyWhenChangeState)
					fncDestroyMeleeWeapon();
			}
		}
	}
	
	if (!transToSlideState)
		instance_destroy(slideEff);
}