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
			if (objGlobalManager.currentPlayer.hp != realHp)
			{
				realHp = objGlobalManager.currentPlayer.hp;
			}
			
			if (objGlobalManager.currentPlayer.wp != realWp)
			{
				realWp = objGlobalManager.currentPlayer.wp;
			}
		}
		
		if (hp != realHp)
		{
			if (animateTimeHp > 0)
			{
				animateTimeHp--;
			}
			else
			{
				hp += sign(realHp - hp);
				animateTimeHp = animateTimeMax;
			}
		}
		
		if (wp != realWp)
		{
			if (animateTimeWp > 0)
			{
				animateTimeWp--;
			}
			else
			{
				wp += sign(realWp - wp);
				animateTimeWp = animateTimeMax;
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