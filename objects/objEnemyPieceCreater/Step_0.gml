/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (pieceType != noone)
{
	if (pieceNumber > 0)
	{
		if (pieceTime < pieceNumber)
		{
			if (waitTime < waitTimeMax)
			{
				waitTime += TIME_SCALE;
			}
			else
			{
				var obj = instance_create_depth(x ,y ,depth , objEnemyPiece);
				obj.hspd = hRange * hDir;
				obj.vspd = -(random(1.5) + 2.5);
				obj.sprite_index = pieceType;
				obj.image_index = pieceTime;
				if (palette != noone)
				{
					obj.palette = palette;
					obj.paletteNumber = paletteNumber;
					with (obj)
						fncStaticPalSwapInitSystem(shd_pal_swapper);
				}
				hDir *= -1;
				hRange += range;
				pieceTime ++;
				waitTime = 0;
			}
		}
		else instance_destroy();
	}
}