/// @description Insert description here
// You can write your code in this editor
if (other.canHitEnemy)
	{
		show_debug_message("damage timmer = " + string(damageTimmer));
	}

if (damageTimmer == -10)
{
	if (other.canHitEnemy)
	{
		var realDamage = other.damage;
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
			show_debug_message("from enemy: can hit enemy 1 = " + string(other.canHitEnemy));
			show_debug_message("from enemy: image index = " + string(other.image_index));
			show_debug_message("from enemy: image index mark = " + string(other.markImageIndex));
			other.canHitEnemy = 0;
			other.markImageIndex = other.image_index;
			show_debug_message("from enemy: can hit enemy 2 = " + string(other.canHitEnemy));
		}
	
		if (realDamage > 0)
		{
			hp -= realDamage;
		
			//Create Effect
			audio_play_sound_on(global.emitterSFX.source, other.collisionSFX, false, false);
		
			if (other.weaponType == PlayerWeaponType.BUSTER)
			{
				if (hp > 0)
				{
					with(other)
						instance_destroy();
				}
			}
		
			else if (other.weaponType == PlayerWeaponType.MELEE)
			{
				createCollisionEffectMelee(other);
			}
		
			//Blink effect
			if (blinkTime == 0)
				blinkTime = blinkTimeMax;
		}
	}
}