/// @description Insert description here
// You can write your code in this editor

ds_queue_destroy(stateQueue);

if (instance_exists(currentState))
	instance_destroy(currentState);