/// @description Insert description here
// You can write your code in this editor
/// @description Destroy
if (parent != noone)
{
	with (parent)
		child = noone;
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
}

if ((weaponTypeCauseDeath == PlayerWeaponType.MELEE) && (destroySlashPiece != noone))
{
	var objPieceCreater = instance_create_depth(x, y, depth - 1, objEnemySlashedPieceCreater);
	objPieceCreater.spritePiece = destroySlashPiece;
	objPieceCreater.image_xscale = image_xscale;
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