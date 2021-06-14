/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

UIContext.childFont = fontMenuM;
UIContext.childVSpace = 96;
UIContext.titleVMargin = 256;
UIContext.childVMargin = 256;

UIBackground.actived = true;
UIBackground.sprite = sprUIBgrBasicGray;
UIBackground.spriteW = 1;
UIBackground.spriteH = 1;
UIBackground.xStart = 200;
UIBackground.yStart = 0;
UIBackground.UIWidth = 480;
UIBackground.UIHeight = 1080;

titleContext = "";
fncInitUIButton(objUIBtn_Start, 200, 300);
fncInitUIButton(objUIBtn_Option, 200, 420);
fncInitUIButton(objUIBtn_Exit, 200, 540);