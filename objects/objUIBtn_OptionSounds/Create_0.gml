/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

UIText.text = "Sounds";

function fncUIHandleSelect()
{
	fncStaticUIOpenSubMenuAfter(objUISoundMenu, 2, noone, noone, true);
}