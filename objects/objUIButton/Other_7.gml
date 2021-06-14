/// @description Insert description here
// You can write your code in this editor
switch (sprite_index)
{
	case UIButtonSpr.sprSelectAnim:
	{
		sprite_index = UIButtonSpr.sprSelected;
		image_index = 0;
	}	break;
	
	case UIButtonSpr.sprConfirm:
	{
		sprite_index = UIButtonSpr.sprConfirmDone;
		image_index = 0;
		
		fncUIHandleSelect();
	}	break;
	
	case UIButtonSpr.sprResetAnim:
	{
		sprite_index = UIButtonSpr.sprUnselected;
		image_index = 0;
		
		state = ButtonState.NORMAL;
	}	break;
}