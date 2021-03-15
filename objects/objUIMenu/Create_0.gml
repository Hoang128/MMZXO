/// @description Insert description here
// You can write your code in this editor

//Display UI props
event_inherited();

phase = 0;
menuCursor = 0;

UIBackground = 
{
	actived   : true,
	backColor : c_black,
	alpha     : 0.7,
	xStart    : 40,
	yStart    : 60,
	xEnd	  : 0,
	yEnd      : 0,
	UIWidth   : 400,
	UIHeight  : 600
}

UIContext = 
{
	titleFont      : fontMenuTitle,
	childFont      : fontMenuContext,
	titleVMargin   : 80,
	titleHMargin   : 60,
	childHMargin   : 90,
	childVSpace    : 64,
	shadow         : true,
	shadowDistance : 2
}

UISFX =
{
	enterSFX  : sfxUIEnter,
	exitSFX   : sfxUIBack,
	deniedSFX : sfxUIDenied
}

UIAnim =
{
	UIWidthMin  : 80,
	UIHeightMin : 80,
	animSpd   : 40
}

//Construct UI props & funcs
parentMenu = noone;
titleContext = "UI Menu (UI Menu Tiếng Việt)";

childMenuNodeList = ds_list_create();

function fncInitUIChildMenuNode(context, childMenuType, childContextType, actived)
{
	var childMenuNode =
	{
		context : "Child Context",
		childMenu : noone,
		actived : true,
		selected : false
	};
	childMenuNode.context = context;
	childMenuNode.childMenuType = childMenuType;
	childMenuNode.childContextType = childContextType;
	childMenuNode.childMenu = noone;
	childMenuNode.childContext = noone;
	childMenuNode.actived = actived;
	childMenuNode.selected = false;
	
	ds_list_add(childMenuNodeList, childMenuNode);
}

//Debug init child menu's props
fncInitUIChildMenuNode("context 1", noone, noone, true);
fncInitUIChildMenuNode("context 2", noone, noone, false);
fncInitUIChildMenuNode("context 3", noone, noone, true);
fncInitUIChildMenuNode("context 4", noone, noone, true);