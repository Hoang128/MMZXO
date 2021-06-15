/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

UIText.text = "Stage Select";

function fncUIHandleSelect()
{
	instance_create_depth(x, y, depth, objUIStageControllerMenu);
	with (menuParent)
	{
		fncUIHandleExit();
	}
}