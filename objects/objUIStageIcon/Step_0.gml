/// @description Insert description here
// You can write your code in this editor
if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 
x + 8, 
y + 5, 
x + 8 + 48 * 4, 
y + 5 + 48 * 4))
{
	if (!cursorOn)
	{
		with (menuParent)
		{
			fncUIChangeStageTo(other);
		}
	}
	else
	{
		if (device_mouse_check_button_released(0, mb_any))
		{
			with (menuParent)
			{
				fncUISelectStage();
			}
		}
	}
}