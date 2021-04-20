/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!inited)
{
	if (haveSound)
	{
		audio_play_sound_on(global.emitterSFX.source, sfxExplosion, false, false);
	}
	
	inited = true;
}