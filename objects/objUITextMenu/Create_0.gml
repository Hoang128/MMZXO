/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

inited = -1;

UIBackground.sprite	= sprUIFrameMessageBox;
UIBackground.spriteW = 1920;
UIBackground.spriteH = 304;
UIBackground.xStart = 0;
UIBackground.yStart = 0;
UIBackground.UIWidth = 1920;
UIBackground.UIHeight = 304;

UIAnim.isEnable = false;

UITransPos.isEnable = true;
UITransPos.UIDiffPosY = -UIBackground.spriteH;
UITransPos.UIDiffPosX = 0;
UITransPos.UIMoveSpd = 20;

UIContext.titleFont = fontMenuM;
UIContext.childFont = fontMenuM;
UIContext.titleVMargin = 96;
UIContext.titleHMargin = 400;
UIContext.childHMargin = 400;
UIContext.childVMargin = 0;
UIContext.childVSpace = 80;
UIContext.shadow = false;

titleContext = "Vent:";

UIMessReader =
{
	contextRevealSpd : 0.5,
	charCursor : 0,
	charCursorMax : 0,
	contextNumber : 1,
	contextCurrent : 0,
	messageIndex : "",
	lineW : 1400
}

UIMessCursor =
{
	center : {x : 1830, y : 220},
	width  : 72,
	height : 36
}

UIMessContext[0] = "Prototype mess";
UIAvatarImage[0] = sprMShotVentSmile;

UIAvatar =
{
	x : 15,
	y : 9,
	width  : 255,
	height : 294,
	backColor : c_white
}


function fncDrawMessContext(xPos, yPos, childContext)
{
	draw_set_font(UIContext.childFont);
	if (UIContext.shadow)
	{
		draw_set_color(c_black);
		draw_text(xPos + UIContext.shadowDistance, yPos + UIContext.shadowDistance, childContext);
	}

	draw_set_color(c_white);
	draw_text_ext(xPos, yPos, childContext, UIContext.childVSpace, UIMessReader.lineW);
}