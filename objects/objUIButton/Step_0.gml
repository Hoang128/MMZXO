/// @description Insert description here
// You can write your code in this editor
if (UIButton.enabled)
{
	if ((menuParent == noone) || (instance_exists(menuParent) 
		&& (objUIManager.UICurrentInUse == menuParent.id) && (menuParent.UIControl.isEnable)))
	{
		var parentPos = {x : 0, y : 0};
		if (instance_exists(menuParent))
		{
			parentPos.x = menuParent.UIBackground.xStart + menuParent.UITransPos.UICurrentDiffPosX;
			parentPos.y = menuParent.UIBackground.yStart + menuParent.UITransPos.UICurrentDiffPosY;
		}
		switch (state)
		{
			case ButtonState.NORMAL:
			{
				if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 
					parentPos.x + bbox_left, 
					parentPos.y + bbox_top, 
					parentPos.x + bbox_right, 
					parentPos.y + bbox_bottom))
				{
					sprite_index = UIButtonSpr.sprSelectAnim;
					state = ButtonState.HIGHLIGHT;
				}
			}	break;
			case ButtonState.HIGHLIGHT:
			{
				if (!point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 
					parentPos.x + bbox_left, 
					parentPos.y + bbox_top, 
					parentPos.x + bbox_right, 
					parentPos.y + bbox_bottom))
				{
					sprite_index = UIButtonSpr.sprUnselected;
					state = ButtonState.NORMAL;
				}
				else
				{
					if (sprite_index == UIButtonSpr.sprSelected)
					{
						if (device_mouse_check_button_released(0, mb_any))
						{
							sprite_index = UIButtonSpr.sprConfirm;
							image_index = 0;
							state = ButtonState.SELECTED;
							
							if (menuParent != noone)
							{
								objUIManager.UICurrentInUse = noone;
							}
						}
					}
				}
			}	break;
			case ButtonState.SELECTED:
			{
			}	break;
		}
	}
}