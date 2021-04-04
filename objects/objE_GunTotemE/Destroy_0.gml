/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

instance_destroy(topBlock);
instance_destroy(botBlock);

if (spark != noone)
{
	if (instance_exists(spark))
	{
		if (spark.state == 0)
			spark.state = 1;
	}
}