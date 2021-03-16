/// @description Insert description here
// You can write your code in this editor

//Display UI props
event_inherited();

objUIManager.UICurrentInUse = self;
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
	shadowDistance : 4
}

UISFX =
{
	enterSFX  : sfxUIEnter,
	exitSFX   : sfxUIBack,
	deniedSFX : sfxUIDenied
}

UIAnim =
{
	isEnable    : true,
	UIWidthMin  : 80,
	UIHeightMin : 80,
	animSpd     : 40
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

function fncUISelect()
{
	if (fncStaticHandleButton(KeyMap.UI_CONFIRM,KeyAction.PRESSED))
	{
		audio_play_sound(UISFX.enterSFX, global.emitterSFX.source, false);
		fncUIHandleSelect();
	}
}

function fncUIExit()
{
	if (fncStaticHandleButton(KeyMap.UI_BACK,KeyAction.PRESSED))
	{
		audio_play_sound(UISFX.exitSFX, global.emitterSFX.source, false);
		fncUIHandleExit();
	}
}

function fncUIMoveUp()
{
	if (fncStaticHandleButton(KeyMap.UI_UP,KeyAction.PRESSED))
	{
		if (menuCursor > 0)
		{
			var tempCursor = menuCursor - 1;
			while(!ds_list_find_value(childMenuNodeList, tempCursor).actived)
			{
				tempCursor--;
				if (tempCursor < 0)
					break;
			}
			if (tempCursor >= 0)
				menuCursor = tempCursor;
			fncUIUpdateSelectedContext();
		}
	}
}

function fncUIMoveDown()
{
	if (fncStaticHandleButton(KeyMap.UI_DOWN,KeyAction.PRESSED))
	{
		if (menuCursor < ds_list_size(childMenuNodeList) - 1)
		{
			var tempCursor = menuCursor + 1;
			while(!ds_list_find_value(childMenuNodeList, tempCursor).actived)
			{
				tempCursor++;
				if (tempCursor >= ds_list_size(childMenuNodeList))
					break;
			}
			if (tempCursor < ds_list_size(childMenuNodeList))
				menuCursor = tempCursor;
			fncUIUpdateSelectedContext();
		}
	}
}

function fncUIUpdateSelectedContext()
{
	if (ds_list_size(childMenuNodeList) > 0)
	{
		for (var i = 0; i < ds_list_size(childMenuNodeList); i++)
		{
			if (ds_list_find_value(childMenuNodeList, i).selected)
				ds_list_find_value(childMenuNodeList, i).selected = false;
		}
	
		ds_list_find_value(childMenuNodeList, menuCursor).selected = true;
	}	else	menuCursor = -1;
}

function fncUIHandleExit()
{
	
}

function fncUIHandleSelect()
{
	
}

//Debug init child menu's props