/// @description Insert description here
// You can write your code in this editor
if (inited == 1)
{
	if (phase == 0)
		return;

	if (UIBackground.actived)
	{
		draw_sprite_ext(
		UIAvatarImage[UIMessReader.contextCurrent], 
		0,
		UIBackground.xStart + UITransPos.UICurrentDiffPosX + UIAvatar.x,
		UIBackground.yStart + UITransPos.UICurrentDiffPosY + UIAvatar.y,
		1/48*UIAvatar.width, 
		1/57*UIAvatar.height, 
		0, 
		c_white, 
		1);
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

		xPos = xStartPos + UITransPos.UICurrentDiffPosX;
		yPos = yStartPos + UITransPos.UICurrentDiffPosY;
	
		draw_set_valign(fa_top);
		fncDrawMessContext(xPos, yPos, UIMessReader.messageIndex);
	
		draw_set_color(c_white);
		draw_triangle(UIMessCursor.center.x, UIMessCursor.center.y + UIMessCursor.height, 
					  UIMessCursor.center.x - UIMessCursor.width/2, UIMessCursor.center.y, 
					  UIMessCursor.center.x + UIMessCursor.width/2, UIMessCursor.center.y,
					  false);
	}
}