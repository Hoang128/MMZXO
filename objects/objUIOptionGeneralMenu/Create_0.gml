/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

UIAnim.isEnable = false;

UITransPos.isEnable = true;
UITransPos.UIDiffPosY = 0;
UITransPos.UIDiffPosX = -540;
UITransPos.UIMoveSpd = 40;

UIContext.childVSpace = 256;
UIContext.titleVMargin = 128;
UIContext.childVMargin = 128;

UIBackground.actived = true;
UIBackground.sprite = sprUIBgrBasicGray;
UIBackground.spriteW = 1;
UIBackground.spriteH = 1;
UIBackground.xStart = 100;
UIBackground.yStart = 100;
UIBackground.UIWidth = VPORT_W - (UIBackground.xStart * 2);
UIBackground.UIHeight = VPORT_H - (UIBackground.yStart * 2);

titleContext = "Option";

fncInitUIChildMenuNode("Sound effect volume", noone, noone, true, true);
fncInitUIChildMenuNode("Background music volume", noone, noone, true, true);
fncInitUIButton(objUIBtn_SoundBack, UIBackground.UIWidth - 128, UIBackground.UIHeight - 128);

fncInitUIButton(objUIBtn_SFXVolumeDown, 900, 220);
fncInitUIButton(objUIBtn_SFXVolumeUp, 1200, 220);

fncInitUIButton(objUIBtn_BGMVolumeDown, 900, 480);
fncInitUIButton(objUIBtn_BGMVolumeUp, 1200, 480);
