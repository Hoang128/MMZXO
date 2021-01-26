/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (waitY > 0)
	waitY -= TIME_SCALE;
else
{
	if (phase == 1)
	{
		if (dir == 1)
		{
			if (scale != 1)
			{
				scale = 1;
				if (sign(image_xscale) == 1)
					image_xscale = scale * numberScale;
				else
					image_xscale = -scale * numberScale;
				image_yscale = scale * numberScale;
			}
			if (self.y > (yCenter - orbitRad))
				vspd = -ySpd;
			else
			{
				depth = core.depth + localDepth * dir;
				dir = -1;
			}
		}
		else if (dir == -1)
		{
			if (scale != 0.8)
			{
				scale = 0.8;
				if (sign(image_xscale) == 1)
					image_xscale = scale * numberScale;
				else
					image_xscale = -scale * numberScale;
				image_yscale = scale * numberScale;
			}
			if (self.y < (yCenter + orbitRad))
				vspd = ySpd;
			else
			{
				depth = core.depth + localDepth * dir;
				dir = 1;
			}
		}
		
		if (dir == dirEnd)	phase = 2;
	}
	else if (phase == 2)
	{
		if (dir == 1)
		{
			if (scale != 1)
			{
				scale = 1;
				if (sign(image_xscale) == 1)
					image_xscale = scale * numberScale;
				else
					image_xscale = -scale * numberScale;
				image_yscale = scale * numberScale;
			}
		}
		else if (dir == -1)
		{
			if (scale != 0.8)
			{
				scale = 0.8;
				if (sign(image_xscale) == 1)
					image_xscale = scale;
				else
					image_xscale = -scale;
				image_yscale = scale;
			}
		}
		damage = damageP2;
		vspd = -dir * ySpd;
		phase = 3;
	}
}