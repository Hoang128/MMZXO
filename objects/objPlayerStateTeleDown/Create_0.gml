/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
waitPhase1 = 60;
waitPhase2 = 60;
waitTime = waitPhase1;
teleTimeMax = 15;
teleTime = teleTimeMax;
teleHeightMax = 240;
teleHeight = teleHeightMax;
phase = 1;
alphaBlend = 1;
xScaleMin = 0.1;
xScale = xScaleMin;
yScaleMax = 4;
yScale = yScaleMax;
depth = -10;

function fncStateStart()
{
	with(core.id)
	{
		sprite_index = sprPlayer.sprStand;
		image_index = 0;
		visible = 0;
		move_contact_solid(270, 0);
		other.depth = depth - 1;
		canGetDamage = false;
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
					if (other.teleTime > 0)
					{
						other.teleTime -= TIME_SCALE;
						if (other.teleTime < 0)
							other.teleTime = 0;
						else
						{
							other.alphaBlend = sqrt(other.teleTime)/2;
							other.teleHeight -= other.teleHeightMax/other.teleTimeMax * TIME_SCALE;
							other.xScale += (1 - other.xScaleMin)/other.teleTimeMax * TIME_SCALE;
							other.yScale = 1 + (other.yScaleMax - 1)*sqrt(other.teleTime/other.teleTimeMax);
						}
					}
					else
					{
						other.teleTime = 0;
						other.alphaBlend = 0;
						other.teleHeight = 0;
						other.xScale = 1;
						other.yScale = 1;
						visible = 1;
					}
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
	global.gameState = GameState.INGAME_GAMEPLAY;
	with (core.id)
	{
		canGetDamage = true;
	}
}