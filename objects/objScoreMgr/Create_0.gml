/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
depth = -1000;

enum ScoreMgrState {PAUSE, CACULATE};

state = ScoreMgrState.CACULATE;

resultCaculator =
{
	currentScore : 0,
	timeElapsed : 0,
	enemiesDestroyed : 0,
	damageGot : 0,
	clearBonus : false
}