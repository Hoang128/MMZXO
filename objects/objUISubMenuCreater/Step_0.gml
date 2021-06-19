/// @description Insert description here
// You can write your code in this editor
switch (phase)
{
	case 0:
	{
		if (time > 0) time--;
		else	phase = 1;
	}	break;
	case 1:
	{
		if (effectClose != noone)
		{
			effCloseObj = instance_create_depth(x, y, depth, effectClose);
		}
		phase = 2;
	
	}	break;
	case 2:
	{
		if (effCloseObj != noone)
		{
			if (effCloseObj.isComplete)
			{
				phase = 3;
			}
		}
		else	phase = 3;
	}	break;
	case 3:
	{
		if (effCloseObj != noone)
			instance_destroy(effCloseObj);
		if (effectOpen != noone)
			effOpenObj = instance_create_depth(x, y, depth, effectOpen);
		if (menu != noone)
		{
			var objMenu = instance_create_depth(x, y, depth - 1, menu);
			if (menuParent != noone)
			{
				objMenu.parentMenu = menuParent;
			}
			if (menuParentObj != noone)
			{
				objMenu.parentMenuObj = menuParentObj;
			}
		}
		instance_destroy();
	}	break;
}