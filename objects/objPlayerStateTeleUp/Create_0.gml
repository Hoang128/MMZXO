/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
waitPhase1 = 60;
waitPhase2 = 45;
waitTime = waitPhase1;
teleTimeMax = 15;
teleTime = 0;
teleHeightMax = 240;
teleHeight = 0;
phase = 1;
alphaBlend = 0;
xScaleMin = 0.1;
xScale = 1;
yScaleMax = 4;
yScale = 1;
depth = -10;

function fncStateStart()
{
	with(core.id)
	{
		sprite_index = sprPlayer.sprStandStart;
		image_index = 0;
		visible = 0;
		move_contact_solid(270, 0);
		other.depth = depth - 1;
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
					other.phase = 2;
					other.waitTime = other.waitPhase2;
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
					if (other.teleTime < other.teleTimeMax)
					{
						other.teleTime += TIME_SCALE;
						other.alphaBlend = sqrt(other.teleTime);
						other.teleHeight += other.teleHeightMax/other.teleTimeMax * TIME_SCALE;
						other.xScale -= (1 - other.xScaleMin)/other.teleTimeMax * TIME_SCALE;
						other.yScale = 1 + (other.yScaleMax - 1)*sqrt(other.teleTime/other.teleTimeMax);
					}
					else
					{
						other.teleTime = other.teleTimeMax;
						other.alphaBlend = 1;
						other.teleHeight = other.teleHeightMax;
						other.xScale = other.xScaleMin;
						other.yScale = other.yScaleMax;
					}
				}
			}
		}	break;
	}
}

function fncStateEnd()
{

}