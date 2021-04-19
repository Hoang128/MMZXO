/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

inited = false;

cutSegmentQueue = ds_queue_create();

currentCutSegment = noone;

function fncCreateCutsceneSegment()
{
	currentCutSegment = instance_create_depth(x, y, depth, ds_queue_dequeue(cutSegmentQueue));
	currentCutSegment.core = self;
}

function fncHandleCutsceneSegment()
{
	if (ds_queue_size(cutSegmentQueue) > 0)
	{
		fncCreateCutsceneSegment();
	}
	else
	{
		instance_destroy();
	}
}