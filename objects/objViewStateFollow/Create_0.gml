/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

function fncStateRun()
{
	with(core.id)
	{
		targetObject = objGlobalManager.currentPlayer;
		
		x = targetObject.x;
		y = targetObject.y;
	}
}