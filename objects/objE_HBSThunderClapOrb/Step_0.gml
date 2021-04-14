/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (waitTime > 0)
{
	waitTime -= TIME_SCALE;
}
else
{
	if (waitTime != 0)
		waitTime = 0;
		
	if (!canChangeDir)
		canChangeDir = true;
}

if (!place_meeting(x + image_xscale * moveSpd * TIME_SCALE, y, objBlock))
{
	x += image_xscale * moveSpd * TIME_SCALE;
}
else
{
	if (changeDirTime > 0)
	{
		if (canChangeDir)
		{
			image_xscale *= -1;
			changeDirTime--;
			waitTime = waitMax;
			canChangeDir = false;
		}
	}
	else
	{
		instance_destroy();
	}
}