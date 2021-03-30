/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

flySpeed = 7;
damage = 4;
destroyEff = objFlareCluster;
destroyEffShield = objFlarePulseCluster;

audio_play_sound_on(global.emitterSFX.source, sfxZXBusterC2, false, false);

objFlareCreater1 = instance_create_depth(x, y, depth, objZXBusterFlareCtrl);
objFlareCreater1.core = self;
objFlareCreater1.dirStart = 1;
objFlareCreater2 = instance_create_depth(x, y, depth, objZXBusterFlareCtrl);
objFlareCreater2.core = self;
objFlareCreater2.dirStart = -1;