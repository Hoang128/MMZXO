/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

dashJump = false;
shadowEffCreater = noone;
wallKickTimeH = 0;
wallKickTimeV = 0;

function fncStateStart()
{
	with(core.id)
	{
		sprite_index = sprPlayer.sprWallKick
		image_index = 0;
		
		physic.gravAffect = false;
		other.wallKickTimeH = wallKickTimeHMax;
		airDashCount = airDashCountMax;
		jumpTime = jumpTimeMax;
		
		vspd = -wallKickSpd;
		hspd = 0;
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
				return;
			}
		}
	}
}

function fncStateEnd()
{
	with(core.id)
		physic.gravAffect = true;
	if (instance_exists(shadowEffCreater))
		instance_destroy(shadowEffCreater);
}

