/// @description Insert description here
// You can write your code in this editor

if (!other.isIllusion)
{
	if (inviTime == 0)
	{
		hp -= other.damage;
	
		if (hp < 0) hp = 0;
	
		inviTime = inviAfterStunMax;
		with (playerStateMachine)
			fncStateChange(objPlayerStateStunNor);
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