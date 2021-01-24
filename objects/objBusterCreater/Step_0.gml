/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!instance_exists(core))
	instance_destroy();

if (!inited)
{
	fncSetCreatePosition();
	image_xscale = core.image_xscale;
	
	if (buster != noone)
	{
		var objBuster = instance_create_depth(createPosition.x, createPosition.y, createPosition.depth, buster);
		if (reserved)
			objBuster.image_xscale = -image_xscale;
		else
			objBuster.image_xscale = image_xscale;
	}
	
	inited = true;
}

if (inited)
	instance_destroy();