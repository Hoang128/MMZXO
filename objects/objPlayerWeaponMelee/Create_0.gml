/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hit = 0;

core = noone;
inited = false;
spriteWeapon = noone;
sfx = noone;

image_speed = 0;
imgSpd = 0;
destroyWhenChangeState = false;
playerStateChanged = false;

function fncChangeImgSpd()
{
	imgSpd = 1;
}

function fncSetupResources()
{
}