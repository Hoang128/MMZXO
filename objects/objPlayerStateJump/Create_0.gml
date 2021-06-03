/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
dashJump = false;
shadowEffCreater = noone;
afterWallKick = 0;
lastState = noone;
ableToBoostUp = false;

function fncStateStart()
{
	if (global.debug)
		show_debug_message("Entered Jump State!");
	fncPlayerJumpStart();
}

function fncStateRun()
{
	fncStateInit();
	fncPlayerJumpRun();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerJumpEnd();
}

function fncPlayerJumpStart()
{
	with (core.id)
	{
		if (vspd < 0)
		{
			sprite_index = sprPlayer.sprJumpStart;
			image_index = 0;
		}
		else
		{
			sprite_index = sprPlayer.sprFallStart;
			image_index = 0;
		}
		
		if (object_index == objPlayerH)
			other.ableToBoostUp = true;
		physic.onGround = false;
	}
}

function fncStateInit()
{
	if (!inited)
	{
		with(core.id)
		{
			if (vspd >= 0)
			{
				var colObj = noone;
				do
				{
					colObj = collision_rectangle(bbox_left, bbox_top - 1, bbox_right, bbox_top, objBlock, false, true)
					if (colObj)
						y++;
				}
				until (colObj == noone)
			}
		}
		
		inited = true;
	}
}

function fncPlayerJumpRun()
{
	if (dashJump)
	{
		if (shadowEffCreater == noone)
		{
			shadowEffCreater = instance_create_depth(core.x, core.y, depth - 1, objPlayerShadowCreater);
			shadowEffCreater.core = self.core;
		}
	}
	with (core.id)
	{
		if (other.afterWallKick == 1)
		{
			image_index = 1;
			other.afterWallKick = 2;
		}
		if (hMove != 0)
		{
			charDir = hMove;
		}
		
		var moveSpd = runSpd;
		if (other.dashJump)
			moveSpd = dashSpd;
		
		hspd = moveSpd * hMove * jumpHspdRatio;
		
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
				
						var climbFromFirstImageTemp = false;
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
		
		if (!fncStaticHandleButton(KeyMap.JUMP, KeyAction.HELD))
		{
			if (vspd < 0) vspd = 0;
		}
		
		if (airDashCount > 0)
		{
			if ((airDashWhenFastMove == true)
			|| ((airDashWhenFastMove == false) && other.dashJump == false))
			{
				if (fncStaticHandleButton(KeyMap.DASH, KeyAction.PRESSED))
				{
					if (!other.ableToBoostUp) || (!fncStaticHandleButton(KeyMap.UP, KeyAction.HELD))
					{
						airDashCount--;
						if (!mixAirDashJump)
							jumpTime = 0;
						with(other.stateMachine)
						{
							var currentAirDash = true;
							fncStateChange(objPlayerStateDash);
							currentState.airDash = currentAirDash;
							return;
						}
					}
				}
			}
		}
	
		if (vspd >= 0)
		{
			if ((sprite_index == sprPlayer.sprJumpStart) || (sprite_index == sprPlayer.sprJump))
			{
				sprite_index = sprPlayer.sprFallStart;
				image_index = 0;
			}
			
			if (fncStaticHandleButton(KeyMap.JUMP, KeyAction.PRESSED))
			{
				if (place_meeting(x + charDir * distanceCanWKick, y, objBlock))
				{
					with(other.stateMachine)
					{
						fncStateChange(objPlayerStateWallKick);
						currentState.dashJump = fncStaticHandleButton(KeyMap.DASH, KeyAction.HELD);
						return;
					}
				}
			}
			
			if (place_meeting(x + charDir, y, objBlock))
			{
				if (!fncIsOnGround(distanceOffSlide))
				{
					if (hMove == charDir)
					{
						with(other.stateMachine)
						{
							fncStateChange(objPlayerStateSlide);
						}
					}
				}
			}
			
			if (physic.onGround)
			{
				sprite_index = sprPlayer.sprLand;
				image_index = 0;
				
				runSFXPlayer = instance_create_depth(x, y, depth, objPlayerRunSFXCreater);
				runSFXPlayer.core = self.id;
				
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateIdle);
					currentState.lastState = "jump";
					return;
				}
			}
		}
	}
}

function fncPlayerJumpEnd()
{
	if (instance_exists(shadowEffCreater))
		instance_destroy(shadowEffCreater);
}

function fncChangeToZXStates()
{
	with (core.id)
	{
		if (vspd >= 0)
		{
			if (fncStaticHandleButton(KeyMap.JUMP, KeyAction.PRESSED))
			{
				if (!place_meeting(x + charDir * distanceCanWKick, y, objBlock))
				{
					if ((airJumpWhenFastMove == true)
					|| ((airJumpWhenFastMove == false) && other.dashJump == false))
					{
						if (jumpTime > 0)
						{
							vspd = -jumpSpd;
							jumpTime--;
							if (!mixAirDashJump)
								airDashCount = 0;
					
							with(other.stateMachine)
							{
								var currentDashJump = currentState.dashJump;
								fncStateChange(objPlayerStateJump);
								if (currentDashJump)
									currentState.dashJump = true;
								return;
							}
						}
					}
				}
			}
		}
	}
}

function fncChangeToHXStates()
{
	with (core.id)
	{
		if (airDashCount > 0)
		{
			if ((airDashWhenFastMove == true)
			|| ((airDashWhenFastMove == false) && other.dashJump == false))
			{
				if (fncStaticHandleButton(KeyMap.DASH, KeyAction.PRESSED))
				{
					if (fncStaticHandleButton(KeyMap.UP, KeyAction.HELD))
					{
						airDashCount--;
						if (!mixAirDashJump)
							jumpTime = 0;
						with(other.stateMachine)
						{
							fncStateChange(objPlayerStateHBoostUp);
							currentState.airDash = true;
							return;
						}
					}
				}
			}
		}
		
		if (vspd >= 0)
		{
			if (fncStaticHandleButton(KeyMap.JUMP, KeyAction.PRESSED))
			{
				if (!place_meeting(x + charDir * distanceCanWKick, y, objBlock))
				{
					if ((airJumpWhenFastMove == true)
					|| ((airJumpWhenFastMove == false) && other.dashJump == false))
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