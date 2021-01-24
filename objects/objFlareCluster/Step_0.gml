/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (waitTime > 1)
{
	if (flareCreated < flareNumber)
	{
		if (waitTime <= 0)
		{
			var pos = {x : 0, y: 0}
			pos.x = random_range(range/4, range);
			pos.y = random_range(range/4, range);
			var flare = instance_create_depth(x + pos.x, y + pos.y, depth, objFlare);
			flare.image_angle = random(360);
			waitTime = waitTimeMax;
		}
		else
		{
			waitTime -= TIME_SCALE;
		}
	}
	else	instance_destroy();
}
else
{
	for (var i = 0; i < flareNumber; i++)
	{
		var pos = {x : 0, y: 0}
		pos.x = random(range);
		pos.y = random(range);
		var flare = instance_create_depth(x + pos.x, y + pos.y, depth, objFlare);
		flare.image_angle = random(360);
	}
	
	instance_destroy();
}
