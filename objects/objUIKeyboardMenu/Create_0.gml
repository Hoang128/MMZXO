/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

UIContext.titleFont = fontMenuM;
UIContext.childFont = fontMenuS;

UIContext.childVSpace = 96;
UIContext.titleVMargin = 128;
UIContext.childVMargin = 192;

UIBackground.xStart = 668;
UIBackground.yStart = 64;
UIBackground.UIWidth = 1188;
UIBackground.UIHeight = 952;

UIMenuLimit.actived = true;
UIMenuLimit.maxRow = 5;

listKeyboardMap = ds_list_create();

titleContext = "Cài đặt bàn phím";
fncInitUIChildMenuNode("Di chuyển trái", noone, objUIKeyboardIndexer, true, true);
fncInitUIChildMenuNode("Di chuyển phải", noone, objUIKeyboardIndexer, true, true);
fncInitUIChildMenuNode("Di chuyển lên", noone, objUIKeyboardIndexer, true, true);
fncInitUIChildMenuNode("Di chuyển xuống", noone, objUIKeyboardIndexer, true, true);
fncInitUIChildMenuNode("Nhảy", noone, objUIKeyboardIndexer, true, true);
fncInitUIChildMenuNode("Trượt", noone, objUIKeyboardIndexer, true, true);
fncInitUIChildMenuNode("Dùng vũ khí 1", noone, objUIKeyboardIndexer, true, true);
fncInitUIChildMenuNode("Dùng vũ khí 2", noone, objUIKeyboardIndexer, true, true);
fncInitUIChildMenuNode("Tuyệt chiêu 1", noone, objUIKeyboardIndexer, true, true);
fncInitUIChildMenuNode("Tuyệt chiêu 2", noone, objUIKeyboardIndexer, true, true);
fncInitUIChildMenuNode("Đổi dạng", noone, objUIKeyboardIndexer, true, true);
fncInitUIChildMenuNode("Xem bản đồ", noone, objUIKeyboardIndexer, true, true);

function fncUIHandleExit()
{
	fncUICloseMenu();
}

function fncInitlistKeyboardMap()
{
	ds_list_add(listKeyboardMap, global.keyLeft);
	ds_list_add(listKeyboardMap, global.keyRight);
	ds_list_add(listKeyboardMap, global.keyUp);
	ds_list_add(listKeyboardMap, global.keyDown);
	ds_list_add(listKeyboardMap, global.keyJump);
	ds_list_add(listKeyboardMap, global.keyDash);
	ds_list_add(listKeyboardMap, global.keyAtk1);
	ds_list_add(listKeyboardMap, global.keyAtk2);
	ds_list_add(listKeyboardMap, global.keyMoveL);
	ds_list_add(listKeyboardMap, global.keyMoveR);
	ds_list_add(listKeyboardMap, global.keyChangeL);
	ds_list_add(listKeyboardMap, global.keyChangeR);
}

function fncInitCheckDuplicateKey(key, index)
{
	for (var i = 0; i < ds_list_size(listKeyboardMap); i++)
	{
		if (i == index)	
			continue;
		if (ds_list_find_value(listKeyboardMap, i) == key)
		{
			return true;
		}
	}
	
	return false;
}

fncInitlistKeyboardMap();