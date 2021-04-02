/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp = 2;
damage = 1;

destroyPiece.sprite = sprGunJumperPieces;
destroyPiece.number = 3;

physic.enable = true;
physic.onGround = true;
physic.gravAffect = true;

jumpSpd = 2;
moveSpd = 2;
canShot = true;

waitTimeMax =
{
	idle : 60
}

lastActiveState = noone;

waitTime = 0;

enum gunJumperState {INIT, IDLE, JUMP, CHANGE_DIR, FALL, SHOT};

state = gunJumperState.INIT;

function fncChangeDirToCam()
{
	image_xscale = -1;
	if ((objGameView.x - x) != 0)
		image_xscale = sign(objGameView.x - x);
}

function fncHavePlayerAhead()
{
	if (sign(objGlobalManager.currentPlayer.x - self.x) == sign(image_xscale))
	{
		return true;
	}
	return false;
}