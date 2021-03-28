/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp = 3;

destroyPiece.sprite = sprHermitCrabPieces;
destroyPiece.number = 6;
//destroySlashPiece = sprTrooperSlashPieces;

enum hermitCrabState {INIT, IDLE, RUN, CLOSE_SHELL, OPEN_SHELL, SHOT, IN_SHELL};
state = hermitCrabState.INIT;

runSpd = 2;
dir = 0;
waitIdleMax = 2;
waitCloseShellMax = 2;
distanceToShot = 200;
yDistanceToShot = 160;
xDistanceToShot = 120;
waitToShotmax = 120;
shotPos = {x : 0, y : 8};
shotBullet = array_create(3, false);

isCloseShellToShot = false;
waitTime = 0;
waitToShot = 0;

physic.enable = true;
physic.onGround = true;

function fncIsPlayerInRange(player)
{
	if (instance_exists(player))
	{
		if (distance_to_point((player.bbox_left + player.bbox_right) / 2 , (player.bbox_top + player.bbox_bottom) / 2) <= distanceToShot)
		{
			if (abs(self.x - player.x) <= xDistanceToShot)
			{
				if (image_yscale > 0)
				{
					if ((self.y - player.y) <= yDistanceToShot)
					{
						return true;
					}
				}
				else
				{
					if ((player.y - self.y) <= yDistanceToShot)
					{
						return true;
					}
				}
			}
		}
	}
	return false;
}

function fncIsReadyToAttack(player)
{
	if (fncIsPlayerInRange(player))
	{
		return true;
	}
	return false;
}

function fncChangeDirToCam()
{
	image_xscale = -1;
	if ((objGameView.x - x) != 0)
		image_xscale = sign(objGameView.x - x);
}

function fncCreateHCArrow(bulletIndex)
{
	if (shotBullet[bulletIndex] == false)
	{
		switch (bulletIndex)
		{
			case 0:
			{
				var objBullet = instance_create_depth(x + shotPos.x, y - shotPos.y * image_yscale, depth - 1, objE_HCArrowElect);
				if (image_yscale == 1)
				{
					if (image_xscale == 1)
						objBullet.image_angle = 45;
					else
						objBullet.image_angle = 135;
				}
				else
				{
					if (image_xscale == -1)
						objBullet.image_angle = 315;
					else
						objBullet.image_angle = 225;
				}
					
			}	break;
			case 1:
			{
				var objBullet = instance_create_depth(x + shotPos.x, y - shotPos.y * image_yscale, depth - 1, objE_HCArrowElect);
				if (image_yscale == 1)
					objBullet.image_angle = 90;
				else
					objBullet.image_angle = 270;
			}	break;
			case 2:
			{
				var objBullet = instance_create_depth(x + shotPos.x, y - shotPos.y * image_yscale, depth - 1, objE_HCArrowElect);
				if (image_yscale == 1)
				{
					if (image_xscale == 1)
						objBullet.image_angle = 135;
					else
						objBullet.image_angle = 45;
				}
				else
				{
					if (image_xscale == -1)
						objBullet.image_angle = 225;
					else
						objBullet.image_angle = 315;
				}
			}	break;
		}
	
		shotBullet[bulletIndex] = true;
	}
}