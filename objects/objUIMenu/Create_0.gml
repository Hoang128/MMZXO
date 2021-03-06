/// @description Insert description here
// You can write your code in this editor

//Display UI props
event_inherited();

objUIManager.UICurrentInUse = self.id;
phase = 0;
menuCursor = 0;
closeTime = 0;
closeMenuOpenEffObj = noone;
closeMenuCloseEffObj = noone;

UIBackground = 
{
	actived   : true,
	sprite	  : sprUIBgrBasicGray,
	spriteW   : 1,
	spriteH   : 1,
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
	titleFont      : fontMenuM,
	childFont      : fontMenuS,
	titleVMargin   : 80,
	titleHMargin   : 60,
	childHMargin   : 90,
	childVMargin   : 64,
	childVSpace    : 64,
	shadow         : true,
	shadowDistance : 4
}

UIMenuLimit = 
{
	actived : false,
	maxRow : 5,
	firstRow : 0,
	iconCtrlSpacing : 16
}

UIControl =
{
	isEnable : true,
	fireRateMax : 10,
	firate : 0,
	goBack : false
}

UITransPos =
{
	isEnable          : false,
	UIDiffPosX        : 0,
	UIDiffPosY        : 0,
	UICurrentDiffPosX : 0,
	UICurrentDiffPosY : 0,
	UIMoveSpd         : 20
}

UIAnim =
{
	isEnable    : true,
	UIWidthMin  : 80,
	UIHeightMin : 80,
	animSpd     : 40,
	closeMenuOpenEff : noone,
	closeMenuCloseEff : noone
}

//Construct UI props & funcs
parentMenu = noone;
parentMenuObj = noone;
titleContext = "UI Menu (UI Menu Tiếng Việt)";

//Text menu
#region

childMenuNodeList = ds_list_create();

function fncInitUIChildMenuNode(context, childMenuType, childContextType, actived, visible)
{
	var childMenuNode =
	{
		contextVisible : visible,
		context : "Child Context",
		childMenuType : noone,
		childContextType : noone,
		childContext : noone,
		actived : true,
		selected : false
	};
	childMenuNode.context = context;
	childMenuNode.childMenuType = childMenuType;
	childMenuNode.childContextType = childContextType;
	childMenuNode.actived = actived;
	childMenuNode.selected = false;
	if (childMenuNode.childContextType != noone)
	{
		childMenuNode.childContext = instance_create_depth(x, y, depth - 1, childContextType);
		childMenuNode.childContext.parentMenu = self;
		childMenuNode.childContext.index = ds_list_size(childMenuNodeList);
		childMenuNode.childContext.UIContext.font = UIContext.childFont;
	}
	
	ds_list_add(childMenuNodeList, childMenuNode);
}

function fncUISelect()
{
	if (fncStaticHandleButton(KeyMap.UI_CONFIRM,KeyAction.PRESSED))
	{
		var selectUI = fncUIHandleSelect();
		if (selectUI)
			audio_play_sound(UISFX.enterSFX, global.emitterSFX.source, false);
	}
}

function fncUIExit()
{
	if (fncStaticHandleButton(KeyMap.UI_BACK,KeyAction.PRESSED))
	{
		var exitUI = fncUIHandleExit();
		if (exitUI)
			audio_play_sound(UISFX.exitSFX, global.emitterSFX.source, false);
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
			if (UIMenuLimit.actived)
				fncUIUpdateUIMenuDisplayCursorUp();
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
			if (UIMenuLimit.actived)
				fncUIUpdateUIMenuDisplayCursorDown();
		}
	}
}

function fncUIUpdateUIMenuDisplayCursorDown()
{
	if (UIMenuLimit.firstRow < menuCursor - UIMenuLimit.maxRow)
	{
		if (menuCursor <= UIMenuLimit.maxRow)
			UIMenuLimit.firstRow = 0;
		else
		{
			UIMenuLimit.firstRow = menuCursor - UIMenuLimit.maxRow;
		}
	}
	
	for (var i = 0; i < ds_list_size(childMenuNodeList); i++)
	{
		if ((i >= UIMenuLimit.firstRow) && (i <= (UIMenuLimit.firstRow + UIMenuLimit.maxRow)))
		{
			ds_list_find_value(childMenuNodeList, i).contextVisible = true;
			ds_list_find_value(childMenuNodeList, i).childContext.UIContext.isVisible = true;
		}
		else
		{
			ds_list_find_value(childMenuNodeList, i).contextVisible = false;
			ds_list_find_value(childMenuNodeList, i).childContext.UIContext.isVisible = false;
		}
	}
}

