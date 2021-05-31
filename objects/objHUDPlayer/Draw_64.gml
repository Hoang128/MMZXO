/// @description Insert description here
// You can write your code in this editor
var bonusHp = global.itemsNumber.hpTank * global.upgradeItemEff.hpTank;
var bonusWp = global.itemsNumber.wpTank * global.upgradeItemEff.wpTank;

draw_sprite_ext(sprPlayerHUDCore, 0, drawPoint.x, drawPoint.y, ratio, ratio, 0, c_white, 1);

if (hpAtCore + bonusHp - 1 == 15)
{
	var barDrawPoint = 
	{
		x : drawPoint.x + (hpBarStartPoint.x + hpBarUnitW * 15) * ratio,
		y : drawPoint.y + hpBarStartPoint.y * ratio
	}
	
	draw_sprite_ext(sprPlayerHUDHPFrameEnd, 0, barDrawPoint.x, barDrawPoint.y, ratio, ratio, 0, c_white, 1);
}

for (var i = hpAtCore; i < (hpAtCore + bonusHp); i++)
{
	var barSprite = sprPlayerHUDHPFrame;
	if (i == (hpAtCore + bonusHp - 1))
	{
		barSprite = sprPlayerHUDHPFrameEnd;
	}
	
	var barDrawPoint = 
	{
		x : drawPoint.x + (hpBarStartPoint.x + hpBarUnitW * i) * ratio,
		y : drawPoint.y + hpBarStartPoint.y * ratio
	}
	
	draw_sprite_ext(barSprite, 0, barDrawPoint.x, barDrawPoint.y, ratio, ratio, 0, c_white, 1);
}

for (var i = 0; i < hp; i++)
{
	var hpDrawPoint = 
	{
		x : drawPoint.x + (hpStartPoint.x + hpBarUnitW * i) * ratio,
		y : drawPoint.y + hpStartPoint.y * ratio
	}
	
	draw_sprite_ext(sprPlayerHUDHP, 0, hpDrawPoint.x, hpDrawPoint.y, ratio, ratio, 0, c_white, 1);
}