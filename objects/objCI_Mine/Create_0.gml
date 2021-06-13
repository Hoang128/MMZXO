/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

damage = 3;

existTime = 120;

destroyEff = objExplosion;

hp = 2;

weaponTypeCauseDeath = PlayerWeaponType.OBJECTIVE;

function fncCreateMinePieces()
{
	for (var i = 0; i <= 2; i++)
	{
		var objMinePiece = instance_create_depth(x, y, depth, objCI_MinePiece);
		objMinePiece.moveDir = 240 + i * 30;
		objMinePiece.image_index = i;
	}
}