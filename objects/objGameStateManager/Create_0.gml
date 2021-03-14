/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

enum GameState
{
	INGAME_CUTSCENE,
	INGAME_GAMEPLAY,
	CUTSCENE,
	MENU
}

gameState = GameState.MENU;