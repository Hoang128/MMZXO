/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
slashEnd = false;
slashNext = false;

function fncStateStart()
{
	fncPlayerZXSlashCombo3Start();
}

function fncStateRun()
{
	fncPlayerZXSlashCombo3Run();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerZXSlashCombo3End();
}

function fncPlayerZXSlashCombo3Start()
{
	with(core.id)
	{
		sprite_index = sprPlayerZXSlashCombo3;
		image_index = 0;
		
		audio_play_sound_on(global.emitterSFX.source, vfxVentSlash3, false, false);
	}
}

function fncPlayerZXSlashCombo3Run()
{
	if (slashEnd)
	{
		with(stateMachine)
			fncStateChange(objPlayerStateIdle);
	}
}

function fncPlayerZXSlashCombo3End()
{
	
}