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
	shadowEffCreater = instance_create_depth(core.x , core.y, depth - 1, objPlayerShadowCreater);
	shadowEffCreater.core = self.core;
	with(core.id)
	{	
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
			if (fncIsOnGround(2))
			{
				other.airDash = false;
				physic.gravAffect = true;
			}
			if (charDir * hMove == -1)
			{
				charDir = hMove;
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateJump);
					currentState.lastState = "dash";
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
							currentState.lastState = "dash";
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
								currentState.lastState = "dash";
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
						currentState.lastState = "dash";
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
					currentState.lastState = "dash";
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
				var playerOnGround = true;
				with (core.id)
				{
					playerOnGround = fncIsOnGround(2);
				}
				
				if (playerOnGround)
				{
					fncStateChange(objPlayerStateIdle);
					currentState.lastState = "dash";
					return;
				}
				else
				{
					fncStateChange(objPlayerStateJump);
					currentState.lastState = "dash";
					return;
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
			with (core.id)
			{
				sprite_index = sprPlayer.sprDashStart;
				image_index = 0;
				
				audio_play_sound_on(global.emitterSFX.source, sfxPlayer.sfxDash, false, false);
			}

			var dashDust = instance_create_depth(core.id.x, core.id.y, core.id.depth - 1, objSideDust);
			dashDust.image_xscale = core.id.charDir;
		}
		else
		{
			with (core.id)
			{
				sprite_index = sprPlayer.sprAirDashStart;
				image_index = 0;
				
				audio_play_sound_on(global.emitterSFX.source, sfxPlayer.sfxAirDash, false, false);
			}

			with (core.id)
				physic.gravAffect = false;
		}
		inited = true;
	}
}

function fncChangeToZXStates()
{

}

function fncChangeToHXStates()
{
	with (core.id)
	{
		if (vspd >= 0)
		{
			if (fncStaticHandleButton(KeyMap.JUMP, KeyAction.PRESSED))
			{
				if (!place_meeting(x + charDir * distanceCanWKick, y, objBlock))
				{
					if (airJumpWhenFastMove == true)
					{
						if (jumpTime > 0)
						{
							vspd = -jumpSpd;
							jumpTime--;
							if (!mixAirDashJump)
								airDashCount = 0;
					
							with(other.stateMachine)
							{
								fncStateChange(objPlayerStateHHover);
								return;
							}
						}
					}
				}
			}
		}
	}
}