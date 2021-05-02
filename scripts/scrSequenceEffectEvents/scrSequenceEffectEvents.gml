// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


//Boss explosion
#region
function fncCreateBossRayLight_0()
{
	var ray1 = instance_create_depth(objBossManager.x, objBossManager.y, -100, objBossRayLight);
	ray1.image_index = 0;
	
	var ray2 = instance_create_depth(objBossManager.x, objBossManager.y, -100, objBossRayLight);
	ray2.image_index = 0;
	ray2.image_xscale = -1;
	ray2.image_yscale = -1;
}

function fncCreateBossRayLight_1()
{
	var ray1 = instance_create_depth(objBossManager.x, objBossManager.y, -100, objBossRayLight);
	ray1.image_index = 1;
	
	var ray2 = instance_create_depth(objBossManager.x, objBossManager.y, -100, objBossRayLight);
	ray2.image_index = 1;
	ray2.image_xscale = -1;
	ray2.image_yscale = -1;
}

function fncCreateBossRayLight_2()
{
	var ray1 = instance_create_depth(objBossManager.x, objBossManager.y, -100, objBossRayLight);
	ray1.image_index = 2;
	
	var ray2 = instance_create_depth(objBossManager.x, objBossManager.y, -100, objBossRayLight);
	ray2.image_index = 2;
	ray2.image_xscale = -1;
	ray2.image_yscale = -1;
}

function fncDestroyBossRayLight()
{
	if (instance_exists(objBossRayLight))
	{
		instance_destroy(objBossRayLight);
	}
}

function fncCreateBossExplosionCreater()
{
	instance_create_depth(objBossManager.x, objBossManager.y, -100, objBossExplosionCreater);
}

function fncDestroyBossExplosionCreater()
{
	if (instance_exists(objBossExplosionCreater))
		instance_destroy(objBossExplosionCreater);
}


#endregion

//Common
#region
function fncStaticCreateFadeFromNorToWhiteScene()
{
	var objFadeScene = instance_create_depth(VIEW_X, VIEW_Y, -1000, objSceneFadeInColor);
	objFadeScene.colorVal = c_white;
}

function fncStaticCreateFadeFromWhiteToNorScene()
{
	var objFadeScene = instance_create_depth(VIEW_X, VIEW_Y, -1000, objSceneFadeOutColor);
	objFadeScene.colorVal = c_white;
}

function fncStaticCreateFadeFromNorToBlackScene()
{
	instance_create_depth(VIEW_X, VIEW_Y, -1000, objSceneFadeInColor);
}

function fncStaticCreateFadeFromBlackToNorScene()
{
	instance_create_depth(VIEW_X, VIEW_Y, -1000, objSceneFadeOutColor);
}

function fncStaticDestroyFadeInScene()
{
	if (instance_exists(objSceneFadeInColor))
	{
		with(objSceneFadeInColor)
		{
			if (isComplete)
			{
				instance_destroy();
			}
		}
	}
}

function fncStaticPlayerTeleUp()
{
	with (objGlobalManager.currentPlayer.playerStateMachine)
	{
		fncStateChange(objPlayerStateTeleUp);
	}
}

function fncStaticGoToScoreRoom()
{
	with (objRoomManager)
		fncChangeRoomTo(roomScore);
}

#endregion