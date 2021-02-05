/// @description Insert description here
// You can write your code in this editor
if (keyboard_check(ord("T")))
{
	if (keyboard_check_pressed(vk_subtract))
	{
		if (global.timeScale == 0.1)
		{
			global.timeScale = 1;
		}
		else
			global.timeScale -= 0.1;
	}
	else if (keyboard_check_pressed(vk_add))
	{
		if(global.timeScale == 1)
		{
			global.timeScale = 0.1;
		}
		else
			global.timeScale += 0.1;
	}
}

if (keyboard_check(ord("L")))
{
	if (keyboard_check_pressed(vk_numpad0))
	{
		if (physicVisible.blocks)
		{
			fncChangeBlocksVisible(false);
		}
		else
		{
			fncChangeBlocksVisible(true);
		}
	}
	
	if (keyboard_check_pressed(vk_numpad1))
	{
		if(instance_exists(objPlayerBasic))
		{
			if (physicVisible.player)
			{
				physicVisible.player = false;
			}
			else
			{
				physicVisible.player = true;
			}
		}
	}
}

if (keyboard_check(ord("R")))
{
	if (keyboard_check_pressed(vk_subtract))
	{
		if (room_speed == 10)
		{
			room_speed = 60;
		}
		else
			room_speed -= 10;
	}
	else if (keyboard_check_pressed(vk_add))
	{
		if (room_speed == 60)
		{
			room_speed = 10;
		}
		else
			room_speed += 10;
	}
}