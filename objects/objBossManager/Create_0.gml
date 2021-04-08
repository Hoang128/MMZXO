/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

enum bossFightState {INIT, OPEN_CUTSCENE, FIGHT, END_CUTSCENE};

state = bossFightState.INIT;

boss = objEnemyBoss;
bossInstance = noone;
bossSpawnPos = {x : VIEW_X + VIEW_W / 2, y : VIEW_Y + VIEW_H / 2};
bossOpenCutsceneObj = noone;
bossCloseCutsceneObj = noone;
bossZone = noone;

function fncChangeToEndCutsceneState()
{
	global.gameState = GameState.INGAME_CUTSCENE;
	if (bossOpenCutsceneObj != noone)
	{
		instance_create_depth(x, y, depth, bossCloseCutsceneObj);
		state = bossFightState.END_CUTSCENE;
	}
	else
	{
		instance_destroy();
	}
}

function fncChangeToBossFightState()
{
	state = bossFightState.FIGHT;
	global.gameState = GameState.INGAME_GAMEPLAY;
	bossInstance = instance_create_depth(bossSpawnPos.x, bossSpawnPos.y, depth, boss);
	bossInstance.bossManager = self;
}