/// @description Insert description here
// You can write your code in this editor
if (sprite_index == sprTrooperShoot)
{
	if (shotTime > shotNumber)
	{
		shotTime = 0;
		state = gunTrooperState.STAND;
		sprite_index = sprTrooperIdle;
		waitToShot = waitToShotMax;
	}
	else
	{
		canShot = 1;
	}
}