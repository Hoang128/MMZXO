/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
lastAction = "jump";
accSlow = 0;

function fncStateStart()
{
	fncPlayerLDiveStart();
}

function fncStateRun()
{
	fncStateInit();
	fncPlayerLDiveRun();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerLDiveEnd();
}

function fncPlayerLDiveStart()
{
	with (core.id)
	{
		physic.gravAffect = false;
	}
}

function fncStateInit()
{
	if (!inited)
	{
		switch (lastAction)
		{
			case "jump":
			{
				core.id.sprite_index = sprPlayerLDiveNorStart;
				core.id.image_index = 0;
				accSlow = core.id.accDive;
			}
			case "dive move":
			{
				core.id.sprite_index = sprPlayerLDiveIdle;
				core.id.image_index = 0;
				accSlow = core.id.accDive;
				
			}
			case "dive dash":
			{
				core.id.sprite_index = sprPlayerLDiveIdle;
				core.id.image_index = 0;
				accSlow = core.id.accDiveDash;
				
			}
			case "spin":
			{
				core.id.sprite_index = sprPlayerLDiveIdle;
				core.id.image_index = 0;
				accSlow = core.id.accDiveDash;
			}
		}
		inited = true;
	}
}

function fncPlayerLDiveRun()
{
	with (core.id)
	{
		if (vspd < 0)
		{
			if (!collision_rectangle(bbox_left, bbox_top - 1, bbox_right, bbox_top, objZoneWater, false, false))
			{
				vspd = 0;
			}
		}
		else if (vspd > 0)
		{
			if (!collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom + 1, objZoneWater, false, false))
			{
				vspd = 0;
			}
		}
		
		if (abs(vspd) >= other.accSlow)
		{
			vspd -= sign(vspd) * other.accSlow;
		}
		else
			vspd = 0;
			
		if (abs(hspd) >= other.accSlow)
		{
			hspd -= sign(hspd) * other.accSlow;
		}
		else
			hspd = 0;
		
		if ((airDashWhenFastMove == true)
		|| ((airDashWhenFastMove == false) && other.dashJump == false))
		{
			if (fncStaticHandleButton(KeyMap.DASH, KeyAction.PRESSED))
			{
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateLDiveDash);
					currentState.lastAction = "dive idle";
					other.vspd = 0;
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
		
		if ((hMove != 0) || (vMove != 0))
		{
			with(other.stateMachine)
			{
				fncStateChange(objPlayerStateLDiveMove);
				other.vspd = 0;
				return;
			}
		}
	}
}

function fncPlayerLDiveEnd()
{
	with (core.id)
	{
		physic.gravAffect = true;
	}
}