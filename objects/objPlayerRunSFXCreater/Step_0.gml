/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (core.playerStateMachine.currentState.object_index != objPlayerStateRun)
	instance_destroy();

if (waitTime <= 0)
{
	waitTime = waitTimeMax;
	audio_play_sound_on(global.emitterSFX.source, sfxFootCommon, false, false);
}
else
{
	waitTime -= TIME_SCALE;
}