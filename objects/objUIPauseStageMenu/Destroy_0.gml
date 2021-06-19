/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (activePauseButton)
{
	with (objUIBtn_PauseGame)
	{
		fncResetState();
	}
	
	instance_destroy(objUIPauseScreen);
}