/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!instance_exists(core))
	instance_destroy();
else
{
	x = core.x;
	y = core.y;

	switch (phase)
	{
		case 1:
		{
			for (var i = 0; i < flareNumber; i++)
			{
				var flare = instance_create_depth(x - distance * i * core.image_xscale, y, depth + 1, objZXBusterFlare);
				flare.dir = dirStart;
				flare.orbitRad = orbitRad;
				flare.core = self;
				flare.distance = distance * i;
				flare.localDepth = (flareNumber - i);
				flare.waitY = flare.distance/2;
				flare.numberScale = (flareNumber - i*0.75) / flareNumber;
				flare.image_xscale = core.image_xscale * flare.numberScale;
				flare.image_yscale *= flare.numberScale;
				flare.depth = core.depth - flare.localDepth * dirStart;
				if (dirStart == 1)
					flare.scale = 1;
				else flare.scale = 0.5;
				ds_list_add(flareList, flare.id);
			}
			phase = 2;
		}	break;
	
		case 2:
		{
			for(var i = 0; i < flareNumber; i++)
			{
				var flare = ds_list_find_value(flareList, i);
				flare.x = x - flare.distance * core.image_xscale;
			}
			coreHspd = core.hspd;
		}	break;
	}
}