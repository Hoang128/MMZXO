/// @description Insert description here
// You can write your code in this editor

if (global.roomState == RoomState.STAGE)
{
	if (!instance_exists(objScoreMgr))
	{
		instance_create_depth(x, y, depth, objScoreMgr);
	}
	fncCreatePlayer(objPlayerZX);
	
	currentCamera = instance_create_depth(
		global.playerStartPosition.x, 
		global.playerStartPosition.y, 
		depth, 
		objGameView);
}