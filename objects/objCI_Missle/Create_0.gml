/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp = 1;
damage = 3;
moveSpd = 2;
phase = 0;
existTime = 180;
createEffTimeMax = 10;
createEffTime = createEffTimeMax;

direction = 90;
image_angle = direction;
changeDirTimeMax = 5;
changeDirTime = changeDirTimeMax;
destroyEff = objExplosionS;

hDir = 1;
defaultChangeDirTime = 3;

weaponTypeCauseDeath = PlayerWeaponType.OBJECTIVE;

audio_play_sound_on(global.emitterSFX.source, sfxCI_LaunchMissle, false, true);