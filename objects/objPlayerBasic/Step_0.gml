/// @description Insert description here
// You can write your code in this editor

//Step handle for early dev
image_speed = imgSpd * TIME_SCALE;

fncSetupProperties();

with(playerStateMachine)
	fncStateHandle();

event_inherited();