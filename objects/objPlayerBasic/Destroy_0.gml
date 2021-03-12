/// @description Insert description here
// You can write your code in this editor

if (weaponMeleeMgr != noone)
{
	if (instance_exists(weaponMeleeMgr))
	{
		instance_destroy(weaponMeleeMgr);
	}
}

with (objGameView)
{
	targetObject = self;
}

if (instance_exists(playerStateMachine))
{
	instance_destroy(playerStateMachine)
}