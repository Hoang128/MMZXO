/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

gateBlock = noone;
state = 0;

function fncGateCreateBlock()
{
	if (gateBlock == noone)
	{
		gateBlock = instance_create_depth(x, y, depth, objBlock);
		gateBlock.x = x - 16;
		gateBlock.y = y - 72;
		gateBlock.image_xscale = 4;
		gateBlock.image_yscale = 10;
	}
}

function fncCanBeOpen(player)
{
	if (fncCanBeOpenNormal(player))
		return true;
	return false;
}

function fncCanBeOpenNormal(player)
{
	if (place_meeting(x, y, player))
	{
		if (player.bbox_top > bbox_top)
		{
			if (player.bbox_bottom < bbox_bottom)
			{
				if (player.vspd >= 0)
				{
					if (player.charDir == sign(self.x - player.x))
						return true;
				}
			}
		}
	}
}