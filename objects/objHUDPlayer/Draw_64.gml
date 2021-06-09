/// @description Insert description here
// You can write your code in this editor
var bonusHp = global.itemsNumber.hpTank * global.upgradeItemEff.hpTank;
var bonusWp = global.itemsNumber.wpTank * global.upgradeItemEff.wpTank;

draw_sprite_ext(sprPlayerHUDAvatar, avatarImg, drawPoint.x + ratio * 3, drawPoint.y + ratio * 3, avatarRatio * ratio, avatarRatio * ratio, 0, c_white, 1);

fncStaticPalSwapSet(HUDPal, HUDColor, false);
draw_sprite_ext(sprPlayerHUDCore, 0, drawPoint.x, drawPoint.y, ratio, ratio, 0, c_white, 1);
fncStaticPalSwapReset();

//Draw hp
for (var i = hpAtCore; i < (hpAtCore + 1 + bonusHp); i++)
{
	var barSprite = sprPlayerHUDHPFrame;
	if (i == (hpAtCore + bonusHp))
	{
		barSprite = sprPlayerHUDHPFrameEnd;
	}
	
	var barDrawPoint = 
	{
		x : drawPoint.x + (hpBarStartPoint.x + hpBarUnitW * i) * ratio,
		y : drawPoint.y + hpBarStartPoint.y * ratio
	}
	
	fncStaticPalSwapSet(HUDPal, HUDColor, false);
	draw_sprite_ext(barSprite, 0, barDrawPoint.x, barDrawPoint.y, ratio, ratio, 0, c_white, 1);
	fncStaticPalSwapReset();
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

//Draw mp
for (var i = wpAtCore; i < (wpAtCore + bonusWp + 1); i++)
{
	var frame = 0;
	var barSprite = sprPlayerHUDWPFrame;
	if (i == (wpAtCore + bonusWp))
	{
		barSprite = sprPlayerHUDWPFrameEnd;
		if (hpBarBotLim <= wpBarTopLim)
			frame = 1;
	}
	
	var barDrawPoint = 
	{
		x : drawPoint.x + (wpBarStartPoint.x + wpBarUnitW * i) * ratio,
		y : drawPoint.y + wpBarStartPoint.y * ratio
	}
	
	draw_sprite_ext(barSprite, frame, barDrawPoint.x, barDrawPoint.y, ratio, ratio, 0, c_white, 1);
}

for (var i = 0; i < wp; i++)
{
	var wpDrawPoint = 
	{
		x : drawPoint.x + (wpStartPoint.x + wpBarUnitW * i) * ratio,
		y : drawPoint.y + wpStartPoint.y * ratio
	}
	
	draw_sprite_ext(sprPlayerHUDWP, 0, wpDrawPoint.x, wpDrawPoint.y, ratio, ratio, 0, c_white, 1);
}

if (hpBarBotLim <= wpBarTopLim)
{
	var col = make_color_rgb(108, 119, 136);
	var drawLinePoint =
	{
		x1 : drawPoint.x + (hpBarStartPoint.x + hpBarBotLim) * ratio,
		y1 : drawPoint.y + (wpBarStartPoint.y - 1) * ratio,
		x2 : drawPoint.x + (hpBarStartPoint.x + wpBarTopLim) * ratio,
		y2 : drawPoint.y + (wpBarStartPoint.y) * ratio
	}
	draw_set_color(col);
	draw_rectangle(drawLinePoint.x1, drawLinePoint.y1, drawLinePoint.x2, drawLinePoint.y2, false);
	draw_set_color(c_white);
}