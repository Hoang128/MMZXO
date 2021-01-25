/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
weapon = 1;
core = noone;
imgSpd = 0.25;

if (!audio_is_playing(sfxChargeEff))
	audio_play_sound_on(global.emitterSFX.source, sfxChargeEff, true, false);