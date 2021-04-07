/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

sprGate.sprClose = sprGateBClose;
sprGate.sprClosing = sprGateBClosing;
sprGate.sprOpen = sprGateBOpen;
sprGate.sprOpening = sprGateBOpening;

function fncGateClose()
{
	sprite_index = sprGate.sprClose;
	image_index = 0;
	state = 1;
	//Debug
	global.gameState = GameState.INGAME_CUTSCENE;
	fncGateCreateBlock();
}