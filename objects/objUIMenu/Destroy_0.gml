/// @description Insert description here
// You can write your code in this editor
ds_list_clear(childMenuNodeList);

if (parent != noone)
	objUIManager.UICurrentInUse = parent;
else
	objUIManager.UICurrentInUse = noone;