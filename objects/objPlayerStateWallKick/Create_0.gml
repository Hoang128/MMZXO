/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

dashJump = false;
shadowEffCreater = noone;
wallKickTimeH = 0;

function fncStateStart()
{
	fncPlayerWallKickStart();
}

function fncStateRun()
{
	fncStateInit();
	fncPlayerWallKickRun();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerWallKickEnd();
}

function fncPlayerWallKickStart()
{
	with(core.id)
	{
		sprite_index = sprPlayer.sprWallKick
		image_index = 0;
		
		var flare = instance_create_depth(x + charDir * 12, y, depth - 1, objFlare);
		flare.image_xscale = charDir;
		
		physic.gravAffect = false;
		other.wallKickTimeH = wallKickTimeHMax;
		airDashCount = airDashCountMax;
		jumpTime = jumpTimeMax;
		
		vspd = -wallKickSpd;
		hspd = 0;
	}
}

function fncPlayerWallKickRun()
{
	if (dashJump)
	{
		if (shadowEffCreater == noone)
		{
			shadowEffCreater = instance_create_depth(core.x, core.y, depth - 1, objPlayerShadowCreater);
			shadowEffCreater.core = self.core;
		}
	}
	with(core.id)
	{
		if (other.wallKickTimeH > 0)
		{
			if (hspd == 0)
			{
				if (!other.dashJump)
					hspd = -charDir * runSpd;
				else
					hspd = -charDir * dashSpd;
			}
			other.wallKickTimeH -= TIME_SCALE;
		}
		else
		{
			with(other.stateMachine)
			{
				var currentDashJump = currentState.dashJump;
				fncStateChange(objPlayerStateJump);
				currentState.dashJump = currentDashJump;
				currentState.afterWallKick = 1;
				return;
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
	}
}

function fncPlayerWallKickEnd()
{
	with(core.id)
		physic.gravAffect = true;
	if (instance_exists(shadowEffCreater))
		instance_destroy(shadowEffCreater);
}

function fncChangeToZXStates()
{

}