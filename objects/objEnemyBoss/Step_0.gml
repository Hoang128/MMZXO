/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!inited)
{
	if (instance_exists(bossManager))
	{
		if (instance_exists(bossManager.bossOpenCutEndIns))
			instance_destroy(bossManager.bossOpenCutEndIns);
	}
	
	with (objBGMManager)
	{
		fncBGMSet(other.bossBGM, false);
	}
	inited = true;
}

if (inviTime > 0)
{
	inviTime -= TIME_SCALE;
}
else
{
	inviTime = 0;
}

with (bossStateMachine)
{
	fncStateHandle();
}