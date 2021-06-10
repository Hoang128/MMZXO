/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp = 64;
damage = 3;

destroySlashPiece.sprite = sprHellBatSlashPieces; 
destroySlashPiece.hMove = 2;
destroySlashPiece.waitTime = 240;

deadImageByBuster = sprHellBatPieces;

inited = false;

bossStateMachine.coreType = "HellBatSchilt";

bossFightZone = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, objBossFightZone, false, false);
teleZone = 
{
	x_l: bossFightZone.bbox_left + 32,
	x_r: bossFightZone.bbox_right - 32,
	y_t: bossFightZone.bbox_top + 128,
	y_b: bossFightZone.bbox_bottom - 64
};

ds_map_add(moveRatio, "release bat", 1);
ds_map_add(moveRatio, "release sonic", 1);
ds_map_add(moveRatio, "teleport", 1);
ds_map_add(moveRatio, "shot down", 1);
ds_map_add(moveRatio, "thunder clap", 1);

with(bossStateMachine)
	fncStateChange(objHBSStateIdle);
	
audio_play_sound_on(global.emitterSFX.source, sfxBossHBSIdleStart, false, true);

function fncGetBossMoveSequence(stringMove)
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