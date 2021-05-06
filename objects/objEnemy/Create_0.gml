/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp = 5;
damage = 1;
damageGot = 0;

//protect ranged attack
shield = noone;

//protect melee attack
guard = 0;
guardDir = 0;

damageTimmer = -10;

parent = noone;

bullet = false;
blink = 0;
blinkMax = 8;
blinkTime = 0;
blinkTimeMax = 4;
armor =
{
	neutralArmor : 0,
	fireArmor : 0,
	iceArmor : 0,
	electArmor : 0,
	darkArmor : 0
}
createDestroyEff = true;
destroyEff = objExplosionChain;
explosionCount = 1;
weaponTypeCauseDeath = noone;
deathDir = 1;

destroySlashPiece = {sprite : noone, hMove : 0, vMove : 0, waitTime : 20};
destroyPiece = {sprite : noone, number : 0};

palette = noone;
paletteNumber = 0;
isIllusion = false;
inPool = false;
pool = noone;

function createCollisionEffectMelee(playerDamageSource)
{
	var randomSpace = 5;
	var pos = {x : self.x, y : self.y};
	pos.x = clamp(playerDamageSource.x + (abs(playerDamageSource.sprite_width) - abs(playerDamageSource.sprite_xoffset)) * 0.75 * playerDamageSource.image_xscale, bbox_left, bbox_right);
	pos.y = clamp((playerDamageSource.core.core.bbox_top + playerDamageSource.core.core.bbox_bottom) / 2, bbox_top, bbox_bottom);
	var objSlash = instance_create_depth(pos.x, pos.y, depth - 1, objMeleeSlashEff);
	objSlash.image_angle = random(randomSpace) * 180 / randomSpace;
}

function fncRealEnemyHandleStep()
{
	if (damageTimmer > 0) damageTimmer -= TIME_SCALE;
	if ((damageTimmer <= 0) && (damageTimmer > -10)) damageTimmer = -10;

	if (blinkTime > 0)
	{
		if (blink > 0) blink -= TIME_SCALE;
		else blink = blinkMax;
		blinkTime -= TIME_SCALE;
	}
	else
	{
		blink = 0;
		blinkTime = 0;
	}

	if (hp <= 0)
	{
		instance_destroy();
	}
}

function fncOnGetDamage(realDamage)
{
	
}

function fncOnEnemyDestroy()
{
	/// @description Insert description here
	// You can write your code in this editor
	/// @description Destroy
	if (parent != noone)
	{
		with (parent)
			child = noone;
	}

	if (instance_exists(shield))
	{
		if (shield != self)
			instance_destroy(shield);
	}

	if (createDestroyEff)
	{
		if (weaponTypeCauseDeath != PlayerWeaponType.MELEE)
		{
			var pos = {x : (bbox_right + bbox_left) / 2, y : (bbox_top + bbox_bottom) / 2}
			var dEff = instance_create_depth(pos.x, pos.y, depth - 1, destroyEff);
			if (destroyEff == objExplosionChain)
			{
				dEff.chainMax = explosionCount;
			}
		}
	}

	if (weaponTypeCauseDeath == PlayerWeaponType.MELEE)
	{
		var objSlashEff = instance_create_depth(x + (deathDir * abs(sprite_width) / 2), (bbox_top + bbox_bottom) / 2 - (sprite_height / 4), depth, objSlashKillEff);
		objSlashEff.image_xscale = deathDir;
		objSlashEff.image_angle = -deathDir * 45;
	
		if (destroySlashPiece.sprite == noone)
		{
			var pos = {x : (bbox_right + bbox_left) / 2, y : (bbox_top + bbox_bottom) / 2}
			var dEff = instance_create_depth(pos.x, pos.y, depth - 1, destroyEff);
			if (destroyEff == objExplosionChain)
			{
				dEff.chainMax = explosionCount;
			}
		}
	}

	if ((weaponTypeCauseDeath == PlayerWeaponType.MELEE) && (destroySlashPiece.sprite != noone))
	{
		var objPieceCreater = instance_create_depth(x, y, depth - 1, objEnemySlashedPieceCreater);
		objPieceCreater.spritePiece = destroySlashPiece.sprite;
		objPieceCreater.hMove = destroySlashPiece.hMove;
		objPieceCreater.vMove = destroySlashPiece.vMove;
		objPieceCreater.image_xscale = image_xscale;
		objPieceCreater.waitTime = destroySlashPiece.waitTime;
	}
	else
	{
		if (destroyPiece.number > 0)
		{
			var objPiece = instance_create_depth((bbox_left + bbox_right) / 2, (bbox_top + bbox_bottom) / 2, depth - 1, objEnemyPieceCreater);
			objPiece.pieceType = destroyPiece.sprite;
			objPiece.pieceNumber = destroyPiece.number;
			if (palette != noone)
			{
				objPiece.palette = palette;
				objPiece.paletteNumber = paletteNumber;
			}
		}
	}
	
	if (instance_exists(objScoreMgr))
	{
		if (hp <= 0)
		{
			objScoreMgr.resultCaculator.enemiesDestroyed++;
		}
	}
}