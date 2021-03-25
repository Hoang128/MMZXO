/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
phase = 0;

objUIManager.UICurrentInUse = self;
index = 0;
context = "";

UIContext = 
{
	font : fontMenuS,
	titleVMargin   : 80,
	titleHMargin   : 60,
	childHMargin   : 90,
	childVMargin   : 64,
	childVSpace    : 64,
	shadow         : true,
	shadowDistance : 4
};

function fncUISetContextPosition(newX, newY)
{
	x = newX;
	y = newY;
}