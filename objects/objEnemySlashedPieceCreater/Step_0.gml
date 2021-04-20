/// @description Insert description here
// You can write your code in this editor

if (!inited)
{
	pieceFront = instance_create_depth(x, y, -10, objEnemySlashedPiece);
	pieceFront.sprite_index = spritePiece;
	pieceFront.image_index = 0;
	pieceFront.image_xscale = image_xscale;
	pieceFront.hMove = hMove;
	pieceFront.vMove = vMove;
	pieceFront.waitTime = waitTime;
	
	pieceBack = instance_create_depth(x, y, depth + 2, objEnemySlashedPiece);
	pieceBack.sprite_index = spritePiece;
	pieceBack.image_index = 1;
	pieceBack.image_xscale = image_xscale;
	pieceBack.waitTime = waitTime;
	
	inited = true;
	instance_destroy();
}