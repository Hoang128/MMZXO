/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp = 4;
damage = 2;

destroyPiece.sprite = sprProcessorPieces;
destroyPiece.number = 4;
destroySlashPiece.sprite = sprProcessorSlashPieces;
destroySlashPiece.vMove = 0.5;
destroySlashPiece.hMove = 1;

enum processorState {INIT, FLY, CHANGE_DIR};

state = processorState.INIT;