/// @description Handle

event_inherited();

var xx = VIEW_X - VIEW_W / 2;
var yy = VIEW_Y - VIEW_H / 2;
var ww = VIEW_W * 2;
var hh = VIEW_H * 2;

if (collision_rectangle(ACTIVE_X, ACTIVE_Y, ACTIVE_X + ACTIVE_W, ACTIVE_Y + ACTIVE_H, self, false, false))
{
	if (!collision_rectangle(xx, yy, xx + ww, yy + hh, self,false, false))
	{
		if (child == noone)
		{
			if (childObjectType != noone)
			{
				var obj = instance_create_depth(x, y, depth, childObjectType);
				obj.parent = self;
				obj.image_xscale = image_xscale;
				obj.image_yscale = image_yscale;
				obj.image_angle = image_angle;
				
				if (childObjectPal != noone)
				{
					obj.palette = childObjectPal;
					obj.paletteNumber = childObjectPalNumber;
					with (obj)
						fncStaticPalSwapInitSystem(shd_pal_swapper);
				}
				child = obj;
			}
		}
	}
}