/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp = 64;
damage = 3;

physic.waterRatio.y = 1;

destroySlashPiece.sprite = sprCInarabitta_SlashPieces; 
destroySlashPiece.hMove = 2;
destroySlashPiece.waitTime = 240;

voiceDie = sfxCI_Die;

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
ds_map_add(moveRatio, "drill down", 1);
ds_map_add(moveRatio, "drop mines", 1);
ds_map_add(moveRatio, "ice arrow", 1);



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
		
		case "drill down":
		{
			with (bossStateMachine)
			{
				fncStateEnqueue(objCIState_MoveH);
				fncStateEnqueue(objCIState_MoveToWall);
				fncStateEnqueue(objCIState_MoveV);
				fncStateEnqueue(objCIState_DrillDown);
				fncStateEnqueue(objCIState_JumpBack);
			}
		}	break;
		
		case "drop mines":
		{
			with (bossStateMachine)
			{
				fncStateEnqueue(objCIState_MoveH);
				fncStateEnqueue(objCIState_MoveToWall);
				fncStateEnqueue(objCIState_MoveV);
				fncStateEnqueue(objCIState_DropMines);
			}
		}	break;
		
		case "ice arrow":
		{
			with (bossStateMachine)
			{
				fncStateEnqueue(objCIState_Slash);
			}
		}	break;
	}
	
	with (bossStateMachine)
	{
		fncStateEnqueue(objCIState_Idle);
	}
	
	lastMove = stringMove;
}