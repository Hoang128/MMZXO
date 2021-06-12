/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
phase = 0;
jumpSpd = 3;
moveSpd = 3;
standWaitMax = 1;
standWait = standWaitMax;
changeToStand = false;
distanceToWallJump = 64;

function fncDoJump()
{
	phase = 1;
	with (core.id)
	{
		sprite_index = sprCInarabitta_Jump;
		image_index = 0;
		physic.onGround = false;
		vspd = -other.jumpSpd;
		hspd = image_xscale * other.moveSpd;
	}
}

function fncSetSprite()
{
	if (phase == 1)
	{
		with (core.id)
		{
			if (vspd > 0)
				image_index = 1;
			else
				image_index = 0;
		}
	}
}

function fncStateStart()
{
	with (core.id)
	{
		physic.enable = true;
		physic.gravAffect = true;
		physic.onGround = true;
	}
	
	fncDoJump();
}

function fncStateRun()
{
	fncSetSprite();
	
	switch (phase)
	{
		case 0:
		{
			with (core.id)
			{
				if (other.standWait > 0)
				{
					other.standWait -= TIME_SCALE;
				}
				else
				{
					var rect = 
					{
						x1 : x,
						y1 : y - 10,
						x2 : x + image_xscale * other.distanceToWallJump,
						y2 : y - 14
					}
					with (other)
					{
						if (collision_rectangle(rect.x1, rect.y1, rect.x2, rect.y2, objBlock, false, true))
						{
							fncDoDequeueMove();
							return;
						}
						else
						{
							fncDoJump();
						}
					}
					other.standWait = other.standWaitMax;
				}
			}
		}	break;
		case 1:
		{
			with (core.id)
			{
				if (physic.onGround)
				{
					other.phase = 2;
					vspd = 0;
					hspd = 0;
					sprite_index = sprCInarabitta_Land;
					image_index = 0;
				}
			}
		}
		case 2:
		{
			if (changeToStand)
			{
				phase = 0;
				with (core.id)
				{
					sprite_index = sprCInarabitta_Idle;
					image_index = 0;
				}
				changeToStand = false;
			}
		}
	}
}

function fncStateEnd()
{
}