/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

clapTime = 4;
rootPos = {x:4, y:-4};

function fncStateStart()
{
	with (core.id)
	{
		sprite_index = sprHellBatThunderClap;
		image_index = 0;
	}
	
	clapTime--;
}

function fncStateRun()
{
}

function fncStateEnd()
{
}