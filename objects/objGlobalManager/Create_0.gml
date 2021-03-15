/// @description Insert description here
// You can write your code in this editor

global.debug = true;
currentPlayer = noone;
currentCamera = noone;
slowEffTime = -10;

function fncSetTimeScale(newTimeScale, time)
{
	if (time == 0)
	{
		slowEffTime = -10;
	}
	else
	{
		slowEffTime = time;
	}
	
	global.timeScale = newTimeScale;	
}

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

if (!instance_exists(objRoomManager))
	instance_create_depth(x, y, depth, objRoomManager);
	
if (!instance_exists(objInputManager))
	instance_create_depth(x, y, depth, objInputManager);
	
if (!instance_exists(objUIManager))
	instance_create_depth(x, y, depth, objUIManager);

//Deactivate object variables
activateCount = 0;
activateMaxCount = 3;