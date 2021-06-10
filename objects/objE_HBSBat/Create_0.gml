/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp = 1;
damage = 3;

inPool = true;

sprite_index = sprHellBatMiniBatStart;
image_index = 0;

hMoveSpd = 4;
vMoveSpd = 0;
accSpd = 0.02;
core = objE_HellBatSchilt;
destroyEff = objExplosionS;

imgSpd = 1;

if (instance_exists(core))
{
	image_xscale = core.image_xscale;
}