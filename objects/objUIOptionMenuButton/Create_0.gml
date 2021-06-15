/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

UIAnim.isEnable = false;

UITransPos.isEnable = true;
UITransPos.UIDiffPosY = 0;
UITransPos.UIDiffPosX = -540;
UITransPos.UIMoveSpd = 40;

closeTime = 4;
UITransPos.isEnable = true;
UITransPos.UIDiffPosY = 0;
UITransPos.UIDiffPosX = -540;
UITransPos.UIMoveSpd = 40;

UIContext.childVSpace = 96;
UIContext.titleVMargin = 128;
UIContext.childVMargin = 192;

UIBackground.xStart = 64;
UIBackground.yStart = 64;
UIBackground.UIWidth = 540;
UIBackground.UIHeight = 952;

titleContext = "Cài đặt";
fncInitUIButton(objUIBtn_OptionGeneral, UIBackground.UIWidth / 2, 240);
fncInitUIButton(objUIBtn_OptionGraphics, UIBackground.UIWidth / 2, 240 + 120);
fncInitUIButton(objUIBtn_OptionSounds, UIBackground.UIWidth / 2, 240 + 120 * 2);
fncInitUIButton(objUIBtn_OptionKeyboard, UIBackground.UIWidth / 2, 240 + 120 * 3);
fncInitUIButton(objUIBtn_OptionGamepad, UIBackground.UIWidth / 2, 240 + 120 * 4);
fncInitUIButton(objUIBtn_OptionExitOption, UIBackground.UIWidth / 2, 240 + 120 * 5);