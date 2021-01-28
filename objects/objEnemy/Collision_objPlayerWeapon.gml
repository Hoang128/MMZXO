/// @description Insert description here
// You can write your code in this editor
var realDamage = 0;

if (damageTimmer == -1) 
	damageTimmer = 0;
if (damageTimmer <= 0)
{
	damageTimmer = other.maxTimmer;

	switch (other.element)
	{
		case Element.DARK:		realDamage = other.damage - armor.darkArmor;		break;
		case Element.FIRE:		realDamage = other.damage - armor.fireArmor;		break;
		case Element.ICE:		realDamage = other.damage - armor.iceArmor;			break;
		case Element.ELECT:		realDamage = other.damage - armor.electArmor;		break;
	}
	realDamage -= armor.neutralArmor;
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
		
		//Blink effect
		if (blinkTime == 0)
			blinkTime = blinkTimeMax;
	}
}