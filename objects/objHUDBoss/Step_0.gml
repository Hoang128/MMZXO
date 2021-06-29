/// @description Insert description here
// You can write your code in this editor
switch (phase)
{
	case 0:
	{
		switch (boss.object_index)
		{
			case objE_HellBatSchilt:
				avatarImg = 1;
				break;
			case objE_ChildreInarabitta:
				avatarImg = 2;
				break;
			default:
				avatarImg = 0;
		}
		if (abs(drawPoint.y - drawPointFight.y) > moveSpd)
		{
			drawPoint.y += sign(drawPointFight.y - drawPoint.y) * moveSpd;
		}
		else
		{
			drawPoint.y = drawPointFight.y;
			phase = 1;
		}
	}	break;
	
	case 1:
	{
		if (instance_exists(boss))
		{
			if (ceil(boss.hp) != hp)
			{
				if (animateTime > 0)
				{
					animateTime--;
				}
				else
				{
					hp += sign(ceil(boss.hp) - hp);
					animateTime = animateTimeMax;
				}
			}
		}
	}	break;
	
	case 2:
	{
		if (abs(drawPoint.y - drawPointHide.y) > moveSpd)
		{
			drawPoint.y += sign(drawPointHide.y - drawPoint.y) * moveSpd;
		}
		else
		{
			instance_destroy();
		}
	}	break;
}