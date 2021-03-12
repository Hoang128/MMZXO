/// @Handle

event_inherited();

if (chainNumber < chainMax)
{
	if (chainTime < chainTimeMax)
	{
		chainTime += TIME_SCALE;
	}
	else
	{
		var explosion = instance_create_depth(x - rangeMax + random(rangeMax * 2), y - rangeMax + random(rangeMax * 2), depth, objExplosion);
		explosion.makeSound = self.makeSound;
		chainTime = 0;
		chainNumber++;
	}
}
else	instance_destroy();