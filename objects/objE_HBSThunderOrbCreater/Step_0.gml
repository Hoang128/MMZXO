/// @description Insert description here
// You can write your code in this editor

if (orbNumber > 0)
{
	if (waitTime > 0)
	{
		waitTime -= TIME_SCALE;
	}
	else
	{
		var objOrb1 = instance_create_depth(x, y, depth, objE_HBSThunderOrb);
		objOrb1.image_xscale = 1;
		var objOrb2 = instance_create_depth(x, y, depth, objE_HBSThunderOrb);
		objOrb2.image_xscale = -1;
		orbNumber--;
		
		waitTime = waitToCreate;
	}
}
else
	instance_destroy();