/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp = 64;
damage = 2;

destroySlashPiece.sprite = sprCInarabitta_SlashPieces; 
destroySlashPiece.hMove = 2;
destroySlashPiece.waitTime = 240;

deadImageByBuster = sprCInarabitta_Pieces; 

inited = false;

bossStateMachine.coreType = "ChildreInarabitta";

bossFightZone = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, objBossFightZone, false, false);

moveRatio = ds_map_create();

with(bossStateMachine)
	fncStateChange(objCIState_Idle);

//for debug
move_contact_solid(270, 0);

ds_map_add(moveRatio, "launch missle", 1);
//ds_map_add(moveRatio, "drill down", 1);
//ds_map_add(moveRatio, "set mines", 1);
//ds_map_add(moveRatio, "ice arrow", 1);



function fncGetBossMoveSequence(stringMove)
{
	switch (stringMove)
	{
		case "launch missle":
		{
			with (bossStateMachine)
			{
				fncStateEnqueue(objCIState_LaunchMissle);
			}
		}	break;	
	}
	
	with (bossStateMachine)
	{
		fncStateEnqueue(objCIState_Idle);
	}
	
	lastMove = stringMove;
}