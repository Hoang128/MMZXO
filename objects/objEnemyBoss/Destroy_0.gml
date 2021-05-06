/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited(); 

if (weaponTypeCauseDeath != PlayerWeaponType.MELEE)
{
	var objDeathImg = instance_create_depth(x, y, depth, objBossDeadByBuster);
	objDeathImg.image_xscale = image_xscale;
	objDeathImg.sprite_index = deadImageByBuster;
}

with (bossManager)
{
	fncChangeToEndCutsceneState();
	x = (other.bbox_left + other.bbox_right) / 2;
	y = (other.bbox_top + other.bbox_bottom) / 2;
}

if (instance_exists(objScoreMgr))
{
	if (objScoreMgr.state == ScoreMgrState.CACULATE)
	{
		objScoreMgr.state = ScoreMgrState.PAUSE;
	}
}