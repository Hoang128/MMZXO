/// @description Insert description here
// You can write your code in this editor
if (!iconInited)
{
	switch (stageBossId)
	{
		case 0:
		{
			stageRoom = RoomStartStage;
			stageStartPlace.x = 48;
			stageStartPlace.y = 1000;
		}	break;
		case 1:
		{
			stageRoom = RoomElecStage;
			stageStartPlace.x = 0;
			stageStartPlace.y = 0;
		}	break;
		case 2:
		{
			stageRoom = roomTest;
			stageStartPlace.x = 400;
			stageStartPlace.y = 200;
		}	break;
	}
	iconInited = true;
}

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
			if (iconPhase == 2)
				fncUIChangeStageTo(other);
		}
	}
	else
	{
		if (device_mouse_check_button_released(0, mb_any))
		{
			with (menuParent)
			{
				if (iconPhase == 2)
					fncUISelectStage();
			}
		}
	}
}