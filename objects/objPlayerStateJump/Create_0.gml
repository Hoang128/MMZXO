/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
dashJump = false;
shadowEffCreater = noone;

function fncStateStart()
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
		
		physic.onGround = false;
	}
}

function fncStateRun()
{
	if (dashJump)
	{
		if (shadowEffCreater == noone)
		{
			shadowEffCreater = instance_create_depth(x, y, depth - 1, objPlayerShadowCreater);
			shadowEffCreater.core = self.core;
		}
	}
	with (core.id)
	{
		if (hMove != 0)
		{
			charDir = hMove;
		}
		
		var moveSpd = runSpd;
		if (other.dashJump)
			moveSpd = dashSpd;
		
		hspd = moveSpd * hMove;
		
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
		
		if (!keyboard_check(global.keyJump))
		{
			if (vspd < 0) vspd = 0;
		}
		
		if (airDashCount > 0)
		{
			if ((airDashWhenFastMove == true)
			|| ((airDashWhenFastMove == false) && other.dashJump == false))
			{
				if (keyboard_check_pressed(global.keyDash))
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
	
		if (vspd >= 0)
		{
			if ((sprite_index == sprPlayer.sprJumpStart)
			|| (sprite_index == sprPlayer.sprJump))
			{
				sprite_index = sprPlayer.sprFallStart;
				image_index = 0;
			}
			
			if (place_meeting(x + charDir, y, objBlock))
			{
				if (hMove == charDir)
				{
					with(other.stateMachine)
					{
						fncStateChange(objPlayerStateSlide);
					}
				}
			}
			
			
			if (keyboard_check_pressed(global.keyJump))
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
				else
				{
					with(other.stateMachine)
					{
						fncStateChange(objPlayerStateWallKick);
						currentState.dashJump = keyboard_check(global.keyDash);
						return;
					}
				}
			}
			
			if (physic.onGround == true)
			{
				sprite_index = sprPlayer.sprLand;
				image_index = 0;
				
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateIdle);
					return;
				}
			}
		}
	}
}

function fncStateEnd()
{
	if (instance_exists(shadowEffCreater))
		instance_destroy(shadowEffCreater);
}