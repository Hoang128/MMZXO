/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

function fncCreateItem(objItem)
{
	if (objItem == noone)	
		return;
	else
	{
		var insItem = instance_create_depth(x, y, depth, objItem);
		insItem.vspd = -2;
	}
}

item = noone;
rateNo  = 8;
rateHpM = 2;
rateHpS = 2;
rateWpM = 2;
rateWpS = 2;

if (instance_exists(objGlobalManager.currentPlayer))
{
	if (objGlobalManager.currentPlayer.hp < objGlobalManager.currentPlayer.hpMax/2)
	{
		rateHpM *= 2;
		rateHpS *= 2;
	}
	
	if (objGlobalManager.currentPlayer.wp < objGlobalManager.currentPlayer.wpMax/2)
	{
		rateWpM *= 2;
		rateWpS *= 2;
	}
}

rateItem = rateHpM + rateHpS + rateWpM + rateWpS;

totalRate = rateNo + rateItem;

randomize();
if (random(totalRate) <= rateItem)
{
	var randomItem = random(rateItem);
	if (randomItem <= (rateHpM + rateHpS))
	{
		if (random(rateHpM + rateHpS) <= rateHpM)
		{
			item = objHpEnergyM;
		}
		else
		{
			item = objHpEnergyS;
		}
	}
	else
	{
		if (random(rateWpM + rateWpS) <= rateWpM)
		{
			item = objMpEnergyM;
		}
		else
		{
			item = objMpEnergyS;
		}
	}
}

fncCreateItem(item);