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
	instance_create_depth(x, y, depth, newState);
	if (newState.stateType == coreType)
	{
		newState.stateMachine = self.id;
		newState.core = self.core;
		with(newState.id)
		{
			fncStateStart();
		}
		
		if (currentState != noone)
		{
			with(currentState)
			{
				fncStateEnd();
				instance_destroy();
			}
		}
		
		currentState = newState.id;
	}
	else
	{
		show_message("STATE MACHINE DO NOT CONTAIN THIS STATE!");
		game_end();
	}
}