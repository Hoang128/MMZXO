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

if (existTime > 0)
{
	y += moveSpd * TIME_SCALE;
	existTime -= TIME_SCALE;
}
else
	instance_destroy();