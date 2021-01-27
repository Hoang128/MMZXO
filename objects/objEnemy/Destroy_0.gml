/// @description Insert description here
// You can write your code in this editor
var pos = {x : (bbox_left + bbox_right) / 2, y : (bbox_top + bbox_bottom) / 2};
instance_create_depth(pos.x, pos.y, depth - 1, destroyEff);