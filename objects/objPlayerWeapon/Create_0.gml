/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

weaponType = PlayerWeaponType.OBJECTIVE;
element = Element.NEUTRAL;
isGuardBreaker = false;
maxTimmer = 2;
collisionSFX = sfxEnemyHit;
canHitEnemy = true;

enemyIgnoreList = ds_list_create();

function fncIsEnemyIgnored(enemy)
{
	if (ds_list_empty(enemyIgnoreList))
		return false;
	else
	{
		for (var i = 0; i < ds_list_size(enemyIgnoreList); i++)
		{
			if (ds_list_find_value(enemyIgnoreList, i) == enemy)
				return true;
		}
		
		return false;
	}
}