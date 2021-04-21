/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

inited = false;

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
UIContext.childVSpace = 96;
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
	lineW : 1472
}

UIMessContext[0] = "So, can we start the battle now ? The battle will be very exciting";
UIMessContext[1] = "zzzzzzzzzzzzzzzsfasfasf zxfc zxcccccccccc asikljgioawhngoias asignaiowhngioaslng asing oiasngoi nsgioa nsiognasoi asgioashng";

UIAvatar =
{
	image : noone,
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