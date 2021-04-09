/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp = 64;
damage = 2;

bossStateMachine = instance_create_depth(x, y, depth, objStateMachine);
bossStateMachine.core = self;
bossStateMachine.coreType = "HellBatSchilt";

with(bossStateMachine)
	fncStateChange(objHBSStateIdle);