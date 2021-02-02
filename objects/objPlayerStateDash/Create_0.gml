/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
airDash = false;
shadowEffCreater = noone;


function fncStateStart()
{
	fncPlayerDashStart();
}

function fncStateRun()
{
	fncStateInit();
	fncPlayerDashRun();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerDashEnd();
}

function fncPlayerDashStart()
{
	shadowEffCreater = instance_create_depth(x, y, depth - 1, objPlayerShadowCreater);
	shadowEffCreater.core = self.core;
	with(core.id)
	{
		sprite_index = sprPlayer.sprDashStart;
		image_index = 0;
		
		var dashEff = instance_create_depth(x + charDir * 12, bbox_bottom - 12, depth - 2, objMoveImpactEff);
		dashEff.image_xscale = self.charDir;
		
		dashTime = dashTimeMax;
	}
}

function fncPlayerDashRun()
{
	with(core.id)
	{	
		vspd = 0;
		if (other.airDash)
		{
			if (physic.gravAffect)
				physic.gravAffect = false;
			if (fncIsOnBlockThin(2))
				if (!physic.onGround)
					physic.onGround = true;
			if (charDir * hMove == -1)
			{
				charDir = hMove;
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateJump);
					return;
				}
			}
			if (place_meeting(x + charDir, y, objBlock))
			{
				if (!place_meeting(x + charDir * maxDisDetectSlopeAbove, y, objSlope))
				{
					if (charDir == hMove)
					{
						with(other.stateMachine)
						{			
							fncStateChange(objPlayerStateSlide);
							return;
						}
					}
					else
					{
						with(other.stateMachine)
						{			
							fncStateChange(objPlayerStateJump);
							return;
						}
					}
				}
			}
		}
		else
		{
			if (fncStaticHandleButton(KeyMap.JUMP, KeyAction.PRESSED))
			{
				if (fncStaticHandleButton(KeyMap.DOWN, KeyAction.HELD))
				{
					if (fncIsOnBlockThin(1))
					{
						if (!fncIsOnBlock(1))
						{
							y+=4;
							jumpTime--;
							physic.onGround = false;
							fncIgnoreThinBlockFor(physic.thinBlockIgnoreTimeMax);
							with(other.stateMachine)
							{
								fncStateChange(objPlayerStateJump);
								return;
							}
						}
					}
				}
				if (jumpTime > 0)
				{
					vspd = -jumpSpd;
					jumpTime--;
					with(other.stateMachine)
					{
						fncStateChange(objPlayerStateJump);
						currentState.dashJump = true;
						return;
					}
				}
			}
			
			if (place_meeting(x + charDir, y, objBlock))
			{
				if (!place_meeting(x, y + maxDisDetectSlopeAbove, objSlope))
				{
					if (!place_meeting(x + charDir * maxDisDetectSlopeAbove, y, objSlope))
					{
						dashTime = 0;
					}
				}
			}
			

			if (charDir * hMove == -1)
			{
				charDir = hMove;
			}
			
			if (!physic.onGround)
			{
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateJump);
					return;
				}
			}
		}
		
		if (vMove < 0)
		{
			if (canClimb)
			{
				var objCol = collision_rectangle(bbox_right, (bbox_top + bbox_bottom) / 2, bbox_left, bbox_bottom, objLadder, false, false);
				if (objCol != noone)
				{
					if ((abs(self.x - ((objCol.bbox_right + objCol.bbox_left)/2))) <= climbDistance)
					{
						x = (objCol.bbox_right + objCol.bbox_left)/2;
				
						var climbFromFirstImageTemp = true;
						if (!physic.onGround)
							climbFromFirstImageTemp = false;
						with(other.stateMachine)
						{
							fncStateChange(objPlayerStateClimb);
							currentState.climbFromFirstImage = climbFromFirstImageTemp;
							return;
						}
					}
				}
			}
		}
		
		if (dashTime > 0)
		{
			if (abs(hspd) < dashSpd)
			{
				hspd += charDir * dashAccUp;
			}
			else
				hspd = charDir * dashSpd;
			if (fncStaticHandleButton(KeyMap.DASH, KeyAction.RELEASED))
			{
				dashTime = 0;
			}
			dashTime -= TIME_SCALE;
		}
		else
		{
			with(other.stateMachine)
			{
				fncStateChange(objPlayerStateIdle);
				currentState.lastState = "dash";
				return;
			}
		}
	}
}

function fncPlayerDashEnd()
{
	instance_destroy(shadowEffCreater);
	with (core.id)
	{
		if (!physic.gravAffect)
			physic.gravAffect = true;
	}
}

function fncStateInit()
{
	if (!inited)
	{
		if (!airDash)
		{
			var dashDust = instance_create_depth(core.id.x, core.id.y, core.id.depth - 1, objSideDust);
			dashDust.image_xscale = core.id.charDir;
		}
		
		inited = true;
	}
}

function fncChangeToZXStates()
{
	with (core.id)
	{
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
		
		if (fncStaticHandleButton(KeyMap.ATTACK2, KeyAction.RELEASED))
		{
			fncReleaseWeapon(2);
		}
	}
}