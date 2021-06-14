/// @description Insert description here
// You can write your code in this editor
switch (phase)
{
	case 0:
	{
		if (UIAnim.isEnable)
		{
			UIBackground.xEnd = UIBackground.xStart + UIAnim.UIWidthMin;
			UIBackground.yEnd = UIBackground.yStart + UIAnim.UIHeightMin;
		}
		else
		{
			UIBackground.xEnd = UIBackground.xStart + UIBackground.UIWidth;
			UIBackground.yEnd = UIBackground.yStart + UIBackground.UIHeight;
		}
		
		if (UITransPos.isEnable)
		{
			UITransPos.UICurrentDiffPosX = UITransPos.UIDiffPosX;
			UITransPos.UICurrentDiffPosY = UITransPos.UIDiffPosY;
		}
		
		fncUIUpdateSelectedContext();
		
		phase = 0.5;
	}	break;
	
	case 0.5:
	{
		if (UITransPos.isEnable)
		{
			if (abs(UITransPos.UICurrentDiffPosX - 0) < UITransPos.UIMoveSpd)
			{
				UITransPos.UICurrentDiffPosX = 0;
			}
			else
			{
				UITransPos.UICurrentDiffPosX -= sign(UITransPos.UICurrentDiffPosX) * UITransPos.UIMoveSpd;
			}
			
			if (abs(UITransPos.UICurrentDiffPosY - 0) < UITransPos.UIMoveSpd)
			{
				UITransPos.UICurrentDiffPosY = 0;
			}
			else
			{
				UITransPos.UICurrentDiffPosY -= sign(UITransPos.UICurrentDiffPosY) * UITransPos.UIMoveSpd;
			}
			
			if ((UITransPos.UICurrentDiffPosX == 0) && (UITransPos.UICurrentDiffPosY == 0))
			{
				phase = 1;
			}
		}
		else
		{
			phase = 1;
		}
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
			phase = 2.5;
		}
	}	break;
	case 2.5:
	{
		if (ds_list_size(childButtonList) > 0)
		{
			fncEnableUIButtonList();
		}
		phase = 3;
	}	break;
	case 3:
	{
		if (objUIManager.UICurrentInUse == self.id)
		{
			if (UIControl.isEnable)
			{
				if (ds_list_size(childMenuNodeList) > 0)
				{
					fncUISelect();
					fncUIMoveUp();
					fncUIMoveDown();
				}
				fncUIExit();
			}
		}
	}	break;
	case 3.5:
	{
		if (ds_list_size(childButtonList) > 0)
		{
			fncDisableUIButtonList();
		}
		phase = 4;
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
			phase = 5;
		}
	}	break;
	case 5:
	{
		if (UIAnim.isEnable)
		{
			//Close width
			if (UIBackground.xEnd > (UIBackground.xStart + UIAnim.UIWidthMin))
				UIBackground.xEnd -= UIAnim.animSpd;
			else
			{
				UIBackground.xEnd = (UIBackground.xStart + UIAnim.UIWidthMin);
				phase = 5.5;
			}
		}
		else
		{
			phase = 5.5;
		}
	}	break;
	case 5.5:
	{
		if (UITransPos.isEnable)
		{
			if (abs(UITransPos.UICurrentDiffPosX - UITransPos.UIDiffPosX) < UITransPos.UIMoveSpd)
			{
				UITransPos.UICurrentDiffPosX = UITransPos.UIDiffPosX;
			}
			else
			{
				UITransPos.UICurrentDiffPosX += sign(UITransPos.UIDiffPosX - UITransPos.UICurrentDiffPosX) * UITransPos.UIMoveSpd;
			}
			
			if (abs(UITransPos.UICurrentDiffPosY - UITransPos.UIDiffPosY) < UITransPos.UIMoveSpd)
			{
				UITransPos.UICurrentDiffPosY = UITransPos.UIDiffPosY;
			}
			else
			{
				UITransPos.UICurrentDiffPosY += sign(UITransPos.UIDiffPosY - UITransPos.UICurrentDiffPosY) * UITransPos.UIMoveSpd;
			}
			
			if ((UITransPos.UICurrentDiffPosX == UITransPos.UIDiffPosX) && (UITransPos.UICurrentDiffPosY == UITransPos.UIDiffPosY))
			{
				phase = 6;
			}
		}
		else
		{
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