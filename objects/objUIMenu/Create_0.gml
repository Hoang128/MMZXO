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
	enterSFX : noone,
	exitSFX  : noone,
	moveSFX  : noone
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

function fncInitUIChildMenuNode(context, childMenu, actived)
{
	var childMenuNode =
	{
		context : "Child Context",
		childMenu : noone,
		actived : true,
		selected : false
	};
	childMenuNode.context = context;
	childMenuNode.childMenu = childMenu;
	childMenuNode.actived = actived;
	childMenuNode.selected = false;
	
	ds_list_add(childMenuNodeList, childMenuNode);
}

function fncDrawUITitle(xPos, yPos, context)
{
	draw_set_font(fontMenuTitle);
	if (UIContext.shadow)
	{
		draw_set_color(c_black);
		draw_text(xPos + UIContext.shadowDistance, yPos + UIContext.shadowDistance, context);
	}
	
	draw_set_color(c_white);
	draw_text(xPos, yPos, context);
	draw_set_color(c_white);
}

function fncDrawUIChildContext(xPos, yPos, childContext)
{
	draw_set_font(fontMenuContext);
	if (UIContext.shadow)
	{
		draw_set_color(c_black);
		draw_text(xPos + UIContext.shadowDistance, yPos + UIContext.shadowDistance, childContext.context);
	}
	
	if (childContext.actived)
	{
		if (childContext.selected)
			draw_set_color(c_yellow);
		else
			draw_set_color(c_white);
	}	else	draw_set_color(c_gray);
	draw_text(xPos, yPos, childContext.context);
	draw_set_color(c_white);
}

//Debug init child menu's props

fncInitUIChildMenuNode("context 1", noone, true);
fncInitUIChildMenuNode("context 2", noone, false);
fncInitUIChildMenuNode("context 3", noone, true);
fncInitUIChildMenuNode("context 4", noone, true);