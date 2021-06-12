/// @description Insert description here
// You can write your code in this editor

global.debug = true;
currentPlayer = noone;
currentCamera = noone;
charToStart = noone;
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
	currentPlayer = objPlayer.id;
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

if (!instance_exists(objSaveDataManager))
	instance_create_depth(x, y, depth, objSaveDataManager);

if (!instance_exists(objRoomManager))
	instance_create_depth(x, y, depth, objRoomManager);
	
if (!instance_exists(objInputManager))
	instance_create_depth(x, y, depth, objInputManager);
	
if (!instance_exists(objUIManager))
	instance_create_depth(x, y, depth, objUIManager);
	
if (!instance_exists(objBGMManager))
	instance_create_depth(x, y, depth, objBGMManager);

//Deactivate object variables
activateCount = 0;
activateMaxCount = 3;

fncStaticInitGame();

function fncDeactiveOutsideCamRegion()
{
	instance_deactivate_all(true);
	instance_activate_object(objParallaxBackground);
	instance_activate_object(objGameManager);
	instance_activate_object(objBlock);
	instance_activate_object(objBlockThin);
	instance_activate_object(objEnemySpawmer);
	instance_activate_object(objPlayerShadowCreater);
	instance_activate_object(objState);
	instance_activate_object(objStateMachine);
	instance_activate_object(objUI);
	instance_activate_object(objEffUI);
	instance_activate_object(objStageZone);
	instance_activate_object(objGate);
	instance_activate_object(objEnemyBoss);
	
	instance_activate_object(objPlayerBasic);
	
	//Special Enemies
	#region

	
	#endregion
	
	instance_activate_region(ACTIVE_X, ACTIVE_Y, ACTIVE_X + ACTIVE_W, ACTIVE_Y + ACTIVE_H, true);
}