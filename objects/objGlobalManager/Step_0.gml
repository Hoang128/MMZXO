/// @description Insert description here
// You can write your code in this editor

if (slowEffTime > 0)
	slowEffTime--;
else if (slowEffTime == 0)
{
	global.timeScale = 1;
	slowEffTime = -10;
}