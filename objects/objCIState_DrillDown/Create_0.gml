/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
waitToDrill = 10;
phase = 0;
drillSpd = 4;
drillSpace = 16;
canCheckColDown = false;
changeState = false;
xDrill = 0;
shot = false;

function fncCreateIceSpike()
{
	var objSpike0 = instance_create_depth(x + 24, y + 14, depth - 1, objCI_IceSpike);
	objSpike0.moveDir = 20;
	objSpike0.image_xscale = 1;
	
	var objSpike1 = instance_create_depth(x - 24, y + 14, depth - 1, objCI_IceSpike);
	objSpike1.moveDir = 20;
	objSpike1.image_xscale = -1;
	
	var objSpike2 = instance_create_depth(x + 21, y + 7, depth - 1, objCI_IceSpike);
	objSpike2.moveDir = 40;
	objSpike2.image_xscale = 1;
	objSpike2.image_index = 1;
	
	var objSpike3 = instance_create_depth(x - 21, y + 7, depth - 1, objCI_IceSpike);
	objSpike3.moveDir = 40;
	objSpike3.image_xscale = -1;
	objSpike3.image_index = 1;
}

function fncStateStart()
{
	xDrill = (core.id.bossFightZone.bbox_left + core.id.bossFightZone.bbox_right) / 2;
}

function fncStateRun()
{
	if (changeState)
	{
		fncDoDequeueMove();
	}
	switch (phase)
	{
		case 0:
		{
			if (waitToDrill > 0)
			{
				with (core.id)
					other.waitToDrill -= TIME_SCALE;
			}
			else
			{
				phase = 1;
				with (core.id)
				{
					sprite_index = sprCInarabitta_DrillDown;
					image_index = 0;
					
					if (instance_exists(objGlobalManager.currentPlayer))
						other.xDrill = objGlobalManager.currentPlayer.x;
					
					x = clamp(other.xDrill, bossFightZone.bbox_left + 24, bossFightZone.bbox_right - 24);
					vspd = other.drillSpd;
				}
			}
		}	break;
		
		case 1:
		{
			if (!canCheckColDown)
			{
				with (core.id)
				{
					if (!place_meeting(x, y, objBlock))
					{
						other.canCheckColDown = true;
					}
				}
			}
			else
			{
				with (core.id)
				{
					if (place_meeting(x, y + other.drillSpd + other.drillSpace, objBlock))
					{
						vspd = 0;
						move_contact_solid(270, 0);
						y -= other.drillSpace;
						sprite_index = sprCInarabitta_DrillDownEnd;
						image_index = 0;
						other.phase = 2;
					}
				}
			}
		}	break;
	}
}

function fncStateEnd()
{
	with (core.id)
	{
		x += 8*image_xscale;
		y -= 13;
		image_xscale *= -1;	
		sprite_index = sprCInarabitta_JumpSpinBack;
		image_index = 0;
	}
}