/// @description Insert description here
// You can write your code in this editor

if (damageTimmer > 0) damageTimmer -= TIME_SCALE;

if (blinkTime > 0)
{
	if (blink > 0) blink -= DELTA_TIME;
	else blink = blinkMax;
	blinkTime -= DELTA_TIME;
}
else
{
	blink = 0;
	blinkTime = 0;
}

// Inherit the parent event
event_inherited();

