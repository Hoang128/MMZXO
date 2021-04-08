/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

bossZone = noone;

sprGate.sprClose = sprGateBClose;
sprGate.sprClosing = sprGateBClosing;
sprGate.sprOpen = sprGateBOpen;
sprGate.sprOpening = sprGateBOpening;

inited = false;

function fncGateClose()
{
	sprite_index = sprGate.sprClose;
	image_index = 0;
	state = 1;
	//Debug
	
	if (instance_exists(bossZone) && bossZone != noone)
	{
		if (fncPlayerColFightZone(objGlobalManager.currentPlayer) && bossZone.haveBoss)
		{
			bossZone.bossManagerInstance = instance_create_depth(bossZone.x, bossZone.y, depth, bossZone.bossManager);
			bossZone.bossManagerInstance.bossZone = bossZone;
		}
		else
		{
			global.gameState = GameState.INGAME_GAMEPLAY;
		}
	}
	else
	{
		global.gameState = GameState.INGAME_GAMEPLAY;
	}
	
	fncGateCreateBlock();
}

function fncCanBeOpen(player)
{
	if (instance_exists(bossZone) && bossZone != noone)
	{
		if (bossZone.haveBoss)
		{
			if (fncCanBeOpenBoss(player))
				return true;
		}
		else
		{
			if (fncCanBeOpenNormal(player))
				return true;
		}
	}
	else
	{
		if (fncCanBeOpenNormal(player))
			return true;
	}
	return false;
}

function fncPlayerColFightZone(player)
{
	if (instance_exists(bossZone) && (bossZone != noone))
	{
		if (instance_exists(player))
		{
			if (collision_rectangle(bossZone.bbox_left, bossZone.bbox_top, bossZone.bbox_right, bossZone.bbox_bottom, player, false, true))
			{
				return true;
			}
		}
	}
	
	return false;
}

function fncCanBeOpenBoss(player)
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
					{
						if (sign(player.x - x) != sign(bossZone.x - x))
							return true;
					}
				}
			}
		}
	}
}