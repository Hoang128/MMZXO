/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

UIButtonImg = sprUIButtonS_IconBack;

function fncUIHandleSelect()
{
	switch (room)
	{
		case roomStart:
			fncStaticUIOpenSubMenuAfter(objUIStartMenuButton, 2, noone, noone, true);
			break;
		case roomStageSelect:
			fncStaticUIOpenSubMenuAfter(objUIActionMenuButton, 2, noone, noone, true);
			break;
		default:
			fncStaticUIOpenSubMenuAfter(objUIPauseStageMenu, 2, noone, noone, true);
			break;
	}
	with (menuParent)
	{
		UIControl.goBack = true;
		fncUICloseMenu();
	}
}