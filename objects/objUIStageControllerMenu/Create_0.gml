/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

iconPhase = 0;
startDrawPoint =
{x : -1600, y : 0};
stageIconStart = 
{x : 32, y : 32};
stageIconSpace = 32;
stageIconWidth = 202;
moveSpd = 40;
currentBossPhase = 0;
cursor = 0;

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

menuCursor = -1;

titleContext = "Stage info";
fncInitUIChildMenuNode("Target:", noone, noone, true, true);
fncInitUIChildMenuNode("Hellbat schilt", noone, noone, true, true);
fncInitUIChildMenuNode("Location:", noone, noone, true, true);
fncInitUIChildMenuNode("Power plant", noone, noone, true, true);
fncInitUIChildMenuNode("Highest score:", noone, noone, true, true);
fncInitUIChildMenuNode("0", noone, noone, true, true);

objUIManager.UICurrentInUse = self;

stageIconList = ds_list_create();

function fncChangeStageInfo()
{
	switch (cursor)
	{
		case 0:
		{
			ds_list_find_value(childMenuNodeList, 1).context = "No";
			ds_list_find_value(childMenuNodeList, 3).context = "Forest";
			ds_list_find_value(childMenuNodeList, 5).context = objSaveDataManager.currentPlayerData.stageScore.stage_0.highestScore;
		}	break;
		case 1:
		{
			ds_list_find_value(childMenuNodeList, 1).context = "Electric Bat";
			ds_list_find_value(childMenuNodeList, 3).context = "Power Plant";
			ds_list_find_value(childMenuNodeList, 5).context = objSaveDataManager.currentPlayerData.stageScore.stage_1.highestScore;
		}	break;
		case 2:
		{
			ds_list_find_value(childMenuNodeList, 1).context = "Ice Rabbit";
			ds_list_find_value(childMenuNodeList, 3).context = "Ice Lake";
			ds_list_find_value(childMenuNodeList, 5).context = objSaveDataManager.currentPlayerData.stageScore.stage_2.highestScore;
		}	break;
	}
}

function fncUIExit()
{
	if (fncStaticHandleButton(KeyMap.UI_BACK,KeyAction.PRESSED))
	{
		fncUIHandleExit();
	}
}

function fncUIHandleExit()
{
	if (iconPhase != 3)
	{
		audio_play_sound(UISFX.exitSFX, global.emitterSFX.source, false);
		iconPhase = 3;
		return true;
	}
}

function fncUIChangeStageTo(iconObj)
{
	cursor = ds_list_find_index(stageIconList, iconObj.id);
	audio_play_sound(UISFX.enterSFX, global.emitterSFX.source, false);
	for (var i = 0; i < ds_list_size(stageIconList); i++)
	{
		if (ds_list_find_value(stageIconList, i).cursorOn == true)
		{
			ds_list_find_value(stageIconList, i).cursorOn = false;
			break;
		}
	}
	fncChangeStageInfo();
	iconObj.cursorOn = true;
}

function fncUIChangeStage()
{
	if (fncStaticHandleButton(KeyMap.UI_LEFT,KeyAction.PRESSED))
	{
		if (cursor > 0)
		{
			audio_play_sound(UISFX.enterSFX, global.emitterSFX.source, false);
			cursor--;
			for (var i = 0; i < ds_list_size(stageIconList); i++)
			{
				if (ds_list_find_value(stageIconList, i).cursorOn == true)
				{
					ds_list_find_value(stageIconList, i).cursorOn = false;
					ds_list_find_value(stageIconList, i - 1).cursorOn = true;
					break;
				}
			}
		}
	}
	
	if (fncStaticHandleButton(KeyMap.UI_RIGHT,KeyAction.PRESSED))
	{
		if (cursor < ds_list_size(stageIconList) - 1)
		{
			audio_play_sound(UISFX.enterSFX, global.emitterSFX.source, false);
			cursor++;
			for (var i = 0; i < ds_list_size(stageIconList); i++)
			{
				if (ds_list_find_value(stageIconList, i).cursorOn == true)
				{
					ds_list_find_value(stageIconList, i).cursorOn = false;
					ds_list_find_value(stageIconList, i + 1).cursorOn = true;
					break;
				}
			}
		}
	}
	
	fncChangeStageInfo();
}

function fncUISelectStage()
{
	audio_play_sound(UISFX.enterSFX, global.emitterSFX.source, false);
	var stage = noone;
	with (ds_list_find_value(stageIconList, cursor))
	{
		stage = stageRoom;
		global.playerStartPosition.x = stageStartPlace.x; 
		global.playerStartPosition.y = stageStartPlace.y;
	}
		
	with instance_create_depth(x, y, depth, objUICharSelectMenu)
	{
		stageToGo = stage;
	}
	iconPhase = 3;
}