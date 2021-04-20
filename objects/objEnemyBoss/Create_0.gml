/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp = 64;

damageRecord = 0;
damageRecordLimitSingle = 4;
damageRecordLimit = 8;

deadImageByBuster = noone;

inviTime = 0;
inviTimeMax = 180;

bossManager = noone;

lastMove = "no move";

function fncChangeDirToPlayer(player)
{
	if (instance_exists(player))
	{
		image_xscale = sign(player.x - x);
		if (image_xscale == 0)
			image_xscale = 1;
	}
}