function fncUIUpdateUIMenuDisplayCursorUp()
{
	if (UIMenuLimit.firstRow > menuCursor)
	{
		if (menuCursor >= (ds_list_size(childMenuNodeList) - 1 - UIMenuLimit.maxRow))
			UIMenuLimit.firstRow = ds_list_size(childMenuNodeList) - 1 - UIMenuLimit.maxRow;
		else
		{
			UIMenuLimit.firstRow = menuCursor;
		}
	}
	
	for (var i = 0; i < ds_list_size(childMenuNodeList); i++)
	{
		if ((i >= UIMenuLimit.firstRow) && (i <= (UIMenuLimit.firstRow + UIMenuLimit.maxRow)))
		{
			ds_list_find_value(childMenuNodeList, i).contextVisible = true;
			ds_list_find_value(childMenuNodeList, i).childContext.UIContext.isVisible = true;
		}
		else
		{
			ds_list_find_value(childMenuNodeList, i).contextVisible = false;
			ds_list_find_value(childMenuNodeList, i).childContext.UIContext.isVisible = false;
		}
	}
}

function fncUIUpdateSelectedContext()
{
	if ((menuCursor >= 0) && (menuCursor <= ds_list_size(childMenuNodeList)))
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
}

#endregion

//Button menu
#region

childButtonList = ds_list_create();

function fncInitUIButton(buttonType, posX, posY)
{
	var button = instance_create_depth(posX, posY, depth - 1, buttonType);
	button.UIButton.enabled = false;
	button.menuParent = self;
	ds_list_add(childButtonList, button);
}

function fncEnableUIButtonList()
{
	for (var i = 0; i < ds_list_size(childButtonList); i++)
	{
		ds_list_find_value(childButtonList, i).UIButton.enabled = true;
	}
}

function fncDisableUIButtonList()
{
	for (var i = 0; i < ds_list_size(childButtonList); i++)
	{
		ds_list_find_value(childButtonList, i).UIButton.enabled = false;
	}
}

function fncDestroyUIButtonList()
{
	for (var i = 0; i < ds_list_size(childButtonList); i++)
	{
		instance_destroy(ds_list_find_value(childButtonList, i));
	}
}

function fncResetButtonsState()
{
	for (var i = 0; i < ds_list_size(childButtonList); i++)
	{
		with (ds_list_find_value(childButtonList, i))
		{
			fncResetState();
		}
	}
}

#endregion

function fncUIHandleExit()
{
	
}

function fncUIHandleSelect()
{
	
}

function fncUICloseMenu()
{
	if (ds_list_size(childMenuNodeList) > 0)
	{
		for (var i = 0; i < ds_list_size(childMenuNodeList); i++)
		{
			if (instance_exists(ds_list_find_value(childMenuNodeList, i).childContext))
				instance_destroy(ds_list_find_value(childMenuNodeList, i).childContext);
		}
	}
	
	phase = 3.5;
}

function fncUIOpenSubMenuAfter(time, effectClose, effectOpen, isDestroySelfMenu)
{
	var obj = instance_create_depth(UIBackground.xStart, UIBackground.yStart, depth, objUISubMenuCreater);
	obj.menu = ds_list_find_value(childMenuNodeList, menuCursor).childMenuType;
	obj.time = time;
	obj.effectClose = effectClose;
	obj.effectOpen = effectOpen;
	obj.menuParent = self;
	obj.menuParentObj = self.object_index;
	
	objUIManager.UICurrentInUse = noone;
	
	if (isDestroySelfMenu)
	{
		fncUICloseMenu();
	}
}

function fncDrawMenuDebugInfo()
{
	draw_set_font(fontDebug);
	
	switch(object_index)
	{
		case objUIKeyboardMenu:
		{
			draw_text(UIBackground.xStart, UIBackground.yStart + 32, "keyboard menu");
		}	break;
	}
	
	draw_text(UIBackground.xStart, UIBackground.yStart + 64, "start vector =  " + string(UIBackground.xStart) + ", " + string(UIBackground.yStart));
	draw_text(UIBackground.xStart, UIBackground.yStart + 96, "end vector =  " + string(UIBackground.xEnd) + ", " + string(UIBackground.yEnd));
}

function fncDrawUITitle(xPos, yPos, context)
{
	draw_set_font(UIContext.titleFont);
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
	if (childContext.contextVisible)
	{
		draw_set_font(UIContext.childFont);
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
}