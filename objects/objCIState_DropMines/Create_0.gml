/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
phase = 0;
canCheckColDown = false;
changeState = false;
jumpSpd = 2.5;
moveSpd = 2.5;
jumpTime = 4;

function fncDoJump()
{
	phase = 1;
	with (core.id)
	{
		physic.onGround = false;
		sprite_index = sprCInarabitta_Jump;
		image_index = 0;
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
		vspd = global.gravMax;
		physic.enable = false;
		physic.gravAffect = false;
		
		sprite_index = sprCInarabitta_Jump;
		image_index = 1;
		image_xscale *= -1;
		
		if (image_xscale == -1)
		{
			x = bossFightZone.bbox_right - 24;
		}
		else
		{
			x = bossFightZone.bbox_left + 24;
		}
	}
}	

function fncStateRun()
{
	if (changeState)
	{
		fncDoDequeueMove();
	}
	
	fncSetSprite();
	if (!canCheckColDown)
	{
		with (core.id)
		{
			if (!place_meeting(x, y, objBlock))
			{
				other.canCheckColDown = true;
				physic.enable = true;
				physic.gravAffect = true;
				physic.onGround = false;
			}
		}
	}
	else
	{
		if (jumpTime > 0)
		{
			with (core.id)
			{
				if (vspd > 0)
				{
					if (place_meeting(x, y + 1, objZoneWater))
					{
						instance_create_depth(x, y, depth, objCI_Mine);
						with (other)
							fncDoJump();
						other.jumpTime--;
					}
				}
			}
		}
		else
		{
			with (core.id)
			{
				if (physic.onGround)
				{
					sprite_index = sprCInarabitta_Land;
					image_index = 0;
					
					with (other)
						fncDoDequeueMove();
				}
			}
		}
	}
}

function fncStateEnd()
{
}