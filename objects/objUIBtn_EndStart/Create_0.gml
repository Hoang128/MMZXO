/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

UIText.text = "Title";

function fncUIHandleSelect()
{
	with(objRoomManager)
		fncChangeRoomTo(roomStart, true);
	objUIManager.UICurrentInUse = noone;
}