/// @description Insert description here
// You can write your code in this editor

event_inherited();

//General Parameters
runSpd = 2;
jumpSpd = 4;

//Properties
physic = 1;
gravAffect = 1;
charDir = 1;

//State machine
playerStateMachine = instance_create_depth(x, y, depth, objStateMachine);
playerStateMachine.core = self;
playerStateMachine.coreType = "player";

with(playerStateMachine)
{
	fncStateChange(objPlayerStateIdle);
}