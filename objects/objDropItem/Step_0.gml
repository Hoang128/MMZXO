/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (existTime > 0)
{
	existTime -= TIME_SCALE;
	if (existTime <= 100)
	{
		if (blinkTime > 0)
		{
			blinkTime -= TIME_SCALE;
			if (blinkTime > blinkTimeMax/2)
			{
				if (image_alpha != 0.2)
					image_alpha = 0.2;
			}
			else
			{
				if (image_alpha != 0.8)
					image_alpha = 0.8;
			}
		}
		else
		{
			blinkTime = blinkTimeMax;
		}
	}
}
else
	instance_destroy();