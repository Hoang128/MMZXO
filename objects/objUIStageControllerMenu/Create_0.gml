/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

objUIManager.UICurrentInUse = self;

function fncUIExit()
{
	if (fncStaticHandleButton(KeyMap.UI_BACK,KeyAction.PRESSED))
	{
		audio_play_sound(UISFX.exitSFX, global.emitterSFX.source, false);
		fncUIHandleExit();
	}
}

function fncUIHandleExit()
{
	instance_destroy();
	instance_create_depth(x, y, depth, objUIActionMenu);
}