/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
lastAction = "jump";

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
			}
			case "dive move":
			case "dive dash":
			{
				core.id.sprite_index = sprPlayerLDiveIdle;
				core.id.image_index = 0;
			}
		}
		inited = true;
	}
}

function fncPlayerLDiveRun()
{
	with (core.id)
	{
		if (abs(vspd) >= accDive)
		{
			vspd -= sign(vspd) * accDive;
		}
		else
			vspd = 0;
			
		if (abs(hspd) >= accDive)
		{
			hspd -= sign(hspd) * accDive;
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