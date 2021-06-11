/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
missleNumber = 5;
changeState = false;
shot = false;

function fncShotMissle()
{
	instance_create_depth(x + 5 * core.id.image_xscale, core.id.y - 34, depth, objCI_Missle);
}

function fncStateStart()
{
	with (core.id)
	{
		sprite_index = sprCInarabitta_LaunchMissleStart;
		image_index = 0;
	}
}

function fncStateRun()
{
	if (shot)
	{
		fncShotMissle();
		shot = false;
	}
	if (changeState)
	{
		fncDoDequeueMove();
	}
}

function fncStateEnd()
{
}