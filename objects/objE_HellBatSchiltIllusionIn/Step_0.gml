/// @description Insert description here
// You can write your code in this editor

if (inviTime > 0)
{
	inviTime -= TIME_SCALE;
}
else
{
	inviTime = inviMax;
}

if (distance > 0)
	distance -= TIME_SCALE;
else
	instance_destroy();