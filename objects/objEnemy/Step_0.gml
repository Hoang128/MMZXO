/// @description Insert description here
// You can write your code in this editor

if (timeWait > 0)
{
	timeWait -= TIME_SCALE;
}
else
	timeWait = 0;

event_inherited();