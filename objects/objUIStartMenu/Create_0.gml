/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

UIContext.childFont = fontMenuM;
UIContext.childVSpace = 96;
UIContext.titleVMargin = 256;

UIBackground.xStart = 200;
UIBackground.yStart = 0;
UIBackground.UIWidth = 480;
UIBackground.UIHeight = 1080;

titleContext = "";
fncInitUIChildMenuNode("Chơi đơn", noone, noone, true);
fncInitUIChildMenuNode("Chơi mạng", noone, noone, false);
fncInitUIChildMenuNode("Cài đặt", objUIOptionsMenu, noone, true);

function fncUIHandleSelect()
{
	switch (menuCursor)
	{
		case 0:
		{
			with(objRoomManager)
				fncChangeRoomTo(roomTest);
			objUIManager.UICurrentInUse = noone;
		}	break;
		case 2:
		{
			fncUIOpenSubMenuAfter(2, objSceneFadeInColor, objSceneFadeOutColor);
		}	break;
	}
}