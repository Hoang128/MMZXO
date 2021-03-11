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
	var pos = {x : (bbox_right + bbox_left) / 2, y : (bbox_top + bbox_bottom) / 2}
	instance_create_depth(pos.x, pos.y, depth - 1, destroyEff);
}

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