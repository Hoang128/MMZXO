/// @description Insert description here
// You can write your code in this editor
if (damageTimmer > 0) 
{
	damageTimmer -= TIME_SCALE ;
	//show_debug_message("damage timmer = " + string(damageTimmer));
}
if ((damageTimmer <= 0) && (damageTimmer > -10)) damageTimmer = -10;

if (blinkTime > 0)
{
	if (blink > 0) blink -= TIME_SCALE;
	else blink = blinkMax;
	blinkTime -= TIME_SCALE;
}
else
{
	blink = 0;
	blinkTime = 0;
}

