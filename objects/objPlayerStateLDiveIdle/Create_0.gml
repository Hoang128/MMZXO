/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

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
		sprite_index = sprPlayerLDiveNorStart;
		image_index = 0;
		
		physic.gravAffect = false;
		hspd = 0;
	}
}

function fncPlayerLDiveRun()
{
	with (core.id)
	{
		if (vspd > 0)
		{
			vspd -= vAccDive;
		}
		else
			vspd = 0;
		
		if ((airDashWhenFastMove == true)
		|| ((airDashWhenFastMove == false) && other.dashJump == false))
		{
			if (fncStaticHandleButton(KeyMap.DASH, KeyAction.PRESSED))
			{
					
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

function fncPlayerLDiveEnd()
{
	with (core.id)
	{
		physic.gravAffect = true;
	}
}