/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

UIButtonImg = sprUIButtonS_Right;

function fncUIHandleSelect()
{
	if (global.emitterBGM.volume <= 0.9)
	{
		global.emitterBGM.volume += 0.1;
		audio_emitter_gain(global.emitterBGM.source, global.emitterBGM.volume);
	}
	alarm[0] = 2;
}