/// @description Insert description here
// You can write your code in this editor

currentPlayer = noone;
currentCamera = noone;

function fncCreatePlayer(player)
{
	var objPlayer = instance_create_depth(global.playerStartPosition.x, global.playerStartPosition.y, depth, player);
	currentPlayer = objPlayer.id
}

function fncChangePlayer(newPlayer)
{
	if (instance_exists(currentPlayer.id))
	{
		instance_destroy(currentPlayer.id);
	}
	
	fncCreatePlayer(newPlayer);
}