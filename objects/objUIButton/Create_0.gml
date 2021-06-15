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
		y : (bbox_bottom - bbox_top) / 2,
	},
	font		   : fontButtonS,
	color		   : c_white,
	shadow         : true,
	shadowDistance : 4
}

function fncUICloseMenu()
{
	if (instance_exists(menuParent))
	{
		with (menuParent)
		{
			fncUICloseMenu();
		}
	}
}

function fncStaticUIOpenSubMenuAfter(subMenu, time, effectClose, effectOpen, isDestroySelfMenu)
{
	var obj = instance_create_depth(x, y, depth, objUISubMenuCreater);
	obj.menu = subMenu;
	obj.time = time;
	obj.effectClose = effectClose;
	obj.effectOpen = effectOpen;
	obj.menuParent = menuParent;
	obj.menuParentObj = menuParent.object_index;
	
	objUIManager.UICurrentInUse = noone;
	
	if (isDestroySelfMenu)
	{
		fncUICloseMenu();
	}
}

function fncUIHandleSelect()
{

}

function fncResetState()
{
	if (state == ButtonState.SELECTED)
	{
		sprite_index = UIButtonSpr.sprResetAnim;
		image_index = 0;
	}
}