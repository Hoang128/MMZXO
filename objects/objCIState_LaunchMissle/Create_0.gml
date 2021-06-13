/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
missleNumber = 4;
changeState = false;
shot = false;

function fncShotMissle()
{
	var objMissle = instance_create_depth(x + 5 * core.id.image_xscale, core.id.y - 34, depth, objCI_Missle);
	objMissle.hDir = core.id.image_xscale;
}

function fncStateStart()
{
	with (core.id)
	{
		sprite_index = sprCInarabitta_LaunchMissleStart;
		image_index = 0;
		
		audio_play_sound_on(global.emitterSFX.source, sfxCI_VoiceLaunchMissle, false, true);
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