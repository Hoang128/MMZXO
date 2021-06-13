/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
useQueue = false;

coreType = noone;
currentState = noone;
core = noone;

stateQueue = ds_queue_create();

function fncStateEnqueue(state)
{
	ds_queue_enqueue(stateQueue, state);
}

function fncStateDequeue()
{
	if (ds_queue_size(stateQueue) == 0)
		return;
	var newState = ds_queue_dequeue(stateQueue);
	
	fncStateChange(newState);
}

function fncStateChange(newState)
{
	var objNewState = instance_create_depth(x, y, depth, newState);
	if (objNewState.stateType == coreType)
	{
		objNewState.stateMachine = self.id;
		objNewState.core = self.core;
		
		if (currentState != noone)
		{
			with(currentState.id)
			{
				fncStateEnd();
				instance_destroy();
			}
		}
		
		with(objNewState.id)
		{
			fncStateStart();
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