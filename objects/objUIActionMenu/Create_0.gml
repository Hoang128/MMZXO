/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

UIBackground.UIWidth = 480;
UIBackground.UIHeight = VPORT_H;
UIBackground.xStart = VPORT_W - UIBackground.UIWidth;
UIBackground.yStart = 0;

UIContext.childVSpace = 96;
UIContext.titleVMargin = 128;
UIContext.childVMargin = 192;

UIAnim.isEnable = false;

UITransPos.isEnable = true;
UITransPos.UIDiffPosY = 0;
UITransPos.UIDiffPosX = VPORT_W;
UITransPos.UIMoveSpd = 40;

titleContext = "Action";

fncInitUIChildMenuNode("Stage Select", noone, noone, true, true);
fncInitUIChildMenuNode("Load Game", noone, noone, true, true);
fncInitUIChildMenuNode("Option Menu", objUIOptionsMenu, noone, true, true);
fncInitUIChildMenuNode("Exit", noone, noone, true, true);

function fncUIHandleSelect()
{
	switch (menuCursor)
	{
		case 0:
		{
			instance_create_depth(x, y, depth, objUIStageControllerMenu);
			fncUIHandleExit();
		}	
		break;
		
		case 1:
		{
			
		}	
		break;
		
		case 2:
		{
			fncUIOpenSubMenuAfter(2, objSceneFadeInColor, objSceneFadeOutColor);
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

function fncUIHandleExit()
{
	fncUICloseMenu();
}