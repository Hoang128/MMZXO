/// @description Insert description here
// You can write your code in this editor
switch (pattern)
{
	case 0:
	{
		var obj0 = instance_create_depth(x + 24, y, depth, objHCycloneH);
		obj0.direction = 0;
		var obj1 = instance_create_depth(x - 24, y, depth, objHCycloneH);
		obj1.direction = 180;
	}	break;
	
	case 1:
	{
		var obj0 = instance_create_depth(x + image_xscale * 24, y + 8, depth, objHCycloneV);
		obj0.direction = 90 - image_xscale * 70;
		var obj1 = instance_create_depth(x + image_xscale * 24, y - 8, depth, objHCycloneV);
		obj1.direction = 270 + image_xscale * 70;
	}	break;
}
	
instance_destroy();