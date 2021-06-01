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
		if (instance_exists(objGlobalManager.currentPlayer))
		{
			if (objGlobalManager.currentPlayer.hp != hp)
			{
				if (animateTimeHp > 0)
				{
					animateTimeHp--;
				}
				else
				{
					hp += sign(objGlobalManager.currentPlayer.hp - hp);
					animateTimeHp = animateTimeMax;
				}
			}
			
			if (objGlobalManager.currentPlayer.wp != wp)
			{
				if (animateTimeWp > 0)
				{
					animateTimeWp--;
				}
				else
				{
					wp += sign(objGlobalManager.currentPlayer.wp - wp);
					animateTimeWp = animateTimeMax;
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