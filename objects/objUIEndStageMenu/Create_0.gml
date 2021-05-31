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
fncInitUIChildMenuNode("Retry", noone, noone, true, true);
fncInitUIChildMenuNode("Stage select", noone, noone, true, true);
fncInitUIChildMenuNode("Return to title screen", noone, noone, true, true);

function fncUIHandleSelect()
{
	switch (menuCursor)
	{
		case 0:
		{
			with(objRoomManager)
				fncChangeRoomTo(room, true);
			objUIManager.UICurrentInUse = noone;
		}	
		break;
		
		case 1:
		{
			with(objRoomManager)
				fncChangeRoomTo(roomStageSelect, true);
			objUIManager.UICurrentInUse = noone;
		}	
		break;
		
		case 3:
		{
			with(objRoomManager)
				fncChangeRoomTo(roomStart, true);
			objUIManager.UICurrentInUse = noone;
		}	
		break;
	}
}