/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

closeTime = 4;
UIAnim.closeMenuCloseEff = objSceneFadeInColor;
UIAnim.closeMenuOpenEff = objSceneFadeOutColor;

UIContext.childVSpace = 96;
UIContext.titleVMargin = 128;
UIContext.childVMargin = 192;

UIBackground.xStart = 64;
UIBackground.yStart = 64;
UIBackground.UIWidth = 540;
UIBackground.UIHeight = 952;

titleContext = "Cài đặt";
fncInitUIChildMenuNode("Cài đặt bàn phím", objUIKeyboardMenu, noone, true, true);
fncInitUIChildMenuNode("Cài đặt tay cầm", noone, noone, true, true);
fncInitUIChildMenuNode("Cài đặt chung", noone, noone, false, true);
fncInitUIChildMenuNode("Đồ họa", noone, noone, true, true);
fncInitUIChildMenuNode("Âm thanh", noone, noone, true, true);
fncInitUIChildMenuNode("Trở lại", noone, noone, true, true);

function fncUIHandleSelect()
{
	switch (menuCursor)
	{
		case 0:
			fncUIOpenSubMenuAfter(0, noone, noone);	break;
		case 5:
			fncUICloseMenu();
	}
}

function fncUIHandleExit()
{
	fncUICloseMenu();
}