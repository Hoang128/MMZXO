/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

UIText.text = "Retry";

function fncUIHandleSelect()
{
	with(objRoomManager)
		fncChangeRoomTo(room, true);
	objUIManager.UICurrentInUse = noone;
}