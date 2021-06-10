/// @description Insert description here
// You can write your code in this editor

if (!other.isIllusion)
{
	if (canGetDamage)
	{
		if (inviTime == 0)
		{
			hp -= other.damage;
			if (instance_exists(objScoreMgr))
			{
				objScoreMgr.resultCaculator.damageGot += other.damage;
			}
	
			if (hp < 0) hp = 0;
	
			inviTime = inviAfterStunMax;
			with (weaponMeleeMgr)
			{
				fncDestroyMeleeWeapon();
			}
			with (playerStateMachine)
				fncStateChange(objPlayerStateStunNor);
		}
	}

	with (other)
	{
		if (bullet)
		{
			if (destroyWhenHit)
				instance_destroy();
		}
	}
}