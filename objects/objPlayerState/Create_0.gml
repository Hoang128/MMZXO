/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

stateType = "player";

function fncChangeToUniqueStates()
{
	switch(core.object_index)
	{
		case objPlayerZX:	fncChangeToZXStates();	break;
		case objPlayerHX:	fncChangeToHXStates();	break;
		case objPlayerPX:	fncChangeToPXStates();	break;
		case objPlayerLX:	fncChangeToLXStates();	break;
		case objPlayerFX:	fncChangeToFXStates();	break;
		case objPlayerOX:	fncChangeToOXStates();	break;
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