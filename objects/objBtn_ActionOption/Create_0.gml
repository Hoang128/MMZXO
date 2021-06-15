/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

UIText.text = "Option";

function fncUIHandleSelect()
{
	fncStaticUIOpenSubMenuAfter(objUIOptionMenuButton, 2, noone, noone, true);
}