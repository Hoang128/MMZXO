/// @description Insert description here
// You can write your code in this editor

var i = 0;
for (i = 0; i < ds_list_size(dustList); i++)
{
	var objDust = ds_list_find_value(dustList, i);
	objDust.inPool = false;
}
