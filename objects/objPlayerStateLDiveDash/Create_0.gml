/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
hMove = 0;
vMove = 0;
isNeedAccUp = true;
lastAction = "jump";

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
				hspd += sign(hMove * accDive);
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
		dashTime = dashTimeMax;
	}
}

function fncStateInit()
{
	if (!inited)
	{
		switch (lastAction)
		{
			case "jump":
			case "dive idle":
				core.id.image_index = 0;	break;
			case "dive move":
				core.id.image_index = 1;	break;
		}
		inited = true;
	}
}

function fncPlayerLDiveMoveRun()
{
	with (core.id)
	{	
		if (dashTime > 0)
		{
			dashTime -= TIME_SCALE;
			if ((hMove == 0) && (vMove == 0))
			{
				if (sprite_index != sprPlayerLDiveDashForward)
				{
					sprite_index = sprPlayerLDiveDashForward;
				}
				
				if ((abs(hMove) > 0) && (abs(diveSpeed) > 0) && other.isNeedAccUp)
				{
					if (abs(hspd) < abs(dashDiveSpd))
					{
						hspd += sign(charDir * accDive);
					}
				}
				else
				{
					hspd = charDir * dashDiveSpd;
					other.isNeedAccUp = false;
				}
				
				vspd = 0;
			}
			else
			{
				if ((hMove != 0) && (vMove != 0))
				{
					var nextSprite = noone;
					if (vMove > 0)
					{
						nextSprite = sprPlayerLDiveDashDownForward;		
					}
					else
					{
						nextSprite = sprPlayerLDiveDashUpForward;
					}
					if (sprite_index != nextSprite)
					{
						sprite_index = nextSprite;
					}
				
					with (other)
						fncDiveWithSpeed(other.dashDiveSpd/sqrt(2));
				}
				else
				{
					var nextSprite = noone;
					if (vMove > 0)
					{
						nextSprite = sprPlayerLDiveDashDown;
					}
					else if (vMove < 0)
					{
						nextSprite = sprPlayerLDiveDashUp;
					}
					else
					{
						nextSprite = sprPlayerLDiveDashForward;
					}
					if (sprite_index != nextSprite)
					{
						sprite_index = nextSprite;
					}
				
					with (other)
						fncDiveWithSpeed(other.dashDiveSpd);
				}
			}

			if (fncStaticHandleButton(KeyMap.DASH, KeyAction.RELEASED))
			{
				dashTime = 0;
			}
		}
		else
		{
			if ((hMove == 0) && (vMove == 0))
			{
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateLDiveIdle);
					currentState.lastAction = "dive dash";
					return;
				}
			}
			else
			{
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateLDiveMove);
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