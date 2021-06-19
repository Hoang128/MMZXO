/// @description Insert description here
// You can write your code in this editor

if (global.roomState == RoomState.STAGE)
{
	if (!instance_exists(objScoreMgr))
	{
		instance_create_depth(x, y, depth, objScoreMgr);
	}
	if (charToStart!=noone)
	{
		fncCreatePlayer(charToStart);
		instance_create_depth(x, y, depth, objHUDPlayer);
		instance_create_depth(x, y, depth, objUIBtn_PauseGame);
	}
	
	currentCamera = instance_create_depth(
		global.playerStartPosition.x, 
		global.playerStartPosition.y, 
		depth, 
		objGameView);
}
else
{
	
	if (instance_exists(objScoreMgr))
	{
		instance_destroy(objScoreMgr);
	}
}