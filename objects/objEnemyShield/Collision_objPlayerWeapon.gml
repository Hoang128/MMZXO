/// @description Insert description here
// You can write your code in this editor
if (other.weaponType = PlayerWeaponType.MELEE)
{
	with (objGlobalManager)
	{
		fncSetTimeScale(0.5, 5);
	}
}
	
if (other.weaponType = PlayerWeaponType.BUSTER)
{
	with (other)
	{
		colWithGuard = true;
	}
}