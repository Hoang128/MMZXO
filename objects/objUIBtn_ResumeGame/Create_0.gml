/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

UIText.text = "Resume";

function fncUIHandleSelect()
{
	with (menuParent)
	{
		activePauseButton = true;
		UIControl.goBack = true;
		fncUICloseMenu();
	}
}