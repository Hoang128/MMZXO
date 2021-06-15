/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

UIText.text = "Start Game";

function fncUIHandleSelect()
{
	with(objRoomManager)
		fncChangeRoomTo(roomStageSelect, true);
	objUIManager.UICurrentInUse = noone;
}