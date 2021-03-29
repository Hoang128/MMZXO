/// @description Insert description here
// You can write your code in this editor
event_inherited();

if (createDestroyEff)
{
	if (destroyEff != noone)
	{
		var destroyEffect = instance_create_depth(x + flySpeed * image_xscale, y, depth, destroyEff);
		destroyEffect.image_xscale = image_xscale;
	}
}