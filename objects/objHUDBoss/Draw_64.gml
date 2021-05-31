/// @description Insert description here
// You can write your code in this editor

draw_sprite_ext(sprBossHUDCore, 0, drawPoint.x, drawPoint.y, ratio, ratio, 0, c_white, 1);
for (var i = hpAtCore; i < 32; i++)
{
	var barSprite = sprBossHUDBar;
	if (i == 31)
	{
		barSprite = sprBossHUDBarEnd;
	}
	
	var barDrawPoint = 
	{
		x : drawPoint.x + (hpBarStartPoint.x - hpBarUnitW * i) * ratio,
		y : drawPoint.y + hpBarStartPoint.y * ratio
	}
	
	draw_sprite_ext(barSprite, 0, barDrawPoint.x, barDrawPoint.y, ratio, ratio, 0, c_white, 1);
}

for (var i = 0; i < hp; i++)
{
	var hpDrawPoint = 
	{
		x : drawPoint.x + (hpStartPoint.x - hpBarUnitW * (i % maxHpBar)) * ratio,
		y : drawPoint.y + hpStartPoint.y * ratio
	}
	
	var hpPointLayer = floor(i / maxHpBar);
	
	draw_sprite_ext(sprBossHUDHpPoint, hpPointLayer, hpDrawPoint.x, hpDrawPoint.y, ratio, ratio, 0, c_white, 1);
}