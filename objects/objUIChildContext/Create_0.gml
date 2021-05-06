/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
phase = 0;
parentMenu = noone;

index = 0;
context = "";

UIContext = 
{
	isVisible      : true,
	font           : fontMenuS,
	shadow         : true,
	shadowDistance : 4,
	hAlignSpace    : 0
};

UIController =
{
	isEnabled : true,
	isHSpinner : true
};

function fncUISetContextVisible(isVisible)
{
	if (isVisible)
	{
		UIContext.isVisible = true;
	}
	else
	{
		UIContext.isVisible = false;
	}
}

function fncUISetContextPosition(newX, newY)
{
	if (UIContext.hAlignSpace == 0)
	{
		x = newX;
	}
	else
	{
		x = UIContext.hAlignSpace;
	}
	y = newY;
}