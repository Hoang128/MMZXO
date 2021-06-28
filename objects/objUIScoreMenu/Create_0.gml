/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

menuCursor = -1;

titleContext = "Mission Result";

UIBackground.xStart = 120;
UIBackground.yStart = 120;
UIBackground.UIWidth = 1680;
UIBackground.UIHeight = 840;

UIContext.childVSpace = 96;
UIContext.titleVMargin = 128;
UIContext.childVMargin = 192;

fncInitUIChildMenuNode("Time: ", noone, objUIScoreTimeIndexer, true, false);
fncInitUIChildMenuNode("Damage got: ", noone, objUIScoreDamageGotIndexer, true, false);
fncInitUIChildMenuNode("Enemies eliminated: ", noone, objUIScoreEnemiesDestroyed, true, false);
fncInitUIChildMenuNode("Total score: ", noone, objUIScoreTotalIndexer, true, false);

function fncSaveData()
{
	with (objSaveDataManager)
	{
		switch (objRoomManager.lastStage)
		{
			case RoomStartStage:
			{
				if (currentPlayerData.stageScore.stage_0.highestScore < other.resultData.totalScore)
					currentPlayerData.stageScore.stage_0.highestScore = other.resultData.totalScore;
				currentPlayerData.stageScore.stage_1.active = 1;
				currentPlayerData.stageScore.stage_2.active = 1;
			}	break;
		
			case RoomElecStage:
			{
				if (currentPlayerData.stageScore.stage_1.highestScore < other.resultData.totalScore)
					currentPlayerData.stageScore.stage_1.highestScore = other.resultData.totalScore;
				currentPlayerData.modelUnlock.modelH.isActived = 1;
			}	break;
		
			case RoomIceStage:
			{
				if (currentPlayerData.stageScore.stage_2.highestScore < other.resultData.totalScore)
					currentPlayerData.stageScore.stage_2.highestScore = other.resultData.totalScore;
				currentPlayerData.modelUnlock.modelL.isActived = 1;
			}	break;
		}
		
		fncSaveGameDataSlot(playSlot);
		fncSaveGameData();
		fncLoadGameData();
		fncLoadGameDataSlot(playSlot);
	}
}

function fncUIExit()
{
	if (keyboard_check_pressed(vk_anykey))
	{
		if (scoreDisplayState == 4)
		{
			fncUICloseMenu();
			return true;
		}
	}
}

scoreDisplayState = 0;
scoreDisplayStateSub = 0;

resultData =
{
	currentScore : 0,
	timeElapsed : 0,
	enemiesDestroyed : 0,
	damageGot : 0,
	totalScore : 0,
	clearBonus : false
}

if (ds_list_size(childMenuNodeList) > 0)
{
	timeElapsedContext = ds_list_find_value(childMenuNodeList, 0).childContext;
	dmgGotContext = ds_list_find_value(childMenuNodeList, 1).childContext;
	enemiesDestroyedContext =  ds_list_find_value(childMenuNodeList, 2).childContext;
	totalScoreContext =  ds_list_find_value(childMenuNodeList, 3).childContext;

	timeElapsedContext.UIContext.isVisible = false;
	dmgGotContext.UIContext.isVisible = false;
	enemiesDestroyedContext.UIContext.isVisible = false;
	totalScoreContext.UIContext.isVisible = false;
}