/// @description Insert description here
// You can write your code in this editor
ignoreThinBlockList = ds_list_create();

function fncAddIgnoreTBlockList(objID)
{
	ds_list_add(ignoreThinBlockList, objID);
	
}

function fncRemoveIgnoreTBlockList(objID)
{
	if (!ds_list_empty(ignoreThinBlockList))
		ds_list_delete(ignoreThinBlockList, ds_list_find_index(ignoreThinBlockList, objID));
	else
	{
		show_message("IGNORE THIN BLOCK LIST IS EMPTY! CANNOT DELETE ELEMENT IN AN EMPTY LIST");
		game_end();
	}
}