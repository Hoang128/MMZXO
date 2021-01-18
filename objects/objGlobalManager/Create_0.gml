/// @description Insert description here
// You can write your code in this editor

global.debug = true;
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

if (global.debug == true)
{
	if (!instance_exists(objDebug))
	{
		instance_create_depth(x, y, depth, objDebug);
	}
}