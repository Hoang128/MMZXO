/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hpRevive = 0;

function fncDoEffect()
{
	with (objGlobalManager.currentPlayer)
	{
		if ((hp + other.hpRevive) <= hpMax)
			hp += other.hpRevive;
		else
			hp = hpMax;
	}
	instance_destroy();
}