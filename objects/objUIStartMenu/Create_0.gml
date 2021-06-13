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
fncInitUIChildMenuNode("Chơi đơn", noone, noone, true, true);
fncInitUIChildMenuNode("Chơi mạng", noone, noone, false, true);
fncInitUIChildMenuNode("Cài đặt", objUIOptionsMenu, noone, true, true);
fncInitUIChildMenuNode("Thoát", noone, noone, true, true);

function fncUIHandleSelect()
{
	switch (menuCursor)
	{
		case 0:
		{
			with(objRoomManager)
				fncChangeRoomTo(roomStageSelect, true);
			objUIManager.UICurrentInUse = noone;
			return true;
		}	
		break;
		
		case 2:
		{
			fncUIOpenSubMenuAfter(2, objSceneFadeInColor, objSceneFadeOutColor);
			return true;
		}	
		break;
		
		case 3:
		{
			game_end();
			return true;
		}	
		break;
	}
	
	return false;
}