/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

UIBackground.UIWidth = 480;
UIBackground.UIHeight = VPORT_H;
UIBackground.xStart = VPORT_W - UIBackground.UIWidth - 100;
UIBackground.yStart = 0;

UIContext.childVSpace = 96;
UIContext.titleVMargin = 128;
UIContext.childVMargin = 192;

UIAnim.isEnable = false;

UITransPos.isEnable = true;
UITransPos.UIDiffPosY = 0;
UITransPos.UIDiffPosX = VPORT_W + 100;
UITransPos.UIMoveSpd = 40;

titleContext = "Action";

fncInitUIButton(objBtn_ActionStageSelect, UIBackground.UIWidth/2 , 300);
//fncInitUIButton(objBtn_ActionLoadGame, UIBackground.UIWidth/2 , 420);
fncInitUIButton(objBtn_ActionOption, UIBackground.UIWidth/2 , 540);
fncInitUIButton(objBtn_ActionExit, UIBackground.UIWidth/2 , 660);

function fncUIHandleExit()
{
	fncUICloseMenu();
}