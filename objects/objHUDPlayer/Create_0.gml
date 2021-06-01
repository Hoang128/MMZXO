/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

phase = 0;
moveSpd = 20;
hp = objGlobalManager.currentPlayer.hp;
wp = objGlobalManager.currentPlayer.wp;
animateTimeMax = 2;
animateTimeHp = animateTimeMax;
animateTimeWp = animateTimeMax;

ratio = 4;

drawPointHide =
{
	x : 32,
	y : -32
}

drawPoint =
{
	x : drawPointHide.x,
	y : drawPointHide.y
}

drawPointFight =
{
	x : 32,
	y : 32
}
hpStartPoint =
{
	x : 31,
	y : 15
}
hpBarStartPoint =
{
	x : 31,
	y : 14
}

wpStartPoint =
{
	x : 31,
	y : 20
}

wpBarStartPoint =
{
	x : 31,
	y : 19
}

hpAtCore = 15;
wpAtCore = 15;
hpBarUnitW = 6;
wpBarUnitW = 5;

hpBarBotLim = hpBarUnitW * (hp) + 1;
wpBarTopLim = wpBarUnitW * (wp) + 4 + 1;