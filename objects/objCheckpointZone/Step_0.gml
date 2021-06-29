/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (instance_exists(objGlobalManager.currentPlayer))
{
	if ((global.playerStartPosition.x != self.x) && (global.playerStartPosition.y != self.y))
	{
		if (place_meeting(x, y, objGlobalManager.currentPlayer))
		{
			global.playerStartPosition.x = self.x;
			global.playerStartPosition.y = self.y;
		}
	}
}