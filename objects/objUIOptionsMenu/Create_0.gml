/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

closeTime = 4;
UIAnim.closeMenuCloseEff = objSceneFadeInColor;
UIAnim.closeMenuOpenEff = objSceneFadeOutColor;

UIContext.childVSpace = 96;
UIContext.titleVMargin = 128;

UIBackground.xStart = 64;
UIBackground.yStart = 64;
UIBackground.UIWidth = 540;
UIBackground.UIHeight = 952;

titleContext = "Cài đặt";
fncInitUIChildMenuNode("Cài đặt phím", noone, noone, true);
fncInitUIChildMenuNode("Cài đặt chung", noone, noone, false);
fncInitUIChildMenuNode("Đồ họa", noone, noone, true);
fncInitUIChildMenuNode("Âm thanh", noone, noone, true);

function fncUIHandleExit()
{
	fncUICloseMenu();
}