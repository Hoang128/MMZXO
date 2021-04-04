/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp = 8;
damage = 2;

enum gunTotemState {INIT, IDLE, OPEN, CLOSE, SHOT, CHANGE_DIR};

state = gunTotemState.INIT;

shot = false;
waitTime = 0;
waitCreateSpark = 0;
waitTimeMax = {idle : 120, shot: 120, createSpark: 120};
waitToShot = 0;

spark = noone;

destroyPiece.sprite = sprGunTotemEPieces;
destroyPiece.number = 3;
destroySlashPiece.sprite = sprGunTotemESlashPieces;
destroySlashPiece.vMove = 0.5;
destroySlashPiece.hMove = 1;

topBlock = noone;
botBlock = noone;

function fncChangeDirToCam()
{
	image_xscale = -1;
	if ((objGameView.x - x) != 0)
		image_xscale = sign(objGameView.x - x);
}

function fncIsPlayerAhead(player)
{
	if (instance_exists(player))
	{
		if (image_xscale == sign(player.x - x))
		{
			return true;
		}
	}
	return false;
}