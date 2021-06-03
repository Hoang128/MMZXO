/// @description Insert description here
// You can write your code in this editor
switch (phase)
{
	case 1:
	{
		if (instance_exists(objSaveDataManager))
		{
			if (objSaveDataManager.currentPlayerData.modelUnlock.modelZX.isActived == 1)
			{
				var objIcon = instance_create_depth(x, y, depth, objUICharIconMenu);
				objIcon.backColor = c_red;
				objIcon.imageChar = sprArtModelZX;
				objIcon.cursorOn = true;
				objIcon.charObj = objPlayerZX;
				ds_list_add(charIconList, objIcon);
			}
			
			if (objSaveDataManager.currentPlayerData.modelUnlock.modelH.isActived == 1)
			{
				var objIcon = instance_create_depth(x, y, depth, objUICharIconMenu);
				objIcon.backColor = c_green;
				objIcon.imageChar = sprArtModelH;
				objIcon.charObj = objPlayerH;
				ds_list_add(charIconList, objIcon);
			}
			
			if (objSaveDataManager.currentPlayerData.modelUnlock.modelP.isActived == 1)
			{
				var objIcon = instance_create_depth(x, y, depth, objUICharIconMenu);
				objIcon.backColor = c_purple;
				objIcon.imageChar = sprArtModelP;
				objIcon.charObj = objPlayerP;
				ds_list_add(charIconList, objIcon);
			}
			
			if (objSaveDataManager.currentPlayerData.modelUnlock.modelL.isActived == 1)
			{
				var objIcon = instance_create_depth(x, y, depth, objUICharIconMenu);
				objIcon.backColor = c_blue;
				objIcon.imageChar = sprArtModelL;
				objIcon.charObj = objPlayerL;
				ds_list_add(charIconList, objIcon);
			}
			
			if (objSaveDataManager.currentPlayerData.modelUnlock.modelF.isActived == 1)
			{
				var objIcon = instance_create_depth(x, y, depth, objUICharIconMenu);
				objIcon.backColor = c_orange;
				objIcon.imageChar = sprArtModelF;
				objIcon.charObj = objPlayerF;
				ds_list_add(charIconList, objIcon);
			}
		}
		for (var i = 0; i < ds_list_size(charIconList); i++)
		{
			var objIcon = ds_list_find_value(charIconList, i);
			if (i%2==0)
			{
				objIcon.y = -VPORT_H;
			}
			else
			{
				objIcon.y = VPORT_H * 2;
			}
			objIcon.x = VPORT_W/2 + iconSpace * (i - (ds_list_size(charIconList) - 1)/2);
		}
		phase = 2;
	}	break;
	case 2:
	{
		for (var i = 0; i < ds_list_size(charIconList); i++)
		{
			var objIcon = ds_list_find_value(charIconList, i);
			if (abs(objIcon.y - VPORT_H/2) > moveSpd)
			{
				objIcon.y += sign(VPORT_H/2 - objIcon.y) * moveSpd;
			}
			else
			{
				objIcon.y = VPORT_H/2;
			}
		}
		
		if (ds_list_find_value(charIconList, 0).y == VPORT_H/2)
			phase = 3;
	}	break;
	case 3:
	{
		fncUISelectChar();
		fncUIChangeChar();
		fncUIExitCharSelectMenu();
	}	break;
	case 4:
	{
		instance_destroy();
		/*
		for (var i = 0; i < ds_list_size(charIconList); i++)
		{
			var objIcon = ds_list_find_value(charIconList, i);
			if (abs(objIcon.y - VPORT_H/2) > moveSpd)
			{
				if (i%2==0)
				{
					objIcon.y += moveSpd;
				}
				else
				{
					objIcon.y -= moveSpd;
				}
			}
		}
		
		if ((ds_list_find_value(charIconList, 0).y > VPORT_H * 2) || (ds_list_find_value(charIconList, 0).y < -VPORT_H))
		*/
	}	break;
}