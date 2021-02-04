/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

climbFromFirstImage = true;
inited = false;
lastState = "default";

function fncStateStart()
{
	fncPlayerClimbStart();
}

function fncStateRun()
{
	fncStateInit();
	fncPlayerClimbRun();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerClimbEnd();
}

function fncStateInit()
{
	if (!inited)
	{
		if (lastState == "climb slash")
		{
			with (core.id)
			{
				sprite_index = sprPlayer.sprClimb;
				image_index = 3;
			}
		}
		else
		{
			with (core.id)
			{
				sprite_index = sprPlayer.sprClimbStart;
				image_index = 0;
			}
		}
		inited = true;
	}
}


function fncPlayerClimbStart()
{
	with (core.id)
	{
		hspd = 0;
		vspd = 0;
		physic.gravAffect = false;
		physic.onGround = false;
		jumpTime = jumpTimeMax;
		airDashCount = airDashCountMax;
	}
}

function fncPlayerClimbRun()
{
	with (core.id)
	{
		if (sprite_index == sprPlayer.sprClimbStart)
		{
			if (!other.inited)
			{
				if (other.climbFromFirstImage == false)
					image_index = 1;
				other.inited = true;
			}
		}
		else if (sprite_index == sprPlayer.sprClimb)
		{
			if (fncStaticHandleButton(KeyMap.JUMP, KeyAction.PRESSED))
			{
				vspd = 0;
				canClimb = -canClimbDelayTime;
				jumpTime--;
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateJump);
					return;
				}
			}
			
			climbDir = vMove;
			vspd = climbDir * climbSpeed;
			if (vspd < 0 && place_meeting(x, y + vspd, objBlock))
			{
				vspd = 0;
				climbDir = 0;
			}
			if (hMove != 0)
				charDir = hMove;
			var objCol = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, objLadderTop, false, true);
			if (objCol != noone)
			{
				if (((self.bbox_top + self.bbox_bottom) / 2 - objCol.bbox_top) < 0)
				{
					sprite_index = sprPlayer.sprClimbEnd;
					image_index = 0;
					
					vspd = 0;
					physic.gravAffect = true;
					self.y = objCol.bbox_top;
					climbEndDelay = climbEndDelayMax;
				}
			}
			
			if (fncIsOnBlock(vspd) || fncIsOnBlockThin(vspd))
			{
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateIdle);
					return;
				}
			}
		}
		else if (sprite_index == sprPlayer.sprClimbEnd)
		{
			if (climbEndDelay > 0)
				climbEndDelay -= TIME_SCALE;
			else
			{
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateIdle);
					return;
				}
			}
		}
	}
}

function fncPlayerClimbEnd()
{
	with(core.id)
	{
		physic.gravAffect = true;
	}
}

function fncChangeToZXStates()
{
	with (core.id)
	{
		if (shotAnimPhase != 0)
			vspd = 0;
		
		if (fncStaticHandleButton(KeyMap.ATTACK1, KeyAction.PRESSED))
		{
			fncPerformWeapon1();
		}
		
		if (fncStaticHandleButton(KeyMap.ATTACK2, KeyAction.PRESSED))
		{
			fncPerformWeapon2();
		}
		
		if (fncStaticHandleButton(KeyMap.ATTACK2, KeyAction.HELD))
		{
			fncChargeWeapon(2);
		}
		
		if (!fncStaticHandleButton(KeyMap.ATTACK2, KeyAction.HELD))
		{
			fncReleaseWeapon(2);
		}
	}
}