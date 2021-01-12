/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

physic = 0;

coreType = noone;
currentState = noone;
core = noone;

function fncStateChange(newState)
{
	var objNewState = instance_create_depth(x, y, depth, newState);
	if (objNewState.stateType == coreType)
	{
		objNewState.stateMachine = self.id;
		objNewState.core = self.core;
		with(objNewState.id)
		{
			fncStateStart();
		}
		
		if (currentState != noone)
		{
			with(currentState.id)
			{
				fncStateEnd();
				instance_destroy();
			}
		}
		
		currentState = objNewState.id;
	}
	else
	{
		show_message("STATE MACHINE DO NOT CONTAIN THIS STATE!");
		game_end();
	}
}

function fncStateHandle()
{
	with (currentState.id)
		fncStateRun();
}