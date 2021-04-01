/// @description Insert description here
// You can write your code in this editor

if (slowEffTime > 0)
	slowEffTime--;
else if (slowEffTime == 0)
{
	global.timeScale = 1;
	slowEffTime = -10;
}

//Deactivate unecessary objects
//Active object inside zone
if (activateCount > 0)
{
	activateCount--;
}
else
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
	
	instance_activate_object(objPlayerBasic);
	
	//Special Enemies
	#region

	
	#endregion
	
	instance_activate_region(ACTIVE_X, ACTIVE_Y, ACTIVE_X + ACTIVE_W, ACTIVE_Y + ACTIVE_H, true);
	
	activateCount = activateMaxCount;
}