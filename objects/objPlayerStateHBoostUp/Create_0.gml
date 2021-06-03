/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

function fncStateStart()
{
	fncPlayerHBoostUpStart();
}

function fncStateRun()
{
	fncStateInit();
	fncPlayerHBoostUpRun();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerHBoostUpEnd();
}

function fncPlayerHBoostUpStart()
{
	shadowEffCreater = instance_create_depth(core.x , core.y, depth - 1, objPlayerShadowCreater);
	shadowEffCreater.core = self.core;
	with(core.id)
	{
		sprite_index = sprPlayerHBoostUpStart;
		image_index = 0;
		
		var dashEff = instance_create_depth(x, bbox_top + 12, depth - 2, objMoveImpactEff);
		dashEff.image_angle = 90;
		
		dashTime = dashTimeMax / 3 * 2;
		hspd = 0;
		vspd = 0;
	}
}

function fncStateInit()
{
	if (!inited)
	{
		with (core.id)
			physic.gravAffect = false;
		inited = true;
	}
}

function fncPlayerHBoostUpRun()
{
	with(core.id)
	{	
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
		
		if (dashTime > 0)
		{
			if (vspd > -dashSpd)
			{
				vspd -= dashAccUp;
			}
			else
				vspd = -dashSpd;
			if (fncStaticHandleButton(KeyMap.DASH, KeyAction.RELEASED))
			{
				dashTime = 0;
			}
			if (place_meeting(x, y - 1, objBlock))
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
				
				fncStateChange(objPlayerStateJump);
				currentState.lastState = "dash";
				return;
			}
		}
	}
}

function fncPlayerHBoostUpEnd()
{
	instance_destroy(shadowEffCreater);
	with (core.id)
	{
		if (!physic.gravAffect)
			physic.gravAffect = true;
	}
}