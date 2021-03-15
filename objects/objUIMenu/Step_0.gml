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
				childContext = instance_create_depth(x, y, depth - 1, childContextType);
				childContext.parent = self;
			}
		}
		
		phase = 1;
	}	break;
	case 1:
	{
		//Open width
		if (UIBackground.xEnd < (UIBackground.xStart + UIBackground.UIWidth))
			UIBackground.xEnd += UIAnim.animSpd;
		else
		{
			UIBackground.xEnd = (UIBackground.xStart + UIBackground.UIWidth);
			phase = 2;
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
	
		}
	}	break;
	case 4:
	{
		//Close height
		if (UIBackground.yEnd > (UIBackground.yStart + UIAnim.UIHeightMin))
			UIBackground.yEnd -= UIAnim.animSpd;
		else
		{
			UIBackground.yEnd = (UIBackground.yStart + UIAnim.UIHeightMin);
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
			instance_destroy();
		}
	}	break;
}

