/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
hMove = 0;
vMove = 0;
isNeedAccUp = true;
effTimeMax = 8;
effTime = effTimeMax;

function fncCreateJetEffect()
{
	with (core.id)
	{
		var effPlace = {x : 0, y : 0, direction : 0};
		switch (sprite_index)
		{
			case sprPlayerLDiveForward:
			{
				effPlace.x = -7;
				effPlace.y = -32;
				effPlace.direction = 90 + image_xscale * 90;
			}	break;
			case sprPlayerLDiveUpForward:
			{
				effPlace.x = -16;
				effPlace.y = -22;
				effPlace.direction = 270 - image_xscale * 45;
			}	break;
			case sprPlayerLDiveDownForward:
			{
				effPlace.x = -6;
				effPlace.y = -39;
				effPlace.direction = 90 + image_xscale * 45;
			}	break;
			case sprPlayerLDiveUp:
			{
				effPlace.x = -13;
				effPlace.y = -19;
				effPlace.direction = 270;
			}	break;
			case sprPlayerLDiveDown:
			{
				effPlace.x = 9;
				effPlace.y = -40;
				effPlace.direction = 90;
			}	break;
		}
	
		var objJetEff = instance_create_depth(x + effPlace.x * image_xscale, y + effPlace.y, depth, objLIceJetEff);
		objJetEff.moveDir = effPlace.direction;
		objJetEff.vDir = 0;
	}
}

function fncDiveWithSpeed(diveSpeed)
{
	with (core.id)
	{
		if (hMove != 0)
			charDir = sign(hMove);
		if (vMove < 0)
		{
			if (!collision_rectangle(bbox_left, bbox_top - 1, bbox_right, bbox_top, objZoneWater, false, false))
			{
				vMove = 0;
			}
		}
		else if (vMove > 0)
		{
			if (!collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom + 1, objZoneWater, false, false))
			{
				vMove = 0;
			}
		}
		
		if ((abs(hMove) > 0) && (abs(diveSpeed) > 0) && other.isNeedAccUp)
		{
			if (abs(hspd) < abs(diveSpeed))
			{
				hspd += sign(hMove) * accDive;
			}
			else
			{
				hspd = hMove * diveSpeed;
				other.isNeedAccUp = false;
			}
		}
		else
		{
			hspd = hMove * diveSpeed;
			other.isNeedAccUp = false;
		}
				
		if ((abs(vMove) > 0) && (abs(diveSpeed) > 0) && other.isNeedAccUp)
		{
			if (abs(vspd) < abs(diveSpeed))
			{
				vspd += sign(vMove * accDive)
			}
			else
			{
				vspd = vMove * diveSpeed;
				other.isNeedAccUp = false;
			}
		}
		else
		{
			vspd = vMove * diveSpeed;
			other.isNeedAccUp = false;
		}
	}
}

function fncStateStart()
{
	fncPlayerLDiveMoveStart();
}

function fncStateRun()
{
	fncStateInit();
	fncPlayerLDiveMoveRun();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerLDiveMoveEnd();
}

function fncPlayerLDiveMoveStart()
{
	with (core.id)
	{
		physic.gravAffect = false;
	}
}

function fncStateInit()
{
	
}

function fncPlayerLDiveMoveRun()
{
	with (core.id)
	{	
		if (other.effTime > 0)
		{
			other.effTime -= TIME_SCALE;
		}
		else
		{
			with (other)
				fncCreateJetEffect();
			other.effTime = other.effTimeMax;
		}
		
		if ((hMove == 0) && (vMove == 0))
		{
			with(other.stateMachine)
			{
				fncStateChange(objPlayerStateLDiveIdle);
				currentState.lastAction = "dive move";
				return;
			}
		}
		else
		{
			if ((hMove != 0) && (vMove != 0))
			{
				var nextSprite = noone;
				if (vMove > 0)
				{
					nextSprite = sprPlayerLDiveDownForward;		
				}
				else
				{
					nextSprite = sprPlayerLDiveUpForward;
				}
				if (sprite_index != nextSprite)
				{
					sprite_index = nextSprite;
					image_index = 0;
				}
				
				with (other)
					fncDiveWithSpeed(other.diveSpd/sqrt(2));
			}
			else
			{
				var nextSprite = noone;
				if (vMove > 0)
				{
					nextSprite = sprPlayerLDiveDown;
				}
				else if (vMove < 0)
				{
					nextSprite = sprPlayerLDiveUp;
				}
				else
				{
					nextSprite = sprPlayerLDiveForward;
				}
				if (sprite_index != nextSprite)
				{
					sprite_index = nextSprite;
					image_index = 0;
				}
				
				with (other)
					fncDiveWithSpeed(other.diveSpd);
			}
		}
		
		if ((airDashWhenFastMove == true)
		|| ((airDashWhenFastMove == false) && other.dashJump == false))
		{
			if (fncStaticHandleButton(KeyMap.DASH, KeyAction.PRESSED))
			{
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateLDiveDash);
					currentState.lastAction = "dive move";
					return;
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
	}
}

function fncPlayerLDiveMoveEnd()
{
	with (core.id)
	{
		physic.gravAffect = true;
	}
}