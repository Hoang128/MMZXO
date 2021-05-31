/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

phase = 0;
moveSpd = 20;
hp = objGlobalManager.currentPlayer.hp;
maxHpBar = 32;
animateTimeMax = 2;
animateTime = animateTimeMax;

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

hpAtCore = 16;
hpBarUnitW = 6;