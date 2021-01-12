/// @description Insert description here
// You can write your code in this editor

if (global.roomState == RoomState.STAGE)
{
	fncCreatePlayer(objPlayerBasic);
	
	currentCamera = instance_create_depth(
		global.playerStartPosition.x, 
		global.playerStartPosition.y, 
		depth, 
		objGameView);
}