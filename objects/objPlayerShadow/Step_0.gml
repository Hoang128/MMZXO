/// @description Insert description here
// You can write your code in this editor

if (image_alpha > 0)
{
	image_alpha -= fadeSpd * TIME_SCALE;
}
else
	instance_destroy();