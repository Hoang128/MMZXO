/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (hp <= 0)
{
	weaponTypeCauseDeath = other.weaponType;
	if (x != other.x)
		deathDir = sign(x - other.x);
}