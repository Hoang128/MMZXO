// Auto-generated stubs for each available event.

//Sequence boss

//General
#region
function fncOnSeqBossExplosion_0()
{
	if (instance_exists(objCutSegmentBossExplosion))
	{
		with (objCutSegmentBossExplosion)
			{
				layer_sequence_x(currentSeq, objBossManager.x);
				layer_sequence_y(currentSeq, objBossManager.y);
			}
	}
}
#endregion

//Hellbat Schiltz
#region
function fncOnSeqHellBatSchilt_0()
{
	if (instance_exists(objCutscene_HBSStand))
	{
		if (instance_exists(objCutSegmentHellBatSchilt_0))
		{
			with (objCutSegmentHellBatSchilt_0)
			{
				layer_sequence_x(currentSeq, objCutscene_HBSStand.x);
				layer_sequence_y(currentSeq, objCutscene_HBSStand.y);
			}
			instance_destroy(objCutscene_HBSStand);
		}
	}
}

function fncOnSeqHellBatSchilt_1()
{
	if (instance_exists(objCutSegmentHellBatSchilt_0))
	{
		with (objHellBatSchiltMgr)
		{
			bossSpawnPos.x = layer_sequence_get_x(objCutSegmentHellBatSchilt_0.currentSeq);
			bossSpawnPos.y = layer_sequence_get_y(objCutSegmentHellBatSchilt_0.currentSeq) - 64;
			bossOpenCutEndIns = instance_create_depth(bossSpawnPos.x, bossSpawnPos.y, 0, bossOpenCutEndObj);
		}
	}
}

#endregion