/// @description Insert description here
// You can write your code in this editor
switch (phase)
{
	case 0:
	{
		UIBackground.xEnd = UIBackground.xStart + UIAnim.UIWidthMin;
		UIBackground.yEnd = UIBackground.yStart + UIAnim.UIHeightMin;
		
		for (var i = 0; i < ds_list_size(childMenuNodeList); i++)
		{
			var currentContext = ds_list_find_value(childMenuNodeList, i);
			if (currentContext.childContextType != noone)
			{
				childContext = instance_create_depth(x, y, depth - 1, currentContext.childContextType);
				childContext.parent = self;
				childContext.index = i;
				childContext.UIContext.font = UIContext.childFont;
			}
		}
		
		fncUIUpdateSelectedContext();
		
		phase = 1;
	}	break;
	case 1:
	{
		if (UIAnim.isEnable)
		{
			//Open width
			if (UIBackground.xEnd < (UIBackground.xStart + UIBackground.UIWidth))
				UIBackground.xEnd += UIAnim.animSpd;
			else
			{
				UIBackground.xEnd = (UIBackground.xStart + UIBackground.UIWidth);
				phase = 2;
			}
		}
		else
		{
			UIBackground.xEnd = (UIBackground.xStart + UIBackground.UIWidth);
			UIBackground.yEnd = (UIBackground.yStart + UIBackground.UIHeight);
			phase = 3;
		}
	}	break;
	case 2:
	{
		//Open height
		if (UIBackground.yEnd < (UIBackground.yStart + UIBackground.UIHeight))
			UIBackground.yEnd += UIAnim.animSpd;
		else
		{
			UIBackground.yEnd = (UIBackground.yStart + UIBackground.UIHeight);
			phase = 3;
		}
	}	break;
	case 3:
	{
		if (objUIManager.UICurrentInUse == self)
		{
			fncUISelect();
			fncUIMoveUp();
			fncUIMoveDown();
			fncUIExit();
		}
	}	break;
	case 4:
	{
		if (UIAnim.isEnable)
		{
			//Close height
			if (UIBackground.yEnd > (UIBackground.yStart + UIAnim.UIHeightMin))
				UIBackground.yEnd -= UIAnim.animSpd;
			else
			{
				UIBackground.yEnd = (UIBackground.yStart + UIAnim.UIHeightMin);
				phase = 5;
			}
		}
		else
		{
			UIBackground.xEnd = (UIBackground.xStart + UIAnim.UIWidthMin);
			phase = 5;
		}
	}	break;
	case 5:
	{
		//Close width
		if (UIBackground.xEnd > (UIBackground.xStart + UIAnim.UIWidthMin))
			UIBackground.xEnd -= UIAnim.animSpd;
		else
		{
			UIBackground.xEnd = (UIBackground.xStart + UIAnim.UIWidthMin);
			phase = 6;
		}
	}	break;
	case 6:
	{
		if (closeTime > 0)
			closeTime--;
		else
			phase = 7;
	}	break;
	case 7:
	{
		if (UIAnim.closeMenuCloseEff != noone)
		{
			closeMenuCloseEffObj = instance_create_depth(x, y, depth, UIAnim.closeMenuCloseEff);
			phase = 8;
		}
		else	phase = 9;
	}	break;
	case 8:
	{
		if (closeMenuCloseEffObj != noone)
		{
			if (closeMenuCloseEffObj.isComplete)
			{
				phase = 9;
			}
		}
		else phase = 9;

	}	break;
	case 9:	
	{
		if (closeMenuCloseEffObj != noone)
		{
			instance_destroy(closeMenuCloseEffObj);
		}
		if (UIAnim.closeMenuOpenEff != noone)
		{
			closeMenuOpenEffObj = instance_create_depth(x, y, depth, UIAnim.closeMenuOpenEff);
		}
		
		instance_destroy();	
	}	break;
}