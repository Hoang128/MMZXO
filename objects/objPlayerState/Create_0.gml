/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

stateType = "player";

function fncChangeToUniqueStates()
{
	fncWeaponHandle();
	
	switch(core.object_index)
	{
		case objPlayerZX:	fncChangeToZXStates();	break;
		case objPlayerH:	fncChangeToHXStates();	break;
		case objPlayerP:	fncChangeToPXStates();	break;
		case objPlayerL:	fncChangeToLXStates();	break;
		case objPlayerF:	fncChangeToFXStates();	break;
		case objPlayerO:	fncChangeToOXStates();	break;
		case objPlayerA:	fncChangeToAStates();	break;
		default:	return;
			
	}
}

function fncChangeToZXStates()
{
	
}

function fncChangeToHXStates()
{
	
}

function fncChangeToPXStates()
{
	
}

function fncChangeToLXStates()
{
	
}

function fncChangeToFXStates()
{
	
}

function fncChangeToOXStates()
{
	
}

function fncChangeToAStates()
{
	
}

function fncWeaponHandle()
{
	with (core.id)
	{
		if (fncStaticHandleButton(KeyMap.ATTACK1, KeyAction.PRESSED))
		{
			fncPerformWeapon1();
		}
		
		if (fncStaticHandleButton(KeyMap.ATTACK1, KeyAction.HELD))
		{
			fncChargeWeapon(1);
		}
		
		if (!fncStaticHandleButton(KeyMap.ATTACK1, KeyAction.HELD))
		{
			fncReleaseWeapon(1);
		}
		
		if (fncStaticHandleButton(KeyMap.ATTACK2, KeyAction.PRESSED))
		{
			fncPerformWeapon2();
		}
		
		if (fncStaticHandleButton(KeyMap.ATTACK2, KeyAction.HELD))
		{
			fncChargeWeapon(2);
		}
		
		if (!fncStaticHandleButton(KeyMap.ATTACK2, KeyAction.HELD))
		{
			fncReleaseWeapon(2);
		}
	}
}