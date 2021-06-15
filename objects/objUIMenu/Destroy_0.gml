/// @description Insert description here
// You can write your code in this editor
ds_list_clear(childMenuNodeList);

if (ds_list_size(childButtonList) > 0)
{
	fncDestroyUIButtonList();
}

ds_list_clear(childButtonList);

if (parentMenu != noone)
{
	if (instance_exists(parentMenu))
	{
		objUIManager.UICurrentInUse = parentMenu.id;
		if (ds_list_size(parentMenu.childButtonList) > 0)
		{
			with (parentMenu)
			{
				fncResetButtonsState();
			}
		}
	}
	else
	{
		if (parentMenuObj != noone)
		{
			instance_create_depth(x, y, depth, parentMenuObj);
		}
	}
}