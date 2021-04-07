/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp = 4;
damage = 2;

destroyPiece.sprite = sprProcessorPieces;
destroyPiece.number = 4;
destroySlashPiece.sprite = sprProcessorSlashPieces;
destroySlashPiece.vMove = 0.5;
destroySlashPiece.hMove = 1;
physic.enable = true;

activeRange = 128;
flyRange = 0;
moveSpd = 3;
burstBackSpd = 2;
guard = 0.5;
waitTime = 0;
burstBackTimeMax = 15;

enum processorState {INIT, FLY, CHANGE_DIR, BURST_BACK};

state = processorState.INIT;

function fncChangeDirToCam()
{
	image_xscale = -1;
	if ((objGameView.x - x) != 0)
		image_xscale = sign(objGameView.x - x);
}

function fncOnGetDamage(realDamage)
{
	if (realDamage <= 0)
	{
		if (state == processorState.FLY)
		{
			state = processorState.BURST_BACK;
			waitTime = burstBackTimeMax;
			hspd = burstBackSpd * -image_xscale;
		}
	}
}