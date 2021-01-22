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
				hspd += charDir * dashAccUp * TIME_SCALE;
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
			if (sprite_index != sprPlayer.sprDashEnd)
			{
				dashTime = 0;
				sprite_index = sprPlayer.sprDashEnd;
				image_index = 0;
				
				if (!other.airDash)
				{
					if (hMove != 0)
					{
						charDir = hMove;
						with(other.stateMachine)
						{
							fncStateChange(objPlayerStateRun);
							return;
						}
					}
				}
			}
			
			if (fncStaticHandleButton(KeyMap.DASH, KeyAction.PRESSED))
			{
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateDash);
					return;
				}
			}
			
			if (other.airDash)
			{
				hspd = 0;
				
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateJump);
					return;
				}
			}
			else
			{
				if (hMove != 0)
				{
					charDir = hMove;
					with(other.stateMachine)
					{
						fncStateChange(objPlayerStateRun);
						return;
					}
				}
				if (abs(hspd) > 0)
				{
					hspd -= charDir * dashAccDown * TIME_SCALE;
				}
				else
				{
					hspd = 0;
				
					with(other.stateMachine)
					{
						fncStateChange(objPlayerStateIdle);
						return;
					}
				}	
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
		if (fncStaticHandleButton(KeyMap.ATTACK2, KeyAction.PRESSED))
		{
			if (canShot == 1)
			{
				fncStartShot();
				canShot = -waitShot;
			}
		}
	}
}