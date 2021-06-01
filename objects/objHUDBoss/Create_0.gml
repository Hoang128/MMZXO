/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

avatar = sprMShotBoss;
avatarImg = 0;
avatarRatio = 0.5;
phase = 0;
moveSpd = 20;
boss = noone;
hp = 64;
maxHpBar = 32;
animateTimeMax = 2;
animateTime = animateTimeMax;

ratio = 4;

drawPointHide =
{
	x : VPORT_W - 384,
	y : VPORT_H + 128
}

drawPoint =
{
	x : drawPointHide.x,
	y : drawPointHide.y
}

drawPointFight =
{
	x : VPORT_W - 384,
	y : VPORT_H - 128
}
hpStartPoint =
{
	x : -31,
	y : 13
}
hpBarStartPoint =
{
	x : -31,
	y : 10
}

hpAtCore = 10;
hpBarUnitW = 6;