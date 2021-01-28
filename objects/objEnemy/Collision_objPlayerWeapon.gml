/// @description Insert description here
// You can write your code in this editor
var realDamage = other.damage;
if (damageTimmer == -1) 
	damageTimmer = 0;
if (damageTimmer <= 0)
{
	damageTimmer = other.maxTimmer;

	switch (other.element)
	{
		case Element.DARK:		realDamage -= armor.darkArmor;		break;
		case Element.FIRE:		realDamage -= armor.fireArmor;		break;
		case Element.ICE:		realDamage -= armor.iceArmor;		break;
		case Element.ELECT:		realDamage -= armor.electArmor;		break;
	}
	show_debug_message("other damage = " + string(other.damage));
	show_debug_message("armor = " + string(armor.neutralArmor));
	realDamage -= armor.neutralArmor;
	show_debug_message("damage = " + string(realDamage));
	if (realDamage < 0)	realDamage = 0;
	if (other.isGuardBreaker == false)
	{
		if (guard == 0.5)
		{
			switch (guardDir)
			{
				case 0:	
				{
					if ((other.x - (bbox_right + bbox_left) / 2) > 0)
						realDamage = 0;
				}	break;
				case 180:
				{
					if ((other.x - (bbox_right + bbox_left) / 2) < 0)
						realDamage = 0;
				}	break;
			}
		}
		if (guard == 1)
		{
			realDamage = 0;
		}
	}
	
	if (guard == 2)
		realDamage = 0;
	
	if (other.weaponType == PlayerWeaponType.MELEE)
	{
		other.hit++;
	}
	
	if (realDamage > 0)
	{
		hp -= realDamage;
		
		//Create Effect
		
		if (other.weaponType == PlayerWeaponType.BUSTER)
		{
			if (hp > 0)
			{
				with(other)
					instance_destroy();
			}
		}
		
		//Blink effect
		if (blinkTime == 0)
			blinkTime = blinkTimeMax;
	}
}