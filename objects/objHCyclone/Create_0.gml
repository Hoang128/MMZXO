/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
imgSpd = 0.5;

damage = 1.5;
maxTimmer = 2;

moveSpd = 2;
accSpd = 0.005;
direction = 0;

inited = false;

audio_play_sound_on(global.emitterSFX.source, sfxModelHCyclone, false, true);