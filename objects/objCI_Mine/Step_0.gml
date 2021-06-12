/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (existTime > 0)
	existTime -= TIME_SCALE;
else
	instance_destroy();