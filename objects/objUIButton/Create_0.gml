/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

state = 0;

UIButtonSpr =
{
	sprNormal     : sprUIButtonN_Normal,
	sprConfirm    : sprUIButtonN_Confirm,
	sprSelected   : sprUIButtonN_Selected,
	sprSelectAnim : sprUIButtonN_SelectAnim,
	sprUnselected : sprUIButtonN_Unselected,
	
	imgSpd		  : 0.5,
}

sprite_index = UIButtonSpr.sprNormal;

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