/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if (inviTime == 0)
{
	event_inherited();
}
else	
{
	damageGot = 0;
}

show_debug_message("damage got = " + string(damageGot));

if (damageGot > 0)
{
	if (damageGot < damageRecordLimitSingle)
		damageRecord += damageGot;
	else
		damageRecord = damageRecordLimit;
}

if (damageRecord >= damageRecordLimit)
{
	inviTime = inviTimeMax;
	blinkTime = inviTimeMax;
	damageRecord = 0;
}