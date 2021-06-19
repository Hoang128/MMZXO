/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

UIButtonImg = sprUIButtonS_Right;

function fncUIHandleSelect()
{
	if (global.emitterSFX.volume <= 0.9)
	{
		global.emitterSFX.volume += 0.1;
		audio_emitter_gain(global.emitterSFX.source, global.emitterSFX.volume);
	}
	alarm[0] = 2;
}