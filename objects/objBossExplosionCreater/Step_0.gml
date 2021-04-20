/// @description Insert description here
// You can write your code in this editor
if (waitTime > 0)
{
	waitTime -= TIME_SCALE;
}
else
{
	var angle = irandom(other.minAngleSpace) * (360 / other.minAngleSpace);
	var insExplosion = instance_create_depth(x + lengthdir_x(radius, angle), y + lengthdir_y(radius, angle), -120, objExplosionBoss);
	insExplosion.haveSound = false;
	with (insExplosion)
	{
		motion_set(angle, moveSpd * TIME_SCALE);
	}
	waitTime = waitTimeMax;
}