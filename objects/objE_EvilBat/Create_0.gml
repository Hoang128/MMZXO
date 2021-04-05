/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp = 1;
damage = 1;

destroyPiece.sprite = sprEvilBatPieces;
destroyPiece.number = 6;

enum evilBatState {INIT, IDLE, DRILL_DOWN, FLY_TO_PLAYER, FLY_UP };

state = evilBatState.INIT;
flySpd = 1;
drillSpd = 2;
flyDownRange = 200;
waitToFly = 0;
waitToDrill = 0;
waitTimeMaxDrill = 60;
waitTimeMax = 120;

imgSpd = 1;

function fncIsPlayerInRange(player)
{
	if (distance_to_object(player) < flyDownRange)
	{
		return true;
	}
	else
	{
		return false;
	}
}

function fncHandleFlyToPlayerState(player)
{
	if (distance_to_point(player.x, player.y - 48) > 8)
	{
		move_towards_point(player.x, player.y - 48, flySpd);
	}
	else
	{
		motion_set(0, 0);
		state = evilBatState.DRILL_DOWN;
		sprite_index = sprEvilBatDrill;
		waitToDrill = waitTimeMaxDrill;
	}
}