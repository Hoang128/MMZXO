/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

fncStaticDestroyOutScreen(self);

if (!scaleFull)
{
	if (image_xscale < 1)
	{
		image_xscale += scaleSpd * TIME_SCALE;
	}
	else
	{
		image_xscale = 1;
	}

	if (image_yscale < 1)
	{
		image_yscale += scaleSpd * TIME_SCALE;
	}
	else
	{
		image_yscale = 1;
	}
	
	if ((image_xscale == 1) & (image_yscale == 1))
	{
		scaleFull = true;
	}
}
else
{
	if (existTime > 0)
	{
		existTime -= TIME_SCALE;
	}
	else
	{
		existTime = 0;
		instance_destroy();
	}
	
	if (!instance_exists(firstSlash)
	|| !place_meeting(x, y, firstSlash))
	{
		var colMeleeWeapon = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, objPlayerWeaponMelee, true, false);
		if (colMeleeWeapon)
		{
			var hDir = sign(x - colMeleeWeapon.x);
			if (hDir == 0)	hDir = 1;
			fncCreateIceSpike(hDir);
			instance_destroy();
		}
	}
	
	if (physic.inWater == InWater.FULL)
	{
		if (physic.gravAffect)
		{
			vspd = 0;
			physic.gravAffect = false;
			physic.enviMoveRatio.x *= physic.waterRatio.x;
			physic.enviMoveRatio.y *= physic.waterRatio.y;
		}
		else
		{
			if (collision_rectangle(bbox_left, bbox_top - 1, bbox_right, bbox_top, objZoneWater, false, false)
			&& !place_meeting(x, y - 1, objBlock) && !place_meeting(x, y - 1, objBlockThin))
			{
				if (vspd < global.gravMax * physic.enviMoveRatio.y)
					vspd -= global.gravAcc * TIME_SCALE * physic.enviMoveRatio.y;
				else
					vspd = -global.gravMax * physic.enviMoveRatio.y;
			}
			else
			{
				vspd = 0;
			}
		}
	}
	else
	{
		if (!physic.gravAffect)
		{
			physic.gravAffect = true;
			physic.enviMoveRatio.x /= physic.waterRatio.x;
			physic.enviMoveRatio.y /= physic.waterRatio.y;
		}
	}
}