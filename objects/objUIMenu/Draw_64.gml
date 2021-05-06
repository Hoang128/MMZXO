/// @description Insert description here
// You can write your code in this editor

if (phase == 0)
	return;

if (UIBackground.actived)
{
	draw_sprite_ext(
	UIBackground.sprite, 
	0, 
	UIBackground.xStart + UITransPos.UICurrentDiffPosX,
	UIBackground.yStart + UITransPos.UICurrentDiffPosY,
	1/UIBackground.spriteW*(UIBackground.xEnd - UIBackground.xStart), 
	1/UIBackground.spriteH*(UIBackground.yEnd - UIBackground.yStart),
	0, c_white, 1);
	//draw_set_color(UIBackground.backColor);
	//draw_set_alpha(UIBackground.alpha);
	//draw_rectangle(UIBackground.xStart, UIBackground.yStart, UIBackground.xEnd, UIBackground.yEnd, false);
	//draw_set_color(c_white);
	//draw_set_alpha(1);
}

if (phase == 3)
{
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_left);
	
	var xPos = UIBackground.xStart + UIContext.titleHMargin + UITransPos.UICurrentDiffPosX;
	var yPos = UIBackground.yStart + UIContext.titleVMargin + UITransPos.UICurrentDiffPosY;
	fncDrawUITitle(xPos, yPos, titleContext);

	var xStartPos = UIBackground.xStart + UIContext.childHMargin;
	var yStartPos = UIBackground.yStart + UIContext.titleVMargin + UIContext.childVMargin;

	var maxRowNumber;
	if (UIMenuLimit.actived)
		maxRowNumber = UIMenuLimit.maxRow + 1;
	else
		maxRowNumber = ds_list_size(childMenuNodeList);
	
	for (var i = 0; i < maxRowNumber; i++)
	{
		var currentContext = ds_list_find_value(childMenuNodeList, i + UIMenuLimit.firstRow);
		xPos = xStartPos + UITransPos.UICurrentDiffPosX;
		yPos = yStartPos + UIContext.childVSpace * i + UITransPos.UICurrentDiffPosY;
		
		with (currentContext.childContext)
		{
			fncUISetContextPosition(xPos, yPos);
		}
		
		fncDrawUIChildContext(xPos, yPos, currentContext);
	}
}

/*
if (global.debug)
	fncDrawMenuDebugInfo();