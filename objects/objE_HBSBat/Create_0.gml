/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp = 1;
damage = 1;

inPool = true;

sprite_index = sprHellBatMiniBatStart;
image_index = 0;

hMoveSpd = 2;
vMoveSpd = 0;
core = objE_HellBatSchilt;
if (instance_exists(core))
{
	image_xscale = core.image_xscale;
}