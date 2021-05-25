/// @description Insert description here
// You can write your code in this editor
instance_create_depth(x, y, depth, objUIStageControllerMenu);
for (var i = 0; i < ds_list_size(charIconList); i++)
{
	instance_destroy(ds_list_find_value(charIconList, i));
}