/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp = 2;

destroyPiece.sprite = sprTrooperPiece;
destroyPiece.number = 3;
destroySlashPiece = sprTrooperSlashPieces;

explosionCount = 3;

physic.enable = true;

runSpeed = 1;
shotNumber = 1;
canShot = 0;
waitTimeMax = 60;
activeRange = 64;
waitToShotMax = 120;

waitToShot = 0;
waitTime = waitTimeMax;
runRange = 0;
shotTime = 0;

enum gunTrooperState {INIT, STAND, RUN, SHOT};

state = gunTrooperState.INIT;

function fncIsPlayerAhead(player)
{
	if (instance_exists(player))
	{
		if (!collision_line(
		(bbox_left + bbox_right) / 2, 
		(bbox_top + bbox_bottom) / 2, 
		(player.bbox_left + player.bbox_right) / 2, 
		(player.bbox_top + player.bbox_bottom) / 2, 
		objBlock, false, false))
		{
			if (image_xscale == sign(player.x - x))
			{
				return true;
			}
		}
	}
	return false;
}

function fncIsReadyToAttack(player)
{
	if (fncIsPlayerAhead(player))
	{
		return true;
	}
	return false;
}