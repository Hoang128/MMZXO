/// @description Insert description here
// You can write your code in this editor
if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 
x + rectPos.x1, 
y + rectPos.y1, 
x + rectPos.x2, 
y + rectPos.y2))
{
	if (!cursorOn)
	{
		with (menuParent)
		{
			fncUIChangeCharTo(other);
		}
	}
	else
	{
		if (device_mouse_check_button_released(0, mb_any))
		{
			with (menuParent)
			{
				fncUISelectChar();
			}
		}
	}
}