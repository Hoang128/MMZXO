/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

mpRevive = 2;

function fncDoEffect()
{
	with (objGlobalManager.currentPlayer)
	{
		if ((wp + other.mpRevive) <= wpMax)
			wp += other.mpRevive;
		else
			wp = wpMax;
	}
	instance_destroy();
}