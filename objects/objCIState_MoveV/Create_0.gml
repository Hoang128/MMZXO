/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
wallOnGround = true;
phase = 0;
moveSpd = 3;
jumpSpd = 3;
standWaitMax = 1;
standWait = standWaitMax;
changeToStand = false;
drillDownTopLimit = 72;

function fncDoJump()
{
	phase = 1;
	with (core.id)
	{
		sprite_index = sprCInarabitta_JumpWall;
		image_index = 0;
		other.wallOnGround = false;
		vspd = -other.moveSpd;
		hspd = -image_xscale * other.jumpSpd;
	}
}

function fncGravityCalculate()
{
	with (core.id)
	{
		if (place_meeting(x + image_xscale * global.gravMax, y, objBlock))
		{
			if (sign(hspd) == sign(image_xscale))
			{
				other.wallOnGround = true;
				move_contact_solid(90 - 90 * image_xscale, 0);
			}
		}
		else
		{
			if (!other.wallOnGround)
			{
				if (abs(hspd) < global.gravMax)
					hspd += image_xscale * global.gravAcc * TIME_SCALE;
				else
					hspd = image_xscale * global.gravMax;
			}
			else
			{
				other.wallOnGround = false;
			}
		}
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
	fncDoJump();
	audio_play_sound_on(global.emitterSFX.source, sfxCI_VoiceClimb, false, true);
}

function fncStateRun()
{
	fncGravityCalculate();
	fncSetSprite();
	with (core.id)
	{
		if ((bossFightZone.bbox_top - self.y) >= other.drillDownTopLimit)
		{
			with (other)
				fncDoDequeueMove();
		}
	}
	
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
					with (other)
						fncDoJump();
					other.standWait = other.standWaitMax;
				}
			}
		}	break;
		case 1:
		{
			with (core.id)
			{
				if (other.wallOnGround)
				{
					other.phase = 2;
					vspd = 0;
					hspd = 0;
					sprite_index = sprCInarabitta_LandWall;
					image_index = 0;
					
					audio_play_sound_on(global.emitterSFX.source, sfxCI_Land, false, true);
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
					sprite_index = sprCInarabitta_IdleWall;
					image_index = 0;
				}
				changeToStand = false;
			}
		}
	}
}

function fncStateEnd()
{
	with (core.id)
	{
		hspd = 0;
		vspd = 0;
	}
}