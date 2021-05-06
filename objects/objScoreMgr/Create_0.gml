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
	totalScore : 0,
	clearBonus : false
}

function fncOnDestroy()
{
	fncCaculateTotalScore();
	if (instance_exists(objUIScoreMenu))
	{
		with (objUIScoreMenu)
		{
			resultData.currentScore     = other.resultCaculator.currentScore;
			resultData.timeElapsed      = other.resultCaculator.timeElapsed;
			resultData.enemiesDestroyed = other.resultCaculator.enemiesDestroyed;
			resultData.damageGot        = other.resultCaculator.damageGot;
			resultData.totalScore       = other.resultCaculator.totalScore;
			resultData.clearBonus       = other.resultCaculator.clearBonus;
		}
	}
}

function fncCaculateTotalScore()
{
	resultCaculator.totalScore = resultCaculator.enemiesDestroyed * 100 + resultCaculator.damageGot * 10;
	var bonusTimeScore = 0;
	if (resultCaculator.timeElapsed < 120)
		bonusTimeScore = 300;
	else if (resultCaculator.timeElapsed < 240)
		bonusTimeScore = 200;
	else if (resultCaculator.timeElapsed < 360)
		bonusTimeScore = 100;
	resultCaculator.totalScore += bonusTimeScore;
}