/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp = 5;
damage = 1;

guardDir = 0;
guard = 0;

damageTimmer = -1;

blink = 0;
blinkMax = 8;
blinkTime = 0;
blinkTimeMax = 4;
armor =
{
	neutralArmor : 0,
	fireArmor : 0,
	iceArmor : 0,
	electArmor : 0,
	darkArmor : 0
}
createDestroyEff = false;
destroyEff = objExplosion;