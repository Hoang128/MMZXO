/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

enum bossFightState {INIT, OPEN_CUTSCENE, FIGHT, END_CUTSCENE};

state = bossFightState.INIT;

boss = noone;
bossInstance = noone;
bossHpBar = noone;
bossSpawnPos = {x : VIEW_X + VIEW_W / 2, y : VIEW_Y + VIEW_H / 2};
bossOpenCutsceneObj = noone;
bossCloseCutsceneObj = noone;
bossOpenCutEndObj = noone;
bossOpenCutEndIns = noone;
bossZone = noone;

with (objBGMManager)
{
	fncBGMStop();
}

function fncChangeToEndCutsceneState()
{
	global.gameState = GameState.INGAME_CUTSCENE;
	
	if (bossCloseCutsceneObj != noone)
	{

		instance_create_depth(x, y, depth, bossCloseCutsceneObj);
		bossHpBar.phase = 2;

		state = bossFightState.END_CUTSCENE;
	}
	else
	{
		instance_create_depth(x, y, depth, objCutSegmentTeleport);
		state = bossFightState.END_CUTSCENE;
		//instance_destroy();
	}
}

function fncChangeToBossFightState()
{
	state = bossFightState.FIGHT;
	if (boss != noone)
	{
		global.gameState = GameState.INGAME_GAMEPLAY;
		bossInstance = instance_create_depth(bossSpawnPos.x, bossSpawnPos.y, depth, boss);
		bossInstance.bossManager = self;
		bossHpBar = instance_create_depth(x, y, depth, objHUDBoss);
		bossHpBar.boss = bossInstance;
	}
}