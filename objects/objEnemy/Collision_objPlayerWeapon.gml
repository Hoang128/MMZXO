/// @description Insert description here
// You can write your code in this editor

if (damageTimmer == -10)
{
	var isIgnored = false;
	with (other)
	{
		isIgnored = fncIsEnemyIgnored(other.id);
	}
	
	if (!isIgnored)
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
			
			if (realDamage == 0)
			{
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
			}
		}
	
		if (guard == 2)
		{
			realDamage = 0;
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
		}
	
		if (other.weaponType == PlayerWeaponType.MELEE)
		{
			other.hit++;
			ds_list_add(other.enemyIgnoreList, self.id);
			other.markImageIndex = other.image_index;
		}
		
		fncOnGetDamage(realDamage);
	
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
				with (objGlobalManager)
				{
					fncSetTimeScale(0.5, 5);
				}
			}
		
			//Blink effect
			if (blinkTime == 0)
				blinkTime = blinkTimeMax;
		}
	}
}