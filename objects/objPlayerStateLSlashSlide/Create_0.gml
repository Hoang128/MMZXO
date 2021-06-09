/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
slideEff = noone;
transToSlideState = false;
startFrame = 0;
slashEnd = false;
createIce = 0;

function fncStateStart()
{
	if (global.debug)
		show_debug_message("Entered Slash Slide State!");
	fncPlayerLSlashSlideStart();
}

function fncStateRun()
{
	fncStateInit();
	fncPlayerLSlashSlideRun();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerLSlashSlideEnd();
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

function fncPlayerLSlashSlideStart()
{
	with (core.id)
	{
		sprite_index = sprPlayerLSlashSlide;
		image_index = 0;
		
		with (weaponMeleeMgr)
		{
			fncCreateMeleeWeapon(objLJavelin, sprLSlashSlideHitbox);
		}
	
		physic.gravAffect = false;
	}
}

function fncPlayerLSlashSlideRun()
{
	if (createIce > 0)
	{
		with (core.id)
		{
			if (image_index > 5)
			{
				if (other.createIce == 1)
				{
					var objIce = instance_create_depth(x + 24 * image_xscale, y - 16, depth,objLIce);
					objIce.image_xscale = image_xscale;
					objIce.firstSlash = weaponMeleeMgr.weaponSlash;
				}
				other.createIce = 0;
			}
		}
	}
	with (core.id)
	{
		
		if (other.slashEnd)
		{
			with(other.stateMachine)
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
				if (instance_exists(weaponMeleeMgr.weaponSlash))
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
				if (instance_exists(weaponMeleeMgr.weaponSlash))
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
				if (instance_exists(weaponMeleeMgr.weaponSlash))
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

function fncPlayerLSlashSlideEnd()
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