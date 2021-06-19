/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

UIButtonImg = noone;

UIButtonSpr =
{
	sprNormal		: sprUIButtonS_Selected,
	sprConfirm		: sprUIButtonS_Confirm,
	sprConfirmDone	: sprUIButtonS_ConfirmDone,
	sprSelected		: sprUIButtonS_Selected,
	sprSelectAnim	: sprUIButtonS_Selected,
	sprUnselected	: sprUIButtonS_Unselected,
	sprResetAnim	: sprUIButtonS_Unselected,
	
	imgSpd		  : 0.5,
}

sprite_index = UIButtonSpr.sprUnselected;