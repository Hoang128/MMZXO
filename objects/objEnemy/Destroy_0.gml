/// @description Insert description here
// You can write your code in this editor
/// @description Destroy
if (parent != noone)
{
	with (parent)
		child = noone;
}

if (createDestroyEff)
{
	var pos = {x : (bbox_right + bbox_left) / 2, y : (bbox_top + bbox_bottom) / 2}
	instance_create_depth(pos.x, pos.y, depth - 1, destroyEff);
}