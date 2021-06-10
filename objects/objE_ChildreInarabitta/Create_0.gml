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
	fncStateChange(objCIStateIdle);

//for debug
move_contact_solid(270, 0);

/*
ds_map_add(moveRatio, "release bat", 1);
ds_map_add(moveRatio, "release sonic", 1);
ds_map_add(moveRatio, "teleport", 1);
ds_map_add(moveRatio, "shot down", 1);
ds_map_add(moveRatio, "thunder clap", 1);
*/

/*
function fncGetBatMoveSequence(stringMove)
{
	switch (stringMove)
	{
		case "release bat":
		{
			with (bossStateMachine)
			{
				fncStateEnqueue(objHBSStateFlyDown);
				fncStateEnqueue(objHBSStateSpamBat);
			}
		}	break;
		
		case "release sonic":
		{
			with (bossStateMachine)
			{
				fncStateEnqueue(objHBSStateTele);
				fncStateEnqueue(objHBSStateSpamSonic);
			}
		}	break;
		
		case "teleport":
		{
			with (bossStateMachine)
			{
				fncStateEnqueue(objHBSStateTele);
			}
		}	break;
		
		case "shot down":
		{
			with (bossStateMachine)
			{
				fncStateEnqueue(objHBSStateTele);
				fncStateEnqueue(objHBSStateShotDown);
				fncStateEnqueue(objHBSStateTeleAfterShot);
			}
		}	break;
		
		case "thunder clap":
		{
			with (bossStateMachine)
			{
				fncStateEnqueue(objHBSStateFlyDown);
				fncStateEnqueue(objHBSStateThunderClap);
				fncStateEnqueue(objHBSStateFlyUp);
			}
		}
	}
	with (bossStateMachine)
	{
		fncStateEnqueue(objHBSStateIdle);
	}
	
	lastMove = stringMove;
}