/// @description Insert description here
// You can write your code in this editor
switch (phase)
{
	case 0:
	{
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
			if (boss.hp != hp)
			{
				if (animateTime > 0)
				{
					animateTime--;
				}
				else
				{
					hp += sign(boss.hp - hp);
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