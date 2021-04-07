/// @description Insert description here
// You can write your code in this editor

if (!inited)
{
	var objGateBossList = ds_list_create();
	collision_rectangle_list(bbox_left, bbox_top, bbox_bottom, bbox_right, objGateBoss, false, true, objGateBossList, false);
	for (var i = 0; i < ds_list_size(objGateBossList); i++)
	{
		ds_list_find_value(objGateBossList, i).boss = true;
	}
	inited = false;
}