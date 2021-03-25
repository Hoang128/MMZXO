/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
waitPhase1 = 30;
waitPhase2 = 60;
waitTime = waitPhase1;
phase = 1;

function fncStateStart()
{
	with(core.id)
	{
		sprite_index = sprPlayer.sprStand;
		image_index = 0;
		
		move_contact_solid(270, 0);
	}
}

function fncStateInit()
{
}

function fncStateRun()
{
	switch (phase)
	{
		case 1:
		{
			with(core.id)
			{
				if (other.waitTime > 0)
				{
					other.waitTime -= TIME_SCALE;
				}
				else
				{
					sprite_index = sprPlayer.sprStandEnd;
					image_index = 0;
					other.phase = 1.5;
				}
			}
		}	break;
		case 2:
		{
			with(core.id)
			{
				if (other.waitTime > 0)
				{
					other.waitTime -= TIME_SCALE;
				}
				else
				{
					with (playerStateMachine)
						fncStateChange(objPlayerStateIdle);
				}
			}
		}	break;
	}
}

function fncStateEnd()
{
}