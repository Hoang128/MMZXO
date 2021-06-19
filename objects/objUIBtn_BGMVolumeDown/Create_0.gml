/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

UIButtonImg = sprUIButtonS_Left;

function fncUIHandleSelect()
{
	if (global.emitterBGM.volume >= 0.1)
	{
		global.emitterBGM.volume -= 0.1;
		audio_emitter_gain(global.emitterBGM.source, global.emitterBGM.volume);
	}
	alarm[0] = 2;
}