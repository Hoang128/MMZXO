/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
destroyWhenHit = false;
moveDir = 15;
moveSpd = 4;
imgSpd = 0;
image_speed = 0;
damage = 3;
destroyEff = objLIcePieceCreater;
canDestroyColWall = false;
destroyColWallTime = 5;

audio_play_sound_on(global.emitterSFX.source, sfxCI_IceBreak, false, true);