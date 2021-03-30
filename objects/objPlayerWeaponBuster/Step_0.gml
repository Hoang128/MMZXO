/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

//if (phase == 2)
	hspd = flySpeed * image_xscale;
	
if (colWithGuard)
{
	if (destroyEff != destroyEffShield)
		destroyEff = destroyEffShield;
	instance_destroy();
}
	
if (destroyOutScreen)
{
	if (!fncIsInActiveZone())
	{
		createDestroyEff = false;
		instance_destroy();
	}
}
	
event_inherited();

if (!throughtWall)
{
	if (place_meeting(x, y, objBlock))
		instance_destroy();
}