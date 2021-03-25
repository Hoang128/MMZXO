/// @description Insert description here
// You can write your code in this editor
switch (sprite_index)
{
	case sprGateClosing:
	{
		sprite_index = sprGateClose;
		image_index = 0;
		state = 1;
		global.gameState = GameState.INGAME_GAMEPLAY;
		fncGateCreateBlock();
	}	break;
	case sprGateOpening:
	{
		sprite_index = sprGateOpen;
		image_index = 0;
		instance_destroy(gateBlock);
		gateBlock = noone;
		state = 3;
	}	break;
}