/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

UIContext.childFont = fontMenuTitle;
UIContext.childVSpace = 96;
UIContext.titleVMargin = 256;

UIBackground.xStart = 200;
UIBackground.yStart = 0;
UIBackground.UIWidth = 480;
UIBackground.UIHeight = 1080;

titleContext = "";
fncInitUIChildMenuNode("Singleplay", noone, noone, true);
fncInitUIChildMenuNode("Multiplay", noone, noone, false);
fncInitUIChildMenuNode("Options", noone, noone, true);

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
		}	break;
	}
}