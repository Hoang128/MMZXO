/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

image_xscale = 4;
image_yscale = 4;
menuParent = noone;

state = 0;

UIButtonSpr =
{
	sprNormal		: sprUIButtonN_Normal,
	sprConfirm		: sprUIButtonN_Confirm,
	sprConfirmDone	: sprUIButtonN_ConfirmDone,
	sprSelected		: sprUIButtonN_Selected,
	sprSelectAnim	: sprUIButtonN_SelectAnim,
	sprUnselected	: sprUIButtonN_Unselected,
	sprResetAnim	: sprUIButtonN_ResetAnim,
	
	imgSpd		  : 0.5,
}

sprite_index = UIButtonSpr.sprUnselected;

UIButton =
{
	enabled              : true,
	waitTimeAfterConfirm : 60
}

UIText =
{
	text : "New Game",
	pos :
	{
		x : 0,
		y : 80
	},
	font		   : fontMenuS,
	color		   : c_white,
	shadow         : true,
	shadowDistance : 4
}

function fncStaticUIOpenSubMenuAfter(subMenu, time, effectClose, effectOpen)
{
	var obj = instance_create_depth(x, y, depth, objUISubMenuCreater);
	obj.menu = subMenu;
	obj.time = time;
	obj.effectClose = effectClose;
	obj.effectOpen = effectOpen;
	obj.menuParent = menuParent;
	
	objUIManager.UICurrentInUse = noone;
}

function fncUIHandleSelect()
{
	fncStaticUIOpenSubMenuAfter(objUIOptionsMenu, 2, objSceneFadeInColor, objSceneFadeOutColor);
}

function fncResetState()
{
	if (state == ButtonState.SELECTED)
	{
		sprite_index = UIButtonSpr.sprResetAnim;
		image_index = 0;
	}
}