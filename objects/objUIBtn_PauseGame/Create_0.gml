/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

x = VPORT_W - 64;
y = 64;

UIButtonImg = sprUIButtonS_IconPause;

function fncUIHandleSelect()
{
	fncStaticUIOpenSubMenuAfter(objUIPauseStageMenu, 0.5, noone, noone, false);
}