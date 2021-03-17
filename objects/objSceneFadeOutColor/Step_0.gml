/// @description Insert description here
// You can write your code in this editor

if (colorAlpha > 0)
	colorAlpha -= fadeSpd;
else
{
	isComplete = true;
	instance_destroy();
}