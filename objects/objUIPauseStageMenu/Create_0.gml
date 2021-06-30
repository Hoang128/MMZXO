/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

UIAnim.isEnable = false;

UITransPos.isEnable = true;
UITransPos.UIDiffPosY = 0;
UITransPos.UIDiffPosX = -540;
UITransPos.UIMoveSpd = 40;

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

activePauseButton = false;

if (instance_exists(objGlobalManager.currentPlayer))
	titleContext = "Pause Game";
else
	titleContext = "Game Over";
fncInitUIButton(objUIBtn_ResumeGame, UIBackground.UIWidth/2, 300);
fncInitUIButton(objUIBtn_Option, UIBackground.UIWidth/2, 420);
fncInitUIButton(objUIBtn_EndRetry, UIBackground.UIWidth/2, 540);
fncInitUIButton(objUIBtn_EndStageSelect, UIBackground.UIWidth/2, 660);
fncInitUIButton(objUIBtn_EndStart, UIBackground.UIWidth/2, 780);

instance_create_depth(x, y, depth, objUIPauseScreen);