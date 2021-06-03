/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

function fncStateStart()
{
	fncPlayerHHoverStart();
}

function fncStateRun()
{
	fncStateInit();
	fncPlayerHHoverRun();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerHHoverEnd();
}

function fncPlayerHHoverStart()
{
	with (core.id)
	{
		sprite_index = sprPlayerHHoverStart;
		image_index = 0;
		
		physic.gravAffect = false;
		vspd = hoverSpd;
	}
}

function fncPlayerHHoverRun()
{
	with (core.id)
	{
		if (hMove != 0)
		{
			charDir = hMove;
		}
		
		hspd = runSpd * hMove * jumpHspdRatio;
		
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
		
		if (airDashCount > 0)
		{
			if ((airDashWhenFastMove == true)
			|| ((airDashWhenFastMove == false) && other.dashJump == false))
			{
				if (fncStaticHandleButton(KeyMap.DASH, KeyAction.PRESSED))
				{
					if (!fncStaticHandleButton(KeyMap.UP, KeyAction.HELD))
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
					else
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
		
		if (fncStaticHandleButton(KeyMap.JUMP, KeyAction.PRESSED))
		{
			with(other.stateMachine)
			{
				fncStateChange(objPlayerStateJump);
				return;
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
			
		if (fncIsOnGround(2))
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

function fncPlayerHHoverEnd()
{
	with (core.id)
	{
		physic.gravAffect = true;
	}
}